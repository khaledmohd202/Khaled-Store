import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/usecase/usecase.dart';
import 'package:ecommerce/data/auth/models/user_signin_req.dart';
import 'package:ecommerce/domain/auth/repository/auth.dart';
import 'package:ecommerce/service_locator.dart';

class SignInUseCase implements UseCase<Either, UserSignInReq> {
  @override
  Future<Either> call({UserSignInReq? params}) async {
    return sl<AuthRepository>().signIn(params!);
  }
}
