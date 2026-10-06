# thomaslima/tap

Homebrew formulae maintained by Thomas Ferreira de Lima.

| Formula | Description |
|---|---|
| `xschem-mac` | [xschem](https://github.com/StefanSchippers/xschem) built as a native macOS application (Aqua Tk, no XQuartz), from the experimental fork [thomaslima/xschem](https://github.com/thomaslima/xschem). Not supported by upstream xschem. |

## Install

```sh
brew install thomaslima/tap/xschem-mac
```

`xschem-mac` is built from source; it has no bottles. It puts `xschem` on `PATH` and builds
`Xschem.app` in its prefix. To show the app in Applications:

```sh
ln -sf "$(brew --prefix)/opt/xschem-mac/Xschem.app" /Applications/Xschem.app
```

If `/Applications/Xschem.app` is already a folder (for example a copy from the release disk
image), move it to the Trash first; otherwise `ln` puts the link inside that folder.

`brew install --HEAD thomaslima/tap/xschem-mac` builds the fork's latest `main`.

A prebuilt, self-contained `Xschem.app` (no Homebrew needed) is also on the fork's
[Releases](https://github.com/thomaslima/xschem/releases) page.

See [README_MacOS.md](https://github.com/thomaslima/xschem/blob/main/README_MacOS.md) in the
fork for what the native build supports.

## Updating the formula

Run Actions > Update formula > Run workflow with a tag of thomaslima/xschem (for example
`v3.4.8RC-mac.3`). It sets `url`, `version` and `sha256`, builds and tests the formula on
macOS, and commits the change. The release process is described in
[XSchemMac/README.md](https://github.com/thomaslima/xschem/blob/main/XSchemMac/README.md#releases).
