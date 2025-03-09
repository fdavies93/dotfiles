#!/bin/python

import os


def setup_config_symlink(cwd: str, source_dir: str, target_dir: str):
    dir_path = os.path.join(cwd, source_dir)
    config_path = os.path.expanduser(os.path.join("~/.config", target_dir))
    # check that dir exists
    if not os.path.exists(dir_path):
        raise ValueError(f"Source directory {source_dir} doesn't exist.")
    # check that it hasn't already been symlinked
    if os.path.exists(config_path):
        raise ValueError(f"Target location {target_dir} already exists.")
    # make the symlink
    os.symlink(dir_path, config_path)
    print(f"Creating symlink from {dir_path} to {config_path}")


def setup_config_symlinks(cwd: str, dirs: dict[str, str]):
    for src, target in dirs.items():
        try:
            setup_config_symlink(cwd, src, target)
        except ValueError as e:
            print(e)


def main():
    cwd = os.getcwd()
    dirs = {
        "nvim-from-scratch": "nvim",
        "alacritty": "alacritty"
    }
    print("Setting up symbolic links.")
    setup_config_symlinks(cwd, dirs)
    print("Finished setting up symbolic links.")


if __name__ == "__main__":
    main()
