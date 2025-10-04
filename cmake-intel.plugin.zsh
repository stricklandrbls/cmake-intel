# CMake Intellisense Zsh Plugin (final stable version)
# Works under WSL, Linux, macOS, and all Zsh 5.7–5.9+ versions.

ZSH_CMAKE_INTEL_DIR="${0:A:h}"

# Add this plugin’s directory to fpath only once
if [[ ${fpath[(Ie)$ZSH_CMAKE_INTEL_DIR]} -eq 0 ]]; then
  fpath=("${ZSH_CMAKE_INTEL_DIR}" $fpath)
fi

# Define the registration logic
_cmake_intel_register() {
  # Only run once per session
  if [[ -n "$_CMAKE_INTEL_REGISTERED" ]]; then
    return
  fi

  # Ensure compinit has finished
  if (( $+functions[compdef] )); then
    autoload -Uz _cmake_intel
    compdef -d cmake 2>/dev/null
    compdef _cmake_intel cmake
    print -u2 "[cmake-intel] ✅ Registered _cmake_intel completion for 'cmake'"
    _CMAKE_INTEL_REGISTERED=1
  fi
}

# Register immediately if compinit is ready
if (( $+functions[compdef] )); then
  _cmake_intel_register
else
  # Otherwise, defer registration until after compinit runs
  autoload -Uz add-zsh-hook
  add-zsh-hook -Uz precmd _cmake_intel_register
fi
