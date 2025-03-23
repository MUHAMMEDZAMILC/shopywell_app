
import 'package:flutter/material.dart';

import '../../view/components/apptext.dart';

enum MessageType { error, success, warning }

void snackBar(BuildContext context,
    {required String message,
    MessageType type = MessageType.error,
    Color? kcolor}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor:  kcolor ?? _getColor(type),
      duration: Duration(seconds: 2),
      content: AppText(
          size: 12,
          text: message.toUpperCase(),
          color: Colors.white,
          maxline: 2,)));
}
Color _getColor(MessageType type) {
  if (type == MessageType.error) {
    return Colors.red[600]!;
  } else if (type == MessageType.success) {
    return Colors.green[600]!;
  }
  return Colors.black;
}