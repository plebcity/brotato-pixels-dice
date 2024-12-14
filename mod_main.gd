extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const MOD_DIR = "plebcity-pixels/" # name of the folder that this file is in
const PIXELS_LOG = "plebcity-pixels" # full ID of your mod (AuthorName-ModName)

var dir = ""
var ext_dir = ""

func _init(modLoader = ModLoader):
	ModLoaderUtils.log_info("Init", PIXELS_LOG)

	# ! We can't use `ModLoader` because the ModLoader instance isn't available
	# ! at this point in the mod's loading process. Instead, the class instance
	# ! is passed to a mod's `_init` func via the variable `modLoader`.
	# ! It will be available in any other places in your mod though, such as in
	# ! your _ready func.
	dir = modLoader.UNPACKED_DIR + MOD_DIR
	ext_dir = dir + "extensions/" # ! any script extensions should go in this folder, and should follow the same folder structure as vanilla

	# Add extensions
	modLoader.install_script_extension(ext_dir + "singletons/player_run_data.gd")
	modLoader.install_script_extension(ext_dir + "singletons/item_service.gd")
	
	modLoader.add_translation_from_resource(dir + "translations/pixelsmod_text.en.translation")

# Called when the node enters the scene tree for the first time.
func _ready()->void:
	ModLoaderUtils.log_info("Loading custom content", PIXELS_LOG)
	# Get the ContentLoader class
	var ContentLoader = get_node("/root/ModLoader/Darkly77-ContentLoader/ContentLoader")

	# Add content. These .tres files are ContentData resources
	ContentLoader.load_data(dir + "content_data/pixels_characters.tres", PIXELS_LOG)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
