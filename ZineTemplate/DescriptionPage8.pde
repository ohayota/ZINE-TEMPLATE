public class DescriptionPage8 extends Page {
  
  private TextType textType;
  private String title;
  private String mainText;
  
  private int mainTextCornerY;
  
  private Image[] images;
  
  private SmallTextBlock smallTextBlock;
  
  public DescriptionPage8(Section section, String path) {
    super(section);
    this.title = txtToString(super.section.getPath() + path + "title.txt");
    this.mainText = txtToString(super.section.getPath() + path + "main.txt");
    // image1.pngからimage8.pngまでのパスを生成
    String[] imagePaths = new String[8];
    for (int i = 0; i < imagePaths.length; i++) {
      imagePaths[i] = super.section.getPath() + path + "image" + (i+1) + ".png";
    }
    this.images = pimagesToImages(imagePaths);
    
    this.mainTextCornerY = marginVertical+titleBottomPadding;
    
    this.smallTextBlock = generateSmallTextBlock(super.section.getPath() + path + "small.txt");
  }
  
  public Image[] pimagesToImages(String[] paths) {
    // 画像8つを読み込む
    PImage[] pImages = new PImage[8];
    for (int i = 0; i < pImages.length; i++) pImages[i] = loadImage(paths[i]);
    int imageWidth = int(areaWidth*(0.985/2.0));
    int imageHeight = convertImageHeight(pImages[0], areaWidth*(0.985/2.0));
    int columnX1 = marginHorizontal;
    int columnX2 = marginHorizontal + int(areaWidth*(1.015/2.0));
    int lineY1 = marginVertical + titleBottomPadding + 136;
    int lineY2 = marginVertical+titleBottomPadding+136 + 4+convertImageHeight(pImages[0], areaWidth*(1.015/2.0));
    int lineY3 = marginVertical+titleBottomPadding+136 + 2*(4+convertImageHeight(pImages[0], areaWidth*(1.015/2.0)));
    int lineY4 = marginVertical+titleBottomPadding+136 + 3*(4+convertImageHeight(pImages[0], areaWidth*(1.015/2.0)));
    Image[] images = new Image[pImages.length];
    images[0] = new Image(pImages[0], columnX1, lineY1, imageWidth, imageHeight);
    images[1] = new Image(pImages[1], columnX2, lineY1, imageWidth, imageHeight);
    images[2] = new Image(pImages[2], columnX1, lineY2, imageWidth, imageHeight);
    images[3] = new Image(pImages[3], columnX2, lineY2, imageWidth, imageHeight);
    images[4] = new Image(pImages[4], columnX1, lineY3, imageWidth, imageHeight);
    images[5] = new Image(pImages[5], columnX2, lineY3, imageWidth, imageHeight);
    images[6] = new Image(pImages[6], columnX1, lineY4, imageWidth, imageHeight);
    images[7] = new Image(pImages[7], columnX2, lineY4, imageWidth, imageHeight);
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
    
    // 本文の表示
    textType = TextType.main;
    textAlign(LEFT, TOP);
    textFont(createFont(textType.getFontName(), textType.getFontSize()));
    fill(0);
    // 自動改行（日本語の場合は改行位置に半角スペースが必要）
    text(mainText, marginHorizontal, mainTextCornerY, areaWidth, areaHeight);
    
    // ページ下部の説明文1行表示
    if (smallTextBlock != null) {
        smallTextBlock.draw();
    }
  }
}
