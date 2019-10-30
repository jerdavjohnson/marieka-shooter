


function playthemeOne()
  if LEVEL < 2 then
    themeOne:play()
    themeTwo:stop()
    themeThree:stop()
    themeFour:stop()
    themeFive:stop()
    themeSix:stop()
    themeSeven:stop()
    themeEight:stop()
  end
end

function playthemeTwo()
  if LEVEL > 2 and LEVEL < 3 then
    themeOne:stop()
    themeTwo:play()
  end
end

function playthemeThree()
  if LEVEL > 3 and LEVEL < 4 then
    themeTwo:stop()
    themeThree:play()
  end
end

function playthemeFour()
  if LEVEL > 4 and LEVEL < 5 then
    themeThree:stop()
    themeFour:play()
    end
end

function playthemeFive()
    if LEVEL > 5 and LEVEL < 6 then
    themeFour:stop()
    themeFive:play()
    end
end

function playthemeSix()
    if LEVEL > 6 and LEVEL < 7 then
    themeFive:stop()
    themeSix:play()
    end
end

function playthemeSeven()
    if LEVEL > 7 and LEVEL < 8 then
    themeSix:stop()
    themeSeven:play()
    end
end

function playthemeEight()
    if LEVEL > 8 and LEVEL < 9 then
    themeSeven:stop()
    themeEight:play()
    end
end

function playthemeNine()
    if LEVEL > 9 and LEVEL < 10 then
    themeEight:stop()
    themeNine:play()
    end
end

function playthemeTen()
    if LEVEL > 10 and LEVEL < 11 then
    themeNine:stop()
    themeTen:play()
    end
end

function playthemeEleven()
    if LEVEL > 11 and LEVEL < 12 then
    themeTen:stop()
    themeEleven:play()
    end
end

function playthemeTwelve()
    if LEVEL > 12 and LEVEL < 13 then
    themeEleven:stop()
    themeTwelve:play()
    end
end

function playthemeThirteen()
    if LEVEL > 13 and LEVEL < 14 then
    themeTwelve:stop()
    themeThirteen:play()
    end
end

function playthemeFourteen()
    if LEVEL > 14 and LEVEL < 15 then
    themeThirteen:stop()
    themeFourteen:play()
    end
end

function playthemeFifteen()
    if LEVEL > 15 and LEVEL < 16 then
    themeFourteen:stop()
    themeFifteen:play()
    end
end

function playthemeSixteen()
    if LEVEL > 16 and LEVEL < 17 then
    themeFifteen:stop()
    themeSixteen:play()
    end
end

function playthemeSeventeen()
    if LEVEL > 17 and LEVEL < 18 then
    themeSixteen:stop()
    themeSeventeen:play()
    end
end

function playthemeEighteen()
    if LEVEL > 18 and LEVEL < 19 then
    themeSeventeen:stop()
    themeEighteen:play()
    end
end

function playthemeNineteen()
    if LEVEL > 19 and LEVEL < 20 then
    themeEighteen:stop()
    themeNineteen:play()
    end
end

function playthemeTwenty()
    if LEVEL > 20 and LEVEL < 21 then
    themeNineteen:stop()
    themeTwenty:play()
    end
end
