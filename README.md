# VimConfig

This repository contains my Neovim configuration file that is compatible with
Vim-Plug and Coc.nvim. It is designed to enhance my Neovim editing experience.

To quickly set up Neovim, I recommend using the
[OS Setup](https://github.com/Nachtalb/os-setup) tool. It provides an automated
installation process that includes the Neovim configuration from this
repository.

## Installation

For a convenient installation without cloning the repository, you can use the
following command:

> ⚠ Disclaimer: Use caution when using the OS Setup tool as it installs various
> dependencies and components other than just this VimConfig, and may overwrite
> or conflict with existing settings; for a manual installation, refer to the
> install.d folder in the OS Setup repository.

```bash
bash <(curl https://raw.githubusercontent.com/Nachtalb/os-setup/master/web-install.sh) --noconfirm
```

This command will automatically download and run the installation script,
skipping any confirmation prompts.

If you already have an existing installation and prefer a manual setup, you can
refer to the files in the `install.d` folder of the
[OS Setup](https://github.com/Nachtalb/os-setup/tree/master/install.d)
repository. These files provide step-by-step instructions and configuration
details specific to each component of the OS setup.

## Other Projects

- [OS Setup](https://github.com/Nachtalb/os-setup): An installation script for
  new Arch setups as described above.
- [Git Open](https://github.com/Nachtalb/git-open-rs): A git-open command
  written in Rust, similar to paulirish/git-open.
- [Dotfiles](https://github.com/Nachtalb/dotfiles): Comprehensive Fish shell
  setup and productivity-enhancing tools
- [Licenses API](https://licenses.nachtalb.io/) |
  [GitHub Repository](https://github.com/Nachtalb/licenses_api): An API for
  retrieving software license information, including SPDX ID, permissions,
  conditions, and more.
- [Leeplate](https://leeplate.nachtalb.io/) |
  [GitHub Repository](https://github.com/Nachtalb/leeplate): A privacy-oriented
  alternative frontend for translation providers.
