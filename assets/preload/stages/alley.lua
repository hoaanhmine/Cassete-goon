function onCreate()
	-- background shit

	makeLuaSprite('goonsky', 'alley/stars', -460, -240);
	setScrollFactor('goonsky', 0.6, 0.6);

	makeLuaSprite('goonbuildings', 'alley/city', -460, -240);
	setScrollFactor('goonbuildings', 0.8, 0.8);

	makeLuaSprite('goonfloor', 'alley/ground', -460, -240);
	setScrollFactor('goonfloor', 1, 1);
	
	makeLuaSprite('goonbg', 'alley/bg', -460, -240);
	setScrollFactor('goonbg', 1, 1);
	--scaleObject('goonfloor', 1.1, 1.1);

	makeLuaSprite('goonbgobjects', 'alley/bgobjects', -460, -240);
	setScrollFactor('goonbgobjects', 1, 1);

	makeLuaSprite('goonrails', 'alley/rails', -460, -240);
	setScrollFactor('goonrails', 1, 1);

	makeLuaSprite('tv', 'alley/tv', -460, -240);
	setScrollFactor('tv', 1, 1);


	makeLuaSprite('postFX', 'alley/bloom', -460, -240);
	setScrollFactor('postFX', 1, 1);
	setBlendMode('postFX', 'add')

	addLuaSprite('goonsky', false);
	addLuaSprite('goonbuildings', false);
	addLuaSprite('goonfloor', false);
	addLuaSprite('goonbg', false);
	addLuaSprite('goonbgobjects', false);

	addLuaSprite('goonrails', true);
	addLuaSprite('tv', true);

	addLuaSprite('postFX', true);

	--makeLuaSprite('bartop','',0,0)
    --makeGraphic('bartop',1280,60,'000000')
    --addLuaSprite('bartop',true)
    --setObjectCamera('bartop','hud')
    --setScrollFactor('bartop',0,0)

    --makeLuaSprite('barbot','',0,659)
    --makeGraphic('barbot',1280,61,'000000')
    --addLuaSprite('barbot',true)
    --setScrollFactor('barbot',0,0)
    --setObjectCamera('barbot','hud')
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end