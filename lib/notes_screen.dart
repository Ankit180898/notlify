import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample data with title and body
    final List<Map<String, String>> items = List.generate(
      10,
      (index) => {
        "title": "Title $index",
        "body": "This is the body of item $index",
      },
    );
    final List<String> filters = [
      "Personal",
      "Work",
      "Travel",
      "Shopping",
      "Fitness"
    ];
    final RxList<String> selectedFilters = <String>[].obs;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      floatingActionButton: SizedBox(
        height: MediaQuery.of(context).size.width * 0.20,
        width: MediaQuery.of(context).size.width * 0.20,
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: const Color(0xffcc4f4f),
          child: const Icon(
            Iconsax.add,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Personal Notes",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ).paddingSymmetric(horizontal: 16.0),
            // Filter Chips
            // Filter Chips in a Row
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: filters.map((filter) {
                  return Obx(() => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: FilterChip(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14)),
                          label: Text(
                            filter,
                            style: const TextStyle(color: Colors.grey),
                          ),
                          showCheckmark: false,
                          selectedColor: const Color.fromRGBO(28, 30, 31, 1),
                          selected: selectedFilters.contains(filter),
                          onSelected: (bool selected) {
                            if (selected) {
                              selectedFilters.add(filter);
                            } else {
                              selectedFilters.remove(filter);
                            }
                          },
                        ),
                      ));
                }).toList(),
              ),
            ).paddingAll(16),

            StaggeredGrid.count(
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              crossAxisCount: 4, // Number of columns in the grid
              children: List.generate(items.length, (index) {
                Color backgroundColor = getRandomColor();
                Color textsColor = getTextColor(backgroundColor);
                return StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: Random().nextBool() ? 2 : 3,
                  child: Container(
                    decoration: BoxDecoration(
                      color: getRandomColor(),
                      borderRadius: const BorderRadius.all(Radius.circular(24)),
                    ),
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          items[index]["title"]!,
                          style: TextStyle(
                            color: textsColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          items[index]["body"]!,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ).paddingSymmetric(horizontal: 8),
          ],
        ),
      ),
    );
  }

  // Function to get random color
  Color getRandomColor() {
    List<Color> colors = [
      const Color.fromRGBO(217, 222, 222, 1),
      const Color.fromRGBO(28, 30, 31, 1),
    ];
    return colors[Random().nextInt(colors.length)];
  }

  // Function to determine text color based on background color brightness
  Color getTextColor(Color backgroundColor) {
    return backgroundColor == const Color(0xFFD9DEDE)
        ? Colors.black
        : Colors.white;
  }
}
