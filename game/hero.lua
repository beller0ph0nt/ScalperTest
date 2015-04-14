local common = require('common')  -- ����������� ����� �������

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

--*************************************************
-- �������, ����������� ������ ���� �� �����
-- ����:
--  x - x-���������� ������ ����
--  y - y-���������� ������ ����
--*************************************************
function hero:IsMouseReleased(x, y) 
  return x <= self.x + self.w / 2 and
         x >= self.x - self.w / 2 and
         y <= self.y + self.h / 2 and
         y >= self.y - self.h / 2
end

--*************************************************
-- �������� ��������� �����
--*************************************************
function hero:Draw() 
  if self.isClicked then self.x, self.y = love.mouse.getX(), love.mouse.getY() end
  common.DrawGameObject(self)
end

--*************************************************
-- �������, ������������ ������������ ����� � ���������
-- ����:
--  e - ������ ������
-- �����:
--  true - ������������� ������������
--  false - ����������� �� �������������
--*************************************************
function hero:IsContact(e)
  -- ��������� ������������ � �������
  for i = 1, #e do
    if (math.abs(e[i].x - self.x) <= (e[i].w / 2 + self.w / 2)) and
       (math.abs(e[i].y - self.y) <= (e[i].h / 2 + self.h / 2)) then
      return true
    end
  end
  
  if common.IsContactWithWorldBorder(self) > 0 then return true end -- ��������� ������������ � ��������� ����
  
  return false
end

return hero