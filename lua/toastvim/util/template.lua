---@diagnostic disable: duplicate-set-field
ToastVim.template.register = function(expr, replacer)
  ToastVim.template.expressions[expr] = replacer
end

local parse = function(input)
  for expr, replacer in pairs(ToastVim.template.expressions) do
    local replace = replacer()
    input = input:gsub(expr, replace)
  end
  return input
end

ToastVim.template.insert = function(opts)
  local dir = ToastVim.template.tmp_path
  local templates = vim.fn.globpath(dir, "**/*", true, true)
  local tmp_dir
  for _, template in ipairs(templates) do
    if vim.fn.isdirectory(template) == 0 then
      local tmp_name = vim.fn.fnamemodify(template, ":t")
      local file_dir = vim.fn.fnamemodify(template, ":p")
      if tmp_name == opts then
        tmp_dir = file_dir
        break
      end
    end
  end
  if not tmp_dir then
    print("Error: Template file '" .. opts .. "' not found.")
    return
  end
  local file = io.open(tmp_dir, "r")
  if not file then
    print("Error: Could not open file at " .. tmp_dir)
    return
  end
  local contents = file:read("*all")
  file:close()
  if not contents or contents == "" then
    print("Error: Template file '" .. opts .. "' is empty.")
    return
  end

  local parsed_contents = parse(contents)
  if parsed_contents then
    local current_buf = vim.api.nvim_get_current_buf()
    vim.api.nvim_buf_set_lines(current_buf, 0, 0, false, vim.split(parsed_contents, "\n"))
  else
    print("Error: Parsing failed for template '" .. opts .. "'")
  end
end

local function get_tpls()
  local files = vim.fn.systemlist({ "fd", "--type", "f", ".", ToastVim.template.tmp_path })
  local file_list = {}
  for _, template in ipairs(files) do
    local filename = vim.fn.fnamemodify(template, ":t")
    if filename:find("tpl") then
      table.insert(file_list, filename)
    end
  end
  return file_list
end

local function get_templates()
  local files = vim.fn.systemlist({ "fd", "--type", "f", ".", ToastVim.template.tmp_path })
  local file_list = {}
  for _, template in ipairs(files) do
    local filename = vim.fn.fnamemodify(template, ":t")
    if not filename:find("tpl") then
      table.insert(file_list, filename)
    end
  end
  return file_list
end

ToastVim.template.tmp_path = vim.fn.stdpath("config") .. "/templates"
ToastVim.template.register('${FILENAME}', function() return vim.fn.expand('%:t:r') end)
ToastVim.template.register('${DATE}', function() return os.date("%d/%m/%y") end)
ToastVim.template.register('${AUTHOR}', function() return vim.fn.system("git config user.name"):gsub("\n", "") end)
ToastVim.template.register('${EMAIL}', function() return vim.fn.system("git config user.email"):gsub("\n", "") end)
ToastVim.template.register('${PROJECT}', function() return vim.fn.system('powershell -Command "Split-Path -Leaf (Get-Location)"'):gsub("\n", "") end)

vim.api.nvim_create_autocmd("BufReadPost", {
  group = vim.api.nvim_create_augroup("ToastVim.template", {}),
  callback = function()
    local file_name = vim.fn.expand("%:t")
    local file_path = vim.fn.expand("%:p")
    local file_size = vim.fn.getfsize(file_path)
    if file_size ~= 0 then return end
    local tpls = get_tpls()
    for _, tpl in ipairs(tpls) do
      local trimmed_tpl = tpl:sub(4)
      if file_name:sub(- #trimmed_tpl) == trimmed_tpl then
        ToastVim.template.insert(tpl)
        return
      end
    end
  end,
})

vim.api.nvim_create_user_command("Template", function(opts)
  ToastVim.template.insert(opts.args)
end, {
  nargs = 1,
  ---@diagnostic disable-next-line: unused-local
  complete = function(arglead, cmdline, cursorpos)
    return get_templates()
  end,
})
