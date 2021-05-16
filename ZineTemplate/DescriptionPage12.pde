public class DescriptionPage12 extends Page {
  
  private TextType textType;
  private String title;
  
  private Image[] images;
  
  private SmallTextBlock smallTextBlock;
  
  public DescriptionPage12(Section section, String path) {
    super(section);
    this.title = txtToString(super.section.getPath() + path + "title.txt");
    // image1.pngからimage12.pngまでのパスを生成
    String[] imagePaths = new String[12];
    for (int i = 0; i < imagePaths.length; i++) {
      imagePaths[i] = super.section.getPath() + path + "image" + (i+1) + ".png";
    }
    this.images = pimagesToImages(imagePaths);
    this.smallTextBlock = generateSmallTextBlock(super.section.getPath() + path + "small.txt");
  }
  
  public Image[] pimagesToImages(String[] paths) {
    // 画像12個を読み込む
    PImage[] pImages = new PImage[12];
    for (int i = 0; i < pImages.length; i++) pImages[i] = loadImage(paths[i]);
    int imageSize = int(areaWidth*(0.98/3.0));
    int columnX1 = marginHorizontal;
    int columnX2 = marginHorizontal+int(areaWidth*(1.015/3.0));
    int columnX3 = marginHorizontal+int(areaWidth*(2.02/3.0));
    int lineY1 = marginVertical+titleBottomPadding;
    int lineY2 = marginVertical+titleBottomPadding+int(areaWidth*(1.015/3.0));
    int lineY3 = marginVertical+titleBottomPadding+int(areaWidth*(2.03/3.0));
    int lineY4 = marginVertical+titleBottomPadding+int(areaWidth*(3.045/3.0));
    Image[] images = new Image[12];
    images[0] = new Image(pImages[0], columnX1, lineY1, imageSize, imageSize);
    images[1] = new Image(pImages[1], columnX2, lineY1, imageSize, imageSize);
    images[2] = new Image(pImages[2], columnX3, lineY1, imageSize, imageSize);
    images[3] = new Image(pImages[3], columnX1, lineY2, imageSize, imageSize);
    images[4] = new Image(pImages[4], columnX2, lineY2, imageSize, imageSize);
    images[5] = new Image(pImages[5], columnX3, lineY2, imageSize, imageSize);
    images[6] = new Image(pImages[6], columnX1, lineY3, imageSize, imageSize);
    images[7] = new Image(pImages[7], columnX2, lineY3, imageSize, imageSize);
    images[8] = new Image(pImages[8], columnX3, lineY3, imageSize, imageSize);
    images[9] = new Image(pImages[9], columnX1, lineY4, imageSize, imageSize);
    images[10] = new Image(pImages[10], columnX2, lineY4, imageSize, imageSize);
    images[11] = new Image(pImages[11], columnX3, lineY4, imageSize, imageSize);
    return images;
  }
  
  public SmallTextBlock generateSmallTextBlock(String path) {
    int blockCornerX = marginHorizontal;
    int blockCornerY = int(HEIGHT-marginVertical-24);
    int blockWidth = areaWidth;
    int blockHeight = 32;
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
    
    // ページ下部の説明文1行表示
    if (smallTextBlock != null) {
        smallTextBlock.draw();
    }
  }
  
}
