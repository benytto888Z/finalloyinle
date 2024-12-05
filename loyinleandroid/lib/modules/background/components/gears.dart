import 'package:flutter/material.dart';
import 'package:loyinle/constants/dimens.dart';

class Gears extends StatefulWidget {
  const Gears({
    Key? key,
    this.gears = const ["S", "T", "E", "P", "H"],
  }) : super(key: key);

  final List<String> gears;

  @override
  State<Gears> createState() => _GearsState();
}

class _GearsState extends State<Gears> {
  int selectedGearIndex = 2;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Dimens.tenW * 14,
      child: Padding(
        padding: EdgeInsets.only(top: Dimens.tenH),
        child: DefaultTextStyle(
          style: TextStyle(
            fontSize: Dimens.thirtyW + Dimens.twoW,
            fontWeight: FontWeight.w600,
          ),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                widget.gears.length,
                (index) => Text(
                  widget.gears[index],
                  style: TextStyle(
                    color: index == selectedGearIndex
                        ? const Color(0xFF6D453A)
                        : Colors.white.withOpacity(0.56),
                  ),
                ),
              )),
        ),
      ),
    );
  }
}