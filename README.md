# JordanVim

Welcome to JordanVim, a meticulously crafted Neovim configuration tailored specifically to meet the unique needs and preferences of Jordan Palmer. This configuration serves as a powerful toolkit designed to enhance both efficiency and user experience while working within Neovim and the terminal environment.

At its core, JordanVim integrates a diverse array of plugins, each selected for its ability to streamline workflows, improve productivity, and provide a more intuitive interface. Whether you are coding, writing, or managing projects, this configuration aims to transform your Neovim experience into a seamless and enjoyable journey.

With a focus on customization and flexibility, JordanVim empowers users to harness the full potential of Neovim, making it not just a text editor, but a comprehensive development environment. Dive in and explore the features and enhancements that make JordanVim a standout choice for anyone looking to elevate their coding experience.

## Installation

1. Clone this repository to your `~/.config/` directory. If the directory does not exist, create it. 
2. Rename the local repository to `nvim` so the path reflects `~/.config/nvim`

## WinYank

**[Win32Yank](https://github.com/equalsraf/win32yank)** is a powerful utility that enables seamless synchronization between your Vim/Neovim clipboard and the Windows system clipboard. To set up this tool effectively, some modifications are necessary depending on your system configuration.

Begin by downloading the latest version of **[win32yank-x64.zip](https://github.com/equalsraf/win32yank/releases)**. Once downloaded, extract the contents of the zip file and save the `win32yank.exe` file in a permanent location. For example, you might choose to save it in a dedicated folder within your Documents directory, such as **WSLPlugins**.

Next, locate the `init.lua` file in your Neovim configuration directory, typically found at `~/.config/nvim`. In this file, you will need to modify the following code snippet to reflect the path where you saved `win32yank.exe`. Ensure that the path is formatted to navigate through the Windows file system mount in Linux (i.e., /mnt). 

```lua
vim.o.clipboard = 'unnamedplus'
vim.g.clipboard = {
name = 'win32yank-wsl',
copy = {
['+'] = '/mnt/c/Users/jorda/OneDrive/Documents/WSLPlugins/win32yank.exe -i --crlf',
['*'] = '/mnt/c/Users/jorda/OneDrive/Documents/WSLPlugins/win32yank.exe -i --crlf',
},
paste = {
['+'] = '/mnt/c/Users/jorda/OneDrive/Documents/WSLPlugins/win32yank.exe -o --lf',
['*'] = '/mnt/c/Users/jorda/OneDrive/Documents/WSLPlugins/win32yank.exe -o --lf',
},
cache_enabled = 0,
}
```

Make sure to replace the paths in the code with the actual location of your win32yank.exe file.

By following these steps, you will successfully configure Win32Yank to enhance your clipboard functionality between Vim/Neovim and Windows.
