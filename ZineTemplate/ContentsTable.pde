public class ContentsTable extends Page {
  
  private String sectionNumber;
  private color textColor;
  private Image backImage;
  
  public ContentsTable(PImage backImage, color textColor) {
    super(Section.contents);
    this.sectionNumber = super.section.getSectionNumber();
    this.backImage = new Image(backImage);
    this.textColor = textColor;
  }
  
  public void draw() {
    // 画面いっぱいに目次画像を表示する
    image(backImage.getPImage(), backImage.imageCornerX, backImage.imageCornerY, backImage.imageWidth+1, backImage.imageHeight+1);
    // 目次ページにあらかじめ作った目次画像を使わない場合，上の処理をコメントアウトして新しく処理を書く
  }
  
}
