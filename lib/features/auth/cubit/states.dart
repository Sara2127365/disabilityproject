abstract class AuthStates{

}

//login
class SignInInitialStates extends AuthStates{

}
class  SignInLoadingStates extends AuthStates{

}
class SignInSuccessStates extends AuthStates{
  final String message;
  SignInSuccessStates(this.message);
}

class SignInErrorStates extends AuthStates{
  final String message;
  SignInErrorStates(this.message);

}

//register

class SignUpInitialStates extends AuthStates{

}
class  SignUpLoadingStates extends AuthStates{

}
class SignUpSuccessStates extends AuthStates{
  final String message;
  SignUpSuccessStates(this.message);
}

class SignUpErrorStates extends AuthStates{
  final String message;
  SignUpErrorStates(this.message);

}