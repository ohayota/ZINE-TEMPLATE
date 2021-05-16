public class DescriptionPage3 extends Page {
  
  private TextType textType;
  private String title;
  private String mainText;
  
  private int mainTextCornerY;
  
  private Image[] images;
  
  private TextBlock[] textBlocks;
  
  public DescriptionPage3(Section section, String path) {
    super(section);
    this.title = txtToString(super.section.getPath() + path + "title.txt");
    this.mainText = txtToString(super.section.getPath() + path + "main.txt");
    // image1.pngからimage3.pngまでのパスを生成
    String[] imagePaths = new String[3];
    for (int i = 0; i < imagePaths.length; i++) {
      imagePaths[i] = super.section.getPath() + path + "image" + (i+1) + ".png";
    }
    this.images = pimagesToImages(imagePaths);
    
    this.mainTextCornerY = marginVertical+titleBottomPadding;
    
    // small1.txtからsmall3.txtまでのパスを生成
    String[] txtPaths = new String[3];
    for (int i = 0; i < txtPaths.length; i++) {
      txtPaths[i] = super.section.getPath() + path + "small" + (i+1) + ".txt";
    }
    this.textBlocks = generateSmallTextBlocks(txtPaths);
  }
  
  public Image[] pimagesToImages(String[] paths) {
    // 画像3つを読み込む
    PImage[] pImages = new PImage[3];
    for (int i = 0; i < pImages.length; i++) pImages[i] = loadImage(paths[i]);
    int imageWidth = int(areaWidth*(1.99/3.0));
    int imageHeight = convertImageHeight(pImages[0], areaWidth*(1.99/3.0));
    int columnX = marginHorizontal+int(areaWidth*(1.01/3.0));
    int lineY1 = marginVertical+titleBottomPadding + 104;
    int lineY2 = marginVertical+titleBottomPadding + 104 + convertImageHeight(pImages[0], areaWidth*(2.11/3.0));
    int lineY3 = marginVertical+titleBottomPadding + 104 + 2*convertImageHeight(pImages[0], areaWidth*(2.11/3.0));
    Image[] images = new Image[pImages.length];
    images[0] = new Image(pImages[0], columnX, lineY1, imageWidth, imageHeight);
    images[1] = new Image(pImages[1], columnX, lineY2, imageWidth, imageHeight);
    images[2] = new Image(pImages[2], columnX, lineY3, imageWidth, imageHeight);
    return images;
  }
  
  public SmallTextBlock[] generateSmallTextBlocks(String[] paths) {
    // 画像3つに対応するテキスト3つを読み込む
    String[] texts = new String[3];
    for (int i = 0; i < texts.length; i++) texts[i] = txtToString(paths[i]);
    PImage pImage = images[0].getPImage();
    int blockWidth = int(areaWidth*(0.99/3.0));
    int blockHeight = convertImageHeight(pImage, areaWidth*(1.99/3.0));
    int columnX = marginHorizontal;
    int lineY1 = marginVertical+titleBottomPadding + 104;
    int lineY2 = marginVertical+titleBottomPadding + 104 + convertImageHeight(pImage, areaWidth*(2.11/3.0));
    int lineY3 = marginVertical+titleBottomPadding + 104 + 2*convertImageHeight(pImage, areaWidth*(2.11/3.0));
    SmallTextBlock[] blocks = new SmallTextBlock[texts.length];
    blocks[0] = new SmallTextBlock(texts[0], columnX, lineY1, blockWidth, blockHeight);
    blocks[1] = new SmallTextBlock(texts[1], columnX, lineY2, blockWidth, blockHeight);
    blocks[2] = new SmallTextBlock(texts[2], columnX, lineY3, blockWidth, blockHeight);
    return blocks;
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
    
    // 説明文の表示
    if (textBlocks != null) {
      for (TextBlock textBlock: textBlocks) {
        textBlock.draw();
      }
    }
  }
}
