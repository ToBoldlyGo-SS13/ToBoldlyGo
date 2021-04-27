/obj/item/clothing/head/headphones
	name = "headphones"
	desc = "It's probably not in accordance with company policy to listen to music on the job... but fuck it."
	icon = 'icons/clothing/head/headphones.dmi'
	icon_state = ICON_STATE_WORLD
	volume_multiplier = 0.5
	body_parts_covered = SLOT_HEAD|SLOT_EARS
	gender = PLURAL

	var/headphones_on = 0
	var/sound_channel
	var/current_track
	var/music_volume = 50

/obj/item/clothing/head/headphones/Initialize()
	. = ..()
	sound_channel = GLOB.sound_channels.RequestChannel(type)

/obj/item/clothing/head/headphones/on_update_icon()
	icon_state = get_world_inventory_state()
	if(headphones_on)
		icon_state = "[icon_state]-on"
	update_clothing_icon()

/obj/item/clothing/head/headphones/get_mob_overlay(mob/user_mob, slot, bodypart)
	var/image/ret = ..()
	if(ret && headphones_on)
		ret.icon_state = "[ret.icon_state]-on"
	return ret

/obj/item/clothing/head/headphones/verb/togglemusic()
	set name = "Toggle Headphone Music"
	set category = "Object"
	set src in usr
	if(!istype(usr, /mob/living)) return
	if(usr.incapacitated()) return
	toggle(usr)

/obj/item/clothing/head/headphones/proc/toggle(mob/user)
	if(headphones_on)
		headphones_on = 0
		to_chat(user, "<span class='notice'>You turn the music off.</span>")
		volume_multiplier = initial(volume_multiplier)
		stop_music(user)
	else
		headphones_on = 1
		to_chat(user, "<span class='notice'>You turn the music on.</span>")
		volume_multiplier = 0.1
		play_music(user)

	update_icon()

/obj/item/clothing/head/headphones/handle_mouse_drop(atom/over, mob/user)
	interact(user)
	return TRUE

/obj/item/clothing/head/headphones/attack_self(mob/user)
	..()
	interact(user)

/obj/item/clothing/head/headphones/equipped(mob/user)
	. = ..()
	if(headphones_on)
		play_music(user)

/obj/item/clothing/head/headphones/dropped(mob/user)
	. = ..()
	stop_music(user)

/obj/item/clothing/head/headphones/proc/play_music(mob/user)
	if(!user || !user.client)
		return
	if(!(user.get_inventory_slot(src) in list(slot_l_ear_str, slot_r_ear_str)))
		return
	if(current_track)
		var/decl/music_track/track = GET_DECL(global.music_tracks[current_track])
		sound_to(user, sound(null, channel = sound_channel))
		sound_to(user, sound(track.song, repeat = 1, wait = 0, volume = music_volume, channel = sound_channel))

/obj/item/clothing/head/headphones/proc/stop_music(mob/user)
	if(!user || !user.client)
		return
	sound_to(user, sound(null, channel = sound_channel))

/obj/item/clothing/head/headphones/interact(var/mob/user)
	if(!CanPhysicallyInteract(user))
		return
	var/list/dat = list()
	dat += "<A href='?src=\ref[src];toggle=1;'>Switch [headphones_on ? "off" : "on"]</a>"
	dat += "Volume: [music_volume] <A href='?src=\ref[src];vol=-10;'>-</a><A href='?src=\ref[src];vol=10;'>+</a>"
	dat += "Tracks:"
	for(var/track in global.music_tracks)
		if(track == current_track)
			dat += "<span class='linkOn'>[track]</span>"
		else
			dat += "<A href='?src=\ref[src];track=[track];'>[track]</a>"

	var/datum/browser/popup = new(user, "headphones", name, 290, 410)
	popup.set_content(jointext(dat,"<br>"))
	popup.open()

/obj/item/clothing/head/headphones/OnTopic(var/user, var/list/href_list)
	if(href_list["toggle"])
		toggle(user)
		interact(user)
		return TOPIC_REFRESH
	if(href_list["vol"])
		var/adj = text2num(href_list["vol"])
		music_volume = Clamp(music_volume + adj, 0, 100)
		if(headphones_on)
			play_music(user)
		interact(user)
		return TOPIC_REFRESH
	if(href_list["track"])
		current_track = href_list["track"]
		if(headphones_on)
			play_music(user)
		interact(user)
		return TOPIC_HANDLED