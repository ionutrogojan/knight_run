extends Resource
class_name game_manager

export(int) var GAME_SPEED = 2000
export(int) var ROUND_SCORE = 0
export(int) var BEST_SCORE = 0

enum OBST_SPACE { SQAURE_1 = 108, SQUARE_2 = 324, SQUARE_3 = 540 }
export(OBST_SPACE) var obstacle_space = OBST_SPACE.SQAURE_1
