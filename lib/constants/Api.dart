
class Api{

  static const String baseUrl = 'http://10.0.2.2:8000/api';// 192.168.137.1
  static const String login = '$baseUrl/login';
  static const String register = '$baseUrl/register';
  static const String addExpert = '$baseUrl/addExpert';
  static const String addExperience = '$baseUrl/auth/addExperience';
  static const String addtime = '$baseUrl/auth/addtime';
  static const String addCredit = '$baseUrl/auth/addCredit';
  static const String viewexperts = '$baseUrl/viewexperts';
  static const String viewexpert = '$baseUrl/viewexpert';
  static const String searchexperts = '$baseUrl/searchexpertName';
  static const String addtofav = '$baseUrl/auth/addtofav';
  static const String showfav = '$baseUrl/auth/showfav';
  static const String addrate = '$baseUrl/addrate';
  static const String viewavg = '$baseUrl/viewavg';
  static const String userprofile = '$baseUrl/auth/user-profile';
  static const String viewTime = '$baseUrl/viewTime';
  static const String reserveTime = '$baseUrl/auth/reserveTime';

}