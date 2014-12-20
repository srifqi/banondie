-- Banned on Die [banondie] by srifqi

minetest.register_on_dieplayer(function(player)

	-- please no creative mode and enable damage to use this
	if minetest.setting_getbool("creative_mode") or not minetest.setting_getbool("enable_damage") then
		return
	end
	
	local name = player:get_player_name()
	
	print(name.." died and banned from server")
	minetest.chat_send_all(name.." died and banned from server")
	
	minetest.after(1, function()
		minetest.ban_player(name)
		minetest.kick_player(name, "Hardcore mode on (no respawn)")
	end)
	
	return false

end)
