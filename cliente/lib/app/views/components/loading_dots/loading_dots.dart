import 'package:flutter/widgets.dart';

import 'delay_tween.dart';

class DotsLoading extends StatefulWidget {
  const DotsLoading({
    super.key,
    this.color,
    this.size = 50.0,
    this.itemBuilder,
    this.duration = const Duration(milliseconds: 1400),
    this.controller,
  });

  final Color? color;
  final double size;
  final IndexedWidgetBuilder? itemBuilder;
  final Duration duration;
  final AnimationController? controller;

  @override
  State<DotsLoading> createState() => _DotsLoadingState();
}

class _DotsLoadingState extends State<DotsLoading> with SingleTickerProviderStateMixin {
  // Controle da animação
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = (widget.controller ??
        AnimationController(
          vsync: this,
          duration: widget.duration,
        ))
      ..repeat();
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.fromSize(
        size: Size(widget.size * 3, widget.size),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(3, (i) {
            return ScaleTransition(
              scale: DelayTween(
                begin: 0.0,
                end: .5,
                delay: i * .2,
              ).animate(_controller),
              child: SizedBox.fromSize(
                size: Size.square(widget.size * 0.8),
                child: _itemBuilder(i),
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget _itemBuilder(int index) => widget.itemBuilder != null
      ? widget.itemBuilder!(context, index)
      : DecoratedBox(
          decoration: BoxDecoration(
            color: widget.color,
            shape: BoxShape.circle,
          ),
        );
}
