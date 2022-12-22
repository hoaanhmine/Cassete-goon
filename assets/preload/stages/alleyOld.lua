function onCreate()
	-- background shit

	makeLuaSprite('goonsky', 'alleyOld/goonsky', -420, -280);
	setScrollFactor('goonsky', 0.6, 0.6);

	makeLuaSprite('goonbuildings', 'alleyOld/goonbuildings', -420, -280);
	setScrollFactor('goonbuildings', 0.8, 0.8);
	
	makeLuaSprite('goonfloor', 'alleyOld/goonfloor', -420, -280);
	setScrollFactor('goonfloor', 1, 1);
	--scaleObject('goonfloor', 1.1, 1.1);

	addLuaSprite('goonsky', false);
	addLuaSprite('goonbuildings', false);
	addLuaSprite('goonfloor', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end