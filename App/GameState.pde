//Manages the state of the game, what to display (main menu, settings, game etc.)
class GameState {
  char scene;
  int levelIndex;
  int maxLevelIndex;
  //Constructer sets the default gamestate
  public GameState() {
    scene = '3';
    levelIndex = maxLevelIndex;
  }
  

  public void update() {
    switch(scene) {
    case 'M':
      break;
    case '1':
      currLevel.update();
      currLevel.hBar.display();
      if (currLevel.hintEnabled) {
         currLevel.hint.display();
      }
      currLevel.infoBox.display();
      if (player.hitCount >= 100 || player.died == true) {
        Fail();
        currLevel.startGame = false;
      }
      break;
    case '2':
      mainMenu.display();
      mainMenu.update();
      break;
    case '3':
      login.display();
      break;
    case '4':
      levelSelector.display();
      levelSelector.update();
      break;
    } 

  }

  void Fail() {
    currLevel = currLevel.reset();
  }
}
