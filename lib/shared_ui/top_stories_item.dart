import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:newsapp/other/StringConstant.dart';
import 'package:newsapp/util/MockData.dart';

class TopStoriesItem extends StatelessWidget {

  final String text;
  final double fontSize;
  final TextAlign textAlign;
  final Color color;
  final bool underline;
  final FontWeight fontWeight;
  final int maxLines;
  final String fontFamily;

  TopStoriesItem(this.text,
      {
        this.fontSize,
        this.textAlign,
        this.color,
        this.fontWeight,
        this.underline = false,
        this.maxLines,
        this.fontFamily});

  @override
  Widget build(BuildContext context) {
    //todo create card with image and title & etc...
    return InkWell(
      onTap: () {
        MotionToast.success(
          title:   text ?? 'استبدل هذا النص',
          titleStyle:
          TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          description: "Example of success motion toast",
          descriptionStyle: TextStyle(fontSize: 12, color: Colors.white),
          width: 300,
        ).show(context);
        print("item Stories is clicked");
      },
      child: Padding(
        padding: EdgeInsets.only(left: 8, right: 8, top: 2),
        child: Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: Image(
                        image: ExactAssetImage(image1),
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8, bottom: 8),
                            child: Text(
                              text ?? 'استبدل هذا النص',
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Lorem Ipsum",
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 16),
                                  child: Row(
                                    children: [
                                      Container(
                                        child: Icon(Icons.timer),
                                        margin: EdgeInsets.only(right: 4),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 6),
                                        child: Text(
                                          "16 min",
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
