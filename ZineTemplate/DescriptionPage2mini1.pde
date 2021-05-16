public class DescriptionPage2mini1 extends Page {
  
  private TextType textType;
  private String title;
  private String mainText;
  
  private int mainTextCornerY;
  
  private Image[] images;
  
  private SmallTextBlock smallTextBlock;
  
  public DescriptionPage2mini1(Section section, String path) {
    super(section);
    this.title = txtToString(super.section.getPath() + path + "title.txt");
    this.mainText = txtToString(super.section.getPath() + path + "main.txt");
    // image1.pngとimage2.pngのパスを生成
    String[] imagePaths = new String[2];
    for (int i = 0; i < imagePaths.length; i++) {
      imagePaths[i] = super.section.getPath() + path + "image" + (i+1) + ".png";
    }
    this.images = pimagesToImages(imagePaths);
    
    this.mainTextCornerY = marginVertical + titleBottomPadding + convertImageHeight(images[0].getPImage(), areaWidth) + mainTopPadding;
    
    this.smallTextBlock = generateSmallTextBlock(super.section.getPath() + path + "small.txt");
  }
  
  public Image[] pimagesToImages(String[] paths) {
    // 画像2つを読み込む
    PImage[] pImages = new PImage[2];
    for (int i = 0; i < pImages.length; i++) pImages[i] = loadImage(paths[i]);
    int imageWidth1 = areaWidth;
    int imageWidth2 = int(areaWidth*(1.99/3.0));
    int imageHeight1 = convertImageHeight(pImages[0], areaWidth);
    int imageHeight2 = convertImageHeight(pImages[1], areaWidth*(1.99/3.0));
    int columnX1 = marginHorizontal;
    int columnX2 = marginHorizontal;
    int lineY1 = marginVertical + titleBottomPadding;
    int lineY2 = int(HEIGHT-marginVertical-int(pImages[1].height*(areaWidth*(1.99/3.0)/float(pImages[1].width))));
    Image[] images = new Image[2];
    images[0] = new Image(pImages[0], columnX1, lineY1, imageWidth1, imageHeight1);
    images[1] = new Image(pImages[1], columnX2, lineY2, imageWidth2, imageHeight2);
    return images;
  }
  
  public SmallTextBlock generateSmallTextBlock(String path) {
    String text = txtToString(path);
    int blockWidth = int(areaWidth*(0.99/3.0));
    int blockHeight = convertImageHeight(images[1].getPImage(), areaWidth*(1.99/3.0));
    int blockCornerX = int(WIDTH-marginHorizontal-int(areaWidth*(0.99/3.0)));
    int blockCornerY = int(HEIGHT-marginVertical-convertImageHeight(images[1].getPImage(), areaWidth*(1.99/3.0)));
    return new SmallTextBlock(text, blockCornerX, blockCornerY, blockWidth, blockHeight);
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
    
    smallTextBlock.draw();
  }
  
}
