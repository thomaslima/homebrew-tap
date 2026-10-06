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

`brew install --HEAD thomaslima/tap/xschem-mac` builds the fork's latest `main`.

See [README_MacOS.md](https://github.com/thomaslima/xschem/blob/main/README_MacOS.md) in the
fork for what the native build supports.
