import 'dart:ui' as ui;
import 'dart:developer';
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
    case "fine_arts":
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

Map<String, dynamic> genders = {
  "female": {"en_US": "Female", "zh_CN": "女", "zh_HK": "女"},
  "male": {"en_US": "Male", "zh_CN": "男", "zh_HK": "男"},
  "other": {"en_US": "Other", "zh_CN": "其他", "zh_HK": "其他"}
};

Map<String, dynamic> occupations = {
  "student": {"en_US": "Student", "zh_CN": "学生", "zh_HK": "學生"},
  "working": {"en_US": "Working", "zh_CN": "上班", "zh_HK": "上班"},
  "freelancer": {"en_US": "Freelancer", "zh_CN": "自由职业", "zh_HK": "自由職業"}
};

String getLocaleText(String languageTag, String value, String type) {
  Map map;
  switch (type) {
    case 'gender':
      map = genders;
      break;
    case 'occupation':
      map = occupations;
      break;
  }

  return map[value][languageTag];
}
