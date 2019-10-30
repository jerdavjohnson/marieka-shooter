



function create_enemyB()

-- Time out enemyB creation
createEnemyTimerB = createEnemyTimerB - (1.7 * dt)
if createEnemyTimerB < 0 then
  createEnemyTimerB = createEnemyTimerBMax

  -- Create an enemyB
  randomNumber = math.random(5, love.graphics.getWidth() - 5)
  newEnemyB = { x = randomNumber, y = -20, img = enemyBImg }
  table.insert(enemies, newEnemyB)
end
