extends Node


@export var parallax_2d: Parallax2D
@export var player: CharacterBody2D
@export var player_pos: Marker2D
@export var depth_portal: Area2D
@export var bg_layer: TileMapLayer


func _on_depth_portal_body_entered(_body: Node2D) -> void:
	bg_layer.collision_enabled = true
	player.reparent.call_deferred(parallax_2d)
	player.global_position = player_pos.global_position
	player.global_scale = Vector2(0.5, 0.5)
	await get_tree().process_frame
	depth_portal.monitoring = false
