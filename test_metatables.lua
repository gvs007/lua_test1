#!/usr/bin/lua

-- package.cpath = package.cpath..';/usr/local/lib/lua/5.1/?.so;/usr/local/lib/lua/5.1/posix/?.so'

t = function()
  print('hello')
end

t()

t = {}

t.__index = t
t.__class = t
t.__base = base

print (t)
print (t.__index)
print (t.__class)
print (t.__base)


condition = {}

s = condition and "on" or "off"   --тернарный оператор

print ('condition:'..s)

o = {}

setmetatable(o, { __index = function(target, key)
        if key ~= "foo" then print('ERR') end
        if flag then return 1 end
        return 2
end})

flag = false
print(o.foo)
flag = true
print(o.foo)

--for n in pairs(_G) do print(n) end

--https://forum.mtasa.com/topic/49166-lua-setmetatable-%D1%83%D1%87%D0%B8%D0%BC%D1%81%D1%8F-%D1%80%D0%B0%D0%B1%D0%BE%D1%82%D0%B0%D1%82%D1%8C-%D1%81-%D0%BC%D0%B5%D1%82%D0%B0%D1%82%D0%B0%D0%B1%D0%BB%D0%B8%D1%86%D0%B0%D0%BC%D0%B8/

-- http://computercraft.ru/topic/1090-metatablitcy-lua/
-- ++++ https://itnan.ru/post.php?c=1&p=346892     есть про self и двоеточие

--не плохая дока по LUA и Примеры по ссылке
--http://www.tutorialspoint.com/lua/lua_metatables.htm


mytable = setmetatable({key1 = "value1"}, {
   __index = function(mytable, key)

      if key == "key2" then
         return "metatablevalue"
      else
         return mytable[key]
      end
   end
})
--debug()
print(mytable.key1,mytable.key2)
f = {}
result = getmetatable (mytable)
print (type(result))

print (result.__index)
--result.__index(a,b)

