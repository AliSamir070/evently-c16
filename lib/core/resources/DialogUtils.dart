import 'package:flutter/material.dart';

class DialogUtils {
  static showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: CircularProgressIndicator(),
            ),
          ],
        ),
      ),
    );
  }

  static showMessageDialog({
    required BuildContext context,
    required String message,
    required String positiveActionTitle,
    required void Function() positiveActionPress,
    String? negativeActionTitle,
    void Function()? negativeActionPress,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        actions: [
          TextButton(
              onPressed: positiveActionPress, child: Text(positiveActionTitle)),
          if (negativeActionTitle != null) ...[
            TextButton(
                onPressed: negativeActionPress,
                child: Text(negativeActionTitle)),
          ]
        ],
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              message,
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ],
        ),
      ),
    );
  }
}
