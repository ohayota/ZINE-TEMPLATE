public class DescriptionPage1Code extends Page {
  
  private TextType textType;
  private String title;
  private String mainText;
  
  private int mainTextCornerY;
  
  private Image image;
  
  private CodeBlock codeBlock;
  private TextBlock textBlock;
  
  public DescriptionPage1Code(Section section, String path, int blockCornerY) {
    super(section);
    this.title = txtToString(super.section.getPath() + path + "title.txt");
    this.mainText = txtToString(super.section.getPath() + path + "main.txt");
    
    this.image = pimageToImage(super.section.getPath() + path + "image.png");
    
    this.mainTextCornerY = marginVertical + titleBottomPadding + convertImageHeight(image.getPImage(), areaWidth) + mainTopPadding;
    
    this.codeBlock = generateCodeBlock(super.section.getPath() + path + "code.txt", blockCornerY);
    this.textBlock = generateSmallTextBlock(super.section.getPath() + path + "small.txt", blockCornerY);
  }
  
  public Image pimageToImage(String path) {
    PImage pImage = loadImage(path);
    int imageWidth = areaWidth;
    int imageHeight = convertImageHeight(pImage, areaWidth);
    int imageCornerX = marginHorizontal;
    int imageCornerY = marginVertical + titleBottomPadding;
    return new Image(pImage, imageCornerX, imageCornerY, imageWidth, imageHeight);
  }
  
  public CodeBlock generateCodeBlock(String path, int blockCornerY) {
    int blockCornerX = marginHorizontal;
    int blockWidth = int(areaWidth*(1.99/3.0));
    int blockHeight = areaHeight - (blockCornerY - marginVertical);
    return new CodeBlock(txtToString(path), blockCornerX, blockCornerY, blockWidth, blockHeight);
  }
  
  public SmallTextBlock generateSmallTextBlock(String path, int blockCornerY) {
    int blockCornerX = int(WIDTH-marginHorizontal-int(areaWidth*(0.99/3.0)));
    int blockWidth = int(areaWidth*(0.99/3.0));
    int blockHeight = areaHeight - (blockCornerY - marginVertical);
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
    
    image.draw();
    
    // 本文の表示
    textType = TextType.main;
    textAlign(LEFT, TOP);
    textFont(createFont(textType.getFontName(), textType.getFontSize()));
    fill(0);
    // 自動改行（日本語の場合は改行位置に半角スペースが必要）
    text(mainText, marginHorizontal, mainTextCornerY, areaWidth, areaHeight);
    
    // コードブロックの表示
    if (codeBlock != null) codeBlock.draw();
    // コード説明ブロックの表示
    if (textBlock != null) textBlock.draw();
  }
}
