class InfoBox {
    String title;
    String mainText;
    String[] stats;
    PVector size;
    PFont Pixel16;
    PFont Pixel32;


    InfoBox(String mainText) {
        this.title = "Info";
        this.mainText = mainText;
        this.stats = mainText.split(";");
        float sizeScale = stats.length;
        this.size = new PVector(400, 100 + sizeScale * 32);
        Pixel32 = createFont("./font/pixel.ttf", 32, false);
        Pixel16 = createFont("./font/pixel.ttf", 16, false);
    }
    
    void display() {

        fill(#ffa862);
        rect(0, 136 + 8, size.x, size.y);
        fill(#ffe995);
        rect(8, 136 + 16, size.x -16, size.y -16);
        PVector relPos = new PVector(16, 136 + 16);
        fill(0);
        textFont(Pixel32);
        textAlign(LEFT, TOP);
        text(title, relPos.x + 8, relPos.y + 16);
        textFont(Pixel16);
        for (int i = 0; i < stats.length; i++) {
            text(stats[i], relPos.x + 8, relPos.y + 64 + i * 32);
        }
   
        textAlign(BASELINE);



    }

}
