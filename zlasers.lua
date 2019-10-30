


function zlasers_fire()

  if love.keyboard.isDown('z') and canShoot then
    -- Create some zlasers
    canShootTimerMax = 3
    newBullet = { x = player.x + (player.img:getWidth()/2), y = player.y, img = zlaserImg }
    table.insert(bullets, newBullet)
    zlaserSound:play()
    ohyeahSting:play()
    canShoot = false
    canShootTimer = canShootTimerMax
  end

end
