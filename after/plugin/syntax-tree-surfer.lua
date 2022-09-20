local status, surfer = pcall(require, "syntax-tree-surfer")
if not status then
	return
end
surfer.setup()

-- surfer.go_to_top_node_and_execute_commands(false, { "normal! O", "normal! O", "startinsert" })

-- Syntax Tree Surfer
local opts = { noremap = true, silent = true }
local opts_expr = { expr = true, silent = true }

-- Normal Mode Swapping:
-- Swap The Master Node relative to the cursor with it's siblings, Dot Repeatable
vim.keymap.set("n", "vU", function()
	vim.opt.opfunc = "v:lua.STSSwapUpNormal_Dot"
	return "g@l"
end, { silent = true, expr = true })

vim.keymap.set("n", "vD", function()
	vim.opt.opfunc = "v:lua.STSSwapDownNormal_Dot"
	return "g@l"
end, { silent = true, expr = true })

-- Swap Current Node at the Cursor with it's siblings, Dot Repeatable
vim.keymap.set("n", "vd", function()
	vim.opt.opfunc = "v:lua.STSSwapCurrentNodeNextNormal_Dot"
	return "g@l"
end, { silent = true, expr = true })

vim.keymap.set("n", "vu", function()
	vim.opt.opfunc = "v:lua.STSSwapCurrentNodePrevNormal_Dot"
	return "g@l"
end, { silent = true, expr = true })

--> If the mappings above don't work, use these instead (no dot repeatable)
-- vim.keymap.set("n", "vd", ':STSSwapCurrentNodeNextNormal<CR>', opts)
-- vim.keymap.set("n", "vu", ':STSSwapCurrentNodePrevNormal<CR>', opts)
-- vim.keymap.set("n", "vD", ':STSSwapDownNormal<CR>', opts)
-- vim.keymap.set("n", "vU", ':STSSwapUpNormal<CR>', opts)

-- Visual Selection from Normal Mode
vim.keymap.set("n", "vx", ":STSSelectMasterNode<CR>", opts)
vim.keymap.set("n", "vn", ":STSSelectCurrentNode<CR>", opts)

-- Select Nodes in Visual Mode
-- vim.keymap.set("x", "J", ":STSSelectNextSiblingNode<CR>", opts)
-- vim.keymap.set("x", "K", ":STSSelectPrevSiblingNode<CR>", opts)
-- vim.keymap.set("x", "H", ":STSSelectParentNode<CR>", opts)
-- vim.keymap.set("x", "L", ":STSSelectChildNode<CR>", opts)

-- Swapping Nodes in Visual Mode
-- vim.keymap.set("x", "<A-j>", ":STSSwapNextVisual<CR>", opts)
-- vim.keymap.set("x", "<A-k>", ":STSSwapPrevVisual<CR>", opts)
