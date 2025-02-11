String? validateEmail(String? val) {
  if (val == null || val.isEmpty) {
    return 'Email cannot be empty';
  }
  final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
  if (!emailRegex.hasMatch(val)) {
    return 'Enter a valid email address';
  }
  return null;
}

String? validatePassword(String? val) {
  if (val == null || val.isEmpty) {
    return 'Password cannot be empty';
  }
  if (val.length < 6) {
    return 'Password must be at least 6 characters long';
  }
  return null;
}

String? validateFullName(String? val) {
  if (val == null || val.isEmpty) {
    return 'Full name cannot be empty';
  }
  return null;
}

String? validateSearch(String? val) {
  if (val == null || val.isEmpty) {
    return 'Search cannot be empty';
  }
  return null;
}

