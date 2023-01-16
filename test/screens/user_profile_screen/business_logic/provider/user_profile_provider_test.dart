import 'package:faciltateur_de_vies/screens/user_profile_screen/business_logic/provider/user_profile_provider.dart';
import 'package:faciltateur_de_vies/screens/user_profile_screen/domain/usecase/delete_user_account_usecase.dart';
import 'package:faciltateur_de_vies/screens/user_profile_screen/domain/usecase/get_account_usecase.dart';
import 'package:faciltateur_de_vies/screens/user_profile_screen/domain/usecase/update_account_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDeleteUserAccountUseCase extends Mock
    implements DeleteUserAccountUseCase {}

class MockGetUserAccountUseCase extends Mock
    implements GetAccountUseCase {}

class MockUpdateUserAccountUseCase extends Mock
    implements UpdateAccountUseCase {}

void main() async {
  late MockDeleteUserAccountUseCase? mockDeleteUserAccountUseCase;
  late UserProfileProvider? userProfileProvider;
  late MockGetUserAccountUseCase? mockGetUserAccountUseCase;
  late MockUpdateUserAccountUseCase? mockUpdateUserAccountUseCase;
  setUp(() {
    mockDeleteUserAccountUseCase = MockDeleteUserAccountUseCase();
    mockGetUserAccountUseCase = MockGetUserAccountUseCase();
    mockUpdateUserAccountUseCase = MockUpdateUserAccountUseCase();
    userProfileProvider = UserProfileProvider(mockDeleteUserAccountUseCase!,mockGetUserAccountUseCase!,mockUpdateUserAccountUseCase!);
  });

  group('test delete user account functionality in provider', () {
    test(
      "initial values of provider should be correct",
      () async {
        // Assert
        expect(userProfileProvider!.isLoading, false);
        expect(userProfileProvider!.isError, false);
      },
    );
  });
}
