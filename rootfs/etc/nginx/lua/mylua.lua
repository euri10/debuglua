-- snip

-- Fix debugger paths
local debug_sources_dir = os.getenv('DEBUG_SOURCES_DIR')
_G.emmy = {}
_G.emmy.fixPath = function(path)
    return string.gsub(path, '/etc/nginx/', debug_sources_dir..'/')
end

-- Load debugger
package.cpath = package.cpath .. ';/usr/local/emmy/?.so'
local dbg = require('emmy_core')
dbg.tcpListen('localhost', 9966)

-- Wait for IDE connection
dbg.waitIDE()
local cookie = nil
if not cookie then
    ngx.log(ngx.ERR, err)
    return
end


