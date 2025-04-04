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
    final isZeroPages = pagesCount == 0;
    final isPageSelected = selectedPageNumber <= 0;
    final isPagesLessSelected = pagesCount < selectedPageNumber;

    if (isZeroPages || isPageSelected || isPagesLessSelected) {
      return SizedBox.shrink();
    }

    for (int i = 1; i <= pagesCount; i++) {
      _pagesBar.add(UnselectedWidget());
    }
    _pagesBar[selectedPageNumber - 1] = SelectedWidget();
    return SizedBox(
      width: 35 + (13 * pagesCount.toDouble()),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [..._pagesBar],
      ),
    );
  }
}

class SelectedWidget extends StatelessWidget {
  const SelectedWidget({super.key});

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

class UnselectedWidget extends StatelessWidget {
  const UnselectedWidget({super.key});

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
