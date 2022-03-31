
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget
{
  HomePage({Key? key, required this.title}) : super(key:key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
              onPressed: (){
                showSearch(context: context,delegate: CustomSearchDelegate(),);
              },
              icon: const Icon(Icons.search),)
        ],
      ),
    );

  }
}

class CustomSearchDelegate extends SearchDelegate
{
  List<String> searchTerms = ['Apple','Banana',"Pear","Watermelons","Oranges","Blueberries","Strawberries","Raspberries",];

  @override
  List<Widget> buildActions(BuildContext context) {

    return[
      IconButton(onPressed: (){
        query = '';
      }, icon: const Icon(Icons.clear))
    ];


  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(onPressed: () {
      close(context, null);
    }, icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for(var fruit in searchTerms)
      {
        if(fruit.toLowerCase().contains(query.toLowerCase())){
          matchQuery.add(fruit);
        }
      }
    return ListView.builder(itemBuilder: (context,index){
      var result = matchQuery[index];
      return ListTile(title: Text(result),);
    },itemCount: matchQuery.length,);
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    List<String> matchQuery = [];

    for(var fruit in searchTerms)
      {
        if(fruit.toLowerCase().contains(query.toLowerCase()))
          {
            matchQuery.add(fruit);
          }
      }

    return ListView.builder(itemBuilder: (context,index){
      var result = matchQuery[index];
      return ListTile(title: Text(result),);
    },itemCount: matchQuery.length,);
  }

}