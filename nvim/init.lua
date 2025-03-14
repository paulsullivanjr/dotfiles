-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.g.node_host_prog = vim.fn.expand("~/.asdf/installs/nodejs/23.0.0/bin/node")
