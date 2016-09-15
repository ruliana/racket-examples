class Example {
  String greet = "Hello,";
  public Example(String greet) {
    this.greet = greet;
  }
  public String hello(String name) {
    return greet + " " + name + "!";
  }
}