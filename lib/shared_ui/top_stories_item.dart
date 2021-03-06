import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:newsapp/model/whatsnew/News.dart';
import 'package:newsapp/other/StringConstant.dart';
import 'package:newsapp/util/MockData.dart';
import 'package:newsapp/view/main/newsdetails.dart';

class TopStoriesItem extends StatelessWidget {

  final Article article;
  final double fontSize;
  final TextAlign textAlign;
  final Color color;
  final bool underline;
  final FontWeight fontWeight;
  final int maxLines;
  final String fontFamily;

  TopStoriesItem(
      this.article,
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
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return NewsDetails(article: article,);
        }
        )
        );
        print("item Stories is clicked");
      },
      child: Padding(
        padding: EdgeInsets.all(4),
        child:  Card(
          elevation: 4,
          child: Column(
            children: [
              _drawBody(article.title,article.description,article.urlToImage),
            ],
          ),
        ),
      ),
    );
  }


  Widget _drawBody(String title, String description,String image) {
    return Padding(
      padding: EdgeInsets.only(left: 4, right: 4, top: 2,bottom: 8),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                    width: 108,
                    height: 108,
                    child: Image.network( image ?? "",fit: BoxFit.cover,)
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 4, bottom: 8),
                        child: Text(
                          title ?? 'Lorem Ipsum',
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 4),
                        child: Text(
                          description ?? "Lorem Ipsum",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                          ),
                          textAlign: TextAlign.start,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
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
    );
  }

}
