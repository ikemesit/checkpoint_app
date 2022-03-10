import 'package:email_validator/email_validator.dart';

String? usernameValidationFn(String? value) {
  if (value == null || value.isEmpty) {
    return 'Username should not be empty!';
  }

  if (value.length < 6 || value.length > 12) {
    return 'Username must be between 6 - 12 characters length!';
  }
  return null;
}

String? passwordValidationFn(String? value) {
  if (value == null || value.isEmpty) {
    return 'Password should not be empty!';
  }
  return null;
}

String? fullNameValidationFn(String? value) {
  if (value == null || value.isEmpty) {
    return 'Full name should not be empty!';
  }

  if (value.length > 100) {
    return 'Full name should not be more than 100 characters length!';
  }
  return null;
}

String? firstNameValidationFn(String? value) {
  if (value == null || value.isEmpty) {
    return 'First name should not be empty!';
  }

  if (value.length > 100) {
    return 'First name should not be more than 100 characters length!';
  }
  return null;
}

String? lastNameValidationFn(String? value) {
  if (value == null || value.isEmpty) {
    return 'Last name should not be empty!';
  }

  if (value.length > 100) {
    return 'Last name should not be more than 100 characters length!';
  }
  return null;
}

String? emailValidationFn(String? value) {
  if (value == null || value.isEmpty) {
    return 'Email should not be empty!';
  }

  if (value.length > 100) {
    return 'Email should not be more than 100 characters length!';
  }

  if (EmailValidator.validate(value) != true) {
    return 'Please enter a valid email!';
  }
  return null;
}

String? contactNoValidationFn(String? value) {
  if (value == null || value.isEmpty) {
    return 'Contact number should not be empty!';
  }
  return null;
}

String? icNoValidationFn(String? value) {
  if (value == null || value.isEmpty) {
    return 'IC/Passport number should not be empty!';
  }
  return null;
}

String? genderValidationFn(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please select a gender!';
  }
  return null;
}
