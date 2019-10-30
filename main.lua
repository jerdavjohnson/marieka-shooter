
require ("zlasers")
require ("shockwave")
require ("metaKeys")
require ("levelBG")
require ("levelMusic")
require ("levelMeters")
require ("shields")
require ("energyMeter")
--require ("menus")


debug = true

-- canShoot Timers
canShoot = true
canShootTimerMax = .05
canShootTimer = canShootTimerMax


--Enemy Timers
EnemyTimerMax = .7
EnemyTimer = EnemyTimerMax


--PowerUp Timers
powerUPATimerMax = 6
powerUPATimer = powerUPATimerMax

--spaceDebris Timers
spaceJunkTimerMax = .3
spaceJunkTimer = spaceJunkTimerMax


-- Player Object
player = { x = 475, y = 410, speed = 550, img = nil }
Player_LifeForce = 100
shieldThree = {x = 475, y = 410, speed = 550, img = nil}
shieldTwo = {x = 475, y = 410, speed = 550, img = nil}
shieldOne = {x = 475, y = 410, speed = 550, img = nil}
isAlive = true
FuckersNailed = 0
score  = 1000
LEVEL = 0
ENERGY = 100
shields = 100
LIVES = 3
shopPoints = 0


--Enemy Object
enemyisAlive = true

-- Image Storage
bulletImg = nil
enemyImg = nil
spaceJunkImg = nil
powerUPAImg = nil

-- Sound Storage
gunSound = nil

-- Entity Storage
bullets = {} -- array of current bullets being drawn and updated
enemies = {} -- array of current enemies on screen
powerUPs = {} -- array of current powerUPs on screen
spaceDebris = {} -- array of current Asteriods & spaceDebris on screen


-- Collision detection taken function from http://love2d.org/wiki/BoundingBox.lua
-- Returns true if two boxes overlap, false if they don't
-- x1,y1 are the left-top coords of the first box, while w1,h1 are its width and height
-- x2,y2,w2 & h2 are the same, but for the second box
function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
  return x1 < x2+w2 and
         x2 < x1+w1 and
         y1 < y2+h2 and
         y2 < y1+h1
end

-- Loading
function love.load(arg)
  love.window.setFullscreen(true, "desktop")

