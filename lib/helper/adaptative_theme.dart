class AdaptativeTheme {
  double maxWidth;
  double maxHeight;
  double fontSize;

  AdaptativeTheme(double width) {
    if (width <= 500) {
      //Small screen
      maxWidth = 400;
      maxHeight = 780;
      fontSize = 40;
    } else {
      //Big screen
      maxWidth = 768;
      maxHeight = 1024;
      fontSize = 60;
    }
  }
}
