public class DescriptionPage2 extends Page {
  
  private TextType textType;
  private String title;
  
  private Image[] images;
  
  private SmallTextBlock[] smallTextBlocks;
  
  public DescriptionPage2(Section section, String path) {
    super(section);
    this.title = txtToString(super.section.getPath() + path + "title.txt");
    // image1.pngとimage2.pngのパスを生成
    String[] imagePaths = new String[2];
    for (int i = 0; i < imagePaths.length; i++) {
      imagePaths[i] = super.section.getPath() + path + "image" + (i+1) + ".png";
    }
    this.images = pimagesToImages(imagePaths);
    
    // small1.txtとsmall2.txtのパスを生成
    String[] txtPaths = new String[2];
    for (int i = 0; i < txtPaths.length; i++) {
      txtPaths[i] = super.section.getPath() + path + "small" + (i+1) + ".txt";
    }
    this.smallTextBlocks = generateSmallTextBlocks(txtPaths);
  }
  
  public Image[] pimagesToImages(String[] paths) {
    // 画像2つを読み込む
    PImage[] pImages = new PImage[2];
    for (int i = 0; i < pImages.length; i++) pImages[i] = loadImage(paths[i]);
    int imageSize = int(areaWidth*(1.99/3.0));
    int columnX1 = marginHorizontal;
    int columnX2 = marginHorizontal + int(areaWidth*(1.01/3.0));
    int lineY1 = marginVertical + titleBottomPadding;
    int lineY2 = int(HEIGHT-marginVertical-int(areaWidth*(1.99/3.0)));
    Image[] images = new Image[2];
    images[0] = new Image(pImages[0], columnX1, lineY1, imageSize, imageSize);
    images[1] = new Image(pImages[1], columnX2, lineY2, imageSize, imageSize);
    return images;
  }
  
  public SmallTextBlock[] generateSmallTextBlocks(String[] paths) {
    // 画像2つに対応するテキスト2つを読み込む
    String[] texts = new String[2];
    for (int i = 0; i < texts.length; i++) texts[i] = txtToString(paths[i]);
    int blockWidth = int(areaWidth*(0.99/3.0));
    int blockHeight = int(areaWidth*(1.99/3.0));
    int columnX1 = int(WIDTH-marginHorizontal-int(areaWidth*(0.99/3.0)));
    int columnX2 = marginHorizontal;
    int lineY1 = marginVertical+titleBottomPadding;
    int lineY2 = int(HEIGHT-marginVertical-int(areaWidth*(1.99/3.0)));
    SmallTextBlock[] blocks = new SmallTextBlock[texts.length];
    blocks[0] = new SmallTextBlock(texts[0], columnX1, lineY1, blockWidth, blockHeight);
    blocks[1] = new SmallTextBlock(texts[1], columnX2, lineY2, blockWidth, blockHeight);
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
    
    // 作品説明文
    if (smallTextBlocks != null) {
      for (SmallTextBlock stb: smallTextBlocks) stb.draw();
    }
  }
  
}
