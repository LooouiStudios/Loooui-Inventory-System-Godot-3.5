extends Resource
class_name Item

export (String) var name
export (Texture) var icon
export (bool) var stackable

export (String, "none", "legs", "torso", "head") var type = "none"
