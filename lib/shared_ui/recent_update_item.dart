import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:newsapp/model/whatsnew/News.dart';
import 'package:newsapp/other/StringConstant.dart';
import 'package:newsapp/util/MockData.dart';
import 'package:newsapp/view/main/newsdetails.dart';

class RecentUpdateItem extends StatelessWidget {

  final Article article;
  final double fontSize;
  final TextAlign textAlign;
  final Color color;
  final bool underline;
  final FontWeight fontWeight;
  final int maxLines;
  final String fontFamily;

  RecentUpdateItem(
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
        //_showSheet();
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return NewsDetails(article: article,);
        }
        )
        );
        print("item is clicked");
      },
      child: Padding(
        padding: EdgeInsets.only(left: 4, right: 4, top: 2),
        child: Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 200,
                      child: Image.network( article.urlToImage ?? "",fit: BoxFit.cover,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 8, bottom: 8, left: 12, top: 16),
                      child: Text(
                        article.title ?? 'استبدل هذا النص',
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 8, bottom: 8, left: 12, top: 4),
                      child: Text(
                        article.description ?? 'استبدل هذا النص',
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 8, bottom: 8, left: 8, top: 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 6,right: 8),
                            child: Text(
                              article.publishedAt.toString() ?? 'استبدل هذا النص',
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 6,left: 8,right: 8),
                            child: Text(
                              '15',
                              textAlign: TextAlign.center,
                            ),
                          )
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
