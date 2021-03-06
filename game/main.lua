﻿-- Массив скоростей без нулевого элемента, т.к. игровой объект должен двигаться всегда
local Speed = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10}
local maxSpeed = 10
local maxAngle = 360

local hero = require('hero')      -- Подключение главного героя
local enemi1 = require('enemi1')  -- Подключение 1-го врага
local enemi2 = require('enemi2')  -- Подключение 2-го врага
local enemi3 = require('enemi3')  -- Подключение 3-го врага
local enemi4 = require('enemi4')  -- Подключение 4-го врага
local enemies = {enemi1, enemi2, enemi3, enemi4}  -- Массив врагов
local gameObjects = {hero = hero, enemi1 = enemi1, enemi2 = enemi2, enemi3 = enemi3, enemi4 = enemi4}  -- Таблица игровых объектов

--*************************************************
-- Функция, выполняемая перед запуском
--*************************************************
function love.load()
  love.window.setTitle("Scalper Test")
  love.window.setMode(400, 400, {})
end

--*************************************************
-- Функция обновления статуса игры
--*************************************************
function love.update(dt)
  for i = 1, #enemies do enemies[i]:Move() end                -- Двигаем врагов
  if hero:IsContact(enemies) then hero.isClicked = false end  -- Проверка коллизий
end

--*************************************************
-- Функция отрисовки сцены
--*************************************************
function love.draw()
  for key, val in pairs(gameObjects) do val:Draw() end  -- Цикл перерисовки всех игровых объектов
  love.graphics.setColor({255, 255, 255, 150})
  love.graphics.print("FPS: "..love.timer.getFPS(), 5, 5);
end

--*************************************************
-- Функция обработки отжатия клавиши мыши
--*************************************************
function love.mousereleased(x, y, button)
  if button == "l" and gameObjects.hero:IsMouseReleased(x, y) then
    gameObjects.hero.isClicked = true
    for i = 1, #enemies do
      enemies[i].speed, enemies[i].angle = math.random(1, maxSpeed), math.random(1, maxAngle) -- Генерируем скорость и угол
    end
  end
end
