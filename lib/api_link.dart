class AppLink {
  static const String server = "http://192.168.105.152:8000/api";
  //*********************
  static const String test = "$server/ ";

  //auth Link ***********************
  static const String signup = "$server/register";
  static const String verifycoderegister = "$server/verifyAccount";
  static const String login = "$server/login";
  static const String reSendCode = "$server/sendCode";

  // Forget Password ****************
  static const String checkemail = "$server/forgotPassword";
  static const String verifycodeforgetpassword = "$server/checkCode";
  static const String resetPassword = "$server/resetPassword";
}
