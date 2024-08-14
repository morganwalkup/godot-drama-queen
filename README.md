# Drama Queen 🎭👸

A Godot plugin for writing scripted events, aka "dramas" or "cutscenes" in your game.

Those non-interactive moments where the player loses control until the characters and objects in the world have done some *thing*.

Most people author this sort of thing inside the AnimationPlayer, but DramaQueen does everything through code to give you maximum control.

Exposes a `DramaQueen` autoloaded singleton for playing `*.drama.gd` files known as `Drama` scripts.


### How to Use

First, create a script for your drama:
```py
extends Drama

func _play():
    # Your drama script goes here
```

Then, use `DramaQueen` to play the drama script at the appropriate time:
```py
const drama_script = load("res://path_to_drama/something.drama.gd")

func _ready():
    DramaQueen.play(drama_script)    
```

### How do I stop the rest of my game from interrupting the drama??

`DramaQueen` is intentionally unopinionated about the rest of your game. It won't pause the game or adjust the engine timescale while playing a `Drama`.

Your `Drama` script should be responsible for setting up any nodes involved in the `Drama`. Most likely, the first few lines of your `_play()` function will focus on setting up these nodes.

If you are using Morgan Walkup's `UtilityAI` plugin, we recommend creating a general-purpose `Drama` task that pauses the decision timer while a `Drama` is playing. All `UtilityTaskManagers` in the scene should be interrupted with the `Drama` task when the `Drama` script starts playing.


### DramaQueen Singleton

The `DramaQueen` singleton plays one `Drama` at a time end emits signals before and after playing the `Drama`.

#### DramaQueen Singleton Properties

- is_playing - boolean - True if DramaQueen is actively playing a drama script. False otherwise
- current_drama - Drama - The active drama script played by DramaQueen

#### DramaQueen Singleton Signals

- drama_started - Signal emitted when a drama script starts playing
- drama_finished - Signal emitted when a drama script finishes playing

#### DramaQueen Singleton Methods

- play(drama: Drama) - Plays the given drama script. Can be awaited.


### Drama Class

A base class for all `Drama` scripts. Provides a few useful properties.

### Drama Class Properties

- tree - SceneTree - The active SceneTree of the game. Useful for creating one-off timers and tweens.
- scene - Node - The root node of the active Scene in the SceneTree

### Drama Class Methods

- _init() - Optional setup method to be implemented by your drama scripts.
- _play() - Virtual method to be implemented by your drama scripts. Called only by the DramaQueen singleton.


