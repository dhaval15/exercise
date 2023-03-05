import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class PageIndexController {

  final  _controller = BehaviorSubject<int>();
	final Function(int index)? onIndexChanged;

  PageIndexController({
    int currentIndex = 0,
		this.onIndexChanged,
  }) {
	 _controller.add(currentIndex);
	}

  Stream<int> get stream => _controller.stream;

	int get currentIndex => _controller.value;

	void moveTo(int index) {
		_controller.add(index);
		onIndexChanged?.call(index);
	}
}

class PageIndexView extends StatefulWidget {
  final PageIndexController controller;
  final int totalIndices;
  final int numberOfIndicesToShow;

  const PageIndexView({
    super.key,
    required this.controller,
    required this.totalIndices,
    required this.numberOfIndicesToShow,
  });

  @override
  State<PageIndexView> createState() => _PageIndexViewState();
}

class _PageIndexViewState extends State<PageIndexView> {
  late int _currentIndex;

  @override
  void initState() {
    _currentIndex = widget.controller.currentIndex;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        TextButton(
          onPressed: _currentIndex > 0
              ? () {
                  setState(() {
                    _currentIndex--;
                  });
                  widget.controller.moveTo(_currentIndex);
                }
              : null,
          child: const Text('Prev'),
        ),
        TextButton(
          onPressed: _currentIndex < widget.totalIndices - 1
              ? () {
                  setState(() {
                    _currentIndex++;
                  });
                  widget.controller.moveTo(_currentIndex);
                }
              : null,
          child: const Text('Next'),
        ),
      ],
    );
  }
}
