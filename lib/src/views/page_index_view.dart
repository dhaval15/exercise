import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class PageIndexController {
  final _controller = BehaviorSubject<int>();
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

  /// Return list of indices which are to be shown
	/// Size of the list returned will be of [numberOfIndicesToShow]
	/// or [numberOfPages], if it is lesser
  List<int> get _indices {
    final list = <int>[];
    int i = 1;
    int currentIndex = widget.controller.currentIndex;
    list.add(currentIndex);

		/// Adds value to [list]

		/// [atFirst] decides weather to insert at begining or at end.
		
		/// return false without adding the element, if length of 
		/// the [list] is already up to [numberOfIndicesToShow]
    bool add(int value, {bool atFirst = false}) {
      if (list.length < widget.numberOfIndicesToShow) {
        if (atFirst) {
          list.insert(0, value);
        } else {
          list.add(value);
        }
        return true;
      } else {
        return false;
      }
    }
		/// adds indices after and before the [currentIndex] iteratively
    while (true) {
      if (currentIndex + i < widget.totalIndices && !(add(currentIndex + i))) {
        break;
      }
      if (currentIndex - i >= 0 && !(add(currentIndex - i, atFirst: true))) {
        break;
      }
      i++;
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        TextButton(
          onPressed: widget.controller.currentIndex > 0
              ? () {
                  widget.controller.moveTo(widget.controller.currentIndex - 1);
                  setState(() {});
                }
              : null,
          child: const Text('Prev'),
        ),
        for (int index in _indices)
          InkWell(
            onTap: () {
              widget.controller.moveTo(index);
              setState(() {});
            },
            child: Container(
              color: index == widget.controller.currentIndex
                  ? Theme.of(context).colorScheme.onSurface.withOpacity(0.1)
                  : Colors.transparent,
              padding: const EdgeInsets.all(4),
              child: Text(
                '${index + 1}',
              ),
            ),
          ),
        TextButton(
          onPressed: widget.controller.currentIndex < widget.totalIndices - 1
              ? () {
                  widget.controller.moveTo(widget.controller.currentIndex + 1);
                  setState(() {});
                }
              : null,
          child: const Text('Next'),
        ),
      ],
    );
  }
}
