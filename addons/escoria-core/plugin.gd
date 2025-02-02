# Plugin script to initialize Escoria
tool
extends EditorPlugin

# Autoloads to instantiate
const autoloads = {
	"escoria": "res://addons/escoria-core/game/escoria.tscn",
}


# Setup Escoria
func _enter_tree():
	for key in autoloads.keys():
		add_autoload_singleton(key, autoloads[key])
	
	# Prepare settings
	set_escoria_main_settings()
	set_escoria_debug_settings()
	set_escoria_ui_settings()
	set_escoria_sound_settings()
	set_escoria_platform_settings()


# Prepare the settings in the Escoria UI category
func set_escoria_ui_settings():
	ProjectSettings.set_setting(
		"audio/default_bus_layout", 
		"res://addons/escoria-core/default_bus_layout.tres"
	)
	if !ProjectSettings.has_setting("escoria/ui/tooltip_follows_mouse"):
		ProjectSettings.set_setting("escoria/ui/tooltip_follows_mouse", true)
	
	if !ProjectSettings.has_setting("escoria/ui/dialogs_chooser"):
		ProjectSettings.set_setting("escoria/ui/dialogs_chooser", "")
		var dialogs_chooser_property_info = {
			"name": "escoria/ui/dialogs_chooser",
			"type": TYPE_STRING,
			"hint": PROPERTY_HINT_FILE,
			"hint_string": "*.tscn, *.scn"
		}
		ProjectSettings.add_property_info(dialogs_chooser_property_info)
		
	if !ProjectSettings.has_setting("escoria/ui/default_dialog_scene"):
		ProjectSettings.set_setting("escoria/ui/default_dialog_scene", "")
		var default_dialog_scene_property_info = {
			"name": "escoria/ui/default_dialog_scene",
			"type": TYPE_STRING,
			"hint": PROPERTY_HINT_FILE,
			"hint_string": "*.tscn, *.scn"
		}
		ProjectSettings.add_property_info(default_dialog_scene_property_info)
	
	if !ProjectSettings.has_setting("escoria/ui/main_menu_scene"):
		ProjectSettings.set_setting("escoria/ui/main_menu_scene", "")
		var main_menu_scene_property_info = {
			"name": "escoria/ui/main_menu_scene",
			"type": TYPE_STRING,
			"hint": PROPERTY_HINT_FILE,
			"hint_string": "*.tscn, *.scn"
		}
		ProjectSettings.add_property_info(main_menu_scene_property_info)
	
	if !ProjectSettings.has_setting("escoria/ui/pause_menu_scene"):
		ProjectSettings.set_setting("escoria/ui/pause_menu_scene", "")
		var pause_menu_scene_property_info = {
			"name": "escoria/ui/pause_menu_scene",
			"type": TYPE_STRING,
			"hint": PROPERTY_HINT_FILE,
			"hint_string": "*.tscn, *.scn"
		}
		ProjectSettings.add_property_info(pause_menu_scene_property_info)
	
	if !ProjectSettings.has_setting("escoria/ui/game_scene"):
		ProjectSettings.set_setting("escoria/ui/game_scene", "")
		var game_scene_property_info = {
			"name": "escoria/ui/game_scene",
			"type": TYPE_STRING,
			"hint": PROPERTY_HINT_FILE,
			"hint_string": "*.tscn, *.scn"
		}
		ProjectSettings.add_property_info(game_scene_property_info)
		
	if !ProjectSettings.has_setting("escoria/ui/items_autoregister_path"):
		ProjectSettings.set_setting(
			"escoria/ui/items_autoregister_path", 
			"res://game/items/escitems/"
		)
		var game_scene_property_info = {
			"name": "escoria/ui/items_autoregister_path",
			"type": TYPE_STRING,
			"hint": PROPERTY_HINT_DIR
		}
		ProjectSettings.add_property_info(game_scene_property_info)
	

