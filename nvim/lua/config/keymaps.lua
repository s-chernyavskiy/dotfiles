local keymap = vim.keymap

local opts = { noremap = true, silent = true }

keymap.set("n", "<leader>m", ":NvimTreeFocus<CR>", opts)
keymap.set("n", "<S-Tab>", ":NvimTreeToggle<CR>", opts)

keymap.set("n", "<C-h>", "<C-w>h", opts)
keymap.set("n", "<C-j>", "<C-w>j", opts)
keymap.set("n", "<C-k>", "<C-w>k", opts)
keymap.set("n", "<C-l>", "<C-w>l", opts)

keymap.set("n", "<leader>sv", ":vsplit<CR>", opts)
keymap.set("n", "<leader>sh", ":split<CR>", opts)

keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

vim.api.nvim_set_keymap("n", "<C-/>", "gcc", { noremap = false })
vim.api.nvim_set_keymap("v", "<C-/>", "gcc", { noremap = false })

keymap.set("n", "ZA", ":%y+<CR>", opts)
keymap.set("n", "<C-a>", "<Esc>ggVG<CR>", opts)

keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")
keymap.set("x", "p", '"_dP')

keymap.set("n", "<leader>d", '"_d')
keymap.set("v", "<leader>d", '"_d')

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<leader>ee", "oif err != nil {<CR>}<Esc>Oreturn err<Esc>")

vim.keymap.set("n", "<leader>ef", 'oif err != nil {<CR>}<Esc>Olog.Fatalf("error: %s\\n", err.Error())<Esc>jj')

vim.keymap.set("n", "<leader>el", 'oif err != nil {<CR>}<Esc>O.logger.Error("error", "error", err)<Esc>F.;i')
