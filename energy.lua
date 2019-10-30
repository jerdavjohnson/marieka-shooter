


function energy_score()

  if ENERGY > 600 then
    ENERGY = ENERGY * .4
    energyOUT:play()
  end


  if ENERGY < 100 and ENERGY > 99 then
    pleaseManeuver:play()
  end


  if ENERGY < 5 and ENERGY > 0 then
    youhaveDepleted:play()
    --warningOverload1:play()
  end



  if ENERGY > 200 and ENERGY < 205 then
  EMPfullycharged:play()
  end


  if CheckCollision(powerUPA.x, powerUPA.y, powerUPA.img:getWidth(), powerUPA.img:getHeight(), player.x, player.y, player.img:getWidth(), player.img:getHeight())
  and isAlive then
    table.remove(powerUPs, i)
    table.remove(bullets, i)
    ENERGY = ENERGY + 50
    LIVES = LIVES + 1
    ohyeahSting:play()
  end

  if CheckCollision(spaceJunk.x, spaceJunk.y, spaceJunk.img:getWidth(), spaceJunk.img:getHeight(), player.x, player.y, player.img:getWidth(), player.img:getHeight())
  and isAlive then
    table.remove(spaceJunk, i)
    ENERGY = ENERGY * .5
    --crash:play()
  end


  if ENERGY < 0 then
    isAlive = false
    lIVES = LIVES - 1
  end


---draw
  if ENERGY > 200 then
    love.graphics.print("For convenient badguy removal press S now.", 675, 10)
  end

  love.graphics.print("ENERGY: " .. tostring(ENERGY), 1200, 10)
end
