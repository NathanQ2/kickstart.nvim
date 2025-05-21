-- ~/.config/nvim/ftplugin/java.lua

local jdtls = require 'jdtls'

local root_markers = { '.git', 'mvnw', 'gradlew', 'pom.xml', 'build.gradle' }
local root_dir = require('jdtls.setup').find_root(root_markers)
if not root_dir then
  return
end

local home = vim.fn.expand '$HOME'
local jdtls_path = home .. '/.local/share/nvim/mason/packages/jdtls'
local workspace_dir = home .. '/.local/share/eclipse/' .. vim.fn.fnamemodify(root_dir, ':p:h:t')

local config = {
  cmd = {
    jdtls_path .. '/bin/jdtls',
    '-data',
    workspace_dir,
  },
  root_dir = root_dir,
  settings = {
    java = {},
  },
  init_options = {
    bundles = {},
  },
}

jdtls.start_or_attach(config)
