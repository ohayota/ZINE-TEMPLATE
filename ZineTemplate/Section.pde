enum Section {
  cover(cover_path, "表紙", new Author[]{ Author.author1 }),
  foreword(foreword_path, "まえがき", new Author[]{ Author.author1 }),
  contents(contents_path, "目次", new Author[]{ Author.author1 }),
  chap1_cover(chap1_path + cover_path, "1章", new Author[]{ Author.author1, Author.author2, Author.author3, Author.author4, Author.author5, Author.author6 }),
  chap1_sec1_cover(chap1_path + sec1_path + cover_path, "1章1節表紙", new Author[]{ Author.author1 }),
  chap1_sec1(chap1_path + sec1_path, "1章1節", new Author[]{ Author.author1 }),
  afterword(afterword_path, "あとがき", new Author[]{ Author.author1, Author.author2, Author.author3, Author.author4, Author.author5, Author.author6 }),
  colophon(colophon_path, "奥付", new Author[]{ Author.author1 }),
  backcover(backcover_path, "裏表紙", new Author[]{ Author.author1 }),
  empty("", "", new Author[]{});
  
  private Section(String path, String sectionNumber, Author[] authors) {
    this.path = path;
    this.sectionNumber = sectionNumber;
    this.authors = authors;
  }
  
  public String getPath() {
    return path;
  }
  public String getSectionNumber() {
    return sectionNumber;
  }
  public Author[] getAuthors() {
    return authors;
  }
  public Author getPrimaryAuthor() {
    return authors[0];
  }
  
  private final String path;
  private final String sectionNumber;
  private final Author[] authors;
}
