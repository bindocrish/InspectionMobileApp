
import 'dart:convert';

import '../model/inspection_details_model.dart';
import 'common_services/api_service.dart';
import 'common_services/http_api_service.dart';
import 'config.dart';

class InspectionDetailsService {
  static final InspectionDetailsService _instance = InspectionDetailsService._internal();

  factory InspectionDetailsService() => _instance;

  InspectionDetailsService._internal();
  final HttpApiClient http = HttpApiClient.instance;




  Future<InspectionDetails> getInspectionDetailsList({Map<String, String>? queryParams}) async {
    final response = await ApiService().getData(
      AppConfig.workOrderList,
      queryParams: queryParams,

    );

    if (response.success) {

      return inspectionDetailsFromJson(jsonEncode(response.body));

    } else {

      throw Exception('GET request failed: ${response.statusCode}');
    }
  }
}
