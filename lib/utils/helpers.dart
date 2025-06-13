// lib/utils/helpers.dart

String cleanUrl(String url) {
  // Check if the URL contains '<' or '>'
  if (url.contains('<') || url.contains('>')) {
    // Remove the '<' and '>' signs
    url = url.replaceAll('<', '').replaceAll('>', '');
  }

  // Check if the URL contains 'amazonaws.com//' and replace it with 'amazonaws.com/'
  if (url.contains('amazonaws.com//')) {
    url = url.replaceFirst('amazonaws.com//', 'amazonaws.com/');
  }

  return url;
}
