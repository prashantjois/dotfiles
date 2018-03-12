# My Dotfiles

## Quick Setup

```bash
git clone https://github.com/prashantjois/dotfiles ~/.dotfiles && ~/.dotfiles/setup
```

## Pre-requisites

  * git
  * curl
  * vim
  * tmux

To Install pre-reqs:

```
./setup prereqs
```

## Detailed Setup

This setup includes configuration for the following apps:
  * vim / neovim
  * bash
  * git
  * tmux

If you pass no arguments to `setup` it will run all installation routines except neovim.

To run an individual setup routine, pass it as an argument to the setup script:

```bash
./setup vim
```
