class Hint {
    String title;
    String hint;
    PImage formula;
    PVector size;
    PFont Pixel16;
    PFont Pixel32;

    Hint(String title, String hint, PImage formula) {
        this.title = title;
        this.hint = hint;
        this.formula = formula;
        this.size = new PVector(600, 300);
        Pixel32 = createFont("./font/pixel.ttf", 32, false);
        Pixel16 = createFont("./font/pixel.ttf", 16, false);
    }
    
    void display() {

        fill(#ffa862);
        rect(width - size.x, 136 + 8, size.x, size.y);
        fill(#ffe995);
        rect(width - size.x + 8, 136 + 16, size.x -16, size.y -16);

        PVector relPos = new PVector(width - size.x + 8, 136 + 16);
        fill(0);
        textFont(Pixel32);
        textAlign(LEFT, TOP);
        text(title, relPos.x + 8, relPos.y + 16);
        textFont(Pixel16);
        text(hint, relPos.x + 8, relPos.y + 64, size.x - 16, size.y - 200);
   
        text("Formula: ", relPos.x + 8, relPos.y + size.y - 100);
        rectMode(CORNER);
        image(formula, relPos.x + textWidth("Formula: ") + 8, relPos.y + size.y - 100, formula.width/4, formula.height/4);
        rectMode(BASELINE);
        textAlign(BASELINE);



    }

}
