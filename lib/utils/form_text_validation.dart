String? Function(String?) textValidation(errText) {
  return (value) {
    if (value == null || value.isEmpty) {
      return 'Please enter $errText';
    }
    return null;
  };
}

String? Function(String?) numberValidation(errText) {
  return (value) {
    if (value == null || value.isEmpty) {
      return 'Please enter $errText';
    }

    if (int.tryParse(value) == null) {
      return 'Please input number';
    }
    return null;
  };
}
