public class SectionCover extends Page {
  
  private Author author;
  private String text;
  private Image backImage;
  private color textColor;
  
  private ClearRect[] clearRects;
  
  public SectionCover(Section section, PImage backImage, color textColor) {
    super(section);
    this.author = section.getPrimaryAuthor();
    this.backImage = new Image(backImage);
    this.text = txtToString(section.getPath() + "description.txt");
    this.textColor = textColor;
  }
  
  public SectionCover(Section section, PImage backImage, color textColor, ClearRect[] clearRects) {
    super(section);
    this.author = section.getPrimaryAuthor();
    this.backImage = new Image(backImage);
    this.text = txtToString(section.getPath() + "description.txt");
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
    text(super.section.getSectionNumber(), 100, 290);
    //textFont(createFont(TextType.belonging.getFontName(), TextType.belonging.getFontSize()));
    //text(author.getBelonging(), 100, 340);
    
    textFont(createFont(TextType.main.getFontName(), TextType.main.getFontSize()));
    text(text, 100, 620, WIDTH-200, 500);
  }
  
}
