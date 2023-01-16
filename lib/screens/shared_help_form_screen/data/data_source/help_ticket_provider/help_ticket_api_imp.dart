import 'package:dio/dio.dart';
import 'package:faciltateur_de_vies/constants/api_keys/api_keys.dart';
import 'package:faciltateur_de_vies/shared_models/shared_help_ticket_request_model.dart';
import '../../../../../core/api_handler/urls.dart';
import '../../../../../core/api_handler/base_api_provider.dart';
import '../../../../../core/api_handler/generic_exceptions.dart';
import '../../../../../core/api_handler/response_handler.dart';
import 'help_ticket_api.dart';

// help ticket api call implementation
class HelpTicketApiImp extends BaseApiProvider
    implements HelpTicketApi {
  @override
  Future<ApiResponse<int>> sendHelpTicket({required SharedHelpTicketRequestModel requestModel}) async {
   ApiResponse<int>? result;
    Response? response;
    try {
      final params = requestModel.toMap();
      response = await client.post(
        Urls.becomeAnEmployee,
        options: await getRequestWithToken(),
        data: params,
      );
      result =
          ApiResponse.completed(response.data[ApiKeys.data][ApiKeys.result]);
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
