// 見開き表紙の左ページ
public class CoverSpreadLeft extends Page {
  
  private String sectionNumber;
  private Image backImage;
  
  public CoverSpreadLeft(Section section) {
    super(section);
    this.sectionNumber = section.getSectionNumber();
    this.backImage = new Image(loadImage(section.getPath() + "left.png"));
  }
  
  public void draw() {
    // 画面いっぱいに背景画像を表示する
    image(backImage.getPImage(), backImage.imageCornerX, backImage.imageCornerY, backImage.imageWidth+1, backImage.imageHeight+1);
  }
  
}


// 見開き表紙の右ページ
public class CoverSpreadRight extends Page {
  
  Author author;
  String text;
  Image backImage;
  color textColor;
  
  ClearRect[] clearRects;
  
  public CoverSpreadRight(Section section, String text, color textColor) {
    super(section);
    this.author = section.getPrimaryAuthor();
    this.backImage = new Image(loadImage(section.getPath() + "right.png"));
    this.text = text;
    this.textColor = textColor;
  }
  
  public CoverSpreadRight(Section section, color textColor, ClearRect[] clearRects) {
    super(section);
    this.author = section.getPrimaryAuthor();
    this.backImage = new Image(loadImage(section.getPath() + "right.png"));
    this.text = txtToString(section.getPath() + "main.txt");
    this.textColor = textColor;
    this.clearRects = clearRects;
  }
  
  public void draw() {
    // 画面いっぱいに背景画像を表示する
    image(backImage.getPImage(), backImage.imageCornerX, backImage.imageCornerY, backImage.imageWidth+1, backImage.imageHeight+1);
    
    if (clearRects != null) {
      for (ClearRect clearRect: clearRects) {
        clearRect.draw();
      }
    }
    
    fill(textColor);
    textAlign(LEFT);
    
    textFont(createFont(TextType.author.getFontName(), TextType.author.getFontSize()));
    text(author.getName(), 100, 290);
    textFont(createFont(TextType.belonging.getFontName(), TextType.belonging.getFontSize()));
    text(author.getBelonging(), 100, 340);
    
    textFont(createFont(TextType.main.getFontName(), TextType.main.getFontSize()));
    text(text, 100, 620);
  }
  
}
