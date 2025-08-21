extends CanvasLayer

func update_score(score):
	$Score.text = str(score)


func show_message(text):
	$Message.text = text
	$Message.show()
	
func show_game_over():
	show_message("Game Over")
	
