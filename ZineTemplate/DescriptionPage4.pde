public class DescriptionPage4 extends Page {
  
  private TextType textType;
  private String title;
  
  private Image[] images;
  
  private SmallTextBlock smallTextBlock;
  
  public DescriptionPage4(Section section, String path) {
    super(section);
    this.title = txtToString(super.section.getPath() + path + "title.txt");
    // image1.pngからimage4.pngまでのパスを生成
    String[] imagePaths = new String[4];
    for (int i = 0; i < imagePaths.length; i++) {
      imagePaths[i] = super.section.getPath() + path + "image" + (i+1) + ".png";
    }
    this.images = pimagesToImages(imagePaths);
    this.smallTextBlock = generateSmallTextBlock(super.section.getPath() + path + "small.txt");
  }
  
  public Image[] pimagesToImages(String[] paths) {
    // 画像4つを読み込む
    PImage[] pImages = new PImage[4];
    for (int i = 0; i < pImages.length; i++) pImages[i] = loadImage(paths[i]);
    int imageSize = int(areaWidth*(0.985/2.0));
    int columnX1 = marginHorizontal;
    int columnX2 = marginHorizontal+int(areaWidth*(1.015/2.0));
    int lineY1 = marginVertical+titleBottomPadding;
    int lineY2 = marginVertical+titleBottomPadding+int(areaWidth*(1.015/2.0));
    Image[] images = new Image[pImages.length];
    images[0] = new Image(pImages[0], columnX1, lineY1, imageSize, imageSize);
    images[1] = new Image(pImages[1], columnX2, lineY1, imageSize, imageSize);
    images[2] = new Image(pImages[2], columnX1, lineY2, imageSize, imageSize);
    images[3] = new Image(pImages[3], columnX2, lineY2, imageSize, imageSize);
    return images;
  }
  
  public SmallTextBlock generateSmallTextBlock(String path) {
    int blockCornerX = marginHorizontal;
    int blockCornerY = marginVertical+titleBottomPadding + areaWidth + 8;
    int blockWidth = areaWidth;
    int blockHeight = int(areaWidth*(1.99/3.0));
    return new SmallTextBlock(txtToString(path), blockCornerX, blockCornerY, blockWidth, blockHeight);
  }
  
  public void draw() {
    super.draw();
    
    // タイトル部分の表示
    textType = TextType.title;
    textAlign(LEFT, TOP);
    textFont(createFont(textType.getFontName(), textType.getFontSize()));
    fill(0);
    text(title, marginHorizontal, marginVertical);
    
    for (Image image: images) {
      image.draw();
    }
    
    // ページ下部の説明文表示
    if (smallTextBlock != null) {
        smallTextBlock.draw();
    }
  }
  
}
