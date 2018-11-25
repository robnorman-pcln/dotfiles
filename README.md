# walrusk dotfiles

Forked from [holman/dotfiles](https://github.com/holman/dotfiles).

## components

- **bin/**: Anything in `bin/` will get added to your `$PATH` and be made available everywhere.
- **Brewfile**: This is a list of applications for [Homebrew Cask](https://caskroom.github.io) to install.
- **topic/install.sh**: Any file named `install.sh` is executed when you run `./bootstrap`.
- **topic/.\***: Dotfiles get symlinked into your `$HOME`. This is so you can keep all of those 
  versioned in your dotfiles but still keep those autoloaded files in your home directory. These get
  symlinked in when you run `./bootstrap`.

## install

Run this:

```sh
git clone https://github.com/walrusk/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./bootstrap
```

This will symlink the appropriate files in `.dotfiles` to your home directory.
Everything is configured and tweaked within `~/.dotfiles`.
