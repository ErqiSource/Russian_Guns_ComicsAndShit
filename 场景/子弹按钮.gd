extends Button

@export var url: String = "https://jmcomic-zzz.one/album/346538/chi-gay-sex-with-otc-sock-in-suit"

func _ready():
	pressed.connect(_on_pressed)

func _on_pressed():
	# 打开网页
	OS.shell_open(url)
