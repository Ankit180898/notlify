import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/utils.dart';
import 'package:iconsax/iconsax.dart';
import 'package:notlify/notes_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(20, 23, 24, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Folders",
          style: TextStyle(
              color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        actions: [
          Icon(
            Iconsax.calendar,
            color: Colors.white,
          ).paddingOnly(right: 16)
        ],
      ),
      floatingActionButton: SizedBox(
        height: MediaQuery.of(context).size.width * 0.20,
        width: MediaQuery.of(context).size.width * 0.20,
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Color(0xffcc4f4f),
          child: Icon(
            Iconsax.add,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.20,
                  child: GestureDetector(
                    onTap: () {
                      Get.to(NotesScreen());
                    },
                    child: Card(
                      color: Color.fromRGBO(28, 30, 31, 1),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24)),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Personal notes",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 16),
                              ),
                              Spacer(),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                              )
                            ],
                          ),
                          Text(
                            "23",
                            style: TextStyle(fontSize: 48, color: Colors.white),
                          )
                        ],
                      ).paddingAll(16),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
