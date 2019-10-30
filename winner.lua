

function winner_Game()

  if isAlive and LEVEL > 21 then
    winningPlayer:play()
    bullets = {}
    enemies = {}
    powerUPs = {}

    -- reset timers
    canShootTimer = canShootTimerMax
    createEnemyTimer = createEnemyTimerMax

    -- reset our game state
    --FuckersNailed = 0
    ENERGY = 30000
    isAlive = false
    end



end
