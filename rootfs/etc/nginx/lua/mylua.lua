-- snip

-- Fix debugger paths
local debug_sources_dir = os.getenv('DEBUG_SOURCES_DIR')
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


-- defines a factorial function
function fact (n)
    if n == 0 then
        return 1
    else
        return n * fact(n - 1)
    end
end

print("enter a number:")
print(fact(10))
ngx.say("hello world 1")


