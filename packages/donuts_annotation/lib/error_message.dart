class ErrorMessage {
  final String message;
  ErrorMessage(final String message) : this.message = "[ErrorMessageException]$message";

  @override
  String toString() {
    return message;
  }
}
