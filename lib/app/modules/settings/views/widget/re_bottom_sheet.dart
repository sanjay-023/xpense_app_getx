import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xpenseappstate/app/modules/home/views/widget/common_widget.dart';
import 'package:xpenseappstate/app/modules/settings/controllers/settings_controller.dart';

class ReminderBottomSheet extends StatelessWidget {
  ReminderBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final settingsController = Get.put(SettingsController());
    settingsController.onInit();
    return SingleChildScrollView(
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        height: 550,
        child: Column(
          children: [
            commonSizedBox(20.0),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                "Set Reminder",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            commonSizedBox(30.0),
            Column(
              children: [
                Container(
                  width: 320,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(30)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 139, 9, 204),
                          child: Icon(
                            Icons.note,
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: SizedBox(
                            width: 210,
                            height: 60,
                            child: TextField(
                              controller: settingsController.messageController,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(5),
                                hintText: 'What to Remind?',
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                TextButton(
                    onPressed: () async {
                      settingsController.timeSet(context);
                    },
                    child: const Text(
                      'Set Timer',
                      style: TextStyle(
                          color: Color.fromARGB(255, 139, 9, 204),
                          fontSize: 19),
                    )),
                commonSizedBox(10.0),
                ElevatedButton(
                    onPressed: () {
                      settingsController.setTimer();
                       Navigator.of(context).pop();
                    },
                    child: const Text('Done'),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 139, 9, 204),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        minimumSize: const Size(150, 40)))
              ],
            )
          ],
        ),
      ),
    );
  }
}
