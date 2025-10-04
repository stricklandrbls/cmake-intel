# ------------------------------------------------------------------------------
# hello-world.plugin.zsh
# A demo Oh My Zsh plugin showing aliases, functions, and completion setup.
# ------------------------------------------------------------------------------

# Debug flag (optional)
typeset -g MYEX_WORLD_DEBUG=true

dir_example_plugin="${0:A:h}"

# Add this plugin’s directory to fpath only once
if [[ ${fpath[(Ie)$dir_example_plugin]} -eq 0 ]]; then
  fpath=("${dir_example_plugin}" $fpath)
fi

autoload -Uz ex_fn

# Simple alias
alias ex_plugin="ex_fn"

# Add tab-completion
if [[ -f $dir_example_plugin ]]; then
  compdef _my_example my-example
fi

# Optional: print debug info when loaded
if [[ $MYEX_WORLD_DEBUG == true ]]; then
  echo "[Example Plugin] Plugin loaded from ${0:h}"
fi
