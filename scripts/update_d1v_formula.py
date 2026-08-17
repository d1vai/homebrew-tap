#!/usr/bin/env python3
from __future__ import annotations

import json
import os
import re
from pathlib import Path
from urllib.request import Request, urlopen

RELEASE_API = "https://api.github.com/repos/d1vai/d1v-cli/releases/latest"
FORMULA_PATH = Path(__file__).resolve().parent.parent / "Formula" / "d1v.rb"
TARGETS = {
    "macos_arm": "d1v-aarch64-apple-darwin.tar.gz",
    "macos_intel": "d1v-x86_64-apple-darwin.tar.gz",
    "linux_arm": "d1v-aarch64-unknown-linux-gnu.tar.gz",
    "linux_intel": "d1v-x86_64-unknown-linux-gnu.tar.gz",
}


def fetch_release() -> dict:
    headers = {
        "Accept": "application/vnd.github+json",
        "User-Agent": "d1vai-homebrew-tap",
        "X-GitHub-Api-Version": "2022-11-28",
    }
    if token := os.environ.get("GITHUB_TOKEN"):
        headers["Authorization"] = f"Bearer {token}"
    with urlopen(Request(RELEASE_API, headers=headers), timeout=30) as response:
        return json.load(response)


def release_values(release: dict) -> tuple[str, str, dict[str, str]]:
    tag = release.get("tag_name", "")
    if not re.fullmatch(r"v\d+\.\d+\.\d+", tag):
        raise RuntimeError(f"unsupported release tag: {tag!r}")

    assets = {asset["name"]: asset for asset in release.get("assets", [])}
    checksums = {}
    for key, name in TARGETS.items():
        asset = assets.get(name)
        if asset is None:
            raise RuntimeError(f"release {tag} is missing {name}")
        digest = asset.get("digest") or ""
        if not re.fullmatch(r"sha256:[0-9a-f]{64}", digest):
            raise RuntimeError(f"release {tag} has no valid SHA-256 for {name}")
        checksums[key] = digest.removeprefix("sha256:")
    return tag, tag.removeprefix("v"), checksums


def render(tag: str, version: str, sha: dict[str, str]) -> str:
    base = f"https://github.com/d1vai/d1v-cli/releases/download/{tag}"
    return f'''class D1v < Formula
  desc "Command-line interface for d1v.ai"
  homepage "https://www.d1v.ai"
  version "{version}"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "{base}/{TARGETS['macos_arm']}"
      sha256 "{sha['macos_arm']}"
    else
      url "{base}/{TARGETS['macos_intel']}"
      sha256 "{sha['macos_intel']}"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "{base}/{TARGETS['linux_arm']}"
      sha256 "{sha['linux_arm']}"
    else
      url "{base}/{TARGETS['linux_intel']}"
      sha256 "{sha['linux_intel']}"
    end
  end

  def install
    bin.install "d1v"
  end

  test do
    assert_match version.to_s, shell_output("#{{bin}}/d1v --version")
  end
end
'''


def main() -> None:
    tag, version, checksums = release_values(fetch_release())
    content = render(tag, version, checksums)
    FORMULA_PATH.parent.mkdir(parents=True, exist_ok=True)
    FORMULA_PATH.write_text(content, encoding="utf-8")
    print(f"Updated {FORMULA_PATH} to {tag}")


if __name__ == "__main__":
    main()
