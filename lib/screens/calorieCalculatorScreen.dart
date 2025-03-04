import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;
import 'dart:developer' as devtools;

class Caloriecalculator extends StatefulWidget {
  const Caloriecalculator({Key? key}) : super(key: key);

  @override
  State<Caloriecalculator> createState() => _CaloriecalculatorState();
}

class _CaloriecalculatorState extends State<Caloriecalculator> {
   File? filepath;
  String label = ' ';
  double confidence = 0.0;
  double totalCalories = 0.0;

  // Map food labels to total calories
  final Map<String, double> labelCalories = {
    "Rice,Dhal,CucumberSalad,Chicken,Beetroot": 746.0,
    "Rice,Dhal,KolaMallum,Chicken,Brinjal": 835.92,
  };

  Future<void> _tfliteInit() async {
    await Tflite.loadModel(
      model: "assets/model_unquant.tflite",
      labels: "assets/labels.txt",
      numThreads: 1,
      isAsset: true,
      useGpuDelegate: false,
    );
  }

  pickImageGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image == null) return;

    var imageMap = File(image.path);
    setState(() {
      filepath = imageMap;
    });

    var recognitions = await Tflite.runModelOnImage(
      path: image.path,
      imageMean: 0.0,
      imageStd: 255.0,
      numResults: 1, // Get the top prediction only
      threshold: 0.2,
      asynch: true,
    );

    if (recognitions == null || recognitions.isEmpty) {
      devtools.log("Recognition is null");
      return;
    }

    devtools.log(recognitions.toString());

    setState(() {
      // Extract label and confidence
      String rawLabel = recognitions[0]['label'].toString();

      // Remove the leading number and space
      String cleanedLabel = rawLabel.substring(rawLabel.indexOf(' ') + 1);

      // Remove extra commas and spaces
      cleanedLabel = cleanedLabel.replaceAll(', ', ',').replaceAll(' ,', ',').trim();

      // Debugging: Print the cleaned label
      devtools.log("Cleaned Label: $cleanedLabel");

      // Update the label and confidence
      label = cleanedLabel;
      confidence = (recognitions[0]['confidence'] * 100);

      // Get calories based on label
      totalCalories = labelCalories.containsKey(cleanedLabel) ? labelCalories[cleanedLabel]! : 0.0;

      // Debugging: Print the total calories
      devtools.log("Total Calories: $totalCalories");
    });
  }

  @override
  void dispose() {
    super.dispose();
    Tflite.close();
  }

  @override
  void initState() {
    super.initState();
    _tfliteInit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Calories Detection")),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 12),
              Card(
                elevation: 20,
                clipBehavior: Clip.hardEdge,
                child: SizedBox(
                  width: 300,
                  child: Column(
                    children: [
                      const SizedBox(height: 18),
                      Container(
                        height: 280,
                        width: 280,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          image: const DecorationImage(
                            image: AssetImage('assets/image_icon.png'),
                          ),
                        ),
                        child: filepath == null
                            ? const Text('')
                            : Image.file(filepath!, fit: BoxFit.fill),
                      ),
                      const SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              "Predicted Label: $label",
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              "Accuracy: ${confidence.toStringAsFixed(0)}%",
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              "Total Calories: ${totalCalories.toStringAsFixed(2)} kcal",
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13),
                  ),
                ),
                child: const Text("Take a Photo"),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: pickImageGallery,
                style: ElevatedButton.styleFrom(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13),
                  ),
                ),
                child: const Text("Pick from Gallery"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
