return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				transparent_background = true,
				float = {
					transparent = true,
					solid = true,
				},
				color_overrides = {
					frappe = {
						base = "#1a121f",
						mantle = "#20172b",
						crust = "#261c37",

						surface0 = "#2c2043",
						surface1 = "#352650",
						surface2 = "#3e2c5d",

						overlay0 = "#533b7a",
						overlay1 = "#624291",
						overlay2 = "#7059a8",

						text = "#f3e8ff",
						subtext0 = "#d6c2f0",
						subtext1 = "#b9a0e2",

						rose = "#ff92d0",
						flamingo = "#ff8fb3",
						mauve = "#c491ff",
						pink = "#ffb0ea",
						maroon = "#b15984",
						peach = "#ffb685",
						yellow = "#ffdc85",
						green = "#8de7c9",
						teal = "#6ad9e3",
						sky = "#89d4ff",
						sapphire = "#7ca7ff",
						blue = "#9aa4ff",
						lavender = "#cdb4ff",
					},
					-- latte = {
					--   -- Core background layers
					--   crust = '#0a0a10',  -- deepest background
					--   mantle = '#151522', -- cooler shadow
					--   base = '#1b1b29',   -- main background
					--
					--   -- Foreground
					--   text = '#e3c7fc',     -- light lavender-pink
					--   subtext1 = '#cfc3f7', -- cooler lavender
					--   subtext0 = '#b4a6e4', -- dimmer lavender-blue
					--
					--   -- Overlays (cool neutral grays, bluish tint)
					--   overlay2 = '#8d86a5',
					--   overlay1 = '#767091',
					--   overlay0 = '#605a77',
					--
					--   -- Surfaces (dark bluish-purple grays)
					--   surface2 = '#45405c',
					--   surface1 = '#353048',
					--   surface0 = '#252236',
					--
					--   -- Accents (pink + blue + purple theme)
					--   rosewater = '#f2c6de', -- soft pink
					--   flamingo = '#ec91b7',  -- pink-magenta
					--   mauve = '#e1a5ff',     -- brighter pastel purple-pink (less gray, more candy)
					--   red = '#f28fb5',       -- rosy hot pink
					--   maroon = '#f06aa9',    -- cool magenta-rose (pulls toward pink/blue instead of red)
					--   pink = '#f5b0e3',      -- candy pink
					--   peach = '#f5a0c6',     -- coral-pink
					--   yellow = '#a3b6ff',    -- periwinkle-blue highlight
					--   green = '#8ac5f7',     -- icy sky-blue
					--   teal = '#7ecbfa',      -- light aqua-blue
					--   sky = '#9ab4ff',       -- bright soft blue
					--   sapphire = '#8fa9ff',  -- softer mid-blue
					--   blue = '#8a7fff',      -- violet-blue bridge
					--   lavender = '#c6a7ff',  -- soft pastel purple
					-- },
				},
			})
			vim.cmd.colorscheme("catppuccin-mocha")
		end,
	},
}
