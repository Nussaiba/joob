class AppLink {
  static const String server = "http://192.168.251.152:8000/api";
  static const String serverimage = "http://192.168.251.152:8000";

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
  static const String resetPassword = "$server/rePassword";
  // Change Password ****************
  static const String changepassword = "$server/resetPasword";

  //Seeker Profile
  static const String createprofile = "$server/seeker/create";
  static const String updateprofile = "$server/seeker/update";
  //seeker post
  static const String createPost = "$server/post/create";
  static const String editPost = "$server/post/edit/{id}";
  static const String deletePost = "$server/post/delete{/id}";

  //CV
  static const String createCV = "$server/seeker/createCV";

  //Company Profile
  static const String createcompanyprofile = "$server/company/create";
  static const String updatecompanyprofile = "$server/company/update";
  //post an opportunity
  static const String addOpportunity = "$server/company/Opportunity/addOpportunity";
  static const String updateOpportunity =
      "$server/company/updateOpportunity{id}";

  //*************Seeker &  Company***************//
  static const String allOpportunities = "$server/allOpportunities";
  static const String viewPost = "$server/allPosts";
  static const String logout = "$server/logout";
  static const String deleteaccount = "$server/delete";
}
