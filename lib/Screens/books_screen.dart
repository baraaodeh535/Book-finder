import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bookfinder/Widgets/book_card.dart';
import 'package:bookfinder/Widgets/sidebar_menu.dart';
import 'package:bookfinder/models/book.dart';
import 'package:http/http.dart' as http;
import 'package:bookfinder/constants.dart';


class BooksScreen extends StatefulWidget {

  @override
  _BooksScreenState createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen> {
  String bookName;
  List<Book> booksList=[];

  Future<List<Book>> getBookData() async{
    List<Book> booksData=[];

    String url='$KBooksAPI$bookName';

    http.Response response=await http.get(url);

    if(response.statusCode==200){

      var decodedData=jsonDecode(response.body);

      List items=decodedData['items'];

      for(int i=0;i<items.length;i++){
        Book newBookItem;

        String bookName=decodedData['items'][i]['volumeInfo']['title'];
        String authors=decodedData['items'][i]['volumeInfo']['authors'][0];
        String publisher="UnKnown";
        String publishDate="UnKnown";
        String imagePath='';
        //int averageRate=0;
        if(checkIfKeyExist(decodedData['items'][i]['volumeInfo']['publisher']))
           publisher=decodedData['items'][i]['volumeInfo']['publisher'];

        if(checkIfKeyExist(decodedData['items'][i]['volumeInfo']['publishedDate']))
           publishDate=decodedData['items'][i]['volumeInfo']['publishedDate'];

        if(checkIfKeyExist(decodedData['items'][i]['volumeInfo']['imageLinks']['thumbnail']))
           imagePath=decodedData['items'][i]['volumeInfo']['imageLinks']['thumbnail'];

        /*if(checkIfKeyExist(decodedData['items'][i]['volumeInfo']['averageRating']))
           averageRate=decodedData['items'][i]['volumeInfo']['averageRating'];*/

        newBookItem=Book(title: bookName,authors: authors,publisher: publisher,
        publishDate: publishDate,imageLink: imagePath);

        booksData.add(newBookItem);
      }

    }

    return booksData;
  }

  bool checkIfKeyExist(dynamic jsonKey){
    try{
      var decodedData=jsonKey;
      if(decodedData!=null){
        print('there is data');

      }
      else{
        return false;
      }
      return true;
    }catch(e){
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Book Finder'),backgroundColor: Color(0xffDC3269),),
      drawer: SidebarMenu(),
      body: Padding(
        padding: const EdgeInsets.only(top: 35,left: 10,right: 10),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: Color(0xff00A388),
                    width: 3.5),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 6,
                        offset: Offset(0,3),
                        color: Colors.grey
                      )
                    ]
                  ),
                  child: Row(

                    children: <Widget>[
                      Expanded(

                        child: TextField(
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(

                            hintText: 'Book name,Author name',
                            border: InputBorder.none

                          ),
                          onChanged: (newBookName){
                            bookName=newBookName;
                          },

                        ),
                      ),
                      SizedBox(width: 10,),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: GestureDetector(
                            child: Icon(Icons.search,size: 25,color: Colors.blue,),
                        onTap: () async{

                              booksList=await getBookData();
                              setState(() {

                              });

                        },),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Expanded(


                child: ListView.builder(
                  itemBuilder: (context,index){
                    return  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: BookCard(imgPath: booksList[index].imageLink,
                        bookName: booksList[index].title,
                        bookAuthor: booksList[index].authors,
                        //bookRate: booksList[index].averageRating,
                        publisherName: booksList[index].publisher,
                        publishedDate: booksList[index].publishDate,),
                    );
                  },
                  itemCount: booksList.length,

                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}


