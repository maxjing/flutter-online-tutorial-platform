import 'dart:ui' as ui;

double getScreenWidth() {
  double screenWidth =
      ui.window.physicalSize.width / ui.window.devicePixelRatio;
  return screenWidth;
}

double getScreenHeight() {
  double screenHeight =
      ui.window.physicalSize.height / ui.window.devicePixelRatio;
  return screenHeight;
}
