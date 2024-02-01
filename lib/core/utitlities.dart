

String? filedRequired(String? value) {
  if (value?.trim().isEmpty ?? true) return 'this filed is required';
  return null;
}
