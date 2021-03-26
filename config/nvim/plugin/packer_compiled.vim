" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
local package_path_str = "/Users/gennadijanzen/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/gennadijanzen/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/gennadijanzen/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/gennadijanzen/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/gennadijanzen/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

_G.packer_plugins = {
  ["coc.nvim"] = {
    loaded = true,
    path = "/Users/gennadijanzen/.local/share/nvim/site/pack/packer/start/coc.nvim"
  },
  edge = {
    loaded = true,
    path = "/Users/gennadijanzen/.local/share/nvim/site/pack/packer/start/edge"
  },
  ["editorconfig-vim"] = {
    config = { "\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25plugin/editor-config\frequire\0" },
    loaded = true,
    path = "/Users/gennadijanzen/.local/share/nvim/site/pack/packer/start/editorconfig-vim"
  },
  ["fugitive-gitlab.vim"] = {
    loaded = true,
    path = "/Users/gennadijanzen/.local/share/nvim/site/pack/packer/start/fugitive-gitlab.vim"
  },
  fzf = {
    loaded = true,
    path = "/Users/gennadijanzen/.local/share/nvim/site/pack/packer/start/fzf"
  },
  ["fzf.vim"] = {
    loaded = true,
    path = "/Users/gennadijanzen/.local/share/nvim/site/pack/packer/start/fzf.vim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/Users/gennadijanzen/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["gruvbox-material"] = {
    loaded = true,
    path = "/Users/gennadijanzen/.local/share/nvim/site/pack/packer/start/gruvbox-material"
  },
  ["gv.vim"] = {
    loaded = true,
    path = "/Users/gennadijanzen/.local/share/nvim/site/pack/packer/start/gv.vim"
  },
  ["lightline.vim"] = {
    loaded = true,
    path = "/Users/gennadijanzen/.local/share/nvim/site/pack/packer/start/lightline.vim"
  },
  ["lush.nvim"] = {
    loaded = true,
    path = "/Users/gennadijanzen/.local/share/nvim/site/pack/packer/start/lush.nvim"
  },
  neomake = {
    loaded = true,
    path = "/Users/gennadijanzen/.local/share/nvim/site/pack/packer/start/neomake"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/Users/gennadijanzen/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-lightbulb"] = {
    loaded = true,
    path = "/Users/gennadijanzen/.local/share/nvim/site/pack/packer/start/nvim-lightbulb"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n7\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\28plugin/nvim-tree-config\frequire\0" },
    loaded = true,
    path = "/Users/gennadijanzen/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n8\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\29plugin/treesitter-config\frequire\0" },
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
  phpactor = {
    config = { "\27LJ\2\nD\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\27plugin/phpactor-config\frequire\0" },
    loaded = false,
    needs_bufread = true,
    path = "/Users/gennadijanzen/.local/share/nvim/site/pack/packer/opt/phpactor"
  },
  playground = {
    loaded = true,
    path = "/Users/gennadijanzen/.local/share/nvim/site/pack/packer/start/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/gennadijanzen/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  sonokai = {
    loaded = true,
    path = "/Users/gennadijanzen/.local/share/nvim/site/pack/packer/start/sonokai"
  },
  ["suda.vim"] = {
    loaded = true,
    path = "/Users/gennadijanzen/.local/share/nvim/site/pack/packer/start/suda.vim"
  },
  ["targets.vim"] = {
    loaded = true,
    path = "/Users/gennadijanzen/.local/share/nvim/site/pack/packer/start/targets.vim"
  },
  ["vim-abolish"] = {
    loaded = true,
    path = "/Users/gennadijanzen/.local/share/nvim/site/pack/packer/start/vim-abolish"
  },
  ["vim-colors-github"] = {
    loaded = true,
    path = "/Users/gennadijanzen/.local/share/nvim/site/pack/packer/start/vim-colors-github"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/Users/gennadijanzen/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/gennadijanzen/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-polyglot"] = {
    loaded = true,
    path = "/Users/gennadijanzen/.local/share/nvim/site/pack/packer/start/vim-polyglot"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/Users/gennadijanzen/.local/share/nvim/site/pack/packer/start/vim-repeat"
  },
  ["vim-rooter"] = {
    loaded = true,
    path = "/Users/gennadijanzen/.local/share/nvim/site/pack/packer/start/vim-rooter"
  },
  ["vim-searchindex"] = {
    loaded = true,
    path = "/Users/gennadijanzen/.local/share/nvim/site/pack/packer/start/vim-searchindex"
  },
  ["vim-smoothie"] = {
    loaded = true,
    path = "/Users/gennadijanzen/.local/share/nvim/site/pack/packer/start/vim-smoothie"
  },
  ["vim-startify"] = {
    config = { "\27LJ\2\nD\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\27plugin/startify-config\frequire\0" },
    loaded = true,
    path = "/Users/gennadijanzen/.local/share/nvim/site/pack/packer/start/vim-startify"
  },
  ["vim-superman"] = {
    loaded = true,
    path = "/Users/gennadijanzen/.local/share/nvim/site/pack/packer/start/vim-superman"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/gennadijanzen/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-swap"] = {
    loaded = true,
    path = "/Users/gennadijanzen/.local/share/nvim/site/pack/packer/start/vim-swap"
  },
  ["vim-tmux-navigator"] = {
    loaded = true,
    path = "/Users/gennadijanzen/.local/share/nvim/site/pack/packer/start/vim-tmux-navigator"
  },
  vimspector = {
    config = { "\27LJ\2\nG\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\30plugin/vim-spector-config\frequire\0" },
    loaded = true,
    path = "/Users/gennadijanzen/.local/share/nvim/site/pack/packer/start/vimspector"
  },
  ["vista.vim"] = {
    config = { "\27LJ\2\n3\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\24plugin/vista-config\frequire\0" },
    loaded = true,
    path = "/Users/gennadijanzen/.local/share/nvim/site/pack/packer/start/vista.vim"
  },
  winresizer = {
    loaded = true,
    path = "/Users/gennadijanzen/.local/share/nvim/site/pack/packer/start/winresizer"
  }
}

-- Config for: editorconfig-vim
try_loadstring("\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25plugin/editor-config\frequire\0", "config", "editorconfig-vim")
-- Config for: vimspector
try_loadstring("\27LJ\2\nG\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\30plugin/vim-spector-config\frequire\0", "config", "vimspector")
-- Config for: gitsigns.nvim
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
-- Config for: vim-startify
try_loadstring("\27LJ\2\nD\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\27plugin/startify-config\frequire\0", "config", "vim-startify")
-- Config for: nvim-treesitter
try_loadstring("\27LJ\2\n8\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\29plugin/treesitter-config\frequire\0", "config", "nvim-treesitter")
-- Config for: nvim-tree.lua
try_loadstring("\27LJ\2\n7\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\28plugin/nvim-tree-config\frequire\0", "config", "nvim-tree.lua")
-- Config for: vista.vim
try_loadstring("\27LJ\2\n3\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\24plugin/vista-config\frequire\0", "config", "vista.vim")
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
vim.cmd [[au FileType php ++once lua require("packer.load")({'phpactor'}, { ft = "php" }, _G.packer_plugins)]]
vim.cmd("augroup END")
END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
