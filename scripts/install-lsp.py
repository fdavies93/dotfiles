#!/bin/python

# While this is clearly a better approach than bash,
# it has the minor issue of complexity re checks, dependencies

import subprocess
from argparse import ArgumentParser

SETUP_CMDS: dict[str,str|None] = {
    "ubuntu": "sudo apt update",
    "arch": None
}

SYSTEM_PACKAGE_CMDS = {
    "ubuntu": "sudo apt install -y lua-language-server clang",
    "arch": "pacman -S lua-language-server clang"
}

def setup(distro_id):
    if distro_id not in SETUP_CMDS:
        print(f"I don't know how to setup {distro_id}, exiting.")
        exit(1)
    run_cmd = SETUP_CMDS[distro_id]
    if run_cmd is None:
        return
    subprocess.run(run_cmd.split(" "))

def install_system_packages(distro_id):
    run_cmd = SYSTEM_PACKAGE_CMDS[distro_id]
    if run_cmd is None:
        return
    subprocess.run(run_cmd.split(" "))

def main():
    parser = ArgumentParser()
    parser.add_argument("distro_id")
    parsed = parser.parse_args()

    distro_id = parsed.distro_id

    setup(distro_id)
    install_system_packages(distro_id)

if __name__ == "__main__":
    main()
