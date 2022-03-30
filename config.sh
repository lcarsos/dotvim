#!/bin/bash
# Because I felt like a bad person for writing a windows config file. I made
# this to feel better about myself

mkdir -p ~/.local/share/nvim/{swap,undo}
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
