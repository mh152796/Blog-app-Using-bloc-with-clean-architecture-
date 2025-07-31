class Failures {
  final String message;
  final int statusCode;
  Failures(this.statusCode, [this.message = "An unexpected error occurred"]);
}