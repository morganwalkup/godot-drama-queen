extends Node

# True if DramaQueen is actively playing a drama script. False otherwise
var is_playing = false
# The active drama script played by DramaQueen
var current_drama: Drama
# Signal emitted when a drama script starts playing
signal drama_started
# Signal emitted when a drama script finishes playing
signal drama_finished

func play(drama_script: Drama):
    is_playing = true
    current_drama = drama_script
    drama_started.emit()
    await drama_script._play()
    is_playing = false
    current_drama = null
    drama_finished.emit()