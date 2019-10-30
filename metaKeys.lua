


-- This file is for in-game Meta / Hot Keys

function escape_quit()
  if love.keyboard.isDown('escape') then
    love.event.push('quit')
  end

end


function morale_button()
  if love.keyboard.isDown('p') then
    winningPlayer:play() else
    --love.event.push('pause')
  end
end
