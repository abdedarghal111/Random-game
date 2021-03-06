--[[
Este sera el modulo de una part, servira para llamarlo como si fuera un object.
Esta es la tabla con las funciones y caracteristicas propias. Tambien tendra
funciones de renderizado y caracteristicas necesarias.
--]]
local cube = {
  position = vector2.new(),
  size = vector2.new(100,100),
  rotation = 0,
  candraw = true,
  rotate = function(self)
    return self.rotation/360*math.pi
  end,
  draw = function(self)
    if self.candraw then
      love.graphics.translate(self.position.x + self.size.x/2,self.position.y + self.size.y/2)
      love.graphics.rotate(self:rotate())
      love.graphics.translate(-self.size.x/2,-self.size.y/2)
      love.graphics.rectangle("fill",0,0,self.size.x,self.size.y)
      love.graphics.origin()
    end
  end
}

--Esta es la funcion para crear la instancia
function cube.new(x,y,px,py,candraw)
  local e = {}
  for i,v in pairs(cube) do
    e[i] = v
  end
  e.position.x = x or 0
  e.position.y = y or 0
  e.size.x = px or 100
  e.size.y = py or 100
  e.candraw = candraw or true
  return e
end

--se devuelve el modulo
return cube
