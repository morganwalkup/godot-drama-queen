extends Resource
class_name Drama # Base class for all drama scripts

# References the SceneTree
var tree
# References the root node of the active scene in the SceneTree
var scene

func _ready():
    tree = null
    scene = null
    print("Drama ready called")
    if is_instance_valid(DramaQueen):
        tree = DramaQueen.get_tree()
        scene = tree.current_scene
        print("Drama tree and scene found")
    else:
        print("Drama tree and scene not found")

func _play():
    pass