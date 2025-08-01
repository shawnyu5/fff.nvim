--- @return string
local function get_lib_extension()
  if jit.os:lower() == 'mac' or jit.os:lower() == 'osx' then return '.dylib' end
  if jit.os:lower() == 'windows' then return '.dll' end
  return '.so'
end

-- search for the lib in the /target/release directory with and without the lib prefix
-- since MSVC doesn't include the prefix
local base_path = debug.getinfo(1).source:match('@?(.*/)')
package.cpath = package.cpath
  .. ';'
  .. base_path
  .. '../../../target/release/lib?'
  .. get_lib_extension()
  .. ';'
  .. base_path
  .. '../../../target/release/?'
  .. get_lib_extension()

return require('fff_nvim')
