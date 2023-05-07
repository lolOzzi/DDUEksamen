class Hint {
    String title;
    String hint;
    PImage formula;
    PVector size;

    Hint(String title, String hint, PImage formula) {
        this.title = title;
        this.hint = hint;
        this.formula = formula;
        this.size = new PVector(600, 400);
    }
    
    void display() {

        PFont Pixel32 = createFont("./font/pixel.ttf", 32, false);
        PFont Pixel16 = createFont("./font/pixel.ttf", 16, false);

        fill(#ffa862);
        rect(width - size.x, 136 + 8, size.x, size.y);
        fill(#ffe995);
        rect(width - size.x + 8, 136 + 16, size.x -16, size.y -16);

        pushMatrix();
        translate(width - size.x + 8, 136 + 16);
        fill(0);
        textFont(Pixel32);
        textMode(CORNER);
        text(title, 8, 32);
        textFont(Pixel16);
        text(hint, 8, 64);
        textMode(BASELINE);
        image(formula, 8, 128, formula.width/4, formula.height/4);
        popMatrix();


    }

}
