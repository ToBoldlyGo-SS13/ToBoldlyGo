#if !defined(USING_MAP_DATUM)

	#include "../../mods/content/mundane.dm"
	#include "../../mods/content/corporate/_corporate.dme"
	#include "../../mods/content/government/_government.dme"
	#include "../../mods/content/psionics/_psionics.dme"
	#include "../../mods/content/modern_earth/_modern_earth.dme"
	#include "../../mods/content/xenobiology/_xenobiology.dme"
	
	#include "../../mods/content/baychems/_baychems.dme"
	#include "../../mods/content/hydroponics/_hydroponics.dme"
	#include "../../mods/content/supplypacks/_supplypacks.dme"

	#include "../../mods/content/iseo/_iseo.dme"
	#include "..\..\mods\mobs\borers\_borers.dme"
	#include "..\..\mods\mobs\dionaea\_dionaea.dme"

	#include "../../mods/content/neural_laces/_laces.dme"
	#include "../../mods/content/genemodding/_genemodding.dme"
	#include "../../mods/content/hearthfoods/_hearthfoods.dme"
	#include "../../mods/content/hearthdrinks/_hearthdrinks.dme"
	#include "../../mods/content/shards/_shards.dme"

	#include "../../mods/verbs/antighost/_subtle_antighost.dme"

	#include "../../mods/utility/ooc_notes/_ooc_notes.dme"
	#include "../../mods/utility/tgsv4_integration/___tgs.dme"
	#include "../../mods/content/hearth_content/_hearth_content.dme"

	#include "../../mods/species/ascent/_ascent.dme"
	#include "../../mods/species/utility_frames/_utility_frames.dme"
	#include "../../mods/species/tajaran/_tajaran.dme"
	#include "../../mods/species/lizard/_lizard.dme"
	#include "../../mods/species/adherent/_adherent.dme"
	#include "../../mods/species/skrell/_skrell.dme"

	#include "../../mods/content/hearth_culture/_hearth_culture.dme"

	#include "../../mods/content/government/away_sites/icarus/icarus.dm"
	#include "../../mods/content/corporate/away_sites/lar_maria/lar_maria.dm"

	#include "../../mods/utility/centcomdb/_centcomdb.dme"

	#include "torch_define.dm"
	#include "torch_announcements.dm"
	#include "torch_antagonism.dm"
	#include "torch_areas.dm"
	#include "torch_elevator.dm"
	#include "torch_events.dm"
	#include "torch_holodecks.dm"
	#include "torch_lobby.dm"
	#include "torch_music.dm"
	//#include "torch_map_templates.dm"
	#include "torch_npcs.dm"
	#include "torch_overmap.dm"
	#include "torch_presets.dm"
	#include "torch_procs.dm"
	#include "torch_ranks.dm"
	#include "torch_security_state.dm"
	#include "torch_setup.dm"
	#include "torch_shuttles.dm"
	#include "torch_submaps.dm"
	#include "torch_turfs.dm"
	#include "torch_unit_testing.dm"
	#include "torch_wall_types.dm"
	#include "torch_paint.dm"
	#include "torch_floor_decals.dm"
	#include "torch_cyclers.dm"
	#include "machinery/rtg.dm"
	#include "torch_departments.dm"

	#include "datums/game_modes/torch_traitor.dm"
	#include "datums/game_modes/torch_revolution.dm"
	#include "datums/game_modes/torch_siege.dm"
	#include "datums/game_modes/torch_meteor.dm"
	#include "datums/game_modes/torch_uprising.dm"

	#include "job/command_jobs.dm"
	#include "job/corporate_jobs.dm"
	#include "job/engineering_jobs.dm"
	#include "job/exploration_jobs.dm"
	#include "job/medical_jobs.dm"
	#include "job/misc_jobs.dm"
	#include "job/outfits/command_outfits.dm"
	#include "job/outfits/corporate_outfits.dm"
	#include "job/outfits/engineering_outfits.dm"
	#include "job/outfits/exploration_outfits.dm"
	#include "job/outfits/medical_outfits.dm"
	#include "job/outfits/misc_outfits.dm"
	#include "job/outfits/research_outfits.dm"
	#include "job/outfits/security_outfits.dm"
	#include "job/outfits/service_outfits.dm"
	#include "job/outfits/supply_outfits.dm"
	#include "job/outfits/torch_outfits.dm"
	#include "job/research_jobs.dm"
	#include "job/security_jobs.dm"
	#include "job/service_jobs.dm"
	#include "job/shard_jobs.dm"
	#include "job/supply_jobs.dm"
	#include "job/torch_access.dm"
	#include "job/torch_jobs.dm"

	#include "../../mods/content/hearth_maps/_hearth_maps.dme"

	#include "torch1_deck5.dmm"
	#include "torch2_deck4.dmm"
	#include "torch3_deck3.dmm"
	#include "torch4_deck2.dmm"
	#include "torch5_deck1.dmm"
	#include "torch6_bridge.dmm"
	#include "z1_admin.dmm"
	#include "z2_transit.dmm"

//	#include "../away/empty.dmm"
//	#include "../away/ascent/ascent.dm"
	#include "../away/liberia/liberia.dm"
	#include "../away/mining/mining.dm"
	#include "../away/derelict/derelict.dm"
	#include "../away/bearcat/bearcat.dm"
	#include "../away/lost_supply_base/lost_supply_base.dm"
	#include "../away/smugglers/smugglers.dm"
	#include "../away/magshield/magshield.dm"
	#include "../away/casino/casino.dm"
	#include "../away/yacht/yacht.dm"
//	#include "../away/blueriver/blueriver.dm"
	#include "../away/slavers/slavers_base.dm"
	#include "../away/mobius_rift/mobius_rift.dm"
	#include "../away/errant_pisces/errant_pisces.dm"
//	#include "../away/voxship/voxship.dm"
//	#include "../away/skrellscoutship/skrellscoutship.dm"
//	#include "../away/meatstation/meatstation.dm"
//	#include "../away/miningstation/miningstation.dm"
//	#include "../away/mininghome/mininghome.dm"
//	#include "../away/scavver/scavver_gantry.dm"
//	#include "../away/verne/verne.dm"

	#define USING_MAP_DATUM /datum/map/torch

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Torch

#endif

