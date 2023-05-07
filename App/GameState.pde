//Manages the state of the game, what to display (main menu, settings, game etc.)
class GameState {
  char scene;
  int levelIndex;
  //Constructer sets the default gamestate
  public GameState() {
    scene = '2';
    levelIndex = 0;
  }
  

  public void update() {
    switch(scene) {
    case 'M':
      break;
    case '1':
      currLevel.update();
      currLevel.hBar.display();
      if (player.hitCount >= 100 || player.died == true) {
        Fail();
        currLevel.startGame = false;
      }
      break;
    case '2':
      levelIndex = 0;
      mainMenu.display();
      mainMenu.update();
      break;
    }
  }

  void Fail() {
    currLevel = currLevel.reset();
  }
}
