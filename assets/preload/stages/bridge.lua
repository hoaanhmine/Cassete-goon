function onCreate()
	-- background shit

	makeLuaSprite('sky', 'bridge/sky', -390, -200);
	setScrollFactor('sky', 0.6, 0.6);
	scaleObject('sky', 1.2, 1.2);

	makeLuaSprite('bgbuildings', 'bridge/layer1', -390, -200);
	setScrollFactor('bgbuildings', 0.65, 0.65);
	scaleObject('bgbuildings', 1.2, 1.2);

	makeLuaSprite('bgbridge', 'bridge/layer2', -390, -150);
	setScrollFactor('bgbridge', 0.7, 0.7);
	scaleObject('bgbridge', 1.2, 1.2);

	makeLuaSprite('bgbuildings2', 'bridge/layer3', -390, -200);
	setScrollFactor('bgbuildings2', 0.8, 0.8);
	scaleObject('bgbuildings2', 1.2, 1.2);
	
	makeLuaSprite('bridgefloor', 'bridge/layer4', -390, -200);
	setScrollFactor('bridgefloor', 1, 1);
	scaleObject('bridgefloor', 1.2, 1.2);

	makeLuaSprite('bridgefloorstuff', 'bridge/layer5', -390, -200);
	setScrollFactor('bridgefloorstuff', 1, 1);
	scaleObject('bridgefloorstuff', 1.2, 1.2);

	makeLuaSprite('postFX1', 'bridge/layer6', -390, -200);
	setScrollFactor('postFX1', 1, 1);
	scaleObject('postFX1', 1.2, 1.2);
	setBlendMode('postFX1', 'add')

	makeLuaSprite('postFX2', 'bridge/layer7', -390, -200);
	setScrollFactor('postFX2', 1, 1);
	scaleObject('postFX2', 1.2, 1.2);
	setBlendMode('postFX2', 'multiply')


	addLuaSprite('sky', false);
	addLuaSprite('bgbuildings', false);
	addLuaSprite('bgbridge', false);
	addLuaSprite('bgbuildings2', false);
	addLuaSprite('bridgefloor', false);
	addLuaSprite('bridgefloorstuff', false);

	addLuaSprite('postFX1', true);
	addLuaSprite('postFX2', true);
	
	--black bars (totally not borrowed from Hotline 024)

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