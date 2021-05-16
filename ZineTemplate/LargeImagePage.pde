public class LargeImagePage extends Page {
  
  private Image largeImage;
  
  public LargeImagePage(Section section, String path) {
    super(section);
    this.largeImage = generateLargeImage(super.section.getPath() + path + "image.png");
  }
  
  public Image generateLargeImage(String path) {
    PImage pImage = loadImage(path);
    float ratio = pImage.width/float(pImage.height);
    int imageCornerX = int(WIDTH/2-int(areaHeight*ratio)/2);
    int imageCornerY = int(HEIGHT/2-areaHeight/2);
    int imageWidth = int(areaHeight*ratio);
    int imageHeight = areaHeight;
    return new Image(pImage, imageCornerX, imageCornerY, imageWidth, imageHeight);
  }
  
  public void draw() {
    super.draw();
    
    largeImage.draw();
  }
  
}
