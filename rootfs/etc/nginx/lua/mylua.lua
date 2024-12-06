--Fix debugger paths
-- you need to ave DEBUG_SOURCES_DIR environment variable set to the path to the sources
-- e.g. export DEBUG_SOURCES_DIR=/path/to/your/sources
-- AND it need to be set in the nginx.conf or it won't be available

local debug_sources_dir  = os.getenv('DEBUG_SOURCES_DIR')

_G.emmy = {}
_G.emmy.fixPath = function(path)
    return string.gsub(path, '/etc/nginx/', debug_sources_dir .. '/')
end

-- Load debugger
package.cpath = package.cpath .. ';/usr/local/emmy/?.so'
local dbg = require('emmy_core')
 dbg.tcpListen('0.0.0.0', 9966)
--Wait for IDE connection
dbg.waitIDE()
print("Debugger started")
for i = 1, 13 do
    print(i)
end
ngx.say("hello world")


