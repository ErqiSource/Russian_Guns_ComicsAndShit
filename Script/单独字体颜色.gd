extends Label

func _ready():
	# 创建一个新的主题
	var theme = Theme.new()
	
	# 设置字体颜色
	theme.set_color("font_color", "Label", Color(0.929, 0.89, 0.0, 1.0))
	
	# 应用主题
	self.theme = theme
