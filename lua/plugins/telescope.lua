local builtin = require("telescope.builtin")

-- vim.keymap.set('n', '<c-p>', builtin.find_files, {})
vim.keymap.set("n", "<Space>ff", builtin.find_files, {})
vim.keymap.set("n", "<Space><Space>", builtin.oldfiles, {})
vim.keymap.set("n", "<Space>fg", builtin.live_grep, {})
vim.keymap.set("n", "<Space>fb", builtin.buffers, {})
vim.keymap.set("n", "<Space>fh", builtin.help_tags, {})

---@tag telescope.mappings
--- source: https://github.com/nvim-telescope/telescope.nvim/blob/master/lua/telescope/mappings.lua

local a = vim.api

local actions = require("telescope.actions")
local config = require("telescope.config")

local mappings = {}

mappings.default_mappings = config.values.default_mappings or {
	i = {},
	n = {},
}

-- normal names are prefixed with telescope|
-- encoded objects are prefixed with telescopej|
local get_desc_for_keyfunc = function(v)
	if type(v) == "table" then
		local name = ""
		for _, action in ipairs(v) do
			if type(action) == "string" then
				name = name == "" and action or name .. " + " .. action
			end
		end
		return "telescope|" .. name
	elseif type(v) == "function" then
		local info = debug.getinfo(v)
		return "telescopej|" .. vim.json.encode({ source = info.source, linedefined = info.linedefined })
	end
end

local telescope_map = function(prompt_bufnr, mode, key_bind, key_func, opts)
	if not key_func then
		return
	end

	opts = opts or {}
	if opts.noremap == nil then
		opts.noremap = true
	end
	if opts.silent == nil then
		opts.silent = true
	end

	if type(key_func) == "string" then
		key_func = actions[key_func]
	elseif type(key_func) == "table" then
		if key_func.type == "command" then
			vim.keymap.set(
				mode,
				key_bind,
				key_func[1],
				vim.tbl_extend("force", opts or {
					silent = true,
				}, { buffer = prompt_bufnr })
			)
			return
		elseif key_func.type == "action_key" then
			key_func = actions[key_func[1]]
		elseif key_func.type == "action" then
			key_func = key_func[1]
		end
	end

	vim.keymap.set(mode, key_bind, function()
		local ret = key_func(prompt_bufnr)
		vim.api.nvim_exec_autocmds("User", { pattern = "TelescopeKeymap" })
		return ret
	end, vim.tbl_extend("force", opts, { buffer = prompt_bufnr, desc = get_desc_for_keyfunc(key_func) }))
end

local extract_keymap_opts = function(key_func)
	if type(key_func) == "table" and key_func.opts ~= nil then
		-- we can't clear this because key_func could be a table from the config.
		-- If we clear it the table ref would lose opts after the first bind
		-- We need to copy it so noremap and silent won't be part of the table ref after the first bind
		return vim.deepcopy(key_func.opts)
	end
	return {}
end

mappings.apply_keymap = function(prompt_bufnr, attach_mappings, buffer_keymap)
	local applied_mappings = { n = {}, i = {} }

	local map = function(modes, key_bind, key_func, opts)
		if type(modes) == "string" then
			modes = { modes }
		end

		for _, mode in pairs(modes) do
			mode = string.lower(mode)
			local key_bind_internal = a.nvim_replace_termcodes(key_bind, true, true, true)
			applied_mappings[mode][key_bind_internal] = true

			telescope_map(prompt_bufnr, mode, key_bind, key_func, opts)
		end
	end

	if attach_mappings then
		local attach_results = attach_mappings(prompt_bufnr, map)

		if attach_results == nil then
			error(
				"Attach mappings must always return a value. `true` means use default mappings, "
					.. "`false` means only use attached mappings"
			)
		end

		if not attach_results then
			return
		end
	end

	for mode, mode_map in pairs(buffer_keymap or {}) do
		mode = string.lower(mode)

		for key_bind, key_func in pairs(mode_map) do
			local key_bind_internal = a.nvim_replace_termcodes(key_bind, true, true, true)
			if not applied_mappings[mode][key_bind_internal] then
				applied_mappings[mode][key_bind_internal] = true
				telescope_map(prompt_bufnr, mode, key_bind, key_func, extract_keymap_opts(key_func))
			end
		end
	end

	-- TODO: Probably should not overwrite any keymaps
	for mode, mode_map in pairs(mappings.default_mappings) do
		mode = string.lower(mode)

		for key_bind, key_func in pairs(mode_map) do
			local key_bind_internal = a.nvim_replace_termcodes(key_bind, true, true, true)
			if not applied_mappings[mode][key_bind_internal] then
				applied_mappings[mode][key_bind_internal] = true
				telescope_map(prompt_bufnr, mode, key_bind, key_func, extract_keymap_opts(key_func))
			end
		end
	end
end

return mappings
