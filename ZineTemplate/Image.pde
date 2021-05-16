public class Image {
  
  private PImage pImage;
  private int imageCornerX;
  private int imageCornerY;
  private int imageWidth;
  private int imageHeight;
  
  public Image(PImage pImage) {
    this.pImage = pImage;
    this.imageCornerX = 0;
    this.imageCornerY = 0;
    this.imageWidth = int(WIDTH);
    this.imageHeight = int(HEIGHT);
  }
  
  // Qverload
  public Image(PImage pImage, int imageCornerX, int imageCornerY, int imageWidth, int imageHeight) {
    this.pImage = pImage;
    this.imageCornerX = imageCornerX;
    this.imageCornerY = imageCornerY;
    this.imageWidth = imageWidth;
    this.imageHeight = imageHeight;
  }
  
  public PImage getPImage() {
    return pImage;
  }
  
  public void draw() {
    imageMode(CORNER);
    image(pImage, imageCornerX, imageCornerY, imageWidth, imageHeight);
  }
  
}
