--Set <space> as the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

--Disable the space key's default behavior in Normal and Visual modes
vim.keymap.set({'n', 'v'}, '<Space>', '<Nop>', {silent = true})

--Avoid recursive maps and error with changes in keymaps
local opts = {noremap = true, silent = true}

--Save file with Ctrl + s
vim.keymap.set('n', '<C-s>', '<cmd> w <CR>', opts)

--Change default movement keys to (k, o, l, ñ)
  --Normal Mode
  vim.keymap.set('n', 'k', 'h', opts) -- Left
  vim.keymap.set('n', 'l', 'j', opts) -- Down
  vim.keymap.set('n', 'ñ', 'l', opts) -- Rigth
  vim.keymap.set('n', 'o', 'k', opts) -- Up
  vim.keymap.set('n', 'O', 'J', opts) -- Join lines with O
  vim.keymap.set('n', 'j', 'o', opts) -- New line below
  vim.keymap.set('n', 'J', 'O', opts) -- New line above

  --Visual Mode
  vim.keymap.set('v', 'k', 'h', opts) -- Left
  vim.keymap.set('v', 'l', 'j', opts) -- Down
  vim.keymap.set('v', 'ñ', 'l', opts) -- Rigth
  vim.keymap.set('v', 'o', 'k', opts) -- Up
  vim.keymap.set('v', 'j', 'J', opts) -- Join lines in Visual

  --Operator Mode (`d`, `c`, `y`, etc.)
  vim.keymap.set('o', 'k', 'h', opts) -- Left
  vim.keymap.set('o', 'l', 'j', opts) -- Down
  vim.keymap.set('o', 'ñ', 'l', opts) -- Rigth
  vim.keymap.set('o', 'o', 'k', opts) -- Up

--Save file without auto-formatting with <Space>sn
vim.keymap.set('n', '<leader>sn', '<cmd>noautocmd w <CR>', opts)

--Quit file with Ctrl + q
vim.keymap.set('n', '<C-q>', '<cmd> q <CR>', opts)

--Delete single character without copying into register
vim.keymap.set('n', 'x', '"_x', opts)

--Vertical scroll with a half window of displacement and center curent view
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)
  
--Find ocurrencies when searching and center current view
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

--Buffers in Normal Mode
  --Navigate to next buffer like :bnext 
  vim.keymap.set('n', '<Tab>', ':bnext<CR>', opts)

  --Navigate to previous buffer like :bprevious
  vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', opts)

  --Close current buffer like :Bdelete!
  vim.keymap.set('n', '<leader>x', ':Bdelete!<CR>', opts)   

  --Create a new empty buffer like :enew
  vim.keymap.set('n', '<leader>b', '<cmd> enew <CR>', opts)


--Window management
vim.keymap.set('n', '<leader>v', '<C-w>v', opts)      --Split window vertically
vim.keymap.set('n', '<leader>h', '<C-w>s', opts)      --Split window horizontally
vim.keymap.set('n', '<leader>se', '<C-w>=', opts)     --Make split windows equal width & height
vim.keymap.set('n', '<leader>xs', ':close<CR>', opts) --Close current split window

--Navigate between splits
vim.keymap.set('n', '<M-o>', ':wincmd k<CR>', opts)
vim.keymap.set('n', '<M-l>', ':wincmd j<CR>', opts)
vim.keymap.set('n', '<M-k>', ':wincmd h<CR>', opts)
vim.keymap.set('n', '<M-ñ>', ':wincmd l<CR>', opts)

--Increment/decrement numbers
vim.keymap.set('n', '<leader>+', '<C-a>', opts) -- increment
vim.keymap.set('n', '<leader>-', '<C-x>', opts) -- decrement

--Press kl fast to exit insert mode
vim.keymap.set('i', 'kl', '<ESC>', opts)
vim.keymap.set('i', 'lk', '<ESC>', opts)

--Move text up and down
vim.keymap.set('v', '<A-l>', ':m .+1<CR>==', opts)
vim.keymap.set('v', '<A-o>', ':m .-2<CR>==', opts)

--Keep last yanked when pasting with selected text
vim.keymap.set('v', 'p', '"_dP', opts)

--With the cursor above a word, it changes all ocurrencies
vim.keymap.set('n', '<leader>R', ':%s/\\<<C-r><C-w>\\>/', { noremap = true, silent = false })

--Replace word under cursor
vim.keymap.set('n', '<leader>j', '*``cgn', opts)

--Open Neo-tree
vim.keymap.set('n', '<leader>e', ':Neotree<CR>', { noremap = true, silent = true })

--Unselect ocurrencies after searching
vim.api.nvim_set_keymap('n', '<Esc>', ':nohlsearch<CR>', { noremap = true, silent = true })



-- Print Global Keymaps
vim.api.nvim_create_user_command('GlobalKeymaps', function()
  -- Create a buffer with all keymaps
  local lines = {
    "=== GLOBAL KEYMAPS ===",
    "Leader key: <Space>",
    "",
    "=== BASIC MOVEMENT ===",
    "n k → h (Left)",
    "n l → j (Down)",
    "n ñ → l (Right)",
    "n o → k (Up)",
    "n O → J (Join lines)",
    "n j → o (New line below)",
    "n J → O (New line above)",
    "",
    "=== FILE OPERATIONS ===",
    "<C-s> → Save file",
    "<C-q> → Quit file",
    "<leader>sn → Save without formatting",
    "",
    "=== WINDOW MANAGEMENT ===",
    "<leader>v → Vertical split",
    "<leader>h → Horizontal split",
    "<leader>se → Equalize splits",
    "<leader>xs → Close current split",
    "<M-o> → Move to upper split",
    "<M-l> → Move to lower split",
    "<M-k> → Move to left split",
    "<M-ñ> → Move to right split",
    "",
    "=== BUFFER MANAGEMENT ===",
    "<Tab> → Next buffer",
    "<S-Tab> → Previous buffer",
    "<leader>x → Close buffer",
    "<leader>b → New empty buffer",
    "",
    "=== EDITING ===",
    "x → Delete char (no yank)",
    "<C-d> → Half-page down (centered)",
    "<C-u> → Half-page up (centered)",
    "n/N → Keep search centered",
    "<leader>+ → Increment number",
    "<leader>- → Decrement number",
    "kl/lk → Escape insert mode",
    "<A-l> → Move line down (visual)",
    "<A-o> → Move line up (visual)",
    "p → Paste without yanking (visual)",
    "<leader>R → Replace all occurrences",
    "<leader>j → Replace word under cursor",
    "",
    "=== OTHER ===",
    "<leader>e → Open Neo-tree",
    "<Esc> → Clear search highlights"
  }

  -- Create a floating window
  local buf = vim.api.nvim_create_buf(false, true)
  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)
  local win = vim.api.nvim_open_win(buf, true, {
    relative = 'editor',
    width = width,
    height = height,
    col = math.floor((vim.o.columns - width) / 2),
    row = math.floor((vim.o.lines - height) / 2),
    style = 'minimal',
    border = 'rounded'
  })

  -- Add content and make it readonly
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
  vim.api.nvim_buf_set_option(buf, 'modifiable', false)
  vim.api.nvim_buf_set_option(buf, 'filetype', 'help')

  -- Close window with q
  vim.api.nvim_buf_set_keymap(buf, 'n', 'q', '<cmd>bd!<CR>', {noremap = true, silent = true})
  vim.api.nvim_buf_set_keymap(buf, 'n', '<Esc>', '<cmd>bd!<CR>', {noremap = true, silent = true})
end, {})






