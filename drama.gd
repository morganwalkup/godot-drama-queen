extends Resource
class_name Drama # Base class for all drama scripts

# References the SceneTree
var tree
# References the root node of the active scene in the SceneTree
var scene

func _ready():
    tree = null
    scene = null
    var main_loop = Engine.get_main_loop()
    if main_loop is SceneTree:
        tree = main_loop
        scene = main_loop.current_scene

func _play():
    pass