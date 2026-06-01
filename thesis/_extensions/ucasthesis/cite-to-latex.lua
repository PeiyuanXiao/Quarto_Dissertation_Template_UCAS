local function cite_text(inlines)
  if inlines == nil or #inlines == 0 then
    return ""
  end
  return pandoc.utils.stringify(inlines)
end

local function optional_args(citation)
  local prefix = cite_text(citation.prefix)
  local suffix = cite_text(citation.suffix)

  if prefix ~= "" and suffix ~= "" then
    return "[" .. prefix .. "][" .. suffix .. "]"
  elseif suffix ~= "" then
    return "[" .. suffix .. "]"
  elseif prefix ~= "" then
    return "[" .. prefix .. "][]"
  end

  return ""
end

function Cite(el)
  if FORMAT ~= "latex" then
    return nil
  end

  local ids = {}
  for _, citation in ipairs(el.citations) do
    table.insert(ids, citation.id)
  end

  if #ids == 0 then
    return nil
  end

  local first = el.citations[1]
  local command = "citep"
  if #ids == 1 and first.mode == "AuthorInText" then
    command = "citet"
  end

  local opts = ""
  if #ids == 1 then
    opts = optional_args(first)
  end

  return pandoc.RawInline("latex", "\\" .. command .. opts .. "{" .. table.concat(ids, ",") .. "}")
end