# Prepare the settings in the Escoria main category
func set_escoria_main_settings():
	
	if !ProjectSettings.has_setting("escoria/main/game_version"):
		ProjectSettings.set_setting("escoria/main/game_version", "")
		var game_version_property_info = {
			"name": "escoria/main/game_version",
			"type": TYPE_STRING
		}
		ProjectSettings.add_property_info(game_version_property_info)
	
	if !ProjectSettings.has_setting("escoria/main/game_start_script"):
		ProjectSettings.set_setting("escoria/main/game_start_script", "")
		var game_start_script_property_info = {
			"name": "escoria/main/game_start_script",
			"type": TYPE_STRING,
			"hint": PROPERTY_HINT_FILE,
			"hint_string": "*.esc"
		}
		ProjectSettings.add_property_info(game_start_script_property_info)
	
	if !ProjectSettings.has_setting("escoria/main/force_quit"):
		ProjectSettings.set_setting("escoria/main/force_quit", true)
		var force_quit_property_info = {
			"name": "escoria/main/force_quit",
			"type": TYPE_BOOL
		}
		ProjectSettings.add_property_info(force_quit_property_info)
	
	ProjectSettings.set_setting("application/run/main_scene", "res://addons/escoria-core/game/main_scene.tscn")

	if not ProjectSettings.has_setting("escoria/main/command_directories"):
		ProjectSettings.set_setting("escoria/main/command_directories", [
			"res://addons/escoria-core/game/core-scripts/esc/commands"
		])
		ProjectSettings.add_property_info({
			"name": "escoria/main/command_directories",
			"type": TYPE_ARRAY,
		})

	if !ProjectSettings.has_setting("escoria/main/text_lang"):
		ProjectSettings.set_setting("escoria/main/text_lang", TranslationServer.get_locale())
		var text_lang_property_info = {
			"name": "escoria/main/text_lang",
			"type": TYPE_STRING,
			"hint": PROPERTY_HINT_NONE
		}
		ProjectSettings.add_property_info(text_lang_property_info)

	if !ProjectSettings.has_setting("escoria/main/voice_lang"):
		ProjectSettings.set_setting("escoria/main/voice_lang", TranslationServer.get_locale())
		var voice_lang_property_info = {
			"name": "escoria/main/voice_lang",
			"type": TYPE_STRING,
			"hint": PROPERTY_HINT_NONE
		}
		ProjectSettings.add_property_info(voice_lang_property_info)
		
	if !ProjectSettings.has_setting("escoria/main/savegames_path"):
		ProjectSettings.set_setting(
			"escoria/main/savegames_path", 
			"user://saves/"
		)
		var savegames_path_property_info = {
			"name": "escoria/main/savegames_path",
			"type": TYPE_STRING,
			"hint": PROPERTY_HINT_DIR
		}
		ProjectSettings.add_property_info(savegames_path_property_info)
	
	if !ProjectSettings.has_setting("escoria/main/settings_path"):
		ProjectSettings.set_setting(
			"escoria/main/settings_path", 
			"user://"
		)
		var settings_path_property_info = {
			"name": "escoria/main/settings_path",
			"type": TYPE_STRING,
			"hint": PROPERTY_HINT_DIR
		}
		ProjectSettings.add_property_info(settings_path_property_info)


# Prepare the settings in the Escoria debug category
func set_escoria_debug_settings():
	if !ProjectSettings.has_setting("escoria/debug/terminate_on_warnings"):
		ProjectSettings.set_setting("escoria/debug/terminate_on_warnings", false)
	
	if !ProjectSettings.has_setting("escoria/debug/terminate_on_errors"):
		ProjectSettings.set_setting("escoria/debug/terminate_on_errors", true)
	
	# Main language the game is developed in. Useful for translation management
	if !ProjectSettings.has_setting("escoria/debug/development_lang"):
		ProjectSettings.set_setting("escoria/debug/development_lang", "en")
		
	# Assure log level preference
	if not ProjectSettings.has_setting("escoria/debug/log_level"):
		ProjectSettings.set_setting("escoria/debug/log_level", "ERROR")
		var property_info = {
			"name": "escoria/debug/log_level",
			"type": TYPE_STRING,
			"hint": PROPERTY_HINT_ENUM,
			"hint_string": "ERROR,WARNING,INFO,DEBUG"
		}
		ProjectSettings.add_property_info(property_info)