loveframes = require("libraries.loveframes")
-- All background images
  level1_image = love.graphics.newImage('assets/levelBG/level1.png')
  level2_image = love.graphics.newImage('assets/levelBG/level2.png')
  level3_image = love.graphics.newImage('assets/levelBG/level3.png')
  level4_image = love.graphics.newImage('assets/levelBG/level4.png')
  level5_image = love.graphics.newImage('assets/levelBG/level5.png')
  level6_image = love.graphics.newImage('assets/levelBG/level6.png')
  level7_image = love.graphics.newImage('assets/levelBG/level7.png')
  level8_image = love.graphics.newImage('assets/levelBG/level8.png')
  level9_image = love.graphics.newImage('assets/levelBG/level9.png')
  level10_image = love.graphics.newImage('assets/levelBG/level10.png')
  level11_image = love.graphics.newImage('assets/levelBG/level11.png')
  level12_image = love.graphics.newImage('assets/levelBG/level12.png')
  level13_image = love.graphics.newImage('assets/levelBG/level13.png')
  level14_image = love.graphics.newImage('assets/levelBG/level14.png')
  level15_image = love.graphics.newImage('assets/levelBG/level15.png')
  level16_image = love.graphics.newImage('assets/levelBG/level16.png')
  level17_image = love.graphics.newImage('assets/levelBG/level17.png')
  level18_image = love.graphics.newImage('assets/levelBG/level18.png')
  level19_image = love.graphics.newImage('assets/levelBG/level19.png')
  level20_image = love.graphics.newImage('assets/levelBG/level20.png')

  -- All images (player, enemy, bullets,.etc - everything!)
  player.img = love.graphics.newImage('assets/plane.png')
  shieldOne.img = love.graphics.newImage('assets/shield_1.png')
  shieldTwo.img = love.graphics.newImage('assets/shield_2.png')
  shieldThree.img = love.graphics.newImage('assets/shield_3.png')
	enemyImg = love.graphics.newImage('assets/enemyA.png')
  spaceJunkImg = love.graphics.newImage('assets/enemyB.png')
  bulletImg = love.graphics.newImage('assets/bullet.png')
  bullet2Img = love.graphics.newImage('assets/bullet2.png')
  zlaserImg = love.graphics.newImage('assets/zlaser.png')
  powerUPAImg = love.graphics.newImage('assets/powerUPA.png')
  playerLives = love.graphics.newImage('assets/plane1.png')
  energymeterL = love.graphics.newImage('assets/energymeterL.png')
  energymeterR  = love.graphics.newImage('assets/energymeterR.png')
  energymeter = love.graphics.newImage('assets/energy.png')
  energymeterOff = love.graphics.newImage('assets/energyOff.png')
  energymeterOffUnder = love.graphics.newImage('assets/energyOffUnder.png')
  energyOverload = love.graphics.newImage('assets/overload.png')
  energyOverloadUnder = love.graphics.newImage('assets/overloadUnder.png')
  lifemeter = love.graphics.newImage('assets/lifemeter.png')
  lifemeterUnder = love.graphics.newImage('assets/lifemeterUnder.png')
  Nolifemeter = love.graphics.newImage('assets/Nolifemeter.png')
  levelMeter = love.graphics.newImage('assets/levelMeter.png')
  levelMeterUnder = love.graphics.newImage('assets/levelmeterUnder.png')
  levelMeterTopUnder = love.graphics.newImage('assets/levelMeterTopUnder.png')
  levelMeterTop = love.graphics.newImage('assets/levelMeterTop.png')
  levelBar = love.graphics.newImage('assets/levelBar.png')
  gameOver = love.graphics.newImage('assets/gameOver.png')
  textOval = love.graphics.newImage('assets/textOval.png')
  theShop = love.graphics.newImage('assets/theShop.png')


  -- player event SFX (player dies, explosions, bullets effects, etc)

	gunSound = love.audio.newSource("sfx/gun-sound.wav", "static")
  Alaser = love.audio.newSource("sfx/gun-soundA.ogg", "static")
  zlaserSound = love.audio.newSource("sfx/zlaser.wav", "static")
  shockwaveS = love.audio.newSource("sfx/shockwave.ogg", "static")
  deadEnemyC = love.audio.newSource("sfx/deadEnemyC.ogg", "static")
  crash = love.audio.newSource("sfx/crash.ogg", "static")

  --level music
  themeOne = love.audio.newSource("soundtrack/level1jam.ogg", "stream")
  themeTwo = love.audio.newSource("soundtrack/level2jam.wav", "stream")
  themeThree = love.audio.newSource("soundtrack/level3jam.ogg", "stream")
  themeFour = love.audio.newSource("soundtrack/level4jam.ogg", "stream")
  themeFive = love.audio.newSource("soundtrack/level5jam.ogg", "stream")
  themeSix = love.audio.newSource("soundtrack/level6jam.ogg", "stream")
  themeSeven = love.audio.newSource("soundtrack/level7jam.ogg", "stream")
  themeEight = love.audio.newSource("soundtrack/level8jam.ogg", "stream")
  themeNine = love.audio.newSource("soundtrack/level9jam.ogg", "stream")
  themeTen = love.audio.newSource("soundtrack/level10jam.ogg", "stream")
  themeEleven = love.audio.newSource("soundtrack/level11jam.ogg", "stream")
  themeTwelve = love.audio.newSource("soundtrack/level12jam.ogg", "stream")
  themeThirteen = love.audio.newSource("soundtrack/level13jam.ogg", "stream")
  themeFourteen = love.audio.newSource("soundtrack/level14jam.ogg", "stream")
  themeFifteen = love.audio.newSource("soundtrack/level15jam.ogg", "stream")
  themeSixteen = love.audio.newSource("soundtrack/level16jam.ogg", "stream")
  themeSeventeen = love.audio.newSource("soundtrack/level17jam.ogg", "stream")
  themeEighteen = love.audio.newSource("soundtrack/level18jam.ogg", "stream")
  themeNineteen = love.audio.newSource("soundtrack/level19jam.ogg", "stream")
  themeTwenty = love.audio.newSource("soundtrack/level20jam.ogg", "stream")


  --stings (power-ups, attaboys, threats, admonishments,.etc)
  winningPlayer = love.audio.newSource("sfx/winningPlayer.wav", "static")
  powerUp = love.audio.newSource("sfx/powerUp.wav", "static")
  levelUpSting = love.audio.newSource("sfx/levelUp.ogg", "static")
  openSting = love.audio.newSource("sfx/openingSting.ogg", "static")
  ohyeahSting = love.audio.newSource("sfx/ohyeahSting.ogg", "static")
  warningOverload1 = love.audio.newSource("sfx/warningOverload1.ogg", "static")
  systemsLow = love.audio.newSource("sfx/systemsarelow.ogg", "static")
  youhaveDepleted = love.audio.newSource("sfx/youhaveDepleted.ogg", "static")
  systemsFiftypercent = love.audio.newSource("sfx/systemsFiftypercent.ogg", "static")
  pleaseManeuver = love.audio.newSource("sfx/maneuver.ogg", "static")
  EMPfullycharged = love.audio.newSource("sfx/EMPfullycharged.ogg", "static")
  decimatorEighty = love.audio.newSource("sfx/decimatorEightyPercent.ogg", "static")
  youareDEAD = love.audio.newSource("sfx/youareDEAD.ogg", "static")
  energyOUT = love.audio.newSource("sfx/energyOUT.ogg", "static")
  allDead = love.audio.newSource("sfx/allDead.ogg", "static")
  asteriodExplosion = love.audio.newSource("sfx/asteriodExplosion.ogg", "static")
  energyOverloadBlowoff = love.audio.newSource("sfx/energyOverload.ogg", "static")
  energyCharge = love.audio.newSource("sfx/energyCharge.ogg", "static")
  shieldHit = love.audio.newSource("sfx/shieldHit.ogg", "static")
  shieldDown = love.audio.newSource("sfx/shieldDown.ogg", "static")



  --boss music


  --menu music


