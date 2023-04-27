import java.util.ArrayList;

class InputBox {
  PVector location, size;
  ArrayList<Character> value = new ArrayList<Character>();
  boolean canType, oneChar, hasBack;

  // type = 0 er for strings, type = 1 er for tal og type = 2 er for passwords
  String combValue;
  int type;
  float intValue;
  ArrayList<Integer> num = new ArrayList<Integer>();

  PFont inputFont = createFont("./font/pixel.ttf", 16, false);
  String defaultString = "Type here";

  InputBox() {
    location = new PVector(100, 100);
    size = new PVector(150, 150);
    oneChar = true;
    combValue = "";
    type = 0;
    insNum();

  }

  InputBox(PVector location, PVector size, int type) {
    this(location, size, type, "Type here");
  }
    InputBox(PVector location, PVector size, int type, String defaultString) {
    this.location = location;
    this.size = size;
    this.type = type;
    this.defaultString = defaultString;
    oneChar = true;
    combValue = "";
    insNum();
  }

  void insNum() {
    for (int i = 0; i < 11; i++) {
      num.add(i);
    }
  }

  void display() {
    fill(0);
    rect(location.x - 3, location.y - 3, size.x + 6, size.y + 6);
    fill(255);
    rect(location.x, location.y, size.x, size.y);
    fill(0);
    textFont(inputFont);
    textAlign(LEFT, CENTER);
    if (combValue.length() > 0) {
      text(combValue, location.x + 10, location.y + size.y/2);
    } else {
      text(defaultString, location.x + 10, location.y + size.y/2);
    }
    textAlign(BASELINE, BASELINE);
    
  }

  void update() {
    writing();
  }

  boolean mouseInBox() {
    if (mouseX >= location.x && mouseX <= location.x + size.x) {
      if (mouseY >= location.y && mouseY <= location.y + size.y) {
        return true;
      }
    }
    return false;
  }

  void writing() {
    
    if (keyPressed == false) {
      oneChar = true;
    }

    if (mouseInBox() && mousePressed) {
      canType = true;
      println("I AM HERE");
    } else if (mouseInBox() == false && mousePressed) {
      canType = false;
     
    }

    if (canType) {
      if (keyPressed == true && oneChar) {
        if (key == BACKSPACE && value.size() > 0) {
          oneChar = false;
          value.remove(value.size() - 1);
          combValue = getValueString(value);
        }

        if (key != BACKSPACE) {
          value.add(key);
          oneChar = false;
          combValue = getValueString(value);
          try {
            if ((key == '.' && value.contains('.') == false) || key != '.') {
              if (type == 1 && num.contains(Integer.parseInt(String.valueOf(key)))) {
                for (int i = 0; i < combValue.length(); i++) {
                }
                intValue = Float.parseFloat(combValue);
              }
            }
          }
          catch(Exception e) {
            value.remove(value.size() - 1);
            combValue = getValueString(value);
          }
        }
      }
    }
  }

  String getValueString(ArrayList<Character> values)
  {
    StringBuilder builder = new StringBuilder(values.size());
    for (Character ch : values)
    {
      builder.append(ch);
    }
    return builder.toString();
  }
}
