public class DescriptionPage1 extends Page {
  
  private TextType textType;
  private String title;
  private String mainText;
  
  private int mainTextCornerY;
  
  private Image image;
  
  public DescriptionPage1(Section section, String path) {
    super(section);
    this.title = txtToString(super.section.getPath() + path + "title.txt");
    this.mainText = txtToString(super.section.getPath() + path + "main.txt");
    
    this.image = pimageToImage(super.section.getPath() + path + "image.png");
    
    this.mainTextCornerY = marginVertical + titleBottomPadding + convertImageHeight(image.getPImage(), areaWidth) + mainTopPadding;
  }
  
  public Image pimageToImage(String path) {
    PImage pImage = loadImage(path);
    int imageWidth = areaWidth;
    int imageHeight = convertImageHeight(pImage, areaWidth);
    int imageCornerX = marginHorizontal;
    int imageCornerY = marginVertical + titleBottomPadding;
    return new Image(pImage, imageCornerX, imageCornerY, imageWidth, imageHeight);
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
  }
}