end


-- Updating
function love.update(dt)
  playthemeOne()
  playthemeTwo()
  playthemeThree()
  playthemeFour()
  playthemeFive()
  playthemeSix()
  playthemeSeven()
  playthemeEight()
  playthemeNine()
  playthemeTen()
  playthemeEleven()
  playthemeTwelve()
  playthemeThirteen()
  playthemeFourteen()
  playthemeFifteen()
  playthemeSixteen()
  playthemeSeventeen()
  playthemeEighteen()
  playthemeNineteen()
  playthemeTwenty()
  morale_button()
  escape_quit()
  zlasers_fire()
  shockwave()

if LEVEL < 1 then
  LEVEL = LEVEL * 0
end

if LEVEL == 21 then
  LEVEL = LEVEL * 0
end

if ENERGY > 500 then
  ENERGY = ENERGY * .1
  energyOverloadBlowoff:play()
end

if ENERGY < 1 then
  ENERGY = ENERGY * 0
end

if ENERGY == 0 then
  isAlive = false
  lIVES = LIVES - 1
end

if LIVES > 4 then
  LIVES = LIVES - 1
end

if LIVES < 1 then
  LIVES = LIVES * 0
end

if shields > 100 then
  shields = shields - 1
end

if shields < 9 then
  shields = shields * 0
end

if ENERGY < 60 then
  shield = shields * .5
  shieldDown:play()
