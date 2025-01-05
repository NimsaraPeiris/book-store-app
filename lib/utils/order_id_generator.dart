String generateOrderId() {
  final timestamp = DateTime.now().millisecondsSinceEpoch;
  final random = timestamp.toString().substring(7);
  return 'ORD-$random';
}