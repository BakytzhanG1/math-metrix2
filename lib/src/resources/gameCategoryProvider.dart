import 'package:mathgame/src/models/gameCategory.dart';

class GameCategoryProvider {
  static List<GameCategory> getGameCategoryList() {
    List<GameCategory> list = List();
    list.add(GameCategory(1, "Calculator"));
    list.add(GameCategory(2, "What's the sign?"));
    list.add(GameCategory(3, "Square root"));
    list.add(GameCategory(4, "Mathematical pairs"));
    list.add(GameCategory(5, "Correct answer"));
    list.add(GameCategory(6, "Magic triangle"));
    list.add(GameCategory(7, "Mentak arithmetic"));
    return list;
  }
}