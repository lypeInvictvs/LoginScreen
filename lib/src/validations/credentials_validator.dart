import 'package:login_screen/src/models/credencials_model.dart';
import 'package:lucid_validation/lucid_validation.dart';

class CredentialsValidator extends LucidValidator<CredentialsModel> {
  CredentialsValidator() {
    ruleFor((model) => model.email, key: 'email').validEmail();
    ruleFor((model) => model.password, key: 'password')
        .minLength(6)
        .mustHaveLowercase()
        .mustHaveSpecialCharacter()
        .mustHaveNumber()
        .mustHaveUppercase();
  }
}
