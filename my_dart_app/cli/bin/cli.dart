const version = '0.0.1'; 
const description = 'A simple CLI application for Dart by MrCoder.';
void main(List<String> arguments) {
  if (arguments.isEmpty || arguments.contains('help')) {
    printUsage();
  } else if (arguments.contains('description')) {
    print('My Dart App CLI version $description');
  }
  else{
    printUsage();
  }
}


void printUsage(){
  print("The following commands are valid: 'description', 'version', 'search <ARTICLE-TITLE>'");
}