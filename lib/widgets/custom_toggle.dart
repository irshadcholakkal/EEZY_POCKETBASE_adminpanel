 import 'package:flutter/cupertino.dart';

class CustomSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;
  final Color activeColor;
  final Color inactiveColor;
  final double width;
  final double height;

  const CustomSwitch({
    Key? key,
    required this.value,
    required this.onChanged,
    this.activeColor = CupertinoColors.systemGreen,
    this.inactiveColor = CupertinoColors.systemGrey,
    this.width = 48.0,
    this.height = 28.0,
  }) : super(key: key);

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  late bool _value;

  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final newValue = !_value;
        setState(() {
          _value = newValue;
        });
        widget.onChanged?.call(newValue);
      },
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: _value ? widget.activeColor : widget.inactiveColor,
        ),
        child: Stack(
          alignment: _value ? Alignment.centerRight : Alignment.centerLeft,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Container(
                width: widget.height - 8.0,
                height: widget.height - 8.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: CupertinoColors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


