//Manages the state of the game, what to display (main menu, settings, game etc.)
class GameState {
  char scene;
  //Constructer sets the default gamestate
  public GameState() {
    scene = '1';
  }

  public void update() {
    switch(scene) {
    case 'M':
      break;
    case '1':
      currLevel.update();
      break;
    }
  }
}
