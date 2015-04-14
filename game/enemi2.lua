local common = require('common')  -- Подключение общих функций

local enemi2 = {
  mode = "fill",
  x = 300,
  y = 40,
  w = 70,
  h = 50,
  color = {
    0,
    0,
    255,
    255
  },
  xSpeed = 0,
  ySpeed = 0
}

function enemi2:Draw() common.DrawGameObject(self) end
function enemi2:Move() common.MoveGameObject(self) end

return enemi2