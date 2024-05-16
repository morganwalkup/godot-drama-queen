extends Drama
# Example drama script for the Drama Queen plugin. Demonstrates the basic structure for a drama script.

# Preload any assets here
# const player_portrait = preload("res://path_to_player_portrait/portrait.png")

func _init():
    # Assert proper setup here
    # assert(player_portrait !== null, "Player portrait must be preloaded")
    pass

func _play():
    var player = scene.get_node("YSort/Player")
    var enemy = scene.get_node("YSort/Enemy")

    player.get_node("AnimatedSprite").play("Idle")
    enemy.get_node("AnimatedSprite").play("Idle")
    await(tree.create_timer(3.0).timeout)

    enemy.get_node("AnimatedSprite").play("Roar")
    await(enemy.get_node("AnimatedSprite").animation_finished)

    enemy.get_node("AnimatedSprite").play("Idle")