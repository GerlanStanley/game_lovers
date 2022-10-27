class ErrorApiUtils {
  static String? parse(Map result) {
    String? message;

    if (result.containsKey("message")) {
      message = result["message"];
    }

    return message;
  }
}