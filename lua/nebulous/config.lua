local M = {}

---Default scheme options
local default_options = {
  variant = "night",
  disable = {
    background = false,
    endOfBuffer = false,
    terminal_colors = false,
  },
  italic = {
    comments = false,
    keywords = false,
    functions = false,
    variables = false,
    builtins = false,
    definitions = false,
    todos = false,
    qualifiers = false,
  },
  bold = {
    comments = false,
    keywords = false,
    functions = false,
    variables = false,
    builtins = false,
    definitions = false,
    todos = false,
    qualifiers = false,
  },
  underline = {
    comments = false,
    keywords = false,
    functions = false,
    variables = false,
    builtins = false,
    definitions = false,
    todos = false,
    qualifiers = false,
  },
  undercurl = {
    comments = false,
    keywords = false,
    functions = false,
    variables = false,
    builtins = false,
    definitions = false,
    todos = false,
    qualifiers = false,
  },
  underdouble = {
    comments = false,
    keywords = false,
    functions = false,
    variables = false,
    builtins = false,
    definitions = false,
    todos = false,
    qualifiers = false,
  },
  underdash = {
    comments = false,
    keywords = false,
    functions = false,
    variables = false,
    builtins = false,
    definitions = false,
    todos = false,
    qualifiers = false,
  },
  custom_colors = {},
}

---Set custom options to the editor
--@param opts table: custom options for editor
function M.set_user_options(opts)
  opts = opts or {}
  local options = vim.tbl_deep_extend("force", {}, default_options, opts)
  return options
end

---Get the value of secheme options
--@param config table: custom options to be applied to the editor scheme
--@return settings table: settings adapted to load the scheme
function M.get_scheme_options(config)
  config = config or {}
  local settings = {} --TODO: improve options adaptation

  local italic_comments = config.italic.comments and "italic" or "NONE"
  local italic_keywords = config.italic.keywords and "italic" or "NONE"
  local italic_functions = config.italic.functions and "italic" or "NONE"
  local italic_variables = config.italic.variables and "italic" or "NONE"
  local italic_builtins = config.italic.builtins and "italic" or "NONE"
  local italic_definitions = config.italic.definitions and "italic" or "NONE"
  local italic_todos = config.italic.todos and "italic" or "NONE"
  local italic_qualifiers = config.italic.qualifiers and "italic" or "NONE"

  local bold_comments = config.bold.comments and "bold" or "NONE"
  local bold_keywords = config.bold.keywords and "bold" or "NONE"
  local bold_functions = config.bold.functions and "bold" or "NONE"
  local bold_variables = config.bold.variables and "bold" or "NONE"
  local bold_builtins = config.bold.builtins and "bold" or "NONE"
  local bold_definitions = config.bold.definitions and "bold" or "NONE"
  local bold_todos = config.bold.todos and "bold" or "NONE"
  local bold_qualifiers = config.bold.qualifiers and "bold" or "NONE"

  local underline_comments = config.underline.comments and "underline" or "NONE"
  local underline_keywords = config.underline.keywords and "underline" or "NONE"
  local underline_functions = config.underline.functions and "underline" or "NONE"
  local underline_variables = config.underline.variables and "underline" or "NONE"
  local underline_builtins = config.underline.builtins and "underline" or "NONE"
  local underline_definitions = config.underline.definitions and "underline" or "NONE"
  local underline_todos = config.underline.todos and "underline" or "NONE"
  local underline_qualifiers = config.underline.qualifiers and "underline" or "NONE"

  local undercurl_comments = config.undercurl.comments and "undercurl" or "NONE"
  local undercurl_keywords = config.undercurl.keywords and "undercurl" or "NONE"
  local undercurl_functions = config.undercurl.functions and "undercurl" or "NONE"
  local undercurl_variables = config.undercurl.variables and "undercurl" or "NONE"
  local undercurl_builtins = config.undercurl.builtins and "undercurl" or "NONE"
  local undercurl_definitions = config.undercurl.definitions and "undercurl" or "NONE"
  local undercurl_todos = config.undercurl.todos and "undercurl" or "NONE"
  local undercurl_qualifiers = config.undercurl.qualifiers and "undercurl" or "NONE"

  local underdouble_comments = config.underdouble.comments and "underdouble" or "NONE"
  local underdouble_keywords = config.underdouble.keywords and "underdouble" or "NONE"
  local underdouble_functions = config.underdouble.functions and "underdouble" or "NONE"
  local underdouble_variables = config.underdouble.variables and "underdouble" or "NONE"
  local underdouble_builtins = config.underdouble.builtins and "underdouble" or "NONE"
  local underdouble_definitions = config.underdouble.definitions and "underdouble" or "NONE"
  local underdouble_todos = config.underdouble.todos and "underdouble" or "NONE"
  local underdouble_qualifiers = config.underdouble.qualifiers and "underdouble" or "NONE"

  local underdash_comments = config.underdash.comments and "underdashed" or "NONE"
  local underdash_keywords = config.underdash.keywords and "underdashed" or "NONE"
  local underdash_functions = config.underdash.functions and "underdashed" or "NONE"
  local underdash_variables = config.underdash.variables and "underdashed" or "NONE"
  local underdash_builtins = config.underdash.builtins and "underdashed" or "NONE"
  local underdash_definitions = config.underdash.definitions and "underdashed" or "NONE"
  local underdash_todos = config.underdash.todos and "underdashed" or "NONE"
  local underdash_qualifiers = config.underdash.qualifiers and "underdashed" or "NONE"

  settings.st_eof = config.disable.endOfBuffer
  settings.term_colors = config.disable.terminal_colors
  settings.st_disable_bg = config.disable.background and "NONE"

  settings.st_comments = italic_comments .. "," .. bold_comments .. "," .. underline_comments .. "," .. undercurl_comments .. "," .. underdouble_comments .. "," .. underdash_comments
  settings.st_keywords = italic_keywords .. "," .. bold_keywords .. "," .. underline_keywords .. "," .. undercurl_keywords .. "," .. underdouble_keywords .. "," .. underdash_keywords
  settings.st_functions = italic_functions .. "," .. bold_functions .. "," .. underline_functions .. "," .. undercurl_functions .. "," .. underdouble_functions .. "," .. underdash_functions
  settings.st_variables = italic_variables .. "," .. bold_variables .. "," .. underline_variables .. "," .. undercurl_variables .. "," .. underdouble_variables .. "," .. underdash_variables
  settings.st_builtins = italic_builtins .. "," .. bold_builtins .. "," .. underline_builtins .. "," .. undercurl_builtins .. "," .. underdouble_builtins .. "," .. underdash_builtins
  settings.st_definitions = italic_definitions .. "," .. bold_definitions .. "," .. underline_definitions .. "," .. undercurl_definitions .. "," .. underdouble_definitions .. "," .. underdash_definitions
  settings.st_todos = italic_todos .. "," .. bold_todos .. "," .. underline_todos .. "," .. undercurl_todos .. "," .. underdouble_todos .. "," .. underdash_todos
  settings.st_qualifiers = italic_qualifiers .. "," .. bold_qualifiers .. "," .. underline_qualifiers .. "," .. undercurl_qualifiers .. "," .. underdouble_qualifiers .. "," .. underdash_qualifiers

  return settings
end

return M
