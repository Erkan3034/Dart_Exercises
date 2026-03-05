const version = '0.0.1'; 
const description = 'A simple CLI application for Dart by MrCoder.';
void main(List<String> arguments) {
  if (arguments.isEmpty || arguments.first=='help') {
    printUsage();
  } 
  
  else if (arguments.contains('description')) {
    print('My Dart App CLI version $description');
  }
  
  else if (arguments.first == 'search') {
    final inputArgs = arguments.length > 1 ? arguments.sublist(1) : null;
    searchWikipedia(inputArgs);
  }
  
  else{
    printUsage();
  }
}


void printUsage(){
  print("The following commands are valid: 'description', 'version', 'search <ARTICLE-TITLE>'");
}

 void searchWikipedia(List<String>? args){
  print("searchWikipedia received arguments : $args");
}