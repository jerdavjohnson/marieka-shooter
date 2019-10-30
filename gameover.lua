


function gameOver()
  if LEVEL > 20 then
    powerUp:play()
		bullets = {}
		enemies = {}

		-- reset timers
		canShootTimer = canShootTimerMax
		createEnemyTimer = createEnemyTimerMax

		-- move player back to default position
		player.x = 475
		player.y = 410

		-- reset our game state
		FuckersNailed = 0
    ENERGY = 100
		isAlive = true
    energyOUT:play()
	end

  --Drawing

  --Game Over reset
    if isAlive then
      love.graphics.draw(player.img, player.x, player.y)
    end

    if not isAlive and LIVES < 1 then
      love.graphics.print("GAME OVER!! Press 'X' to try again", love.graphics:getWidth()/2-50, love.graphics:getHeight()/2-10)
      allDead:play()
    end


    
end
