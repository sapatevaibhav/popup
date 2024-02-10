import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: Colors.deepPurple),
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Animals',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: AnimalsPage(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Animal {
  final String name;
  final String svgAsset;
  final Color backgroundColor;

  Animal({
    required this.name,
    required this.svgAsset,
    required this.backgroundColor,
  });
}












class AnimalsPage extends StatelessWidget {
  final List<Animal> animals = [
    Animal(
      name: 'Cow',
      svgAsset: 'assets/images/cow.svg',
      backgroundColor: const Color.fromARGB(255, 157, 251, 0),
    ),
  ];

  AnimalsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: animals.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            _showAnimalPopup(context, animals[index]);
          },
          child: Container(
            margin: const EdgeInsets.all(5.0),
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1.0),
              borderRadius: BorderRadius.circular(8.0),
              color: animals[index].backgroundColor,
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 50,
                  height: 50,
                  child: SvgPicture.asset(animals[index].svgAsset),
                ),
                const SizedBox(width: 28.0),
                Text(
                  animals[index].name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                    fontFamily: 'Comic Sans MS',
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  
  
  
  
  
  
  
  
  
  
  
  
  Future<void> _showAnimalPopup(BuildContext context, Animal animal) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AnimalPopup(
          animal: animal,
        );
      },
    );
  }
}














class AnimalPopup extends StatefulWidget {
  final Animal animal;

  const AnimalPopup({
    Key? key,
    required this.animal,
  }) : super(key: key);

  @override
  AnimalPopupState createState() => AnimalPopupState();
}

class AnimalPopupState extends State<AnimalPopup> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.animal.name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.volume_up),
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isTapped = !isTapped;
              });
            },
            child: SizedBox(
              width: 200,
              height: 200,
              child: SvgPicture.asset(
                widget.animal.svgAsset,
                color: isTapped ? const Color.fromARGB(81, 118, 96, 94) : null,
              ),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Play Sound'),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Close'),
        ),
      ],
    );
  }
}
