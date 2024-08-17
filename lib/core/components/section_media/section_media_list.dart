import 'package:flutter/material.dart';

class SectionMediaList extends StatefulWidget {
  final int itemCount;
  final Widget Function(BuildContext context, int index) itemBuilder;
  final Function addEvent;

  const SectionMediaList({
    required this.itemCount,
    required this.itemBuilder,
    required this.addEvent,
    super.key,
  });

  @override
  State<SectionMediaList> createState() => _SectionMediaListState();
}

class _SectionMediaListState extends State<SectionMediaList> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.atEdge) {
      if (_scrollController.position.pixels != 0) {
        widget.addEvent();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      controller: _scrollController,
      physics: const BouncingScrollPhysics(),
      itemCount: widget.itemCount,
      itemBuilder: widget.itemBuilder,
      separatorBuilder: (context, index) => const SizedBox(height: 8),
    );
  }
}
