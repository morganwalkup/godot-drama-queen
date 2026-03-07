extends Node

# True if DramaQueen is actively playing a drama script. False otherwise
var is_playing = false
# The active drama script played by DramaQueen
var current_drama: Drama
# Temporary data storage for the current drama
# The drama trigger can store data in the blackboard that will be available to the drama script
# The blackboard is cleared when the drama script finishes playing
var blackboard: Dictionary = {}
# Signal emitted when a drama script starts playing
signal drama_started
# Signal emitted when a drama script finishes playing
signal drama_finished

func play(drama_script: GDScript):
    is_playing = true
    var drama = Drama.new()
    drama.set_script(drama_script)
    current_drama = drama
    drama._ready()
    drama_started.emit()
    await drama._play()
    blackboard.clear()
    is_playing = false
    current_drama = null
    drama_finished.emit()