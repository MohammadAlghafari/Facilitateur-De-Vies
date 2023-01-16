import 'package:dio/dio.dart';
import 'package:faciltateur_de_vies/constants/api_keys/api_keys.dart';
import 'package:faciltateur_de_vies/screens/shared_service_details_screen/data/data_source/service_details_provider/service_details_api.dart';
import 'package:faciltateur_de_vies/screens/shared_service_details_screen/data/models/service_details_model.dart';
import '../../../../../core/api_handler/base_api_provider.dart';
import '../../../../../core/api_handler/generic_exceptions.dart';
import '../../../../../core/api_handler/response_handler.dart';
import '../../../../../core/api_handler/urls.dart';

// service details api call implementation
class ServiceDetailsApiImp extends BaseApiProvider
    implements ServiceDetailsApi {
  @override
  Future<ApiResponse<ServiceDetailsModel>> getServiceDetails(
      {required String id}) async {
    ApiResponse<ServiceDetailsModel>? result;
    Response? response;
    try {
      response = await client.get(
        '${Urls.serviceDetails}/$id',
        options: await getRequestWithToken(),
      );
      ServiceDetailsModel serviceDetails = ServiceDetailsModel.fromMap(
          response.data[ApiKeys.data][ApiKeys.result]);
      result = ApiResponse.completed(serviceDetails);
      result.message = response.data[ApiKeys.message];
      result.code = response.data[ApiKeys.code];
    } catch (error) {
      try {
        error is DioError
            ? customExceptionHandler(error, -1)
            : customExceptionHandler(error, response);
      } catch (forcedException) {
        result = ApiResponse.error(forcedException.toString());
      }
    }
    return result!;
  }
}
