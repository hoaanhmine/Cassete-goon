-- dont ever change this variable from path to ofs
local path = ''
local scale = 0
local boyX = 0
local boyY = 0
local flipX = false
local anim = {}
local i = 0
local shadow = true
local ofs = {}

-- you can change this one to custom it yourself
local range = 50 -- for the shadow range
local duration = 1 -- for how long the shadow still

-- addOffset(obj:String, name:String, x:Int, y:Int)

function startWith(text, prefix)
    return text:find(prefix,1,true) == 1
end

function onCreatePost()
	path = getProperty('boyfriend.imageFile')
	scale = getProperty('boyfriend.jsonScale')
	boyX = getProperty('boyfriend.x')
	boyY = getProperty('boyfriend.y')
	flipX = getProperty('boyfriend.originalFlipX') 
	for i = 0, getProperty('boyfriend.animationsArray.length')-1 do
		if getPropertyFromGroup('boyfriend.animationsArray', i, 'anim') == 'singLEFT' then
			anim[1] = getPropertyFromGroup('boyfriend.animationsArray', i, 'name')
			ofs[1] = getPropertyFromGroup('boyfriend.animationsArray', i, 'offsets')[1]
			ofs[2] = getPropertyFromGroup('boyfriend.animationsArray', i, 'offsets')[2]
		end
		if getPropertyFromGroup('boyfriend.animationsArray', i, 'anim') == 'singDOWN' then
			anim[2] = getPropertyFromGroup('boyfriend.animationsArray', i, 'name')
			ofs[3] = getPropertyFromGroup('boyfriend.animationsArray', i, 'offsets')[1]
			ofs[4] = getPropertyFromGroup('boyfriend.animationsArray', i, 'offsets')[2]
		end
		if getPropertyFromGroup('boyfriend.animationsArray', i, 'anim') == 'singUP' then
			anim[3] = getPropertyFromGroup('boyfriend.animationsArray', i, 'name')
			ofs[5] = getPropertyFromGroup('boyfriend.animationsArray', i, 'offsets')[1]
			ofs[6] = getPropertyFromGroup('boyfriend.animationsArray', i, 'offsets')[2]
		end
		if getPropertyFromGroup('boyfriend.animationsArray', i, 'anim') == 'singRIGHT' then
			anim[4] = getPropertyFromGroup('boyfriend.animationsArray', i, 'name')
			ofs[7] = getPropertyFromGroup('boyfriend.animationsArray', i, 'offsets')[1]
			ofs[8] = getPropertyFromGroup('boyfriend.animationsArray', i, 'offsets')[2]
		end
	end
end

function goodNoteHit(a,b,c,d)
	if shadow and d == false then
	local tag = 'shadow'..tostring(i)
	makeAnimatedLuaSprite(tag, path, boyX, boyY)
	addAnimationByPrefix(tag, 'act', anim[b+1], 24, false)
	addLuaSprite(tag, false)
	setObjectOrder(tag, getObjectOrder('boyfriendGroup')-1)
	objectPlayAnimation(tag, 'act', true)
	setProperty(tag ..'.alpha', 0.5)
	if b == 0 then
		doTweenX(tag, tag, boyX - range, duration, easeOut)
	end
	if b == 1 then
		doTweenY(tag, tag, boyY + range, duration, easeOut)
	end
	if b == 2 then
		doTweenY(tag, tag, boyY - range, duration, easeOut)
	end
	if b == 3 then
		doTweenX(tag, tag, boyX + range, duration, easeOut)
	end
	doTweenAlpha(tag..'alpha', tag, 0, duration, easeOut)
	setProperty(tag..'.offset.x', ofs[b*2+1])
	setProperty(tag..'.offset.y', ofs[b*2+2])
	i = i + 1
	end
end

function onTweenCompleted(tag)
	if startwith(tag, 'shadow') then
		removeLuaSprite(tag, true)
	end
end

function onEvent(n,v1,v2)
	if n == 'shadow' then
		if v1 == 'true' then
			shadow = true
		else
			shadow = false
		end
	end
end

