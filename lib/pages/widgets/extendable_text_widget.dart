import 'package:ecommerce/utils/colors.dart';
import 'package:ecommerce/utils/dimensions.dart';
import 'package:flutter/material.dart';

class ExtandableTextWidget extends StatefulWidget {
  final String text;
  const ExtandableTextWidget({Key? key, required this.text}) : super(key: key);

  @override
  State<ExtandableTextWidget> createState() => _ExtandableTextWidgetState();
}

class _ExtandableTextWidgetState extends State<ExtandableTextWidget> {
  late String firstText;
  late String lastText;

  bool hiddenText = true;

  double textHeight = Dimensions.screenHeight / 5.63;
  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      firstText = widget.text.substring(0, textHeight.toInt());
      lastText =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstText = widget.text;
      lastText = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: lastText.isEmpty
          ? Text(firstText)
          : Column(
              children: [
                Text(
                  hiddenText ? (firstText + '...') : (firstText + lastText),
                  style: TextStyle(
                    fontSize: Dimensions.height18,
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      hiddenText = !hiddenText;
                    });
                  },
                  child: Row(
                    children: [
                      Text(
                        hiddenText ? 'Daha fazla' : 'Daha az',
                        style: TextStyle(
                          color: AppColors.mainColor,
                          fontSize: Dimensions.height16,
                        ),
                      ),
                      Icon(
                        hiddenText
                            ? Icons.arrow_drop_down
                            : Icons.arrow_drop_up,
                        color: AppColors.mainColor,
                      ),
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
