class ClearRect {
  
  private int cornerX;
  private int cornerY;
  private int rectWidth;
  private int rectHeight;
  private color rectColor;
  
  public ClearRect(int cornerX, int cornerY, int rectWidth, int rectHeight, color rectColor) {
    this.cornerX = cornerX;
    this.cornerY = cornerY;
    this.rectWidth = rectWidth;
    this.rectHeight = rectHeight;
    this.rectColor = rectColor;
  }
  
  void draw() {
    fill(rectColor);
    rectMode(CORNER);
    noStroke();
    rect(cornerX, cornerY, rectWidth, rectHeight);
  }
  
}
