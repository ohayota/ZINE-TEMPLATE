import processing.pdf.*;

boolean isExportPDF = true; // 全ページをPDFとして出力
boolean isTwoSheets = true; // 2ページを横に並べて，見開き1ページとして表示

boolean isVisibleGrid = false; // 描画の基準として使用する水色のグリッドを，背景に表示
PImage grid;

ArrayList<Page> allPages;

// 上下（垂直：Vertical）と左右（水平：Horizontal）のマージン
final int marginVertical = 74; // (72dpi) 26.2mm = 74px
final int marginHorizontal = 68; // (72dpi) 24mm = 68px
final int titleBottomPadding = 56;
final int mainTopPadding = 12;

// マージンを除く描画エリアのサイズ
int areaWidth;
int areaHeight;

// 1枚のサイズ (A4, 72dpi)
final float WIDTH = 595.0;
final float HEIGHT = 842.0;

// Sectionのenum内で使うパス
static String cover_path = "cover/";
static String foreword_path = "foreafter/foreword/";
static String contents_path = "contents_table/";
static String chap1_path = "chapter1/";
static String sec1_path = "section1/";
static String afterword_path = "foreafter/afterword/";
static String colophon_path = "colophon/";
static String backcover_path = "backcover/";

// 1ページずつか2ページ横並びかによって，描画エリアのサイズを変える
void settings() {
  if (isTwoSheets) {
    size(int(WIDTH)*2, int(HEIGHT));
  } else {
    size(int(WIDTH), int(HEIGHT));
  }
}

void setup() {
  textAlign(LEFT, TOP);
  
  areaWidth = int(WIDTH - marginHorizontal*2);
  areaHeight = int(HEIGHT - marginVertical*2);
  
  grid = loadImage("grid.png");
  allPages = generatePages();
  
  if (isExportPDF) exportAllPagePDF();
  println("Completed!");
  exit();
}

public void exportAllPagePDF() {
  int pageNumber = 1;
  int getPageNum;
  if (isTwoSheets) {
    final int allPageCount = (allPages.size()+1)/2;
    for (int i = 0; i < allPageCount; i++) {
      beginRecord(PDF, "output/Page" + i + ".pdf");
      background(255);
      getPageNum = 2*i;
      // ページ執筆者名の結合
      String pageNumAndAuthorsLeft = jointPageNumAndAuthors(LEFT, pageNumber, getPageNum);
      // 左ページ番号とページ執筆者名の描画
      switch (allPages.get(getPageNum).section) {
        case foreword:
        case contents:
        case afterword:
        case cover:
        case backcover:
        case colophon:
        case empty:
          // 表紙／裏表紙，まえがき，目次，あとがき，奥付，空白ページではページ番号を表示しない
          break;
        default:
          // ページ番号とページ執筆者名を結合し描画
          textFont(createFont(TextType.section.getFontName(), 10));
          fill(0);
          textAlign(LEFT);
          text(pageNumAndAuthorsLeft, marginHorizontal, HEIGHT-marginVertical/2);
          pageNumber++;
      }
      // 左ページ描画
      allPages.get(getPageNum).draw();
      
      push();
      translate(WIDTH, 0);
      // 右ページが存在するとき
      if ((2*i+1) != allPages.size()) {
        getPageNum = 2*i+1;
        // ページ番号とセクションタイトル
        String pageNumAndAuthorsRight = jointPageNumAndAuthors(RIGHT, pageNumber, getPageNum);
        // 左ページ番号とページ執筆者名の描画
        switch (allPages.get(getPageNum).section) {
          case foreword:
          case contents:
          case afterword:
          case cover:
          case backcover:
          case colophon:
          case empty:
            // 表紙／裏表紙，まえがき，目次，あとがき，奥付，空白ページではページ番号を表示しない
            break;
          default:
            // ページ番号とページ執筆者名を結合し描画
            textFont(createFont(TextType.section.getFontName(), 10));
            fill(0);
            textAlign(RIGHT);
            text(pageNumAndAuthorsRight, WIDTH-marginHorizontal, HEIGHT-marginVertical/2);
            pageNumber++;
        }
        // 右ページ描画
        allPages.get(getPageNum).draw();
      }
      // 2ページの間にグレーの区切り線を引く
      stroke(200, 50);
      line(0, 0, 0, HEIGHT);
      pop();
      endRecord();
      println("exportAllPagePDF(): Page" + i + " exported");
      clear();
    }
  } else {
    for (int i = 0; i < allPages.size(); i++) {
      beginRecord(PDF, "output/Page" + i + ".pdf");
      background(255);
      // ページ番号とページ執筆者名の結合
      String pageNumAndAuthorsLeft = jointPageNumAndAuthors(LEFT, pageNumber, i);
      // ページ番号とページ執筆者名の描画
      switch (allPages.get(i).section) {
        case foreword:
        case contents:
        case afterword:
        case cover:
        case backcover:
        case colophon:
        case empty:
          // 表紙／裏表紙，まえがき，目次，あとがき，奥付，空白ページではページ番号を表示しない
          break;
        default:
          textFont(createFont(TextType.section.getFontName(), 10));
          fill(0);
          textAlign(LEFT);
          text(pageNumAndAuthorsLeft, marginHorizontal, HEIGHT-marginVertical/2);
          pageNumber++;
      }
      // ページ描画
      allPages.get(i).draw();
      endRecord();
      println("exportAllPagePDF(): Page" + i + ": exported");
      clear();
    }
  }
}

