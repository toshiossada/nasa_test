import 'package:design_system/atoms.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateWidget extends StatefulWidget {
  const DateWidget({
    required this.onSelectDate,
    required this.initialDate,
    super.key,
  });
  final Function(DateTime) onSelectDate;
  final DateTime initialDate;

  @override
  State<DateWidget> createState() => _DateWidgetState();
}

class _DateWidgetState extends State<DateWidget> {
  late DateTime _selectedDate = widget.initialDate;

  Future<void> _selectDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
      widget.onSelectDate(_selectedDate);
    }
  }

  void _goToPreviousDate() {
    setState(() {
      _selectedDate = _selectedDate.subtract(const Duration(days: 1));
    });
    widget.onSelectDate(_selectedDate);
  }

  void _goToNextDate() {
    setState(() {
      _selectedDate = _selectedDate.add(const Duration(days: 1));
    });
    widget.onSelectDate(_selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    final date = DateFormat('dd/MM/yyyy').format(_selectedDate);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FIconButton(
          key: const Key('previous_day'),
          icon: const Icon(Icons.arrow_back),
          onPressed: _goToPreviousDate,
        ),
        FElevatedButton(
          onPressed: () => _selectDate(context),
          child: FText(date),
        ),
        FIconButton(
          key: const Key('next_day'),
          icon: const Icon(Icons.arrow_forward),
          onPressed: _goToNextDate,
        ),
      ],
    );
  }
}
