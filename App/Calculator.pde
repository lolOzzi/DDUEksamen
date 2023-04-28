class Calculator {

  ArrayList<Float> numbers = new ArrayList<Float>();
  ArrayList<Character> currNumbers = new ArrayList<Character>();
  ArrayList<Character> ops = new ArrayList<Character>();
  ArrayList<Character> num = new ArrayList<Character>();
  char[] operations = {'+', '-', '*', '/', '^'};
  char[] nums = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9'};
  boolean oneChar;
  char cOp;
  float result;

  boolean isActive = true;
  float prevNum;

  Calculator() {
    for (char c : operations) {
      ops.add(c);
    }
    for (char c : nums) {
      num.add(c);
    }
    print(ops);
    print(num);
    prevNum = 2;
    //currNumbers.add('2');
  }


  void update() {
    if (isActive) {
      writing();
    }
  }

  void writing() {
    if (!keyPressed) {
      oneChar = true;
    }
    if (keyPressed && oneChar) {
      if (num.contains(key)) {
        currNumbers.add(key);
        print(currNumbers);
        oneChar = false;
      }
      if (ops.contains(key) && currNumbers.size() > 0) {
        prevNum = Float.parseFloat(getValueString(currNumbers));
        cOp = key;
        currNumbers.clear();
        println(prevNum);
      }

      if (key == ENTER) {
        println("COP IS: " + cOp);
        switch(cOp) {
        case '+':
          addition();
          break;
        case '-':
          subtraction();
          break;
        case '*':
          multiplication();
          break;
        case '/':
          division();
          break;
        case '^':
          exponentiation();
          break;
        default:
          break;
        }
        cOp = ' ';
        print(result);
      }
    }
  }


  void addition() {
    result = prevNum + Float.parseFloat(getValueString(currNumbers));
  }
  void subtraction() {
    result = prevNum - Float.parseFloat(getValueString(currNumbers));
  }
  void multiplication() {
    result = prevNum * Float.parseFloat(getValueString(currNumbers));
  }
  void division() {
    result = prevNum / Float.parseFloat(getValueString(currNumbers));
  }
  void exponentiation() {
    result = pow(prevNum, Float.parseFloat(getValueString(currNumbers)));
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
