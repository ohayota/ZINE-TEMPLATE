public class Cover extends Page {
  
  private Author author;
  private PImage image;
  private PGraphics pg;
  private PGraphics cpg;
  
  public Cover(Section section) {
    super(section);
    this.author = section.getPrimaryAuthor();
    this.image = loadImage(section.getPath() + "image.png");
    cpg = createGraphics(int(WIDTH), int(HEIGHT));
    cpg.beginDraw();
    // 描画処理
    cpg.endDraw();
    pg = createGraphics(int(WIDTH), int(HEIGHT));
    pg.beginDraw();
    pg.image(image, -220, 0, convertImageWidth(image, HEIGHT), HEIGHT);
    pg.image(cpg, 0, 0);
    pg.endDraw();
  }
  
  public void draw() {
    // 画面いっぱいに背景画像を表示する
    image(pg, 0, 0);
  }
  
}

public class BackCover extends Page {
  
  private Author author;
  private PImage image;
  private PGraphics pg;
  private PGraphics cpg;
  
  public BackCover(Section section) {
    super(section);
    this.author = section.getPrimaryAuthor();
    this.image = loadImage(section.getPath() + "image.png");
    cpg = createGraphics(int(WIDTH), int(HEIGHT));
    cpg.beginDraw();
    // 描画処理
    cpg.endDraw();
    pg = createGraphics(int(WIDTH), int(HEIGHT));
    pg.beginDraw();
    pg.image(image, -convertImageWidth(image, HEIGHT)+WIDTH+85, 0, convertImageWidth(image, HEIGHT), HEIGHT);
    pg.image(cpg, 0, 0);
    pg.endDraw();
  }
  
  public void draw() {
    // 画面いっぱいに背景画像を表示する
    image(pg, 0, 0);
  }
  
}