end

	-- I always start with an easy way to exit the game
	if love.keyboard.isDown('q') then
		love.event.push('quit')
	end

	-- Time out how far apart our shots can be.
	canShootTimer = canShootTimer - (5 * dt)
	if canShootTimer < 0 and isAlive then
		canShoot = true
	end

	-- Stop enemy creation
	EnemyTimer = EnemyTimer - (1.7 * dt)
	if EnemyTimer < 0 then
		EnemyTimer = EnemyTimerMax

		-- Create an enemy
		randomNumber = math.random(5, love.graphics.getWidth() - 12)
		newEnemy = { x = randomNumber, y = -7, img = enemyImg }
		table.insert(enemies, newEnemy)
-- create enemyB
    --randomNumber = math.random(5, love.graphics.getWidth() - 6)
    --newEnemyB = { x = randomNumber, y = -5, img = enemyBImg }
    --table.insert(enemies, newEnemyB)

  end



-- Stop powerUP creation
  powerUPATimer = powerUPATimer - (1.5 * dt)
	if powerUPATimer < 0 then
		powerUPATimer = powerUPATimerMax


-- create PowerUP
    randomNumber = math.random(5, love.graphics.getWidth() - 2, love.graphics.getHeight() - 2)
    powerUPA = { x = randomNumber, y = randomNumber, img = powerUPAImg }
    table.insert(powerUPs, powerUPA)
	end

-- Stop Asteriods & spaceJunk creation
  spaceJunkTimer = spaceJunkTimer - (1.7 * dt)
  if spaceJunkTimer < 0 then
    spaceJunkTimer = spaceJunkTimerMax

-- create Asteriods & spaceJunk
    randomNumber = math.random(5, love.graphics.getWidth() - 2)
    spaceJunk = { x = randomNumber, y = -1, img = spaceJunkImg }
    table.insert(spaceDebris, spaceJunk)
  end




--[[if ENERGY < 50 and ENERGY > 49 then
  systemsFiftypercent:play()
end]]--

