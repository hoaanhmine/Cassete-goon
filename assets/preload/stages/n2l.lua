function onCreate()
	-- background shit	

	makeLuaSprite('garage', 'n2l/garage', -460, -240);
	setScrollFactor('garage', 1, 1);

	makeLuaSprite('vignette', 'n2l/darkness', -460, -240);
	setScrollFactor('vignette', 1, 1);


	makeLuaSprite('graveyard', 'n2l/graveyard', -460, -240);
	setScrollFactor('graveyard', 1, 1);
	setBlendMode('graveyard', 'multiply')

	addLuaSprite('garage', false);
	addLuaSprite('graveyard', false);
	addLuaSprite('vignette', true);

	makeLuaSprite('bartop','',0,0)
    makeGraphic('bartop',1280,60,'000000')
    addLuaSprite('bartop',true)
    setObjectCamera('bartop','hud')
    setScrollFactor('bartop',0,0)

    makeLuaSprite('barbot','',0,659)
    makeGraphic('barbot',1280,61,'000000')
    addLuaSprite('barbot',true)
    setScrollFactor('barbot',0,0)
    setObjectCamera('barbot','hud')
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end