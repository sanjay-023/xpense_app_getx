import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

int? amount;
int? editedamount;

class EditAmountWidget extends StatelessWidget {
  EditAmountWidget({required this.editAmount, Key? key}) : super(key: key);
  int editAmount;
  final editAmountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    editAmountController.text = editAmount.toString();
    editedamount = int.parse(editAmountController.text);
    //print(editedamount);
    return Container(
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
                Icons.add,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: SizedBox(
                width: 210,
                height: 60,
                child: TextField(
                  inputFormatters: [LengthLimitingTextInputFormatter(10)],
                  controller: editAmountController,
                  onChanged: (val) {
                    editedamount = int.parse(val);
                    //print(editedamount);
                  },
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(5),
                    hintText: 'Enter Amount',
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
