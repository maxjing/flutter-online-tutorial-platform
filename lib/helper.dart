import 'dart:ui' as ui;
import 'style.dart';
import 'routes.dart';

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

ui.Color getAreaColor(String area) {
  switch (area.toLowerCase()) {
    case "mindSet":
      {
        return Area_MindSetColor;
      }
      break;

    case "academic":
      {
        return Area_AcademicColor;
      }
      break;
    case "athletic":
      {
        return Area_AthleticColor;
      }
      break;
    case "arts":
      {
        return Area_ArtsColor;
      }
      break;
    case "skills":
      {
        return Area_SkillsColor;
      }
      break;
    case "others":
      {
        return Area_OthersColor;
      }
      break;

    default:
      {
        return Area_MindSetColor;
      }
      break;
  }
}

String getRouteByIndex(int index) {
  switch (index) {
    case 0:
      {
        return IndexRoute;
      }
      break;
    case 1:
      {
        return FavouriteRoute;
      }
      break;
    case 2:
      {
        return TimetableRoute;
      }
      break;
    case 3:
      {
        return ProfileRoute;
      }
      break;
    default:
      {
        return IndexRoute;
      }
      break;
  }
}
