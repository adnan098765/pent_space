import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pent_space/core/utils/navigation_service.dart';
import 'package:pent_space/widgets/platformDialog.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:timeago/timeago.dart' as timeago;

String globalimage =
    "https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8ZG9jdG9yfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60";
String formatTimestamp(DateTime? timestamp) {
  final now = DateTime.now();
  final difference = now.difference(timestamp ?? now);

  return timeago.format(now.subtract(difference));
}

class AppUtils {
  static copyText(String text) async {
    await Clipboard.setData(ClipboardData(text: text));
    return PlatformDialog.showModal(title: 'Success', body: 'Text copied!');
  }

  static go(Widget widget) {
    NavigationService.instance.navigate(widget);
  }

  static goReplace(Widget widget) {
    NavigationService.instance.navigateReplaceTo(widget);
  }

  static goToCustomRoute(Widget widget) {
    NavigationService.instance.navigateToCustomRoute(widget);
  }

  static goBack() {
    NavigationService.instance.goback();
  }
}

// for picking up image from gallery
bool isImagePickerActive = false;

Future<Uint8List?> pickImage(ImageSource source) async {
  if (isImagePickerActive) {
    // Image picker is already active, do nothing or show a message
    print("Image picker is already active");
    return null;
  }

  try {
    isImagePickerActive = true;

    final ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: source);

    if (file != null) {
      // Process the picked image
      return await file.readAsBytes();
    }
  } catch (e) {
    // Handle errors
    print("Error picking image: $e");
  } finally {
    isImagePickerActive = false;
  }
}
