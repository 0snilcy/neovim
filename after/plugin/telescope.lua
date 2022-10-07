local status, telescope = pcall(require, "telescope")
if not status then
	return
end

local transform_mod = require("telescope.actions.mt").transform_mod
local nvb_actions = transform_mod({
	file_path = function(prompt_bufnr)
		-- Get selected entry and the file full path
		local content = require("telescope.actions.state").get_selected_entry()
		local full_path = content.cwd .. require("plenary.path").path.sep .. content.value

		-- Yank the path to unnamed register
		vim.fn.setreg('"', full_path)

		-- Close the popup
		require("utils").info("File path is yanked ")
		require("telescope.actions").close(prompt_bufnr)
	end,
	command = function(prompt_bufnr)
		-- Get selected entry and the file full path
		local content = require("telescope.actions.state").get_selected_entry()
		-- local full_path = content.cwd .. require("plenary.path").path.sep .. content.value
		--

		-- Yank the path to unnamed register
		vim.fn.setreg('"', content.value)

		-- Close the popup
		require("utils").info("Content is yanked ")
		require("telescope.actions").close(prompt_bufnr)
	end,
})

local actions = require("telescope.actions")

telescope.setup({
	defaults = {
		-- vimgrep_arguments = {
		-- 	"rg",
		-- 	"--color=never",
		-- 	"--no-heading",
		-- 	"--with-filename",
		-- 	"--line-number",
		-- 	"--column",
		-- 	"--smart-case",
		-- },
		color_devicons = true,
		sorting_strategy = "ascending",
		layout_strategy = "bottom_pane",
		initial_mode = "insert",
		prompt_prefix = "",
		selection_caret = "⇨ ",
		-- layout_config = {
		-- 	horizontal = {
		-- 		-- prompt_position = "top",
		-- 	},
		-- 	bottom_pane = {
		-- 		border = false,
		-- 		-- prompt_position = "bottom",
		-- 		-- borderchars = { "" },
		-- 	},
		-- },
		file_ignore_patterns = {
			-- "*.bak",
			-- ".git",
		},
		-- buffer_previewer_maker = preview_maker,
		preview = {
			check_mime_type = "file",
			mime_hook = function(filepath, bufnr, opts)
				local is_image = function(filepath)
					local image_extensions = { "png", "jpg", "gif", "svg", "ico", "jpeg", "bmp", "webp" }
					local split_path = vim.split(filepath:lower(), ".", {
						plain = true,
					})
					local extension = split_path[#split_path]
					return vim.tbl_contains(image_extensions, extension)
				end
				if is_image(filepath) then
					local term = vim.api.nvim_open_term(bufnr, {})
					local function send_output(_, data, _)
						for _, d in ipairs(data) do
							vim.api.nvim_chan_send(term, d .. "\r\n")
						end
					end
					vim.fn.jobstart({
						"catimg",
						filepath, -- Terminal image viewer command
					}, {
						on_stdout = send_output,
						stdout_buffered = true,
					})
				else
					require("telescope.previewers.utils").set_preview_message(
						bufnr,
						opts.winid,
						"Binary cannot be previewed"
					)
				end
			end,
		},
		mappings = {
			i = {
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				["<C-n>"] = actions.cycle_history_next,
				["<C-p>"] = actions.cycle_history_prev,
				["<C-q>"] = actions.close,
			},
			n = {
				["q"] = actions.close,
			},
		},
	},
	pickers = {
		find_files = {
			mappings = {
				n = {
					["y"] = nvb_actions.file_path,
				},
				i = {
					["<C-y>"] = nvb_actions.file_path,
				},
			},
			find_command = {
				"fd",
				"--type",
				"f",
				"--exclude",
				".git",
				"--hidden",
				-- "--no-ignore",
				-- ".",
			},
		},
		git_files = {
			mappings = {
				n = {
					["y"] = nvb_actions.file_path,
				},
				i = {
					["<C-y>"] = nvb_actions.file_path,
				},
			},
		},
		search_history = {
			mappings = {
				n = {
					["y"] = nvb_actions.command,
				},
				i = {
					["<C-y>"] = nvb_actions.command,
				},
			},
		},
	},
	extensions = {
		fzf = {
			fuzzy = true,
			case_mode = "smart_case",
		},
		projects = {},
		repo = {
			search_dirs = {
				"~/git",
			},
		},
		file_browser = {
			hijack_netrw = true,
			mappings = {
				n = {
					["y"] = nvb_actions.file_path,
				},
				i = {
					["<C-y>"] = nvb_actions.file_path,
				},
			},
			grouped = true,
			select_buffer = true,
			hidden = true,
			respect_gitignore = true,
			-- hide_parent_dir = true,
		},
	},
})

telescope.load_extension("fzf")
telescope.load_extension("file_browser")
-- telescope.load_extension("media_files")
-- telescope.load_extension("project") -- telescope-project.nvim
-- telescope.load_extension("repo")
-- telescope.load_extension("projects") -- project.nvim
