local common = require('common')  -- Подключение общих функций

local enemi3 = {
  mode = "fill",
  x = 30,
  y = 330,
  w = 30,
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

function enemi3:Draw() common.DrawGameObject(self) end
function enemi3:Move() common.MoveGameObject(self) end

return enemi3