import 'package:flutter/material.dart';
import 'package:bookfinder/Widgets/sidebar_menu.dart';
import 'package:bookfinder/constants.dart';

class BookDetails extends StatelessWidget {

  final String imgPath;
  final String bookName;
  final String bookAuthor;
  final String publisherName;
  final String publishedDate;
  final double bookRate;
  final String description;

  BookDetails({this.bookName,this.bookAuthor,
  this.publisherName,this.publishedDate,this.bookRate,
  this.imgPath,this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Book details'),
      backgroundColor: Color(0xffDC3269),),
      drawer: SidebarMenu(),
      body: Column(

        children: <Widget>[
          SizedBox(
            height: 250,
            width: double.infinity,
            child: Material(borderRadius: BorderRadius.circular(12),
                child: Image.asset(imgPath,
                scale: 2,),
                elevation: 5,
            ),
          ),
          Expanded(

            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(25),
                      topLeft: Radius.circular(25),

                  ),
                color: Color(0xffDC3269),
                boxShadow: [
                  BoxShadow(offset: Offset(0,5),
                  blurRadius: 6,
                  color: Colors.grey)
                ]
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ListView(
                  children: <Widget>[
                    Text('Name : $bookName',style: KBookDetailsTextStyle,),
                    SizedBox(height: 10,),
                    Text('Author : $bookAuthor',
                    style: KBookDetailsTextStyle,),
                    SizedBox(height: 10,),
                    Text('Publisher : $publisherName',style: KBookDetailsTextStyle,),
                    SizedBox(height: 10,),
                    Text('Published : $publishedDate',style: KBookDetailsTextStyle,),
                    SizedBox(height: 10,),
                    Row(
                      children: <Widget>[
                        Text('Rate :  $bookRate',style: KBookDetailsTextStyle,),
                        SizedBox(width: 3,),
                        Icon(Icons.star,color: Colors.yellow,),

                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: <Widget>[
                        Text('Discription : ',
                        style: KBookDetailsTextStyle,),
                        Text(description,
                        style: KBookCardTextStyle,)
                      ],
                    ),
                    SizedBox(height: 10,),

                  ],
                ),
              ),
            ),
          )

        ],
      ),
    );
  }
}
