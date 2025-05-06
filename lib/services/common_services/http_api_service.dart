import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../config.dart';
import 'api_service.dart';
import 'app_exception.dart';


class HttpApiClient {
  static const timeOut = 30;
  late final http.Client client;
  static bool isApiProcessing = false;

  Map commonBody = {};
  HttpApiClient._internal();

  static final HttpApiClient _instance = HttpApiClient._internal();

  static HttpApiClient get instance => _instance;

  static Future<HttpApiClient> createInstance() async {
    await _instance._initializeClient();
    return _instance;
  }

  // Asynchronous client initialization
  Future<void> _initializeClient() async {

  }

//GET Method
  Future<dynamic> get(String api) async {
    var uri = Uri.parse(api);
    isApiProcessing = true;
    try {
      var response = await client
          .get(uri, headers: AppConfig.header)
          .timeout(const Duration(seconds: timeOut));
      isApiProcessing = false;
      return _processResponse(response);
    } on SocketException {
      isApiProcessing = false;
      throw NetworkErrorException(
          uri.toString(), "", "", 'No Internet Connection');
    } on TimeoutException {
      isApiProcessing = false;
      throw ApiNotRespondingOnTimeException(
          'API not responded in time', uri.toString());
    } on HandshakeException {
      isApiProcessing = false;
      throw SSLPinningErrorException(
          uri.toString(), "", "", 'SSL Handshake Error');
    } on CertificateException {
      isApiProcessing = false;
      throw SSLPinningErrorException(
          uri.toString(), "", "", 'Certificate Error');
    } on TlsException {
      isApiProcessing = false;
      throw SSLPinningErrorException(uri.toString(), "", "", 'TLS Error');
    } catch (e) {
      isApiProcessing = false;
      rethrow;
    }
  }

//POST Method
//   Future<dynamic> post(String api, {Map? body}) async {
//     Map bodyVal = {...AccountService().commonBody, ...(body ?? {})};
//
//     isApiProcessing = true;
//
//     var uri = Uri.parse(api);
//     var payload = jsonEncode(bodyVal);
//     try {
//       var response = await client
//           .post(uri, body: payload, headers: Config.header)
//           .timeout(const Duration(seconds: timeOut));
//       isApiProcessing = false;
//       return _processResponse(response);
//     } on SocketException {
//       isApiProcessing = false;
//       throw NetworkErrorException(
//           uri.toString(), "", "", 'No Internet Connection');
//     } on TimeoutException {
//       isApiProcessing = false;
//       throw ApiNotRespondingOnTimeException(
//           'API not responded in time', uri.toString());
//     } on HandshakeException {
//       isApiProcessing = false;
//       throw SSLPinningErrorException(
//           uri.toString(), "", "", 'SSL Handshake Error');
//     } on CertificateException {
//       isApiProcessing = false;
//       throw SSLPinningErrorException(
//           uri.toString(), "", "", 'Certificate Error');
//     } on TlsException {
//       isApiProcessing = false;
//       throw SSLPinningErrorException(uri.toString(), "", "", 'TLS Error');
//     } catch (e) {
//       isApiProcessing = false;
//       rethrow;
//     }
//   }

  Future<ApiResponse<T>> postData<T>(String endpoint, Map<String, dynamic> data) async {
    try {
      final response = await http.post(
        Uri.parse(endpoint),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(data),
      );
      final statusCode = response.statusCode;
      dynamic decodedBody;
      try {
        decodedBody = json.decode(response.body);
      } catch (_) {
        decodedBody = null;
      }

    //  String errorMessage = _handleHttpError(statusCode, decodedBody);
      return ApiResponse<T>(
        body: decodedBody,
        statusCode: response.statusCode,
        message: "dedd",
        success: response.statusCode >= 200 && response.statusCode < 300,
      );
    } catch (e) {
      return ApiResponse<T>(
        body: null,
        statusCode: 500,
        message: "POST error: $e",
        success: false,
      );
    }
  }