// ページ番号とページ執筆者名を結合
public String jointPageNumAndAuthors(int align, int pageNumber, int getPageNum) {
  String authors = "";
  for (Author author: allPages.get(getPageNum).section.getAuthors()) {
    if (authors != "") authors += ", ";
    authors += author.getName();
  }
  // 左右どちらに寄せるものかで結合順を変更
  switch (align) {
    case LEFT:
      return pageNumber + "  |  " + allPages.get(getPageNum).section.getSectionNumber() + " - " + authors;
    case RIGHT:
      return allPages.get(getPageNum).section.getSectionNumber() + " - " + authors + "  |  " + pageNumber;
    default:
      return "";
  }
}

public ArrayList<Page> generatePages() {
  
  ArrayList<Page> pages = new ArrayList<Page>();
  
  /* -------- 表紙 -------- */
  pages.add( new Cover(Section.cover) );
  
  /* -------- まえがき -------- */
  pages.add( new DescriptionPage(Section.foreword, "") );
  
  /* -------- 目次 -------- */
  pages.add( new ContentsTable(loadImage(Section.contents.getPath() + "left.png"), #000000) );
  pages.add( new ContentsTable(loadImage(Section.contents.getPath() + "right.png"), #000000) );
  
  /* -------- 1章表紙 -------- */
  PGraphics chap1CoverBack = createGraphics(595, 842);
  chap1CoverBack.beginDraw();
  chap1CoverBack.background(#500000);
  chap1CoverBack.endDraw();
  pages.add( new SectionCover(Section.chap1_cover, chap1CoverBack, color(#FFFFFF)) );
  
  /* -------- 1章1節 -------- */
  
  pages.add( new DescriptionPage(Section.chap1_sec1, "description/") ); // DescriptionPageの例
  
  // 1章1節見開き表紙左
  pages.add( new CoverSpreadLeft(Section.chap1_sec1_cover) );
  // 1章1節見開き表紙右
  pages.add( new CoverSpreadRight(Section.chap1_sec1_cover, color(#FFFFFF), null) );
  
  pages.add( new DescriptionPageCode(Section.chap1_sec1, "largeImage/", 262) ); // DescriptionPageCodeの例
  pages.add( new LargeImagePage(Section.chap1_sec1, "largeImage/") ); // LargeImagePageの例
  pages.add( new DescriptionPageCode(Section.chap1_sec1, "largeImage2/", 424) ); // DescriptionPageCodeの例
  pages.add( new LargeImagePage2(Section.chap1_sec1, "largeImage2/") ); // LargeImagePage2の例
  pages.add( new DescriptionPage2mini1(Section.chap1_sec1, "description2mini1_1/") ); // DescriptionPage2mini1(2つとも長方形)の例
  pages.add( new DescriptionPage2mini1(Section.chap1_sec1, "description2mini1_2/") ); // DescriptionPage2mini1(1つは正方形)の例
  pages.add( new DescriptionPage1Code(Section.chap1_sec1, "description1Code/", 538) ); // DescriptionPage1Code
  pages.add( new DescriptionPage1(Section.chap1_sec1, "description1/") ); // DescriptionPage1の例
  pages.add( new DescriptionPage2(Section.chap1_sec1, "description2/") ); // DescriptionPage2の例
  pages.add( new DescriptionPage3(Section.chap1_sec1, "description3/") ); // DescriptionPage3の例
  pages.add( new DescriptionPage4(Section.chap1_sec1, "description4/") ); // DescriptionPage4の例
  pages.add( new DescriptionPage8(Section.chap1_sec1, "description8/") ); // DescriptionPage8の例
  pages.add( new DescriptionPage9(Section.chap1_sec1, "description9/") ); // DescriptionPage9の例
  pages.add( new DescriptionPage12(Section.chap1_sec1, "description12/") ); // DescriptionPage12の例
  pages.add( new DescriptionPage(Section.chap1_sec1, "description/") ); // DescriptionPageの例
  
  // ページ合わせの空白ページ
  //pages.add( new Page(Section.empty) );
  
  /* -------- あとがき -------- */
  pages.add( new AfterwordPage() );
  
  /* -------- 奥付 -------- */
  pages.add( new DescriptionPage(Section.colophon, "") );
  
  /* -------- 裏表紙 -------- */
  pages.add( new BackCover(Section.backcover) );
  
  return pages;
}



// path参照先の.txtファイルの内容をStringの文字列として返す
public String txtToString(String path) {
  String text = "";
  String[] lines = loadStrings(path);
  println("txtToString(String path): " + path);
  for (int i = 0 ; i < lines.length; i++) {
    text += lines[i] + "\n";
  }
  return text;
}

// 拡縮後の画像の高さだけ分かっているとき，拡縮後の画像の幅を返す
public int convertImageWidth(PImage image, float afterImageHeight) {
  float afterImageWidth = image.width*(afterImageHeight/(float)image.height);
  return int(afterImageWidth);
}

// 拡縮後の画像の幅だけ分かっているとき，拡縮後の画像の高さを返す
public int convertImageHeight(PImage image, float afterImageWidth) {
  float afterImageHeight = image.height*(afterImageWidth/(float)image.width);
  return int(afterImageHeight);
}
