import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:mathgame/src/data/models/picture_puzzle.dart';
import 'package:mathgame/src/ui/app/game_provider.dart';
import 'package:mathgame/src/core/app_constant.dart';

class PicturePuzzleProvider extends GameProvider<PicturePuzzle> {
  late String result;

  PicturePuzzleProvider({required TickerProvider vsync})
      : super(vsync: vsync,gameCategoryType: GameCategoryType.PICTURE_PUZZLE) {
    startGame();
  }

  void checkGameResult(String answer) async {
    if (result.length < currentState.answer.toString().length &&
        timerStatus != TimerStatus.pause) {
      result = result + answer;
      notifyListeners();
      if (int.parse(result) == currentState.answer) {
        await Future.delayed(Duration(milliseconds: 300));
        loadNewDataIfRequired();
        if (timerStatus != TimerStatus.pause) {
          restartTimer();
        }
        notifyListeners();
      } else if (result.length == currentState.answer.toString().length) {
        wrongAnswer();
      }
    }
  }

  void backPress() {
    if (result.length > 0) {
      result = result.substring(0, result.length - 1);
      notifyListeners();
    }
  }

  void clearResult() {
    result = "";
    notifyListeners();
  }
}