  // Future<dynamic> multipartRequest(String api,
  //     {required Map<String, dynamic>? bodyValue,
  //       required Map<String, List<String?>>? imageFiles}) async {
  //   isApiProcessing = true;
  //   Map bodyVal = {...AccountService().commonBody, ...(bodyValue ?? {})};
  //
  //   var uri = Uri.parse(api);
  //
  //   // final request = http.MultipartRequest('POST', uri);
  //   // For upload progress indicator (%) purpose
  //   final request = MultipartRequest(
  //     'POST',
  //     uri,
  //     onProgress: (int bytes, int total) {
  //       // final progress = bytes / total;
  //       // print('progress: $progress ($bytes/$total)');
  //     },
  //   );
  //   request.headers.addAll(Config.header);
  //
  //   if (imageFiles != null) {
  //     for (var element in imageFiles.entries) {
  //       for (var file in element.value) {
  //         if (file != null && file != "") {
  //           request.files
  //               .add(await http.MultipartFile.fromPath(element.key, file));
  //         }
  //       }
  //     }
  //   }
  //
  //   bodyVal.forEach((key, value) {
  //     if (value is List) {
  //       request.fields[key] = jsonEncode(value);
  //     } else {
  //       request.fields[key] = value.toString();
  //     }
  //   });
  //
  //   try {
  //     final streamedResponse = await client.send(request);
  //     final response = await http.Response.fromStream(streamedResponse);
  //     isApiProcessing = false;
  //     return response.body;
  //   } catch (e) {
  //     isApiProcessing = false;
  //     rethrow;
  //   }
  // }

//process the api response
  _processResponse(http.Response res) {
    String apiUrl = (res.request?.url).toString();
    String statusCode = res.statusCode.toString();
    var response = res.body;
    var resDecode = jsonDecode(response);
    switch (res.statusCode) {
      case 200:
      case 201:
        String statusCode = resDecode['status'].toString();
        if (statusCode == "200") {
          return response;
        } else {
          String errorCode = resDecode['error_code'] ?? ""; //customErrorCode
          String errorMsg = resDecode['message'];
          if (errorCode == "err-401" || errorCode == "err-402") {
            throw UnAuthorizedException(
                apiUrl, resDecode, statusCode, errorMsg, errorCode);
          } else {
            throw ActionFailedException(
                apiUrl, resDecode, statusCode, errorMsg, errorCode);
          }
        }
      case 400: //Bad request
        throw BadRequestException(
            apiUrl, resDecode, statusCode, "Bad Request !");
      case 401: //Unauthorized
      case 403: //Forbidden
        throw UnAuthorizedException(apiUrl, response, statusCode, "err-401");
      case 404: //Resource Not Found
        throw NotFoundException(
            apiUrl, resDecode, statusCode, "Url Not Found !");
      case 429: //Too Many Requests
        throw TooManyRequestsException(
            apiUrl, resDecode, statusCode, "Too Many Requests !");
      case 500: //Internal Server Error
      default:
        throw FetchDataException(apiUrl, resDecode, statusCode, "409");
    }
  }

// ----------------- POSE request with progress using http --------------------

  Future<dynamic> postProgress(String api,
      {required Map body, bool isJsonEncode = true}) async {
    try {
      int total = 0, received = 0;
      final List<int> bytes = [];
      String responseString = "";

      var uri = Uri.parse(api);
      // 1 chunk can carry 1KB of data
      // Progress will run if the data size is above 1KB
      var payload = jsonEncode(body);
      final streamedRequest = http.StreamedRequest("POST", uri);
      streamedRequest.headers.addAll(AppConfig.header);

      var transferredLength = 0;
      // ignore: unused_local_variable
      var uploadProgress = 0.0;

      var totalLength = payload.length;
      Stream.value(payload).transform(utf8.encoder).listen((chunk) {
        transferredLength += chunk.length;
        uploadProgress = transferredLength / totalLength;
        // print(
        //     "Chunk: ${chunk.length}, transferred: $transferredLength, progress: $uploadProgress");
        streamedRequest.sink.add(chunk);
      }, onDone: () {
        streamedRequest.sink.close();
      });

      var streamedResponse = await http.Client().send(streamedRequest);
      total = streamedResponse.contentLength ?? 0;
      await streamedResponse.stream.listen((List<int> chunk) {
        received += chunk.length;
        bytes.addAll(chunk);
        // ignore: unused_local_variable
        double progress = received / total * 100;
        // print('Response received: ${progress.toStringAsFixed(2)}%');
      }, onDone: () async {
        http.Client().close();
      }, onError: (error) {
        http.Client().close();
      }).asFuture();
      responseString = utf8.decode(bytes);
      http.Response res =
      http.Response(responseString, streamedResponse.statusCode);
      return _processResponse(res);
    } on SocketException {
      throw NetworkErrorException(
          api.toString(), "", "", 'No Internet Connection');
    } on TimeoutException {
      throw ApiNotRespondingOnTimeException(
          'API not responded in time', api.toString());
    } catch (e) {
      rethrow;
    }
  }

// ----------------- POSE request with progress using dio --------------------
//   Future<dynamic> postDioProgress(String api,
//       {required Map body, bool isJsonEncode = false}) async {
//     var dio = Dio();
//     try {
//       var res = await dio.post(
//         api,
//         data: jsonEncode(body),
//         onReceiveProgress: (count, total) {
//           // double receiveProgress = count / total;
//         },
//         onSendProgress: (count, total) {
//           // double uploadProgress = count / total;
//         },
//         options: Options(
//             headers: Config.header,
//             responseType: ResponseType.bytes,
//             followRedirects: false,
//             validateStatus: (status) {
//               return status! < 500;
//             }),
//       );
//
//       return _processResponse(http.Response(res.data, res.statusCode!));
//     } on SocketException {
//       throw NetworkErrorException(
//           api.toString(), "", "", 'No Internet Connection');
//     } on TimeoutException {
//       throw ApiNotRespondingOnTimeException(
//           'API not responded in time', api.toString());
//     } catch (e) {
//       rethrow;
//     }
//   }
}

// Override class for multipart request to show progress
class MultipartRequest extends http.MultipartRequest {
  MultipartRequest(super.method, super.url, {required this.onProgress});

  final void Function(int bytes, int totalBytes) onProgress;

  @override
  http.ByteStream finalize() {
    final byteStream = super.finalize();

    final total = contentLength;
    int bytes = 0;

    final t = StreamTransformer.fromHandlers(
      handleData: (List<int> data, EventSink<List<int>> sink) {
        bytes += data.length;
        onProgress(bytes, total);
        if (total >= bytes) {
          sink.add(data);
        }
      },
    );
    final stream = byteStream.transform(t);
    return http.ByteStream(stream);
  }
}
