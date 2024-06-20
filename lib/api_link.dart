class AppLink {
  static const String server = "http://192.168.185.152:8000/api";
  static const String serverimage = "http://192.168.185.152:8000";

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
  // *******************settings***********************
  // Change Password ****************
  static const String changepassword = "$server/resetPasword";
  static const String checkPassword = "$server/checkPassword";
  //logout
  static const String logout = "$server/logout";
  //delete Account
  static const String deleteaccount = "$server/delete";

  //Seeker Profile
  static const String createprofile = "$server/seeker/create";
  static const String updateprofile = "$server/seeker/update";
  //seeker post
  static const String createPost = "$server/post/create";
  static const String editPost = "$server/post/edit";
  static const String deletePost = "$server/post/delete";
  //static const String viewPost = "$server/post/view";

  
  //apply
  static const String apply = "$server/apply";
  static const String updateApply = "$server/apply/update";
  static const String getMyAppliesSeeker = "$server/apply/getMyApplies";

  static const String getAppliesCompany = "$server/apply/getApplies";
  static const String deleteApply = "$server/apply/delete";
  static const String updateStatusApply = "$server/apply/updateStatus";



  //save opportunity
  static const String saveOpportunity = "$server/save";
  static const String getSavedOpportunity = "$server/getSave";
  //CV
  static const String createCV = "$server/seeker/createCV";
  //Company Profile
  static const String createcompanyprofile = "$server/company/create";
  static const String updatecompanyprofile = "$server/company/update";
  
  //post an opportunity
  static const String addOpportunity =
      "$server/opportunity/addOpportunity";
  static const String updateOpportunity =
      "$server/company/updateOpportunity{id}";

  //*************Seeker &  Company***************//
  static const String allOpportunities = "$server/allOpportunities";
  static const String viewPost = "$server/allPosts";


//report
  static const String report = "$server/report/reportUser";
  static const String getReports = "$server/report/getReports";

  
}
