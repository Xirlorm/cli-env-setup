# CLI Development Environment Setup

Welcome to the CLI Development Environment Setup repository! This repository
contains scripts to quickly set up a programming environment on Debian,
Arch Linux, and Termux. It provides an easy way to install essential tools a
development journey, including:

- `clang` or `gcc`: A compiler for C/C++.
- `Node.js` and `npm`: For JavaScript/TypeScript development.
- `Python`: A versatile programming language.
- `Neovim`: A modern text editor.
- `fzf`: A fuzzy finder for your shell.
- `tree`: A command-line directory tree generator.

Additionally, we configure Neovim using the setup from [Xirlorm/nvim](https://github.com/Xirlorm/nvim.git).

## Prerequisites

Before you get started, ensure you have the following prerequisites installed on
your system:

- A compatible Linux distribution (Debian or Arch Linux) or Termux.
- Git: To clone this repository and fetch configurations.

## Installation

Follow these simple steps to set up your development environment:

1. Clone this repository to your local machine:

   ```bash
   git clone https://github.com/Xirlorm/cli-env-setup.git
   ```

2. Change into the project directory:

   ```bash
   cd cli-env-setup
   ```

3. Run the setup script for your specific system:

   - For Debian:

     ```bash
     chmod +x ./setup_debian.sh
     ./setup_debian.sh
     ```

   - For Arch Linux:

     ```bash
     chmod +x ./setup_arch.sh
     ./setup_arch.sh
     ```

   - For Termux:

     ```bash
     chmod +x ./setup_termux.sh
     ./setup_termux.sh
     ```

4. Sit back and relax while the script installs and configures all the necessary
tools for your programming environment.

5. Once the setup is complete, open Neovim using the `nvim` command. Neovim
automagically configures itself when run the first time.

## Issues and Contributions

If you encounter any issues or have suggestions for improvements, please [create an issue](https://github.com/yourusername/cli-environment-setup/issues) or submit a pull request. Your feedback and contributions are highly appreciated.

Happy coding!

---

**Disclaimer:** This setup is tailored to my preferences and may not include every
tool that suits everyone's needs. Feel free to customize it further to meet your
specific requirements.
