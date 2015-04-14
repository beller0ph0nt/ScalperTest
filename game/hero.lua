local common = require('common')  -- Подключение общих функций

-- Патаметры героя
local hero = {
  mode = "fill",                    -- Режим отрисовки
  x = 200,                          -- x-координата центра
  y = 200,                          -- y-координата центра
  w = 40,                           -- Ширина
  h = 40,                           -- Высота
  color = {                         -- Цвет
    255,                              -- Red
    255,                              -- Green
    255,                              -- Blue
    255                               -- Прозрачность
  },                                
  isClicked = false,                -- Флаг нажатия на героя
}

--*************************************************
-- Функция, определения щелчка миши по герою
-- Вход:
--  x - x-координата щелчка мыши
--  y - y-координата щелчка мыши
--*************************************************
function hero:IsMouseReleased(x, y) 
  return x <= self.x + self.w / 2 and
         x >= self.x - self.w / 2 and
         y <= self.y + self.h / 2 and
         y >= self.y - self.h / 2
end

--*************************************************
-- Фунекция отрисовки героя
--*************************************************
function hero:Draw() 
  if self.isClicked then self.x, self.y = love.mouse.getX(), love.mouse.getY() end
  common.DrawGameObject(self)
end

--*************************************************
-- Функция, определяющая столкновение героя с объектами
-- Вход:
--  e - список врагов
-- Выход:
--  true - зафиксировано столкновение
--  false - стлкновение не зафиксировано
--*************************************************
function hero:IsContact(e)
  -- Проверяем столкновение с врагами
  for i = 1, #e do
    if (math.abs(e[i].x - self.x) <= (e[i].w / 2 + self.w / 2)) and
       (math.abs(e[i].y - self.y) <= (e[i].h / 2 + self.h / 2)) then
      return true
    end
  end
  
  if common.IsContactWithWorldBorder(self) > 0 then return true end -- Проверяем столкновение с границами мира
  
  return false
end

return hero