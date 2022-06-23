class LoggedUser {
  final String email;
  final String name;

  LoggedUser({
    required this.name,
    required this.email,
  });

  List<Object> get props => [email, name];
}
