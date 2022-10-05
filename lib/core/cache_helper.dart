import 'package:shared_preferences/shared_preferences.dart';
import '/../generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class CacheHelper {
  static late SharedPreferences _preferences;
  static const _deviceToken = 'DEVICE_TOKEN';
  static const _numOfNotifications = 'NUM_OF_NOTIFICATION';
  static const _userToken = 'USER_TOKEN';
  static const _userId = 'USER_ID';
  static const _cityName = 'CITY_NAME';
  static const _cityId = 'CITY_ID';
  static const _userName = 'USER_NAME';
  static const _defaultLocation = 'DEFAULT_LOCATION';
  static const _userImage = 'USER_IMAGE';
  static const _userPhone = 'USER_PHONE';
  static const _language = 'LANGUAGE';

  static init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static setDeviceToken(String token) async {
    await _preferences.setString(_deviceToken, token);
  }

  static String getDeviceToken() {
    return _preferences.getString(_deviceToken) ?? "";
  }

  static setNumOfUnReadNotifications(int number) async {
    await _preferences.setInt(_numOfNotifications, number);
  }

  static int getNumOfUnReadNotifications() {
    return _preferences.getInt(_numOfNotifications) ?? 0;
  }

  static setUserId(int id) async {
    await _preferences.setInt(_userId, id);
  }

  static int getUserId() {
    return _preferences.getInt(_userId) ?? 0;
  }

  static Future setIfIsVisitor(bool isVisitor) async {
    await _preferences.setBool("isVisitor", isVisitor);
  }

  static bool getIfIsVisitor() {
    return _preferences.getBool("isVisitor") ?? true;
  }

  static setCityName(String value) async {
    await _preferences.setString(_cityName, value);
  }

  static String getCityName() {
    return _preferences.getString(_cityName) ?? " ";
  }

  static setIfVip(bool value) async {
    await _preferences.setBool("isVip", value);
  }

  static bool getIfVip() {
    return _preferences.getBool("isVip") ?? false;
  }

  static setCityId(String value) async {
    await _preferences.setString(_cityId, value);
  }

  static String getCityId() {
    return _preferences.getString(_cityId) ?? " ";
  }

  static setUserToken(String token) async {
    await _preferences.setString(_userToken, token);
  }

  static String getUserToken() {
    return _preferences.getString(_userToken) ?? "";
  }

  static setLang(lang) async {
    await _preferences.setString(_language, lang);
  }

  static String getLang() {
    return _preferences.getString(_language) ?? "ar";
  }

  static setName(String name) async {
    await _preferences.setString(_userName, name);
  }

  static String getName() {
    return _preferences.getString(_userName) ?? "";
  }

  static setDefaultLocation(String location) async {
    await _preferences.setString(_defaultLocation, location);
  }

  static String getDefaultLocation() {
    String location = _preferences.getString(_defaultLocation) ??
        LocaleKeys.chooseLocation.tr();
    return location != LocaleKeys.chooseLocation.tr() && location.length > 20
        ? location.substring(0, 20)
        : location;
  }

  static setDefaultLocationId(int id) async {
    await _preferences.setInt("DEFAULT_LOCATION_ID", id);
  }

  static setDefaultLocationPrice(double price) async {
    await _preferences.setDouble("DEFAULT_LOCATION_Price", price);
  }

  static double getDefaultLocationPrice() {
    return _preferences.getDouble("DEFAULT_LOCATION_Price") ?? 0;
  }

  static int? getDefaultLocationId() {
    return _preferences.getInt("DEFAULT_LOCATION_ID");
  }

  static setCartNumOfItems(int num) async {
    await _preferences.setInt("items_num", num);
  }

  static updateCartNumOfItems({bool isAdd = true}) async {
    await _preferences.setInt("items_num",
        isAdd ? (getCartNumOfItems() + 1) : (getCartNumOfItems() - 1));
  }

  static int getCartNumOfItems() {
    return _preferences.getInt("items_num") ?? 0;
  }

  static setImage(String image) async {
    await _preferences.setString(_userImage, image);
  }

  static String getImage() {
    return _preferences.getString(
          _userImage,
        ) ??
        "";
  }

  static setPhone(String phone) async {
    await _preferences.setString(_userPhone, phone);
  }

  static String getPhone() {
    return _preferences.getString(
          _userPhone,
        ) ??
        "";
  }

  static remove() async {
    await _preferences.clear();
  }

  static removeDefaultLocation() async {
    await _preferences.remove("DEFAULT_LOCATION_ID");
    await _preferences.remove("DEFAULT_LOCATION");
  }

  static removeId() async {
    await _preferences.remove(_userId);
  }

  static removeUserToken() async {
    await _preferences.remove(_userToken);
  }
  // static removeUserData() async {
  //   await _preferences.remove(_userToken);
  //   await _preferences.remove(_userId);
  //   removeDefaultLocation();
  //   await _preferences.remove(_userToken);
  //   await _preferences.remove(_userToken);
  // }
}
