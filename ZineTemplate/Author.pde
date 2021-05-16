enum Author {
  author1("執筆者1", "author1", "執筆者1の所属", new Role[]{ Role.role1, Role.role2, Role.role3 }),
  author2("執筆者2", "author2", "執筆者2の所属", new Role[]{ Role.role1, Role.role2, Role.role3 }),
  author3("執筆者3", "author3", "執筆者3の所属", new Role[]{ Role.role1, Role.role2, Role.role3 }),
  author4("執筆者4", "author4", "執筆者4の所属", new Role[]{ Role.role1, Role.role4 }),
  author5("執筆者5", "author5", "執筆者5の所属", new Role[]{ Role.role1, Role.role4 }),
  author6("執筆者6", "author6", "執筆者6の所属", new Role[]{ Role.role1, Role.role4 });
  
  private Author(String name, String nameLower, String belonging, Role[] roles) {
    this.name = name;
    this.nameLower = nameLower;
    this.belonging = belonging;
    this.roles = roles;
  }
  
  public String getName() {
    return name;
  }
  public String getNameLower() {
    return nameLower;
  }
  public String getBelonging() {
    return belonging;
  }
  public String getRole() {
    String role = roles[0].getName();
    for (int i = 1; i < roles.length; i++) {
      role += "／" + roles[i].getName();
    }
    return role;
  }
  
  private final String name;
  private final String nameLower;
  private final String belonging;
  private final Role[] roles;
}

enum Role {
  role1("役割1"),
  role2("役割2"),
  role3("役割3"),
  role4("役割4");
  
  private Role(String name) {
    this.name = name;
  }
  
  public String getName() {
    return name;
  }
  
  private final String name;
}
