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
  speed = 0,			-- Скорость в пункт/сек
  angle = 0				-- Угол вектора скорости в градусах
}

function enemi3:Draw() common.DrawGameObject(self) end
function enemi3:Move() common.MoveGameObject(self) end

return enemi3
