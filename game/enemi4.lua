local common = require('common')  -- Подключение общих функций

local enemi4 = {
  mode = "fill",
  x = 330,
  y = 330,
  w = 120,
  h = 20,
  color = {
    0,
    0,
    255,
    255
  },
  xSpeed = 0,
  ySpeed = 0
}

function enemi4:Draw() common.DrawGameObject(self) end
function enemi4:Move() common.MoveGameObject(self) end

return enemi4