public class LargeImagePage2 extends Page {
  
  private Image[] largeImages;
  
  public LargeImagePage2(Section section, String path) {
    super(section);
    // image1.pngとimage2.pngのパスを生成
    String[] imagePaths = new String[2];
    for (int i = 0; i < imagePaths.length; i++) {
      imagePaths[i] = super.section.getPath() + path + "image" + (i+1) + ".png";
    }
    this.largeImages = pimagesToImages(imagePaths);
  }
  
  public Image[] pimagesToImages(String[] paths) {
    // 画像2つを読み込む
    PImage[] pImages = new PImage[2];
    for (int i = 0; i < pImages.length; i++) pImages[i] = loadImage(paths[i]);
    int imageSize = int(areaHeight/2*0.99);
    int columnX = int(WIDTH/2-int(areaHeight/2*0.99)/2);
    int lineY1 = int(HEIGHT/2-areaHeight/2);
    int lineY2 = int(HEIGHT/2+areaHeight/2-int(areaHeight/2*0.99));
    Image[] images = new Image[2];
    images[0] = new Image(pImages[0], columnX, lineY1, imageSize, imageSize);
    images[1] = new Image(pImages[1], columnX, lineY2, imageSize, imageSize);
    return images;
  }
  
  public void draw() {
    super.draw();
    
    for (Image image: largeImages) {
      image.draw();
    }
  }
  
}
