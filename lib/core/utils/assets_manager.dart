const String imagesPath = 'assets/images/';
const String iconsPath = 'assets/icons/';
const String svgPatch = 'assets/svg/';
const String jsonPatch = 'assets/json/';
const String language = 'lib/config/language';

abstract class ImageAssets {
  static const String party = '${imagesPath}party.png';
  static const String party2 = '${imagesPath}party2.png';
  static const String logo = '${iconsPath}logo.png';
  static const String logo2 = 'assets/images/logo2.png';
  static const String backgroundAvatar = '${imagesPath}avatar.png';
  static const String tableG4 = '${imagesPath}tableG4.jpg';

}

abstract class IconAssets {
  static const String person = '${iconsPath}person.png';
  static const String home = '${iconsPath}home.png';
  static const String setting = '${iconsPath}setting.png';
  static const String ring = '${iconsPath}ring.png';
  static const String checklist = '${iconsPath}Checklist.png';
  static const String dollar = '${iconsPath}Dollar Currency Symbol.png';
  static const String exam = '${iconsPath}Exam.png';
  static const String examA = '${iconsPath}Exam A Plus.png';
  static const String group = '${iconsPath}Group.png';
  static const String id = '${iconsPath}ID.png';
  static const String star = '${iconsPath}Star.png';
  static const String table = '${iconsPath}Table.png';
  static const String lock = '${iconsPath}Lock.png';
  static const String email = '${iconsPath}Email.png';
}

abstract class SvgAssets {
  static const String aPlus = '${svgPatch}APlus.svg';
  static const String checklist = '${svgPatch}Checklist.svg';
  static const String dollar = '${svgPatch}dollar.svg';
  static const String email = '${svgPatch}email.svg';
  static const String exam = '${svgPatch}Exam.svg';
  static const String group = '${svgPatch}group.svg';
  static const String id = '${svgPatch}ID.svg';
  static const String table = '${svgPatch}Table.svg';
  static const String notification = '${svgPatch}Notification.svg';
  static const String profile = '${svgPatch}User.svg';
  static const String home = '${svgPatch}Home.svg';
  static const String settings = '${svgPatch}Gear.svg';
  static const String warning = '${svgPatch}Warning.svg';
}

abstract class JsonAssets {
  static const String warning = '${jsonPatch}warning.json';
  static const String warning2 = '${jsonPatch}warning_updated.json';
  static const String warning3 = '${jsonPatch}warning_circle_exclamation_modified.json';
}
