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
  switch (area) {
    case "MindSet":
      {
        return Area_MindSetColor;
      }
      break;

    case "Academic":
      {
        return Area_AcademicColor;
      }
      break;
    case "Athletic":
      {
        return Area_AthleticColor;
      }
      break;
    case "Arts":
      {
        return Area_ArtsColor;
      }
      break;
    case "Skills":
      {
        return Area_SkillsColor;
      }
      break;
    case "Others":
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
