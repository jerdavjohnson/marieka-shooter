

function shieldsFull()
  if shields > 75 and shields < 101 and isAlive then
    love.graphics.draw(shieldThree.img, shieldThree.x, shieldThree.y)
  end

  if shields > 50 and shields < 75 and isAlive then
    love.graphics.draw(shieldTwo.img, shieldTwo.x, shieldTwo.y)
  end

  if shields > 10 and shields < 50 and isAlive then
    love.graphics.draw(shieldOne.img, shieldOne.x, shieldOne.y)
  end
end
