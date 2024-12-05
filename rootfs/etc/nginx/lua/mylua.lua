--Fix debugger paths
local env_sources_dir = os.getenv('DEBUG_SOURCES_DIR')
local debug_sources_dir = "./rootfs/etc/nginx"
_G.emmy = {}
_G.emmy.fixPath = function(path)
    return string.gsub(path, '/etc/nginx/', debug_sources_dir .. '/')
end

-- Load debugger
package.cpath = package.cpath .. ';/usr/local/emmy/?.so'
local dbg = require('emmy_core')
 dbg.tcpListen('localhost', 9966)
--Wait for IDE connection
dbg.waitIDE()
print("Debugger started")
for i = 1, 13 do
    print(i)
end
ngx.say("hello world dwdfe1")


