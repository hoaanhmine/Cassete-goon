function onCreate()
makeLuaText('HMFNF','Optimize: Ken GG','width',0,500)
    setTextSize('HMFNF',20)
   addLuaText('HMFNF',true);
   end
function onBeatHit()
if curBeat == 50 then
doTweenX('nameTween', 'HMFNF',  -500, 2, 'linear')
end
if curBeat == 60 then
removeLuaText('HMFNF',true)
end
end