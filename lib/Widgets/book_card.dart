import 'package:flutter/material.dart';
import 'package:bookfinder/constants.dart';
import 'package:bookfinder/Screens/book_details.dart';

class BookCard extends StatelessWidget {

  final String imgPath;
  final String bookName;
  final String bookAuthor;
  final String publisherName;
  final String publishedDate;
  final double bookRate;

  BookCard({this.imgPath,this.bookRate,this.publishedDate,this.publisherName,
    this.bookAuthor,this.bookName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          height: 220,
          width: 350,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(offset: Offset(0,3),
                  blurRadius: 6,
                  color: Colors.grey)
            ],
            color: Color(0xffDC3269),
            borderRadius: BorderRadius.circular(15),

          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(

              children: <Widget>[
                Container(
                  width: 220,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Name : $bookName',
                          style: KBookCardTextStyle,
                        ),
                        SizedBox(height: 10,),
                        Text('Author : $bookAuthor',
                          style: KBookCardTextStyle,),
                        SizedBox(height: 10,),
                        Text('Publisher : $publisherName',
                          style: KBookCardTextStyle,),
                        SizedBox(height: 10,),
                        Text('Published : $publishedDate',
                          style: TextStyle(color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'KillDill'),),
                        SizedBox(height: 10,),
                        Row(
                          children: <Widget>[
                            Text('Rate :  $bookRate',style: KBookCardTextStyle,),
                            SizedBox(width: 3,),
                            Icon(Icons.star,color: Colors.yellow,),

                          ],
                        )

                      ],
                    ),
                  ),
                ),
                Image.network(imgPath,),
              ],
            ),
          )
      ),
      onTap: (){
        Navigator.push(context,MaterialPageRoute(
            builder: (context)=>BookDetails(imgPath: imgPath,bookName: bookName,bookRate: bookRate,
            bookAuthor: bookAuthor,)
        ));
      },
    );
  }
}