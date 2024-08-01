class ApiPath {
  static const String key = "b4f4a30a2e6546a5897afa877c39ec15";
  static const String empty = "";
  static const String token = "SEND TOKEN HERE";
  static const int apiTimeOut = 12;

  //Base URL
  static const baseUrl = "https://tourpedia.online/api";

  //User
  static const login = "$baseUrl/user_v2/login_patient.php"; //revisi
  //
  static const registration = "$baseUrl/user/registration.php";
  static const readUserDoctor = "$baseUrl/user/read_user_doctor.php";
  static const readUserPatient = "$baseUrl/user/read_user_patient.php";
  static const uploadImageUser = "$baseUrl/user/upload_image_user.php";
  static const updatePasswordAccount = "$baseUrl/user/update_password_user.php";
  static const updateAccount = "$baseUrl/user/update_data_user.php";

  //Symptom
  static const readSymptom = "$baseUrl/symptom/read_symptom.php";

  //Information
  static const readInformation = "$baseUrl/information/read_information.php";

  //Storage
  static const imageStorage = "$baseUrl/images_storage/";

  //Verification
  static const sendCodeVerification = "$baseUrl/verification_user/create_verification.php";
  static const checkVerificationAccount = "$baseUrl/verification_user/update_verification.php";

  //Rule
  static const readDataRule = "$baseUrl/rule/read_rule.php";

  //Disease
  static const readTypeDisease = "$baseUrl/disease/read_type_disease.php";

  //Diagnostic Report
  static const createDiagnosticReport = "$baseUrl/diagnostic_reports/create_diagnostic_report.php";
  static const readDiagnosticReport = "$baseUrl/diagnostic_reports/read_diagnostic_report.php";
  static const deleteDiagnosticReport = "$baseUrl/diagnostic_reports/delete_diagnostic_report.php";

  //Message
  static const createDataMessage = "$baseUrl/message/create_message.php";
  static const readDataMessage = "$baseUrl/message/read_message.php";
}

// Database Details
// DB_hostname=hostname
// DB_username=u899554049_user_tourpedia
// DB_password=B4716ur4m15*
// DB_name=u899554049_db_tourpedia
//email=nugraha@tourpedia.host
