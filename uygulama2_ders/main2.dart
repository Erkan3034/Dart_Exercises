import 'package:flutter/material.dart';

void main() {
  runApp(const DropDownButtonKullanimi());
}

class DropDownButtonKullanimi extends StatelessWidget {
  const DropDownButtonKullanimi({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: DropdownButton<String>(
            items: const [
              DropdownMenuItem(
                value: 'Flutter',
                child: Text('Flutter'),
              ),
              DropdownMenuItem(
                value: 'React Native',
                child: Text('React Native'),
              ),
              DropdownMenuItem(
                value: 'Xamarin',
                child: Text('Xamarin'),
              ),
            ],
            value: 'Flutter',
            onChanged: (String? value) {
              print('Seçilen değer: $value');
            },
            hint: const Text('Bir platform seçin'),
          ),
        ),
      ),
    );
  }
}