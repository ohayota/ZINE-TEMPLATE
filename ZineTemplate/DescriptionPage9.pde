public class DescriptionPage9 extends Page {
  
  private TextType textType;
  private String title;
  
  private int mainTextCornerY;
  
  private Image[] images;
  
  private TextBlock[] textBlocks;
  
  public DescriptionPage9(Section section, String path) {
    super(section);
    this.title = txtToString(super.section.getPath() + path + "title.txt");
    // image1.pngからimage9.pngまでのパスを生成
    String[] imagePaths = new String[9];
    for (int i = 0; i < imagePaths.length; i++) {
      imagePaths[i] = super.section.getPath() + path + "image" + (i+1) + ".png";
    }
    this.images = pimagesToImages(imagePaths);
    
    this.mainTextCornerY = marginVertical+titleBottomPadding;
    
    // small1.txtからsmall9.txtまでのパスを生成
    String[] txtPaths = new String[9];
    for (int i = 0; i < txtPaths.length; i++) {
      txtPaths[i] = super.section.getPath() + path + "small" + (i+1) + ".txt";
    }
    this.textBlocks = generateSmallTextBlocks(txtPaths);
  }
  
  public Image[] pimagesToImages(String[] paths) {
    // 画像9つを読み込む
    PImage[] pImages = new PImage[9];
    for (int i = 0; i < pImages.length; i++) pImages[i] = loadImage(paths[i]);
    int imageSize = int(areaWidth*(0.98/3.0));
    int columnX1 = marginHorizontal;
    int columnX2 = marginHorizontal + int(areaWidth*(1.015/3.0));
    int columnX3 = marginHorizontal + int(areaWidth*(2.02/3.0));
    int lineY1 = marginVertical + titleBottomPadding;
    int lineY2 = marginVertical + titleBottomPadding + int(areaWidth*(1.42/3.0));
    int lineY3 = marginVertical + titleBottomPadding + int(areaWidth*(2.82/3.0));
    Image[] images = new Image[pImages.length];
    images[0] = new Image(pImages[0], columnX1, lineY1, imageSize, imageSize);
    images[1] = new Image(pImages[1], columnX2, lineY1, imageSize, imageSize);
    images[2] = new Image(pImages[2], columnX3, lineY1, imageSize, imageSize);
    images[3] = new Image(pImages[3], columnX1, lineY2, imageSize, imageSize);
    images[4] = new Image(pImages[4], columnX2, lineY2, imageSize, imageSize);
    images[5] = new Image(pImages[5], columnX3, lineY2, imageSize, imageSize);
    images[6] = new Image(pImages[6], columnX1, lineY3, imageSize, imageSize);
    images[7] = new Image(pImages[7], columnX2, lineY3, imageSize, imageSize);
    images[8] = new Image(pImages[8], columnX3, lineY3, imageSize, imageSize);
    return images;
  }
  
  public CaptionTextBlock[] generateSmallTextBlocks(String[] paths) {
    // 画像9つに対応するテキスト9つを読み込む
    String[] texts = new String[9];
    for (int i = 0; i < texts.length; i++) texts[i] = txtToString(paths[i]);
    int blockWidth = int(areaWidth*(0.98/3.0));
    int blockHeight = 36;
    int columnX1 = marginHorizontal;
    int columnX2 = marginHorizontal + int(areaWidth*(1.01/3.0));
    int columnX3 = marginHorizontal + int(areaWidth*(2.02/3.0));
    int lineY1 = marginVertical + titleBottomPadding + int(areaWidth*(1.02/3.0));
    int lineY2 = marginVertical + titleBottomPadding + int(areaWidth*(2.42/3.0));
    int lineY3 = marginVertical + titleBottomPadding + int(areaWidth*(3.82/3.0));
    CaptionTextBlock[] blocks = new CaptionTextBlock[texts.length];
    blocks[0] = new CaptionTextBlock(texts[0], columnX1, lineY1, blockWidth, blockHeight);
    blocks[1] = new CaptionTextBlock(texts[1], columnX2, lineY1, blockWidth, blockHeight);
    blocks[2] = new CaptionTextBlock(texts[2], columnX3, lineY1, blockWidth, blockHeight);
    blocks[3] = new CaptionTextBlock(texts[3], columnX1, lineY2, blockWidth, blockHeight);
    blocks[4] = new CaptionTextBlock(texts[4], columnX2, lineY2, blockWidth, blockHeight);
    blocks[5] = new CaptionTextBlock(texts[5], columnX3, lineY2, blockWidth, blockHeight);
    blocks[6] = new CaptionTextBlock(texts[6], columnX1, lineY3, blockWidth, blockHeight);
    blocks[7] = new CaptionTextBlock(texts[7], columnX2, lineY3, blockWidth, blockHeight);
    blocks[8] = new CaptionTextBlock(texts[8], columnX3, lineY3, blockWidth, blockHeight);
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
    
    // 各画像下のキャプション表示
    if (textBlocks != null) {
      for (TextBlock textBlock: textBlocks) {
        textBlock.draw();
      }
    }
  }
}
