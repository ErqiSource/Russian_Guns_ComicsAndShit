extends Button

# 场景文件路径
@export var next_scene_path: String = "res://场景/按钮.tscn"

func _ready():
	# 由于脚本挂载在Button节点上，直接连接自身的pressed信号
	pressed.connect(_on_button_pressed)

func _on_button_pressed():
	# 加载并切换场景
	var next_scene = load(next_scene_path)
	if next_scene:
		get_tree().change_scene_to_packed(next_scene)
	else:
		print("场景加载失败：", next_scene_path)
