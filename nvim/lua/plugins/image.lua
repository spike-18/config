return {

    {
      "3rd/image.nvim",

      config = function()
        require("image").setup({
            backend = "kitty",
            build = false,
            processor = "magick_cli",
            integrations = {
              markdown = { enabled = true },
              neorg = { enabled = true },
            },
            max_height_window_percentage = 50,
            hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" },
          })
      end

    }

}
