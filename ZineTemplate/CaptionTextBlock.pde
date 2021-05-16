public class CaptionTextBlock extends TextBlock {
  
  private TextType textType;
  
  private String text;
  private int blockCenterX;
  private int blockCenterY;
  private int blockWidth;
  private int blockHeight;
  private int textCornerX;
  private int textCornerY;
  private int textWidth;
  private int textHeight;
  
  private int padding;
  
  public CaptionTextBlock(String text, int blockCenterX, int blockCenterY, int blockWidth, int blockHeight) {
    super();
    this.padding = 8;
    this.text = text;
    this.blockCenterX = blockCenterX;
    this.blockCenterY = blockCenterY;
    this.blockWidth = blockWidth;
    this.blockHeight = blockHeight;
    this.textCornerX = blockCenterX;
    this.textCornerY = blockCenterY + padding;
    this.textWidth = blockWidth;
    this.textHeight = blockHeight - padding*2;
  }
  
  public void draw() {
    // テキストの表示
    textType = TextType.small;
    textAlign(CENTER, TOP);
    textFont(createFont(textType.getFontName(), textType.getFontSize()));
    fill(0);
    // 自動改行（日本語の場合は改行位置に半角スペースが必要）
    textLeading(20);
    text(text, textCornerX, textCornerY, textWidth, textHeight);
  }
  
}
