extends "res://singletons/item_service.gd"

const PIXELS_LOG = "plebcity-pixels"

func _ready() -> void:
	ItemService.effects.append("use_physical_dice")

# Extensions
# =============================================================================

func get_upgrades(level: int, number: int, old_upgrades: Array, player_index: int)->Array:
	if RunData.get_player_effect_bool("use_physical_dice", player_index):
		var upgrades_to_show = []
		upgrades_to_show.push_back(_get_upgrade_from_physical_roll())
		return upgrades_to_show
		
	return .get_upgrades(level, number, old_upgrades, player_index)

# Custom
# =============================================================================

func _get_upgrade_from_physical_roll()->UpgradeData:
	var roll = 20 # Get Pixels roll here
	var tier = Tier.COMMON
	
	if roll > 15:
		tier = Tier.LEGENDARY
	elif roll > 10:
		tier = Tier.RARE
	elif roll > 5:
		tier = Tier.UNCOMMON
	
	ModLoaderUtils.log_info("Upgrades tier data: " + String(_tiers_data[tier][TierData.UPGRADES]), PIXELS_LOG)
	return Utils.get_rand_element(_tiers_data[tier][TierData.UPGRADES])
