return {
  "epwalsh/obsidian.nvim",
  version = "*",  -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
  --   -- refer to `:h file-pattern` for more examples
  --   "BufReadPre path/to/my-vault/*.md",
  --   "BufNewFile path/to/my-vault/*.md",
  -- },
  dependencies = {
    "nvim-lua/plenary.nvim",

  },
  opts = {
    ui = { enable = false },
    workspaces = {
      {
        name = "athena",
        path = "~/Documents/Athena/",
      },
    },
    -- Daily notes
    daily_notes = {
      folder = "Atlas/Journal/",
      date_format = "%Y-%m-%d",
      default_tags = { "journal" },
      template = "System/daily.md",
    },
    -- New notes sub
    notes_subdir = "Notes/",
    new_notes_location = "notes_subdir",
    -- Templates
    templates = {
      folder = "System/Templates/",
      date_format = "%Y-%m-%d",
      time_format = "%H:%M",
    },
    -- Default notes
    note_id_func = function(title)
      -- filename = the note title, slugged (e.g. "My Note.md")
      return title
    end,
    note_frontmatter_func = function(note)
      -- Fallback to "Untitled" if title is missing
      local title = (note.title ~= nil and note.title ~= "") and note.title or "Untitled"
    
      -- Fallback to "fleeting" tag if tags missing or empty
      local tags = (note.tags ~= nil and #note.tags > 0) and note.tags or { "fleeting" }
    
      -- Use existing date if present, or fallback to now
      local date = note.date or os.date("%Y-%m-%d %H:%M")
    
      return {
        id = title,
        tags = tags,
        date = date,
      }
    end
  },
}
