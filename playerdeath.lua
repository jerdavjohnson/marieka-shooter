

function player_Death()

  -- reset after in-game death
    if not isAlive and love.keyboard.isDown('f') then
      -- remove all our bullets and enemies from screen
      bullets = {}
      enemies = {}
      spaceDebris = {}

      -- reset timers
      canShootTimer = canShootTimerMax
      createEnemyTimer = createEnemyTimerMax

      -- move player back to default position
      player.x = 475
      player.y = 410

      --alive again sting
      powerUp:play()

      -- reset our game state
      FuckersNailed = 0
      ENERGY = 100
      isAlive = true
    end
--Draw
--in-game death reset
if not isAlive and LIVES == 2 then
  love.graphics.print("You should stop dying! Press 'f' to try that out.", love.graphics:getWidth()/2-50, love.graphics:getHeight()/2-10)
else
  love.graphics.draw(player.img, player.x, player.y)
end

--in-game death reset
if not isAlive and LIVES == 1 then
  love.graphics.print("One life left. Press 'f' to fix that.", love.graphics:getWidth()/2-50, love.graphics:getHeight()/2-10)
else
  love.graphics.draw(player.img, player.x, player.y)
end




end
