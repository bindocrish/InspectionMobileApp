class RegexHelper {
  static bool isValidEmail(String email) =>
      RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
          .hasMatch(email) &&
          email.split("@").last.contains(".");

  static bool isValidGst(String gst) =>
      RegExp(r'^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[1-9A-Z]{1}Z[0-9A-Z]{1}$')
          .hasMatch(gst);

  static bool isValidIfsc(String ifsc) =>
      RegExp(r'^[A-Z]{4}0[A-Z0-9]{6}$').hasMatch(ifsc);

  static bool isValidPan(String pan) =>
      RegExp(r'^[A-Za-z]{5}[0-9]{4}[A-Za-z]{1}$').hasMatch(pan);
  static bool isValidFacebook(String fbUrl) => RegExp(
      r'(?:(?:http|https):\/\/)?(?:www.)?facebook.com\/(?:(?:\w)*#!\/)?(?:pages\/)?(?:[?\w\-]*\/)?(?:profile.php\?id=(?=\d.*))?([\w\-]*)?')
      .hasMatch(fbUrl);

  static bool isValidTwitter(String twUrl) =>
      RegExp(r'^(https:\/\/twitter.com\/(?![a-zA-Z0-9_]+\/)([a-zA-Z0-9_]+))?$')
          .hasMatch(twUrl);

  static RegExp isCheckEmoji = RegExp(
      r'(?:[\u2700-\u27bf]|(?:\ud83c[\udde6-\uddff]){2}|[\ud800-\udbff][\udc00-\udfff]|[\u0023-\u0039]\ufe0f?\u20e3|\u3299|\u3297|\u303d|\u3030|\u24c2|\ud83c[\udd70-\udd71]|\ud83c[\udd7e-\udd7f]|\ud83c\udd8e|\ud83c[\udd91-\udd9a]|\ud83c[\udde6-\uddff]|\ud83c[\ude01-\ude02]|\ud83c\ude1a|\ud83c\ude2f|\ud83c[\ude32-\ude3a]|\ud83c[\ude50-\ude51]|\u203c|\u2049|[\u25aa-\u25ab]|\u25b6|\u25c0|[\u25fb-\u25fe]|\u00a9|\u00ae|\u2122|\u2139|\ud83c\udc04|[\u2600-\u26FF]|\u2b05|\u2b06|\u2b07|\u2b1b|\u2b1c|\u2b50|\u2b55|\u231a|\u231b|\u2328|\u23cf|[\u23e9-\u23f3]|[\u23f8-\u23fa]|\ud83c\udccf|\u2934|\u2935|[\u2190-\u21ff])');
  static bool isValidPhone(String phn) =>
      RegExp(r'^(?!.*([1-9])\1{5})[6-9]\d{9}$').hasMatch(phn);
}

class AddressRegex {
  static String extractFirstName(String text) {
    // Look for patterns indicating a first name
    final RegExp nameRegex =
    RegExp(r'(?:Mr\.|Mrs\.|Ms\.|Dr\.|Miss)\s+([A-Z][a-z]+)');
    final match = nameRegex.firstMatch(text);
    return match != null ? match.group(1) ?? "" : '';
  }

  static String extractLastName(String text) {
    // Look for patterns indicating a last name
    final RegExp nameRegex = RegExp(r'\b([A-Z][a-z]+)\b(?!\s+[A-Z][a-z]+)');
    final match = nameRegex.allMatches(text);
    return match.isNotEmpty ? match.last.group(1) ?? "" : '';
  }

  static String extractDesignation(String text) {
    // Look for common job titles
    final RegExp designationRegex = RegExp(
        r'\b(?:CEO|Manager|Director|Engineer|Designer|Executive)\b',
        caseSensitive: false);
    final match = designationRegex.firstMatch(text);
    return match != null ? match.group(0) ?? "" : '';
  }

  static String extractAddress(String text) {
    // Look for patterns resembling an address
    final RegExp addressRegex = RegExp(
        r'(?<=\bAddress\s*:\s*)(.*?)(?=\b(?:State|City|Phone|Email|Website|\b))',
        caseSensitive: false);
    final match = addressRegex.firstMatch(text);
    return match != null ? match.group(1) ?? "" : '';
  }

  static String extractState(String text) {
    // Look for patterns resembling a state
    final RegExp stateRegex = RegExp(
        r'(?<=\bState\s*:\s*)(.*?)(?=\b(?:City|Phone|Email|Website|\b))',
        caseSensitive: false);
    final match = stateRegex.firstMatch(text);
    return match != null ? match.group(1) ?? "" : '';
  }

  static String extractCity(String text) {
    // Look for patterns resembling a city
    final RegExp cityRegex = RegExp(
        r'(?<=\bCity\s*:\s*)(.*?)(?=\b(?:State|Phone|Email|Website|\b))',
        caseSensitive: false);
    final match = cityRegex.firstMatch(text);
    return match != null ? match.group(1) ?? "" : '';
  }

  static String extractPhoneNumber(String text) {
    // Extract phone number using a pattern
    final RegExp phoneRegex = RegExp(
        r'\b(?:\+?\d{1,3}[-. ]?)?(?:\(\d{1,4}\)?[-. ]?)?\d{2,4}[-. ]?\d{2,4}[-. ]?\d{2,4}\b');
    final match = phoneRegex.firstMatch(text);
    return match != null ? match.group(0) ?? "" : '';
  }

  static String extractEmail(String text) {
    // Extract email using a pattern
    final RegExp emailRegex = RegExp(r'[\w\.-]+@[\w\.-]+\.[\w\.-]+');
    final match = emailRegex.firstMatch(text);
    return match != null ? match.group(0) ?? "" : '';
  }

  static String extractWebsite(String text) {
    // Extract website using a pattern
    final RegExp websiteRegex = RegExp(
        r"https?://(?:www\.)?[\w\.-]+(?:\.[\w\.-]+)+[\w\-\._~:/?#[\]@!\$&\'\(\)\*\+,;=]+");
    final match = websiteRegex.firstMatch(text);
    return match != null ? match.group(0) ?? "" : '';
  }
}
