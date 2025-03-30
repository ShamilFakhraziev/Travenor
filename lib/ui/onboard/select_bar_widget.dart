import 'package:flutter/material.dart';
import 'package:travel_app/helpers/colors/app_color.dart';

class SelectBarWidget extends StatelessWidget {
  final int selectedPageNumber;
  final int pagesCount;

  const SelectBarWidget({
    super.key,
    required this.selectedPageNumber,
    required this.pagesCount,
  });

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pagesBar = <Widget>[];
    if (pagesCount == 0 ||
        selectedPageNumber == 0 ||
        pagesCount < selectedPageNumber)
      return SizedBox.shrink();
    for (int i = 1; i <= pagesCount; i++) {
      _pagesBar.add(_Unselected());
    }
    _pagesBar[selectedPageNumber - 1] = _Selected();
    return SizedBox(
      width: 35 + (13 * pagesCount.toDouble()),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [..._pagesBar],
      ),
    );
  }
}

class _Selected extends StatelessWidget {
  const _Selected({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35,
      height: 7,
      decoration: BoxDecoration(
        color: AppColor.primaryColor,
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}

class _Unselected extends StatelessWidget {
  const _Unselected({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 13,
      height: 7,
      decoration: BoxDecoration(
        color: AppColor.unselectedColor,
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}
