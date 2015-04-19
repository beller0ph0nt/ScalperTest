local common = require('common')  -- Подключение общих функций

local enemi1 = {
  mode = "fill",
  x = 50,				-- Положение объекта. Координата x
  y = 50,				-- Положение объекта. Координата y
  w = 70,				-- Ширина ообъекта
  h = 70,				-- Высота объекта
  color = {				-- Цвет объекта
    0,						-- Красный
    0,						-- Зеленый
    255,					-- Голубой
    255						-- Прозрачность
  },
  speed = 0,			-- Скорость в пункт/сек
  angle = 0				-- Угол вектора скорости в градусах
}

function enemi1:Draw() common.DrawGameObject(self) end
function enemi1:Move() common.MoveGameObject(self) end
function enemi1:Start()
  love.timer.sleep(1 / speed)
  self:Move()
end

return enemi1
