public class SmallTextBlock extends TextBlock {
  
  private TextType textType;
  
  private String text;
  private int blockCornerX;
  private int blockCornerY;
  private int blockWidth;
  private int blockHeight;
  private int textCornerX;
  private int textCornerY;
  private int textWidth;
  private int textHeight;
  
  private int padding = 8;
  
  public SmallTextBlock(String text, int blockCornerX, int blockCornerY, int blockWidth, int blockHeight) {
    super();
    this.text = text;
    this.blockCornerX = blockCornerX;
    this.blockCornerY = blockCornerY;
    this.blockWidth = blockWidth;
    this.blockHeight = blockHeight;
    this.textCornerX = blockCornerX + padding;
    this.textCornerY = blockCornerY + padding;
    this.textWidth = blockWidth - padding*2;
    this.textHeight = blockHeight - padding*2;
  }
  
  public void draw() {
    // テキストの表示
    textType = TextType.small;
    textAlign(LEFT, TOP);
    textFont(createFont(textType.getFontName(), textType.getFontSize()));
    fill(0);
    // 自動改行（日本語の場合は改行位置に半角スペースが必要）
    textLeading(20);
    text(text, textCornerX, textCornerY, textWidth, textHeight);
  }
  
}
