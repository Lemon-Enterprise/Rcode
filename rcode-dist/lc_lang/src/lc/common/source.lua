local Source = {}
function Source.read(path)
  local file, err = io.open(path, "rb")
  if not file then return nil, err end
  local text = file:read("*a"); file:close(); return text
end
return Source
