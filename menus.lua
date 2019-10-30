


function create_menus()
  local startbutton = loveframes.Create("button")
  startbutton:SetSize( 150, 30 )
  startbutton:SetPos( width/2-150/2, 150)
  startbutton:SetState("startmenu")
  startbutton:OnClick = function(object)
    gamestate = "playing"
    loveframes.SetState("playing")
  end

  local quitbutton = loveframse.Create("button")
  quitbutton:SetSize(150, 30)
  quitbutton:SetPos(width/2-150/2, 200)
  quitbutton:SetState("startmenu")
  quitbutton:SetText("Quit!")
  quitbutton.OnClick = function(object)
    love.quit()
  end
  -- Creating the buttons for playing state
  local pausebutton = loveframes.Create("button")
  pausebutton:SetSize(150, 30)
  pausebutton:SetPos(width/2-150/2, 250)
  pausebutton:SetState("playing")
  pausebutton:SetText("||")
  pausebutton.OnClick = function(object)
    gamestate = "paused"
  end



  
end
