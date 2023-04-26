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

  InputBox() {
    location = new PVector(100, 100);
    size = new PVector(150, 150);
    oneChar = true;
    combValue = "";
    type = 0;
    insNum();
  }

  InputBox(PVector location, PVector size, int type) {
    this.location = location;
    this.size = size;
    this.type = type;
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
    fill(100, 100, 100);
    rect(location.x, location.y, size.x, size.y);
    fill(255);
    textSize(20);
    text(combValue, location.x + 10, location.y + size.y/2);
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
