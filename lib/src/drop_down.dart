import 'package:flutter/material.dart';

class DropDownMenu extends StatelessWidget {
  final String? title;
  final void Function(String?) onChanged;
  final List<String> values;
  final String value;
  final bool? enabled;
  const DropDownMenu({
    Key? key,
    this.title,
    required this.onChanged,
    required this.values,
    required this.value,
    this.enabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (title != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    title!,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ],
            ),
          ),
        Container(
          height: 60.0,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            border: Border.all(color: Colors.grey),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              items: values.map((String value) {
                return DropdownMenuItem<String>(
                  enabled: enabled ?? true,
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(
                        fontSize: 14,
                        color: enabled != null
                            ? enabled == false
                                ? Colors.grey
                                : Colors.black
                            : Colors.black),
                  ),
                );
              }).toList(),
              value: value,
              isExpanded: true,
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }
}
