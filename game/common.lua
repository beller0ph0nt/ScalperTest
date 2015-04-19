local f = {}

--*************************************************
-- Функция, рисующая стандартный игровой объект
-- Вход:
--  gameObject - игровой объект
--*************************************************
function f.DrawGameObject(gameObject)
  love.graphics.setColor(gameObject.color)
  love.graphics.rectangle(gameObject.mode,
                          gameObject.x - gameObject.w / 2,
                          gameObject.y - gameObject.h / 2,
                          gameObject.w,
                          gameObject.h)
end

--*************************************************
-- Функция, проверяющая столкновение объекта с 
-- границами мира
--*************************************************
function f.IsContactWithWorldBorder(object)
  if object.x + object.w / 2 >= love.window.getWidth() then       -- Столкновение с правой границей
    return 4
  elseif object.x - object.w / 2 <= 0 then                        -- Столкновение с левой границей
    return 3
  elseif object.y - object.h / 2 <= 0 then                        -- Столкновение с верхней границей
    return 2
  elseif object.y + object.h / 2 >= love.window.getHeight() then  -- Столкновение с нижней границей
    return 1
  else                                                            -- Столкновение отсутствует
    return 0
  end
end

--*************************************************
-- Функция, двигающая игровой объект
--*************************************************
function f.MoveGameObject(gameObject)
  local contact = f.IsContactWithWorldBorder(gameObject)          -- Определяем, было ли столкновение с границами мира
  if contact == 3 then
    gameObject.x = gameObject.w / 2  -- Чтобы игровой объект не выходил за границы
	gameObject.angle = math.deg(math.atan2(math.sin(math.rad(gameObject.angle)), -math.cos(math.rad(gameObject.angle))))
  elseif contact == 4 then
    gameObject.x = love.window.getWidth() - gameObject.w / 2 -- Чтобы игровой объект не выходил за границы
    gameObject.angle = math.deg(math.atan2(math.sin(math.rad(gameObject.angle)), -math.cos(math.rad(gameObject.angle))))
  end
  
  gameObject.x = gameObject.x + gameObject.speed * math.cos(math.rad(gameObject.angle))
  
  if contact == 1 then
    gameObject.y = love.window.getHeight() - gameObject.h / 2  -- Чтобы игровой объект не выходил за границы
    gameObject.angle = math.deg(math.atan2(-math.sin(math.rad(gameObject.angle)), math.cos(math.rad(gameObject.angle))))
  elseif contact == 2 then
	gameObject.y = gameObject.h / 2  -- Чтобы игровой объект не выходил за границы
    gameObject.angle = math.deg(math.atan2(-math.sin(math.rad(gameObject.angle)), math.cos(math.rad(gameObject.angle))))
  end
  
  gameObject.y = gameObject.y + gameObject.speed * math.sin(math.rad(gameObject.angle))
end

return f
