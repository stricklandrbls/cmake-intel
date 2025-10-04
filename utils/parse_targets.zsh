# Extract target names from CMake File API reply JSON
# Requires jq for now (lightweight, but can be replaced later with pure zsh JSON parser)

_cmake_intel__load_targets() {
  local builddir="$1"
  local reply_dir="${builddir}/.cmake/api/v1/reply"

  # Locate the index file (should be one like 'index-xxxx.json')
  local index_file
  index_file=(${reply_dir}/index*.json(N[1])) || return 1

  # Extract the 'codemodel' reply
  local codemodel_file
  codemodel_file=$(jq -r '.reply.codemodel[].jsonFile' "$index_file" 2>/dev/null)
  [[ -f "${reply_dir}/${codemodel_file}" ]] || return 1

  # Parse target names
  jq -r '.configurations[0].targets[].name' "${reply_dir}/${codemodel_file}" 2>/dev/null
}

