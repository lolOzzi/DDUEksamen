import java.awt.Font;
import de.bezier.data.sql.*;
import de.bezier.data.sql.mapper.*;


public class Login {
  ArrayList<PImage> images;
  ArrayList<PVector> size;
  ArrayList<PVector> pos;
  InputBox username;
  InputBox password;
  String inputPassword = "test";
  String inputUsername = "test2";
  int Scaler = 15;

  public Login() {
    images = helper.loadImages("sprites/login/");
    size = new ArrayList<>();
    pos = new ArrayList<>();

    size.add(new PVector(92 * Scaler, 42 * Scaler));
    size.add(new PVector(32 * Scaler, 12 * Scaler));
    size.add(new PVector(38 * Scaler, 12 * Scaler));

    pos.add(new PVector(300, 200));
    pos.add(new PVector(pos.get(0).x + 100, pos.get(0).y + size.get(0).y - size.get(1).y - 100));
    pos.add(new PVector(pos.get(0).x + size.get(0).x - size.get(2).x - 100, pos.get(0).y + size.get(0).y - size.get(1).y - 100));

    PFont inputFont = createFont("./font/pixel.ttf", 32, false);

    username = new InputBox(new PVector(pos.get(0).x + (46*Scaler), pos.get(0).y + (5*Scaler)), new PVector(40*Scaler, 5*Scaler), 0, "Type Username...", "",true, inputFont);
    password = new InputBox(new PVector(pos.get(0).x + (46*Scaler), pos.get(0).y + (15*Scaler)), new PVector(40*Scaler, 5*Scaler), 0, "Type Password...", "", true, inputFont);
  }

  public void display() {
    image(backgroundImgs.get(0), 0, 0);
    for (int i = 0; i < images.size(); i++) {
      image(images.get(i), pos.get(i).x, pos.get(i).y, size.get(i).x, size.get(i).y); // draw Images
      if (helper.OverRect(pos.get(i).x, pos.get(i).y, size.get(i).x, size.get(i).y) && (mouseButton == LEFT) && (mousePressed == true))  {

        tempMouseReleased = false;
        inputUsername = username.combValue;
        inputPassword = password.combValue;
        
        if (i == 1 ) {
          signIn();
        }

        if (i == 2) {
          createAccount();
        }
      }
    }
    username.display();
    password.display();
    username.update();
    password.update();
  }

  public void createAccount() {
    if ( db.connect() ) {


      db.query( String.format("INSERT INTO Player (username, password) VALUES ('%s', '%2s')", inputUsername, inputPassword) );
      db.query( String.format("SELECT * FROM Player WHERE (password == '%s' AND username == '%2s')", inputPassword, inputUsername));

      while (db.next())
        playerID = db.getInt("playerID");
        gameState.scene = '2';
    }
  }



  public void signIn() {
    if ( db.connect() ) {
      db.query( String.format("SELECT * FROM Player WHERE (password == '%s' AND username == '%2s')", inputPassword, inputUsername));
      //db.query( "SELECT * FROM Player WHERE (password == 'test2' AND username == 'test')");

      while (db.next()) {
        playerID = db.getInt("playerID");
        gameState.levelIndex = db.getInt("levelIndex");
        gameState.maxLevelIndex = db.getInt("levelIndex");
        gameState.scene = '2';
        currLevel = currLevel.getCurrentLevel();
      }
    }
  }
  public void setLevelIndex() {
    if ( db.connect() ) {
      db.query( String.format("UPDATE Player SET levelIndex = %s WHERE playerID == %2s", gameState.levelIndex, playerID));

    }
  } 
}
