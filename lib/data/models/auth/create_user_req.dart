class CreateUserReq {
  final String email;
  final String fullName;
  final String password;

  CreateUserReq({
    required this.email,
    required this.fullName,
    required this.password,
  });
}
