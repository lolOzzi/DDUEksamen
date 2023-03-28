class UIButton{
    PVector location, size;
    String text;
    UIButton(float x, float y, float w, float h, String txt){
        this.location = new PVector(x,y);
        this.size = new PVector(w,h);
        this.text = txt;
    }
    void display(){
        fill(0, 255, 0);
        rect(this.location.x,this.location.y,this.size.x,this.size.y);
        fill(0);
        textSize(20);
        textAlign(CENTER);
        text(this.text,this.location.x+this.size.x/2,this.location.y+this.size.y/2);
        textAlign(BASELINE);
    }
    boolean isClicked(){
        if(mouseX > this.location.x && mouseX < this.location.x+this.size.x && mouseY > this.location.y && mouseY < this.location.y+this.size.y){

        return true;
        }
        return false;
    }
    
    void hover() {

    }
}
