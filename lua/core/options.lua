vim.o.hlsearch = true -- Set highlight on search
vim.wo.number = true --Make line numbers
vim.schedule(function() --  Schedule the setting after `UiEnter` because it can increase startup-time.
  vim.opt.clipboard = 'unnamedplus' --Sync clilpboard between OS and Neovim
end)
vim.o.wrap = false --Control that if text exceeds the width it continues below
vim.o.linebreak = true --Control that if words exceed the width don´t be cut off 
vim.o.mouse = 'a' --Enable mouse mode
vim.o.autoindent = true --Copy indenteation from current line when starting a new one
vim.o.ignorecase = true --Case-insensitive searching unless you include capital letters then those will be respected because of smartcase below
vim.o.smartcase = true --Respect capital letter when introduced in searching
vim.o.shiftwidth = 2 --Control identation of <<, >> and = commands
vim.o.tabstop = 2 --Define identation of tab
vim.o.softtabstop = 2 --Control behavior's <Tab> and <Backspace> at the moment of insertion
vim.o.expandtab = true --Convert tabs to spaces
vim.o.undofile = true -- Save undo history in last files when reopen them
vim.wo.signcolumn = 'yes' -- Keep signcolumn on by default, show signs like (+, ~, !, >)
vim.o.updatetime = 250 --Updatetime is the time is gonna take to do some actions like save the file 
vim.o.timeoutlen = 150 -- Time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.splitright = true --Configure a new split at the rigth with :vsplit and :vnew
vim.opt.splitbelow = true --Configure a new split below with :split and :new
vim.opt.inccommand = 'split' --Enable a preview of sustitution with :s commands
vim.opt.cursorline = true --Show which line cursor is (deafault: true)
vim.opt.scrolloff = 10 --Define minimal number of screen lines to keep above and below the cursor











