# CMake Intellisense Zsh Plugin
# Provides target and preset completion from CMake File API

autoload -Uz compinit
autoload -Uz bashcompinit

# Path to this plugin
ZSH_CMAKE_INTELLISENSE_DIR="${0:A:h}"

# Add plugin completion definitions to fpath
fpath+=("${ZSH_CMAKE_INTELLISENSE_DIR}")

# Source utilities
source "${ZSH_CMAKE_INTELLISENSE_DIR}/utils/parse_targets.zsh"

# Ensure completion system is initialized
(( $+functions[compinit] )) || autoload -Uz compinit
compinit -u

# Hook our enhanced completion into cmake command
compdef _cmake_intellisense cmake

