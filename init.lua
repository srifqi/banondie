-- Banned on Die [banondie] by srifqi

-- parameter
local KICK_MESSAGE = "Hardcore mode on (no respawn)"
local USE_ADVANCEDBAN = false

minetest.register_on_dieplayer(function(player)

	-- please no creative mode and enable damage to use this
	if minetest.setting_getbool("creative_mode") or not minetest.setting_getbool("enable_damage") then
		return
	end
	
	local name = player:get_player_name() -- get the player name
	
	if USE_ADVANCEDBAN == true then
		advancedban.ban(name) -- advancedban ban
		minetest.kick_player(name, KICK_MESSAGE) -- kick player
	else
		minetest.ban_player(name) -- normal ban
	end
	
	minetest.log("action", name.." died and banned from server") -- print debug
	minetest.chat_send_all(name.." died and banned from server") -- tell another player
	
	return false

end)