--[[if ENERGY < 100 and ENERGY > 99 then
  pleaseManeuver:play()
end

--[[if ENERGY < 20 and ENERGY > 19 then
  systemsLow:play()
end]]--

--[[if ENERGY < 5 and ENERGY > 0 then
  youhaveDepleted:play()
  --warningOverload1:play()
end]]--



if ENERGY > 200 and ENERGY < 205 then
EMPfullycharged:play()
end


	-- update the positions of bullets
	for i, bullet in ipairs(bullets) do
		bullet.y = bullet.y - (250 * dt)


		if bullet.y < 10 then -- remove bullets when they pass off the screen
			table.remove(bullets, i)
		end
	end

	-- update the positions of enemies
	for i, enemy in ipairs(enemies) do
		enemy.y = enemy.y + (300 * dt)
    enemy.x = enemy.x + (-100 * dt)

		if enemy.y > 850 then -- remove enemies when they pass off the screen
			table.remove(enemies, i)
		end
	end


  -- Update positions of powerUps
  for i, powerUPA in ipairs(powerUPs) do
		powerUPA.y = powerUPA.y + ( 12 * dt)
    powerUPA.x = powerUPA.x + ( 45 * dt)


		if powerUPA.x > 750 then -- remove powerUPs when they pass off the screen
			table.remove(powerUPs, i)
		end
	end

-- update position of Asteriods & spaceJunk
for i, spaceJunk in ipairs(spaceDebris) do
  spaceJunk.y = spaceJunk.y + (100 * dt)
  spaceJunk.x = spaceJunk.x + (2 * dt)

  if spaceJunk.x > 850 then -- remove spaceDebris when it passes off the screen
    table.remove(spaceDebris, i)
  end
end




--bullets vs enemy collision system
	for i, enemy in ipairs(enemies) do
		for j, bullet in ipairs(bullets) do
			if CheckCollision(enemy.x, enemy.y, enemy.img:getWidth(), enemy.img:getHeight(), bullet.x, bullet.y, bullet.img:getWidth(), bullet.img:getHeight()) then
				table.remove(bullets, j)
				table.remove(enemies, i)
        deadEnemyC:play()
        --enemyisAlive = false
        FuckersNailed = FuckersNailed + 1
				score = score + 10
        LEVEL = score * .001
        shopPoints = shopPoints + 10
			end
		end

--player vs enemy collision system
		if CheckCollision(enemy.x, enemy.y, enemy.img:getWidth(), enemy.img:getHeight(), player.x, player.y, player.img:getWidth(), player.img:getHeight())
		and isAlive and shields < 25 then
			table.remove(enemies, i)
      table.remove(enemies, i)
			isAlive = false
      LIVES = LIVES - 1
      youareDEAD:play()
      EMPfullycharged:stop()
		end

--shieldThree vs enemy collision
    if CheckCollision(enemy.x, enemy.y, enemy.img:getWidth(), enemy.img:getHeight(), shieldThree.x, shieldThree.y, shieldThree.img:getWidth(), shieldThree.img:getHeight())
		and isAlive then
			table.remove(enemies, i)
      shields = shields - 5
      shieldHit:play()
			--isAlive = false
      --LIVES = LIVES - 1
      --youareDEAD:play()
      --EMPfullycharged:stop()
		end

--shieldTwo vs enemy collision system
    if CheckCollision(enemy.x, enemy.y, enemy.img:getWidth(), enemy.img:getHeight(), shieldTwo.x, shieldTwo.y, shieldTwo.img:getWidth(), shieldTwo.img:getHeight())
		and isAlive then
			table.remove(enemies, i)
      shields = shields - 5
      shieldHit:play()
			--isAlive = false
      --LIVES = LIVES - 1
      --youareDEAD:play()
      --EMPfullycharged:stop()
		end
--shieldOne vs enemy collision system
    if CheckCollision(enemy.x, enemy.y, enemy.img:getWidth(), enemy.img:getHeight(), shieldOne.x, shieldOne.y, shieldOne.img:getWidth(), shieldOne.img:getHeight())
		and isAlive then
			table.remove(enemies, i)
      shields = shields - 5
      shieldHit:play()
			--isAlive = false
      --LIVES = LIVES - 1
      --youareDEAD:play()
      --EMPfullycharged:stop()
		end


	end


--powerUPs vs bullets Collision detection systems
for i, powerUPA in ipairs(powerUPs) do
  for j, bullet in ipairs(bullets) do
    if CheckCollision(powerUPA.x, powerUPA.y, powerUPA.img:getWidth(), powerUPA.img:getHeight(), bullet.x, bullet.y, bullet.img:getWidth(), bullet.img:getHeight()) then
      table.remove(bullets, j)
      table.remove(powerUPs, i)
      shopPoints = shopPoints + 100
      shields = shields + 10
      --table.remove(enemies, i)
      --deadEnemyC:play()
      --FuckersNailed = FuckersNailed + 1
      --score = FuckersNailed * 10
      --Player_LifeForce = Player_LifeForce + 10
      --LEVEL = Player_LifeForce * .001
    end
  end
--powerUPs vs player collision system
  if CheckCollision(powerUPA.x, powerUPA.y, powerUPA.img:getWidth(), powerUPA.img:getHeight(), player.x, player.y, player.img:getWidth(), player.img:getHeight())
  and isAlive then
    table.remove(powerUPs, i)
    table.remove(bullets, i)
    ENERGY = ENERGY + 25
    shields = shields + 33
    LIVES = LIVES + 1
    ohyeahSting:play()
  end
end

-- asteriod & space debris vs bullets collision detection system
for i, spaceJunk in ipairs(spaceDebris) do
  for j, bullet in ipairs(bullets) do
    if CheckCollision(spaceJunk.x, spaceJunk.y, spaceJunk.img:getWidth(), spaceJunk.img:getHeight(), bullet.x, bullet.y, bullet.img:getWidth(), bullet.img:getHeight()) then
      table.remove(bullets, j)
      table.remove(spaceDebris, i)
      asteriodExplosion:play()
      --FuckersNailed = FuckersNailed + 1
      --asteriods = asteroids + 1
      score = score + 5
      --Player_LifeForce = Player_LifeForce + 10
      --LEVEL = Player_LifeForce * .001
    end
  end
--space junk vs player collision system
  if CheckCollision(spaceJunk.x, spaceJunk.y, spaceJunk.img:getWidth(), spaceJunk.img:getHeight(), player.x, player.y, player.img:getWidth(), player.img:getHeight())
  and isAlive and shields < 25 then
    table.remove(spaceJunk, i)
    ENERGY = ENERGY - .5
    crash:play()
  end

--space junk vs shieldThree collision detection
  if CheckCollision(spaceJunk.x, spaceJunk.y, spaceJunk.img:getWidth(), spaceJunk.img:getHeight(), shieldThree.x, shieldThree.y, shieldThree.img:getWidth(), shieldThree.img:getHeight())
  and isAlive then
    table.remove(spaceJunk, i)
    ENERGY = ENERGY - .5
    shields = shields - .5
    shieldHit:play()
  end

--space junk vs shieldTwo collision detection
  if CheckCollision(spaceJunk.x, spaceJunk.y, spaceJunk.img:getWidth(), spaceJunk.img:getHeight(), shieldTwo.x, shieldTwo.y, shieldTwo.img:getWidth(), shieldTwo.img:getHeight())
  and isAlive then
    table.remove(spaceJunk, i)
    ENERGY = ENERGY - .5
    shields = shields - .5
    shieldHit:play()
  end

--space junk vs shieldOne collision detection
  if CheckCollision(spaceJunk.x, spaceJunk.y, spaceJunk.img:getWidth(), spaceJunk.img:getHeight(), shieldOne.x, shieldOne.y, shieldOne.img:getWidth(), shieldOne.img:getHeight())
  and isAlive then
    table.remove(spaceJunk, i)
    ENERGY = ENERGY - .5
    shields = shields - .5
    shieldHit:play()
  end

---end of collision systems
end


	-- Horizontal movement
	if love.keyboard.isDown('left') then
		if player.x > 0 and shieldThree.x > 0 and shieldTwo.x > 0 and shieldOne.x > 0 then -- binds us to the map
			player.x = player.x - (player.speed*dt)
      shieldThree.x = player.x - (player.speed*dt)
      shieldTwo.x = player.x - (player.speed*dt)
      shieldOne.x = player.x - (player.speed*dt)
      ENERGY = ENERGY + .8
		end
	elseif love.keyboard.isDown('right') then
		if player.x < (love.graphics.getWidth() - player.img:getWidth()) and shieldThree.x < (love.graphics.getWidth() - player.img:getWidth()) and shieldTwo.x < (love.graphics.getWidth() - player.img:getWidth()) and shieldOne.x < (love.graphics.getWidth() - player.img:getWidth())  then
			player.x = player.x + (player.speed*dt)
      shieldThree.x = player.x + (player.speed*dt)
      shieldTwo.x = player.x + (player.speed*dt)
      shieldOne.x = player.x + (player.speed*dt)
      ENERGY = ENERGY + .8
		end
	end

	-- Vertical movement
	if love.keyboard.isDown('up') then
		if player.y > (love.graphics.getHeight() / 6) and shieldThree.y > (love.graphics.getHeight() / 6) and shieldTwo.y > (love.graphics.getHeight() / 6) and shieldOne.y > (love.graphics.getHeight() / 6) then
			player.y = player.y - (player.speed*dt)
      shieldThree.y = player.y - (player.speed*dt)
      shieldTwo.y = player.y - (player.speed*dt)
      shieldOne.y = player.y - (player.speed*dt)
      ENERGY = ENERGY + .8
		end
	elseif love.keyboard.isDown('down') then
		if player.y < (love.graphics.getHeight() - 130) and shieldThree.y < (love.graphics.getHeight() - 130) and shieldTwo.y < (love.graphics.getHeight() - 130) and shieldOne.y < (love.graphics.getHeight() - 130) then
			player.y = player.y + (player.speed*dt)
      shieldThree.y = player.y + (player.speed*dt)
      shieldTwo.y = player.y + (player.speed*dt)
      shieldOne.y = player.y + (player.speed*dt)
      ENERGY = ENERGY + .8
		end
	end

	if isAlive and love.keyboard.isDown('d') and canShoot then
		-- Create some bullets
    canShootTimerMax = .02
		newBullet = { x = player.x + 38 + (player.img:getWidth()/2), y = player.y + 30, img = bulletImg }
		table.insert(bullets, newBullet)
		gunSound:play()
    ENERGY = ENERGY - 2.2
		canShoot = false
		canShootTimer = canShootTimerMax
	end

  if isAlive and love.keyboard.isDown('a') and canShoot then
		-- Create some bullets
    canShootTimerMax = .02
		newBullet = { x = player.x - 48 + (player.img:getWidth()/2), y = player.y + 30, img = bullet2Img }
		table.insert(bullets, newBullet)
		Alaser:play()
    ENERGY = ENERGY - 3.2
		canShoot = false
		canShootTimer = canShootTimerMax
	end


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

if ENERGY < 0 then
  isAlive = false
  lIVES = LIVES - 1
end


	if LIVES == 0 and not isAlive and love.keyboard.isDown('x') then
		-- remove all our bullets and enemies from screen
    powerUp:play()
		bullets = {}
		enemies = {}
    spaceDebris = {}

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
    LIVES = 3
    LEVEL = 0
    score = 1000
    energyOUT:play()
	end


if love.keyboard.isDown('p') then
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
    isAlive = true
    shopPoints = shopPoints + 10
  end

if shopPoints > 100000 then
  bullets = {}
  enemies = {}
  spaceDebris = {}
end

loveframes.update(dt)

end




-- Drawing
function love.draw(dt)


    -- backgrounds
    --if LEVEL < 2 then
    --  love.graphics.draw(background1_image)
    --end
      changelevel_one()
      changelevel_two()
      changelevel_three()
      changelevel_four()
      changelevel_five()
      changelevel_six()
      changelevel_seven()
      changelevel_eight()
      changelevel_nine()
      changelevel_ten()
      changelevel_eleven()
      changelevel_twelve()
      changelevel_thirteen()
      changelevel_fourteen()
      changelevel_fifteen()
      changelevel_sixteen()
      changelevel_seventeen()
      changelevel_eighteen()
      changelevel_nineteen()
      changelevel_twenty()

--level meters
      level1meter()
      level2meter()
      level3meter()
      level4meter()
      level5meter()
      level6meter()
      level7meter()
      level8meter()
      level9meter()
      level10meter()
      level11meter()
      level12meter()
      level13meter()
      level14meter()
      level15meter()
      level16meter()
      level17meter()
      level18meter()
      level19meter()
      level20meter()

      shieldsFull()
      energyMeter()



    -- bullets
    if isAlive then
    	for i, bullet in ipairs(bullets) do
    		love.graphics.draw(bullet.img, bullet.x, bullet.y)
    	end

      -- Enemies
    	for i, enemy in ipairs(enemies) do
    		love.graphics.draw(enemy.img, enemy.x, enemy.y)
    	end

      -- powerUps
      for i, powerUPA in ipairs(powerUPs) do
    		love.graphics.draw(powerUPA.img, powerUPA.x, powerUPA.y, math.rad(90), 1, 1, powerUPAImg:getWidth() / 2, powerUPAImg:getHeight() / 2)
        --love.graphics.rotate(angle)
    	end
    end
    -- Asteriods & space junk
      for i, spaceJunk in ipairs(spaceDebris) do
        love.graphics.draw(spaceJunk.img, spaceJunk.x, spaceJunk.y, math.rad(90), 1, 1, powerUPAImg:getWidth() / 2, powerUPAImg:getHeight() / 2)
      end
    -- Player and Shields
      if isAlive then
        love.graphics.draw(player.img, player.x, player.y)
        --love.graphics.draw(shieldThree.img, player.x, player.y)
        --love.graphics.draw(shieldTwo.img, player.x, player.y)
        --love.graphics.draw(shieldOne.img, player.x, player.y)
      end
    --on screen meters
    	love.graphics.setColor(255, 255, 255)
      --love.graphics.print("FUCKERS NAILED: " .. tostring(FuckersNailed), 400, 10)
      love.graphics.print("SCORE: " .. tostring(score), 1275, 870)
      love.graphics.print("" .. tostring(LEVEL), 1385, 870)
      --love.graphics.print("ENERGY: " .. tostring(ENERGY), 1200, 10)
      --love.graphics.print("LIVES: " .. tostring(LIVES), 1000, 10)
      love.graphics.print("CASH: " .. tostring(shopPoints), 1275, 850)
      --love.graphics.print("shields " .. tostring(shields), 10, 10)



    --on screen lives meter

    if isAlive then
      love.graphics.draw(lifemeter, 950, 850)
    else
      love.graphics.draw(lifemeterUnder, 950, 850)
    end

    if LIVES > 4 then
      love.graphics.draw(playerLives, 1170, 860)
    end

    if LIVES > 3 then
      love.graphics.draw(playerLives, 1150, 860)
    end

    if LIVES > 2 then
      love.graphics.draw(playerLives, 1130, 860)
    end

    if LIVES > 1 then
      love.graphics.draw(playerLives, 1110, 860)
    end

    if LIVES > 0 then
      love.graphics.draw(playerLives, 1090, 860)
    end
--[[
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
]]--


    --the shop

    --[[if shopPoints > 1000000 then
      love.graphics.draw(theShop)
    else
      love.graphics.draw(player.img, player.x, player.y)
    end]]--




      --if ENERGY > 200 then
      --  love.graphics.print("For convenient badguy removal press S now.", 675, 10)
      --end

    --player
      --[[if isAlive then
        love.graphics.draw(player.img, player.x, player.y)
      end]]--

      --in-game death reset
      if not isAlive and LIVES == 4 then
        love.graphics.print("The first of many deaths, I'm sure. Press 'f' to discover your destiny.", 400, 440)
        love.graphics.draw(textOval, 300, 250)
      end

      --in-game death reset
      if not isAlive and LIVES == 3 then
        love.graphics.print("Your shame will come. Press 'f' to define your failure.", 400, 440)
        love.graphics.draw(textOval, 300, 250)
      end

      --in-game death reset
      if not isAlive and LIVES == 2 then
        love.graphics.print("You should stop dying! Press 'f' to try that out.", 400, 440)
        love.graphics.draw(textOval, 300, 250)
      end


      --in-game death reset
      if not isAlive and LIVES == 1 then
        love.graphics.print("One life left. Press 'f' to fix that.", 400, 440)
        love.graphics.draw(textOval, 300, 250)
      end


      --Game Over reset
      --if isAlive then
        --love.graphics.draw(player.img, player.x, player.y)
      --end

      if not isAlive and LIVES < 1 then
        love.graphics.draw(gameOver, 300, 150)
        love.graphics.print("Press 'X' for GAME RESTART", 625, 470)
        allDead:play()
      end

    --debug
      if debug then
    		fps = tostring(love.timer.getFPS())
    		love.graphics.print("FPS: "..fps, 1190, 870)
    	end


      if isAlive and LEVEL > 21 then
        love.graphics.print("GAME OVER, MAN! THAT'S ALL THERE IS!", love.graphics:getWidth()/2-50, love.graphics:getHeight()/2-10)
      end


      loveframes.draw()
    end

function love.mousepressed(x, y, button)

    -- insert code

    loveframes.mousepressed(x, y, button)

end

function love.mousereleased(x, y, button)

    -- insert code

    loveframes.mousereleased(x, y, button)

end

function love.keypressed(key, unicode)

    -- insert code

    loveframes.keypressed(key, unicode)

end

function love.keyreleased(key)

    -- insert code

    loveframes.keyreleased(key)

end
