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
  speed = 0,			-- Скорость в пункт/сек
  angle = 0				-- Угол вектора скорости в градусах
}

function enemi2:Draw() common.DrawGameObject(self) end
function enemi2:Move() common.MoveGameObject(self) end

return enemi2
