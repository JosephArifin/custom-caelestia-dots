return {
	"kylechui/nvim-surround",
	version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
	event = "VeryLazy",
	config = function()
		require("nvim-surround").setup({
			-- Configuration here, or leave empty to use defaults
			surrounds = {
				["("] = {
					add = { "(", ")" },
					-- find = function()
					-- 	return M.get_selection({ motion = "a(" })
					-- end,
					-- delete = "^(. ?)().-( ?.)()$",
				},
				["{"] = {
					add = { "{", "}" },
					-- find = function()
					-- 	return M.get_selection({ motion = "a{" })
					-- end,
					-- delete = "^(. ?)().-( ?.)()$",
				},
				["<"] = {
					add = { "<", ">" },
					-- find = function()
					-- 	return M.get_selection({ motion = "a<" })
					-- end,
					-- delete = "^(. ?)().-( ?.)()$",
				},
				["["] = {
					add = { "[", "]" },
					-- find = function()
					-- 	return M.get_selection({ motion = "a[" })
					-- end,
					-- delete = "^(. ?)().-( ?.)()$",
				},
			},
		})
	end,
}
