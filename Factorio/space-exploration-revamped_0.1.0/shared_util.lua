local util = {}

util.mod_prefix = "se-" -- update strings.cfg

util.min = math.min
util.max = math.max
util.floor = math.floor
util.abs = math.abs
util.sqrt = math.sqrt
util.sin = math.sin
util.cos = math.cos
util.atan = math.atan
util.atan2 = math.atan2
util.pi = math.pi
util.remove = table.remove
util.insert = table.insert
util.str_gsub = string.gsub
util.max_uint32 = 2^32-1

-- Strings

function string.starts(String,Start)
  return string.sub(String,1,string.len(Start))==Start
end

function string.ends(String,End)
  return string.sub(String,string.len(String) - string.len(End) + 1)==End
end

function util.replace(str, what, with)
  what = util.str_gsub(what, "[%(%)%.%+%-%*%?%[%]%^%$%%]", "%%%1") -- escape pattern
  with = util.str_gsub(with, "[%%]", "%%%%") -- escape replacement
  str = util.str_gsub(str, what, with)
  return str --only return the first variable from str_gsub
end

-- Tables

function util.remove_from_table(list, item)
  local index = 0
  for k,v in ipairs(list) do
      if item == v then
          index = k
          break
      end
  end
  if index > 0 then
      util.remove(list, index)
  end
end

-- Add table2 at the end of table1
function util.concatenate_tables(table1, table2)
  for _, value in pairs(table2) do
    table.insert(table1, value)
  end
end

function util.table_contains(table, check)
  for k,v in pairs(table) do if v == check then return true end end
  return false
end

return util
