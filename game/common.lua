local f = {}

--*************************************************
-- �������, �������� ����������� ������� ������
-- ����:
--  gameObject - ������� ������
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
-- �������, ����������� ������������ ������� � 
-- ��������� ����
--*************************************************
function f.IsContactWithWorldBorder(object)
  if object.x + object.w / 2 >= love.window.getWidth() then       -- ������������ � ������ ��������
    return 4
  elseif object.x - object.w / 2 <= 0 then                        -- ������������ � ����� ��������
    return 3
  elseif object.y - object.h / 2 <= 0 then                        -- ������������ � ������� ��������
    return 2
  elseif object.y + object.h / 2 >= love.window.getHeight() then  -- ������������ � ������ ��������
    return 1
  else                                                            -- ������������ �����������
    return 0
  end
end

--*************************************************
-- �������, ��������� ������� ������
--*************************************************
function f.MoveGameObject(gameObject)
  local contact = f.IsContactWithWorldBorder(gameObject)          -- ����������, ���� �� ������������ � ��������� ����
  if contact == 3 then
    gameObject.xSpeed, gameObject.x = -gameObject.xSpeed, gameObject.w / 2  -- ����� ������� ������ �� ������� �� �������
  elseif contact == 4 then
    gameObject.xSpeed, gameObject.x = -gameObject.xSpeed, love.window.getWidth() - gameObject.w / 2 -- ����� ������� ������ �� ������� �� �������
  end
  
  gameObject.x = gameObject.x + gameObject.xSpeed
  
  contact = f.IsContactWithWorldBorder(gameObject)
  if contact == 1 then
    gameObject.ySpeed, gameObject.y = -gameObject.ySpeed, love.window.getHeight() - gameObject.h / 2  -- ����� ������� ������ �� ������� �� �������
  elseif contact == 2 then
    gameObject.ySpeed, gameObject.y = -gameObject.ySpeed, gameObject.h / 2  -- ����� ������� ������ �� ������� �� �������
  end
  
  gameObject.y = gameObject.y + gameObject.ySpeed
end

return f