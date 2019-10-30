

function shockwave()
  if isAlive and love.keyboard.isDown('s') and ENERGY > 200 then
  -- remove all our bullets and enemies from screen
  shockwaveS:play()
  powerUp:play()
  bullets = {}
  enemies = {}
  spaceDebris = {}
  powerUPs = {}
  -- reset timers
  canShootTimer = canShootTimerMax
  createEnemyTimer = createEnemyTimerMax

  -- move player back to default position
  --player.x = 475
  --player.y = 410

  -- reset our game state
  ENERGY = 50
  score = score + 100
  --isAlive = true
end

end
