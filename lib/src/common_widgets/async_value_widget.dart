import 'package:ecommerce_app/src/common_widgets/error_message_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AsyncValueWidget<T> extends ConsumerWidget {
  const AsyncValueWidget({super.key, required this.value, required this.data});

  final AsyncValue<T> value;
  final Widget Function(T) data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return value.when(
      data: data,
      error: (e, st) => Center(
          child: ErrorMessageWidget(
        e.toString(),
      )),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
