

function energyMeter()
  --on screen Energy meter left side
  if isAlive then ---the meter graphic
    love.graphics.draw(energymeter, 800, 850)
  else
    love.graphics.draw(energymeterOffUnder, 800, 850)
  end

  if isAlive and ENERGY > 60 then
  love.graphics.draw(energymeterL, 728, 850)
  end

  if isAlive and ENERGY > 100 then
  love.graphics.draw(energymeterL, 656, 850)
  end

  if isAlive and ENERGY > 128 then
  love.graphics.draw(energymeterL, 584, 850)
  end

  if isAlive and ENERGY > 192 then
  love.graphics.draw(energymeterL, 512, 850)
  end

  if isAlive and ENERGY > 256 then
  love.graphics.draw(energymeterL, 440, 850)
  end

  if isAlive and ENERGY > 320 then
  love.graphics.draw(energymeterL, 368, 850)
  end

  if isAlive and ENERGY > 384 then
  love.graphics.draw(energymeterL, 296, 850)
  end

  if isAlive and ENERGY > 450 then
    love.graphics.draw(energyOverload, 180, 850)
    energyCharge:play()
  else
    love.graphics.draw(energyOverloadUnder, 180, 850)
  end







end
