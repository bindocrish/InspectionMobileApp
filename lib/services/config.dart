class AppConfig{

  static const String _baseUrl = 'https://dev-services-app-inspection-com.azurewebsites.net';


  static Map<String, String> header = {"Content-Type": "application/json"};
  static const String loginUrl = "$_baseUrl/user/login";
  static const String workOrderList = "$_baseUrl/work_orders";
}