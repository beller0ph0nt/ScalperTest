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
  speed = 0,			-- Скорость в пункт/сек
  angle = 0				-- Угол вектора скорости в градусах
}

function enemi4:Draw() common.DrawGameObject(self) end
function enemi4:Move() common.MoveGameObject(self) end

return enemi4
