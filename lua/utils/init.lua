_G.prequire = function(...)
  local status, lib = pcall(require, ...)
  if status then
    return lib
  end
  return nil
end

_G.dump = function(...)
  print(vim.inspect(...))
end

_G.t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

_G.log = function(msg, hl, name)
  name = name or "Neovim"
  hl = hl or "Todo"
  vim.api.nvim_echo({ { name .. ": ", hl }, { msg } }, true, {})
end

_G.warn = function(msg, name)
  vim.notify(msg, vim.log.levels.WARN, { title = name })
end

_G.error = function(msg, name)
  vim.notify(msg, vim.log.levels.ERROR, { title = name })
end

_G.info = function(msg, name)
  vim.notify(msg, vim.log.levels.INFO, { title = name })
end

_G.extend = function(f, s)
  return vim.tbl_deep_extend("force", {}, f, s)
end
