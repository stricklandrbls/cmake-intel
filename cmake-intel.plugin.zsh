# CMake Intellisense Zsh Plugin
# Provides target and preset completion from CMake File API

autoload -Uz compinit
autoload -Uz bashcompinit

# Path to this plugin
ZSH_cmake_intel_DIR="${0:A:h}"

# Add plugin completion definitions to fpath
fpath+=("${ZSH_cmake_intel_DIR}")

# Source utilities
source "${ZSH_cmake_intel_DIR}/utils/parse_targets.zsh"

autoload -Uz _cmake_intel

# Ensure completion system is initialized
(( $+functions[compinit] )) || autoload -Uz compinit
compinit -u

# Hook our enhanced completion into cmake command
compdef _cmake_intel cmake

