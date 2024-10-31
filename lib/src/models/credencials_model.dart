class CredentialsModel {
  String email;
  String password;

  CredentialsModel({
    this.email = '',
    this.password = '',
  });

  void setEmail(String email) => this.email = email;
  void setPassword(String password) => this.password = password;
}
