import 'package:flutter/material.dart';

class Provider<T> extends StatefulWidget {
  final T value;
  final Widget child;

  Provider({this.value, this.child});

  @override
  _ProviderState<T> createState() => _ProviderState<T>();
}

class _ProviderState<T> extends State<Provider<T>> {
  T _value;

  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<T>(
      builder: (context, value, child) {
        return child;
      },
    );
  }
}

class Consumer<T> extends StatelessWidget {
  final Widget child;
  final Function builder;

  Consumer({this.child, this.builder});

  @override
  Widget build(BuildContext context) {
    return builder(context, _value, child);
  }
}