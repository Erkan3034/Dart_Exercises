import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
const version = '0.0.1'; 
const description = 'A simple CLI application for Dart by MrCoder.';
void main(List<String> arguments) {
  if (arguments.isEmpty || arguments.first=='help') {
    printUsage();
  } 
  
  else if (arguments.contains('description')) {
    print('Dartpedia CLI version $description');
  }
  
  else if (arguments.first == 'search') {
    final inputArgs = arguments.length > 1 ? arguments.sublist(1) : null; //creates a new list containing all elements of the arguments list after the first element(search)
    searchWikipedia(inputArgs);
      }

  else if (arguments.first == 'wikipedia') { // Changed to 'wikipedia'
    // Pass all arguments *after* 'wikipedia' to searchWikipedia
    final inputArgs = arguments.length > 1 ? arguments.sublist(1) : null;
    searchWikipedia(inputArgs); // Call searchWikipedia (no 'await' needed here for main)
  }
  else{
    printUsage();
  }
}


void printUsage(){
  print("The following commands are valid: 'description', 'version', 'search <ARTICLE-TITLE>'");
}
 
 void searchWikipedia(List<String>? args) async { // async for wait the response.
  print("searchWikipedia received arguments : $args");
  final String? articleTitle;
  if(args==null || args.isEmpty){ //if the command doesn't contains an arg
    print("Please provide an Article title: ");
    final articleTitleFromStdin = stdin.readLineSync() ?? ' ';  // get an argument from user via command line 
    if (articleTitleFromStdin.isEmpty){
      print("No Article title provided, exitting.");
      return;
    }
    articleTitle = articleTitleFromStdin;
  }else{
    articleTitle =args.join(' ');
  }

  print("Current article title  : $articleTitle");
  // Call the API and await the result
  var articleContent = await getWikipediaArticle(articleTitle);
  print(articleContent); // Print the full article response (raw JSON for now)

}

//A Future is like a promise(js). It represents a value that isn't available yet but will be once an asynchronous operation (like a network request) finishes.
Future<String> getWikipediaArticle(String articleTitle) async {
  final url = Uri.https(
    'en.wikipedia.org', //Wikipedia API domain
    '/api/rest_v1/page/summary/$articleTitle', //Api path for article summary 
  );
 
  final response = await http.get(url); // make the http request

  if(response.statusCode == 200){
    stdout.write("********** Request succesfull********************\n ");
    return  response.body; // return response body if request succesfully
  }else{
    return 'ERROR: An error occured during request : $articleTitle, status code : ${response.statusCode}';
  }
}