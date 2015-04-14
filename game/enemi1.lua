local common = require('common')  -- Подключение общих функций

local enemi1 = {
  mode = "fill",
  x = 50,
  y = 50,
  w = 70,
  h = 70,
  color = {
    0,
    0,
    255,
    255
  },
  xSpeed = 0,
  ySpeed = 0
}

function enemi1:Draw() common.DrawGameObject(self) end
function enemi1:Move() common.MoveGameObject(self) end

return enemi1