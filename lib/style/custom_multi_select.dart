import 'package:flutter/material.dart';

class MultiSelectChip extends StatefulWidget {
  final List<String> reportList;
  final Function(List<String>) onSelectionChanged;

  const MultiSelectChip(
      {Key? key, required this.reportList, required this.onSelectionChanged})
      : super(key: key);
  @override
  State<MultiSelectChip> createState() => _MultiSelectChipState();
}

class _MultiSelectChipState extends State<MultiSelectChip> {
  String selectedChoice = "";
  List<String> selectedChoices = [];
  _buildChoiceList() {
    List<Widget> choices = [];
    for (var item in widget.reportList) {
      choices.add(Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: selectedChoices.contains(item)
                ? const Color(0xffD1D0BD)
                : const Color(0xFF12160F),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(
                color: selectedChoices.contains(item)
                    ? const Color(0xFF1E1E1E)
                    : const Color(0xFF12160F),
              ),
            ),
          ),
          onPressed: () {
            setState(() {
              selectedChoices.contains(item)
                  ? selectedChoices.remove(item)
                  : selectedChoices.add(item);
            });
            widget.onSelectionChanged(selectedChoices);
          },
          child: Text(
            item,
            style: TextStyle(
                color: selectedChoices.contains(item)
                    ? const Color(0xFF12160F)
                    : const Color(0xffD1D0BD)),
          ),
        ),
      ));
    }
    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      // align to center
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: _buildChoiceList(),
    );
  }
}
