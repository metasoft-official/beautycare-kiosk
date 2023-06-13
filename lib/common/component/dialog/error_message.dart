import 'package:beauty_care/common/provider/component_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ErrorMessage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final errorMessage = ref.watch(errorNotifierProvider);
    final errorNotifier = ref.watch(errorNotifierProvider.notifier);

    if (errorMessage != null) {
      Future.microtask(() {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Error'),
            content: Text(errorMessage),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  errorNotifier.dismissError();
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      });
    }

    return Container();

    // The rest of your widget...
  }
}
