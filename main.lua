local MaxSpeed = 10
local MinSpeed = -10

-- �������, �������� ����������� ������� ������
-- ����:
--  gameObject - ������� ������
local function DrawGameObject(gameObject)
  love.graphics.setColor(gameObject.color)
  love.graphics.rectangle(gameObject.mode,
                          gameObject.x - gameObject.w / 2,
                          gameObject.y - gameObject.h / 2,
                          gameObject.w,
                          gameObject.h)
end

-- �������, ����������� ������������ ������� � ��������� ����
local function IsContactWithWorldBorder(object)
  if object.x + object.w / 2 >= love.window.getWidth() then       -- ������������ � ������ ��������
    return 4
  elseif object.x - object.w / 2 <= 0 then                        -- ������������ � ����� ��������
    return 3
  elseif object.y - object.h / 2 <= 0 then                        -- ������������ � ������ ��������
    return 2
  elseif object.y + object.h / 2 >= love.window.getHeight() then  -- ������������ � ������� ��������
    return 1
  else                                                            -- ������������ �����������
    return 0
  end
end

-- �������, ��������� ������� ������
local function MoveGameObject(gameObject)
  local contact = IsContactWithWorldBorder(gameObject)
  if contact == 1 or contact == 2 then
    gameObject.ySpeed = -gameObject.ySpeed
  elseif contact == 3 or contact == 4 then
    gameObject.xSpeed = -gameObject.xSpeed
  end
  
  gameObject.x = gameObject.x + gameObject.xSpeed
  gameObject.y = gameObject.y + gameObject.ySpeed
end

-- ��������� �����
local hero = {
  mode = "fill",                    -- ����� ���������
  x = 200,                          -- x-���������� ������
  y = 200,                          -- y-���������� ������
  w = 40,                           -- ������
  h = 40,                           -- ������
  color = {                         -- ����
    255,                              -- Red
    255,                              -- Green
    255,                              -- Blue
    255                               -- ������������
  },                                
  isClicked = false,                -- ���� ������� �� �����
}

-- �������, ����������� ������ ���� �� �����
-- ����:
--  x - x-���������� ������ ����
--  y - y-���������� ������ ����
function hero:IsMouseReleased(x, y) 
  return x <= self.x + self.w / 2 and
         x >= self.x - self.w / 2 and
         y <= self.y + self.h / 2 and
         y >= self.y - self.h / 2
end

-- �������� ��������� �����
function hero:Draw() 
  if self.isClicked then
    self.x = love.mouse.getX()
    self.y = love.mouse.getY()
  end
  DrawGameObject(self)
end

-- �������, ������������ ������������ ����� � ���������
-- ����:
--  e - ������ ������
-- �����:
--  true - ������������� ������������
--  false - ����������� �� �������������
function hero:IsContact(e)
  -- ��������� ������������ � �������
  for i = 1, #e do
    if (math.abs(e[i].x - self.x) <= (e[i].w / 2 + self.w / 2)) and
       (math.abs(e[i].y - self.y) <= (e[i].h / 2 + self.h / 2)) then
      return true
    end
  end
  
  -- ��������� ������������ � ��������� ����
  if IsContactWithWorldBorder(self) > 0 then
    return true
  end
  
  return false
end

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

function enemi1:Draw() DrawGameObject(self) end
function enemi1:Move() MoveGameObject(self) end

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
  xSpeed = 0,
  ySpeed = 0
}

function enemi2:Draw() DrawGameObject(self) end
function enemi2:Move() MoveGameObject(self) end

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

function enemi3:Draw() DrawGameObject(self) end
function enemi3:Move() MoveGameObject(self) end

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

function enemi4:Draw() DrawGameObject(self) end
function enemi4:Move() MoveGameObject(self) end

local enemies = {enemi1, enemi2, enemi3, enemi4}
local gameObjects = {hero = hero, enemi1 = enemi1, enemi2 = enemi2, enemi3 = enemi3, enemi4 = enemi4}  -- ������� ������� ��������

-- �������, ����������� ����� ��������
function love.load()
  love.window.setTitle("Scalper Test")
  love.window.setMode(400, 400, {})
end

-- ������� ���������� ������� ����
function love.update(dt)
  -- ������� ������
  for i = 1, #enemies do enemies[i]:Move() end
  
  -- �������� ��������
  if hero:IsContact(enemies) then hero.isClicked = false end
end

-- ������� ��������� �����
function love.draw()
  -- ���� ����������� ���� ������� ��������
  for key, val in pairs(gameObjects) do val:Draw() end
end

-- ������� ��������� ������ ������� ����
function love.mousereleased(x, y, button)
  if button == "l" and gameObjects.hero:IsMouseReleased(x, y) then
    gameObjects.hero.isClicked = true
    for i = 1, #enemies do
      enemies[i].xSpeed, enemies[i].ySpeed = math.random(MinSpeed, MaxSpeed), math.random(MinSpeed, MaxSpeed)
    end
  end
end