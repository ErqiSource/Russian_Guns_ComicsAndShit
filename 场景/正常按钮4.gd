extends Button

@export var url: String = "https://jmcomic-zzz.one/album/1238373/%E4%BB%8E%E6%88%91%E8%87%B4%E4%BD%A0-24k%E5%90%8C%E4%BA%BA%E6%B1%89%E5%8C%96-%E4%BE%8B%E5%A4%A7%E7%A5%AD16-drink-it-%E3%82%AA%E3%83%BC%E3%83%89-%E7%A7%81%E3%81%8B%E3%82%89%E3%81%82%E3%81%AA%E3%81%9F%E3%81%B8-%E6%9D%B1%E6%96%B9project"

func _ready():
	pressed.connect(_on_pressed)

func _on_pressed():
	# 打开网页
	OS.shell_open(url)
