class ArgumentException extends FormatException{

  //The command that was being processed when the exception occurred.

  final String? command;

  //The name of the argument that caused the exception, if applicable.
  final String? argumentName;

  ArgumentException(
    super.message,[
    this.command,
    this.argumentName,
    super.source,
    super.offset,
    ]
  );

  @override
  String toString() {
    return 'ArgumentException: $message in command "$command" for argument "$argumentName" at offset $offset in source "$source"';
  }
}