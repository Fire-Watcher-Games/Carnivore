extends Node

const DEFAULT_BOUNTY = 20
const default_player_data = {
	"bounty": DEFAULT_BOUNTY,
}
var player_data: Dictionary = default_player_data

const DEFAULT_VOLUME: float = 1.6

var default_game_settings: Dictionary = {
	"audio": {
		"Master": DEFAULT_VOLUME / 2,
		"music": DEFAULT_VOLUME,
		"entity_sounds": DEFAULT_VOLUME,
		"player_sounds": DEFAULT_VOLUME,
		"environment_sounds": DEFAULT_VOLUME
	},
	"video": {
		"camera_shake": true
	},
	"locale": {
		"value": "DEFAULT"	
	},
	"desktop_keybinds": {
		"controls_up": OS.find_scancode_from_string("W"),
		"controls_right": OS.find_scancode_from_string("D"),
		"controls_down": OS.find_scancode_from_string("S"),
		"controls_left": OS.find_scancode_from_string("A"),
		"controls_pause": OS.find_scancode_from_string("ESCAPE"),
		"controls_shoot": BUTTON_LEFT,
		"controls_special": BUTTON_RIGHT
	},
	"mobile_button_displacement": {
		"movement_joystick": Vector2(35, 20),
		"shooting_joystick": Vector2(45, 25),
		"special_attack": Vector2(14, 14),
		"pause_button": Vector2(12, 12)
	}
}
var game_settings: Dictionary = default_game_settings

var current_platform: String = "desktop" setget set_current_platform, get_current_platform # TEMP
var current_level: String = "" setget set_current_level, get_current_level
var current_level_time: Array = [] setget set_current_level_time, get_current_level_time
var current_arena_wave: int = 1 setget set_current_wave, get_current_wave
var current_player_state: String = ""
var initial_player_bounty
var level_player_bounty: int = 0
var total_level_player_bounty: int = 0

var last_lowest_level_time: Array = [] setget set_last_lowest_level_time, get_last_lowest_level_time



func _ready(): # For debug values    REMEMBER THAT THE PLATFORM MUST BE SET IN device_manager.gd NOT HERE FELIPE YOU DUMB FUCK
	if !OS.is_debug_build() or OS.get_name() == "Android": return
	
	
func override_game_settings(value): game_settings = value
func override_player_data(value): player_data = value



func set_current_platform(platform_name: String): current_platform = platform_name
func get_current_platform() -> String: return current_platform

func set_current_level(level_name: String): current_level = level_name
func get_current_level() -> String: return current_level

func set_current_level_time(time: Array): current_level_time = time
func get_current_level_time() -> Array: return current_level_time

func set_current_wave(wave_number: int): current_arena_wave = wave_number
func get_current_wave() -> int: return current_arena_wave

func set_player_data(key, value): player_data[key] = value
func get_player_data(key): return player_data[key]

func set_game_setting(group, key, value): game_settings[group][key] = value
func get_game_setting(group, key): return game_settings[group][key]

func set_last_lowest_level_time(value: Array): last_lowest_level_time = value
func get_last_lowest_level_time() -> Array: return last_lowest_level_time

func reset_all_data():
	print("RESETTING DATA")
	player_data = default_player_data
	game_settings = default_game_settings
	global_data_manager.save_all()
