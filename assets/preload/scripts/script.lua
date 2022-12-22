-- script by ImaginationSuperHero52806#2485

local iconVars = {
    tagName = 'test',       -- Basically just the lua tag.
    hasLosing = true,   -- Does it have a losing state? Mostly cause I thought of pixel icons since the base game only did that.
    hasWinning = false,      -- Does it have a winning state?
    isAnimated = true,   -- Is it animated (requires XML if true)?
    imageORchar = 'char',  -- Basically do want it to be a set character or detect a set icon?
    thingName = 'CASS',       -- What's the thing's name?
    isP1 = true             -- Is it BF?
}
local iconOffsets = {
    offsetsX = {
        -25, -- Netrual
        -15, -- Losing
        0  -- Winning
    },
    offsetsY = {
        -25, -- Netrual
        15, -- Losing
        0  -- Winning
    }
}

local setup = {
    directory = 'icons/animated/cg_ICONS',
    xmlNames = {'Normal', 'Losing'}
}
local stateNames = { -- just in case reasons
    'Netrual',
    'Losing',
    'Winning'
}

local iconName = nil
local iconType = nil
function onCreatePost()
    if iconVars.isP1 == true then iconName = 'iconP1' else iconName = 'iconP2' end
    makeAnimatedLuaSprite(iconVars.tagName, setup.directory, getProperty(iconName .. '.x'), getProperty(iconName .. '.y'))
    addAnimationByPrefix(iconVars.tagName, stateNames[1], setup.xmlNames[1], 24, false)
    addAnimationByPrefix(iconVars.tagName, stateNames[2], setup.xmlNames[2], 24, false)
    if iconVars.hasWinning == true then addAnimationByPrefix(iconVars.tagName, stateNames[3], setup.xmlNames[3], 24, false) end
    
    setObjectCamera(iconVars.tagName, 'hud')
    addLuaSprite(iconVars.tagName, true)
end


local flipXstupid
local healthPercent
function onUpdate(elapsed)
    updateHitbox(iconVars.tagName)
    flipXstupid = (iconVars.isP1 == false and not getProperty(iconName .. '.flipX'))
    healthPercent = getProperty('healthBar.percent')
    setProperty(iconVars.tagName .. '.flipX', flipXstupid)
    if iconVars.hasWinning == false then
        if iconVars.isP1 == true then
            if healthPercent < 20 then
                playAnim(iconVars.tagName, stateNames[2], false)
            else
                playAnim(iconVars.tagName, stateNames[1], false)
            end
        else
            if healthPercent > 80 then
                playAnim(iconVars.tagName, stateNames[2], false)
            else
                playAnim(iconVars.tagName, stateNames[1], false)
            end
        end
    else
        if iconVars.isP1 == true then
            if healthPercent < 20 then
                playAnim(iconVars.tagName, stateNames[2], false)
            elseif healthPercent > 20 and healthPercent < 80 then
                playAnim(iconVars.tagName, stateNames[1], false)
            elseif healthPercent > 80 then
                playAnim(iconVars.tagName, stateNames[3], false)
            end
        else
            if healthPercent > 80 then
                playAnim(iconVars.tagName, stateNames[2], false)
            elseif healthPercent < 80 and healthPercent > 20 then
                playAnim(iconVars.tagName, stateNames[1], false)
            elseif healthPercent < 20 then
                playAnim(iconVars.tagName, stateNames[3], false)
            end
        end
    end
    
    if iconName == 'iconP1' then
        iconType = boyfriendName
    elseif iconName == 'iconP2' then
        iconType = dadName
    end
    
    local charIcon = getProperty((iconName == 'iconP1' and 'boyfriend' or iconName == 'iconP2' and 'dad') .. '.healthIcon')
    
    if (iconVars.imageORchar == 'char' and iconType or iconVars.imageORchar == 'image' and charIcon) == iconVars.thingName then
        setProperty(iconVars.tagName .. '.visible', true)
        setProperty(iconName .. '.visible', false)
    else
        setProperty(iconVars.tagName .. '.visible', false)
        setProperty(iconName .. '.visible', true)
    end
    
    local variableStupid = {
        '.x',
        '.y',
        '.origin.x',
        '.origin.y',
        '.scale.x',
        '.scale.y',
        '.angle',
        '.alpha'
    }
    for i = 1, #variableStupid do
        setProperty(iconVars.tagName .. variableStupid[i], getProperty(iconName .. variableStupid[i]))
    end
    setObjectOrder(iconVars.tagName, getObjectOrder(iconName) + 0.1)
    
    addOffset(iconVars.tagName, stateNames[1], iconOffsets.offsetsX[1], iconOffsets.offsetsY[1])
    addOffset(iconVars.tagName, stateNames[2], iconOffsets.offsetsX[2], iconOffsets.offsetsY[2])

    if iconVars.hasWinning == true then addOffset(iconVars.tagName, stateNames[3], iconOffsets.offsetsX[3], iconOffsets.offsetsY[3]) end
end