extends Control

# 场景配置
const NEXT_SCENE_PATH = "res://场景/按钮.tscn"

# 节点引用
@onready var button_container = $GridContainer

# 初始化
func _ready():
	# 设置随机种子
	randomize()
	
	# 检查必要节点
	if not button_container:
		printerr("错误：GridContainer 节点未找到！请检查场景结构")
		return
	
	# 执行初始化操作
	shuffle_buttons()
	connect_all_buttons()
	print("场景初始化完成，所有按钮已连接")

# 随机打乱按钮顺序
func shuffle_buttons():
	var buttons = button_container.get_children()
	
	if buttons.size() == 0:
		print("警告：GridContainer 中没有按钮子节点")
		return
	
	# 打乱按钮顺序
	buttons.shuffle()
	
	# 重新排列按钮
	for i in range(buttons.size()):
		button_container.move_child(buttons[i], i)
	
	print("按钮已随机排序，共 ", buttons.size(), " 个按钮")

# 连接所有按钮的点击信号
func connect_all_buttons():
	var buttons = button_container.get_children()
	
	for button in buttons:
		if button is Button:
			# 连接新信号，传递按钮自身作为参数
			button.pressed.connect(_on_button_pressed.bind(button))
			print("已连接按钮：", button.name)
		else:
			print("警告：", button.name, " 不是 Button 类型，跳过连接")

# 按钮点击事件处理
func _on_button_pressed(button: Button):
	# 直接通过参数获取被点击的按钮
	if button:
		print("按钮被点击：", button.name)
	else:
		print("警告：无法确定被点击的按钮")
	
	# 加载下一个场景
	print("正在加载场景：", NEXT_SCENE_PATH)
	
	var next_scene = load(NEXT_SCENE_PATH)
	
	if not next_scene:
		printerr("错误：场景加载失败！路径：", NEXT_SCENE_PATH)
		return
	
	# 切换场景
	get_tree().change_scene_to_packed(next_scene)
	print("场景切换成功：", NEXT_SCENE_PATH)
