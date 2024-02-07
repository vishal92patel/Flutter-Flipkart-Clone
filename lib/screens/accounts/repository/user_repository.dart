import 'package:test_app/bloc/modal/user_modal.dart';
import 'package:test_app/screens/accounts/provider/user_provider.dart';

abstract class IUserRepository {
  Future<UserModal> getUser();
}

class UserRepository implements IUserRepository {
  final UserProvider userProvider;
  UserRepository(this.userProvider);
  @override
  Future<UserModal> getUser() {
    return userProvider.getUser();
  }
}
