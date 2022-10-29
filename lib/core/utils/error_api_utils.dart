class ErrorApiUtils {
  static String? parse(dynamic result) {
    String? message;

    if (result is Map && result.containsKey("message")) {
      message = result["message"];
    } else if (result is List) {
      message = "";
      for (Map item in result) {
        if (item.containsKey("cause")) {
          message = message! + item["cause"];
        } else if (item.containsKey("title")) {
          message = message! + item["title"];
        }
      }
    }

    return message;
  }
}
