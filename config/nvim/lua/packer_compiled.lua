-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/gennadijanzen/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/gennadijanzen/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/gennadijanzen/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/gennadijanzen/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/gennadijanzen/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["DAPInstall.nvim"] = {
    loaded = true,
    path = "/Users/gennadijanzen/.local/share/nvim/site/pack/packer/start/DAPInstall.nvim"
  },
  LuaSnip = {
    config = { "\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20config.snippets\frequire\0" },
    loaded = true,
    path = "/Users/gennadijanzen/.local/share/nvim/site/pack/packer/start/LuaSnip",
    wants = { "friendly-snippets" }
  },
  ["cmp-buffer"] = {
    after_files = { "/Users/gennadijanzen/.local/share/nvim/site/pack/packer/opt/cmp-buffer/after/plugin/cmp_buffer.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/gennadijanzen/.local/share/nvim/site/pack/packer/opt/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/gennadijanzen/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    after_files = { "/Users/gennadijanzen/.local/share/nvim/site/pack/packer/opt/cmp-path/after/plugin/cmp_path.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/gennadijanzen/.local/share/nvim/site/pack/packer/opt/cmp-path"
  },
  cmp_luasnip = {
    after_files = { "/Users/gennadijanzen/.local/share/nvim/site/pack/packer/opt/cmp_luasnip/after/plugin/cmp_luasnip.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/gennadijanzen/.local/share/nvim/site/pack/packer/opt/cmp_luasnip"
  },
  edge = {
    loaded = true,
    path = "/Users/gennadijanzen/.local/share/nvim/site/pack/packer/start/edge"
  },
  ["editorconfig-vim"] = {
    loaded = true,
    path = "/Users/gennadijanzen/.local/share/nvim/site/pack/packer/start/editorconfig-vim"
  },
  everforest = {
    loaded = true,
    path = "/Users/gennadijanzen/.local/share/nvim/site/pack/packer/start/everforest"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/Users/gennadijanzen/.local/share/nvim/site/pack/packer/start/friendly-snippets"
  },
  ["github-nvim-theme"] = {
    loaded = true,
    path = "/Users/gennadijanzen/.local/share/nvim/site/pack/packer/start/github-nvim-theme"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/Users/gennadijanzen/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["gruvbox-material"] = {
    loaded = true,
    path = "/Users/gennadijanzen/.local/share/nvim/site/pack/packer/start/gruvbox-material"
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "/Users/gennadijanzen/.local/share/nvim/site/pack/packer/start/impatient.nvim"
  },
  kommentary = {
    loaded = true,
    path = "/Users/gennadijanzen/.local/share/nvim/site/pack/packer/start/kommentary"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/Users/gennadijanzen/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/Users/gennadijanzen/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    config = { "\27LJ\2\nu\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\21code_action_keys\1\0\0\1\0\2\texec\t<CR>\tquit\n<ESC>\18init_lsp_saga\flspsaga\frequire\0" },
    loaded = true,
    path = "/Users/gennadijanzen/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  ["neoscroll.nvim"] = {
    loaded = true,
    path = "/Users/gennadijanzen/.local/share/nvim/site/pack/packer/start/neoscroll.nvim"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "/Users/gennadijanzen/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    after = { "cmp-buffer", "cmp-path", "cmp_luasnip" },
    loaded = true,
    only_config = true
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/Users/gennadijanzen/.local/share/nvim/site/pack/packer/start/nvim-dap"
  },
  ["nvim-dap-ui"] = {
    loaded = true,
    path = "/Users/gennadijanzen/.local/share/nvim/site/pack/packer/start/nvim-dap-ui"
  },
  ["nvim-dap-virtual-text"] = {
    config = { "\27LJ\2\n2\0\0\2\0\3\0\0056\0\0\0009\0\1\0+\1\2\0=\1\2\0K\0\1\0\21dap_virtual_text\6g\bvim\0" },
    loaded = true,
    path = "/Users/gennadijanzen/.local/share/nvim/site/pack/packer/start/nvim-dap-virtual-text"
  },
  ["nvim-lsp-installer"] = {
    loaded = true,
    path = "/Users/gennadijanzen/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\15config.lsp\frequire\0" },
    loaded = true,
    path = "/Users/gennadijanzen/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-toggleterm.lua"] = {
    config = { "\27LJ\2\nP\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\20shade_terminals\1\nsetup\15toggleterm\frequire\0" },
    loaded = true,
    path = "/Users/gennadijanzen/.local/share/nvim/site/pack/packer/start/nvim-toggleterm.lua"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/Users/gennadijanzen/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/gennadijanzen/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/gennadijanzen/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/gennadijanzen/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/gennadijanzen/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  sonokai = {
    loaded = true,
    path = "/Users/gennadijanzen/.local/share/nvim/site/pack/packer/start/sonokai"
  },
  ["sqlite.lua"] = {
    loaded = true,
    path = "/Users/gennadijanzen/.local/share/nvim/site/pack/packer/start/sqlite.lua"
  },
  ["telescope-dap.nvim"] = {
    loaded = true,
    path = "/Users/gennadijanzen/.local/share/nvim/site/pack/packer/start/telescope-dap.nvim"
  },
  ["telescope-frecency.nvim"] = {
    loaded = true,
    path = "/Users/gennadijanzen/.local/share/nvim/site/pack/packer/start/telescope-frecency.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/Users/gennadijanzen/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/gennadijanzen/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["trouble.nvim"] = {
    loaded = true,
    path = "/Users/gennadijanzen/.local/share/nvim/site/pack/packer/start/trouble.nvim"
  },
  ["vim-cool"] = {
    loaded = true,
    path = "/Users/gennadijanzen/.local/share/nvim/site/pack/packer/start/vim-cool"
  },
  ["vim-polyglot"] = {
    loaded = true,
    path = "/Users/gennadijanzen/.local/share/nvim/site/pack/packer/start/vim-polyglot"
  },
  ["vim-rooter"] = {
    loaded = true,
    path = "/Users/gennadijanzen/.local/share/nvim/site/pack/packer/start/vim-rooter"
  },
  ["vim-searchindex"] = {
    loaded = true,
    path = "/Users/gennadijanzen/.local/share/nvim/site/pack/packer/start/vim-searchindex"
  },
  ["vim-startify"] = {
    loaded = true,
    path = "/Users/gennadijanzen/.local/share/nvim/site/pack/packer/start/vim-startify"
  },
  ["vim-superman"] = {
    commands = { "SuperMan" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/gennadijanzen/.local/share/nvim/site/pack/packer/opt/vim-superman"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/gennadijanzen/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-test"] = {
    loaded = true,
    path = "/Users/gennadijanzen/.local/share/nvim/site/pack/packer/start/vim-test"
  },
  ["vim-tmux-navigator"] = {
    loaded = true,
    path = "/Users/gennadijanzen/.local/share/nvim/site/pack/packer/start/vim-tmux-navigator"
  },
  ["vim-ultest"] = {
    config = { "\27LJ\2\nÎ\1\0\0\2\0\t\0\0176\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0005\1\5\0=\1\4\0006\0\0\0009\0\1\0'\1\a\0=\1\6\0006\0\0\0009\0\1\0+\1\2\0=\1\b\0K\0\1\0\24ultest_virtual_text\23vendor/bin/phpunit test#php#phpunit#executable\1\2\0\0\16php#phpunit\25test#enabled_runners\vneovim\18test#strategy\6g\bvim\0" },
    loaded = true,
    path = "/Users/gennadijanzen/.local/share/nvim/site/pack/packer/start/vim-ultest"
  },
  ["vista.vim"] = {
    loaded = true,
    path = "/Users/gennadijanzen/.local/share/nvim/site/pack/packer/start/vista.vim"
  },
  ["windline.nvim"] = {
    loaded = true,
    path = "/Users/gennadijanzen/.local/share/nvim/site/pack/packer/start/windline.nvim"
  },
  winresizer = {
    loaded = true,
    path = "/Users/gennadijanzen/.local/share/nvim/site/pack/packer/start/winresizer"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-dap-virtual-text
time([[Config for nvim-dap-virtual-text]], true)
try_loadstring("\27LJ\2\n2\0\0\2\0\3\0\0056\0\0\0009\0\1\0+\1\2\0=\1\2\0K\0\1\0\21dap_virtual_text\6g\bvim\0", "config", "nvim-dap-virtual-text")
time([[Config for nvim-dap-virtual-text]], false)
-- Config for: nvim-toggleterm.lua
time([[Config for nvim-toggleterm.lua]], true)
try_loadstring("\27LJ\2\nP\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\20shade_terminals\1\nsetup\15toggleterm\frequire\0", "config", "nvim-toggleterm.lua")
time([[Config for nvim-toggleterm.lua]], false)
-- Config for: lspsaga.nvim
time([[Config for lspsaga.nvim]], true)
try_loadstring("\27LJ\2\nu\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\21code_action_keys\1\0\0\1\0\2\texec\t<CR>\tquit\n<ESC>\18init_lsp_saga\flspsaga\frequire\0", "config", "lspsaga.nvim")
time([[Config for lspsaga.nvim]], false)
-- Config for: vim-ultest
time([[Config for vim-ultest]], true)
try_loadstring("\27LJ\2\nÎ\1\0\0\2\0\t\0\0176\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0005\1\5\0=\1\4\0006\0\0\0009\0\1\0'\1\a\0=\1\6\0006\0\0\0009\0\1\0+\1\2\0=\1\b\0K\0\1\0\24ultest_virtual_text\23vendor/bin/phpunit test#php#phpunit#executable\1\2\0\0\16php#phpunit\25test#enabled_runners\vneovim\18test#strategy\6g\bvim\0", "config", "vim-ultest")
time([[Config for vim-ultest]], false)
-- Config for: LuaSnip
time([[Config for LuaSnip]], true)
try_loadstring("\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20config.snippets\frequire\0", "config", "LuaSnip")
time([[Config for LuaSnip]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vconfig\15config.cmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\15config.lsp\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd cmp_luasnip ]]
vim.cmd [[ packadd cmp-buffer ]]
vim.cmd [[ packadd cmp-path ]]
time([[Sequenced loading]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SuperMan lua require("packer.load")({'vim-superman'}, { cmd = "SuperMan", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
