extends Area2D
class_name PickupArea


signal drop_collected(drop_data)


func _ready() -> void:
	area_entered.connect(on_drop_collided)


func collect_drop(drop_data: DropData = null) -> void:
	drop_collected.emit(drop_data)


func on_drop_collided(drop: Drop) -> void:
	collect_drop(drop.get_data())
	stop_monitoring()
	drop.queue_free()
	
	
func start_monitoring() -> void:
	set_deferred("monitoring", true)
	
	
func stop_monitoring() -> void:
	set_deferred("monitoring", false)
