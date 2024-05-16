extends Resource
class_name Drama # Base class for all drama scripts

# References the SceneTree
var tree
# References the root node of the active scene in the SceneTree
var scene

func _ready():
    tree = DramaQueen.get_tree()
    scene = tree.current_scene

func _play():
    pass