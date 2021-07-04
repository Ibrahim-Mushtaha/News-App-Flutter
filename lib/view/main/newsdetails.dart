import 'package:flutter/material.dart';
import 'package:newsapp/model/whatsnew/News.dart';
import 'package:newsapp/other/ColorsConstant.dart';
import 'package:newsapp/other/StringConstant.dart';

class NewsDetails extends StatefulWidget {
  final Article article;

  const NewsDetails({Key key, this.article}) : super(key: key);

  @override
  _NewsDetails createState() => _NewsDetails();
}

class _NewsDetails extends State<NewsDetails> {

  Article _article;


  @override
  Widget build(BuildContext context) {
    _article = widget.article;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text(READ_LATER),
      ),
      body: Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _drawHeader(context),
              Padding(
                padding: EdgeInsets.only(left: 16, top: 24, bottom: 4),
                child: Text(
                  _article.title ?? "News title",
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16, top: 16, bottom: 4,right: 16),
                child: Text(
                  _article.description ?? "Lorem Ipsum Lorem Ipsum",
                  style: TextStyle(
                    height: 1.4,
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(height: 24,),
              _drawFooter(),
            ],
          ),
        ),
      ),
    );
  }


  Widget _drawHeader(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 260,
          child: Image.network( _article.urlToImage ?? "",fit: BoxFit.cover,)
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 260,
          child: Center(
            child: Container(
              color: Colors.black45.withOpacity(0.5),
            ),
          ),
        ),
      ],
    );
  }

  Widget _drawFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            FlatButton(onPressed: (){

            },
                child: Text(_article.author,
                  style: TextStyle(
                    color: AppColors.deepBlue,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                )
            )
          ],
        ),
        SizedBox(
          width: 120,
          child: FlatButton(onPressed: (){

          },
              child: Text(_article.publishedAt.toString(),
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: AppColors.deepBlue,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              )
          ),
        ),
      ],
    );
  }


}