# Prepare the settings in the Escoria sound settings
func set_escoria_sound_settings():
	if !ProjectSettings.has_setting("escoria/sound/master_volume"):
		ProjectSettings.set_setting("escoria/sound/master_volume", 1)
		var master_data_property_info = {
			"name": "escoria/sound/master_volume",
			"type": TYPE_INT,
			"hint": PROPERTY_HINT_RANGE,
			"hint_string": "0,1"
		}
		ProjectSettings.add_property_info(master_data_property_info)

	if !ProjectSettings.has_setting("escoria/sound/music_volume"):
		ProjectSettings.set_setting("escoria/sound/music_volume", 1)
		var music_data_property_info = {
			"name": "escoria/sound/music_volume",
			"type": TYPE_INT,
			"hint": PROPERTY_HINT_RANGE,
			"hint_string": "0,1"
		}
		ProjectSettings.add_property_info(music_data_property_info)
		
	if !ProjectSettings.has_setting("escoria/sound/sfx_volume"):
		ProjectSettings.set_setting("escoria/sound/sfx_volume", 1)
		var sound_data_property_info = {
			"name": "escoria/sound/sfx_volume",
			"type": TYPE_INT,
			"hint": PROPERTY_HINT_RANGE,
			"hint_string": "0,1"
		}
		ProjectSettings.add_property_info(sound_data_property_info)
	
	if !ProjectSettings.has_setting("escoria/sound/speech_volume"):
		ProjectSettings.set_setting("escoria/sound/speech_volume", 1)
		var speech_data_property_info = {
			"name": "escoria/sound/speech_volume",
			"type": TYPE_INT,
			"hint": PROPERTY_HINT_RANGE,
			"hint_string": "0,1"
		}
		ProjectSettings.add_property_info(speech_data_property_info)
	
	if !ProjectSettings.has_setting("escoria/sound/speech_enabled"):
		ProjectSettings.set_setting("escoria/sound/speech_enabled", 1)
		var speech_enabled_property_info = {
			"name": "escoria/sound/speech_enabled",
			"type": TYPE_BOOL
		}
		ProjectSettings.add_property_info(speech_enabled_property_info)
	if !ProjectSettings.has_setting("escoria/sound/speech_folder"):
		ProjectSettings.set_setting(
			"escoria/sound/speech_folder",
			"res://speech"
		)
		ProjectSettings.add_property_info({
			"name": "escoria/sound/speech_folder",
			"type": TYPE_STRING,
			"hint": PROPERTY_HINT_DIR
		})
	if !ProjectSettings.has_setting("escoria/sound/speech_extension"):
		ProjectSettings.set_setting(
			"escoria/sound/speech_extension",
			"ogg"
		)
		ProjectSettings.add_property_info({
			"name": "escoria/sound/speech_extension",
			"type": TYPE_STRING
		})


# Prepare the settings in the Escoria platform category and may need special
# setting per build
func set_escoria_platform_settings():
	# Skip cache - certain platforms (esp. mobile) lack memory for caching
	# scenes.
	# If set to true, all generic scenes (UI, inventory, etc) will be loaded
	# as any other scene.
	if !ProjectSettings.has_setting("escoria/platform/skip_cache"):
		ProjectSettings.set_setting("escoria/platform/skip_cache", false)
	if !ProjectSettings.has_setting("escoria/platform/skip_cache.mobile"):
		ProjectSettings.set_setting("escoria/platform/skip_cache.mobile", true)

# Uninstall plugin
func _exit_tree():
	for key in autoloads.keys():
		if ProjectSettings.has_setting(key):
			remove_autoload_singleton(key)
	
	
