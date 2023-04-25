//Manages the state of the game, what to display (main menu, settings, game etc.)
class GameState {
  char scene;
  //Constructer sets the default gamestate
  public GameState() {
    scene = '2';
  }

  public void update() {
    switch(scene) {
    case 'M':
      break;
    case '1':
      currLevel.update();
      if (player.hitCount >= 100) {
        Fail();
        currLevel.startGame = false;
      } else {
        println(player.hitCount);
      }
      break;
    case '2':
      mainMenu.display();
      mainMenu.update();
      break;
    }
  }

  void Fail() {
    player.location = new PVector(player.ogLoc.x, player.ogLoc.y);
    println(player.ogLoc);
    println(player.location);
    player.moveUpdate();
    player.display();
    player.hitCount = 0;
  }
}
