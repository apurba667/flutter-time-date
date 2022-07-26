import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TimeDateDemo extends StatefulWidget {
  const TimeDateDemo({Key? key}) : super(key: key);

  @override
  State<TimeDateDemo> createState() => _TimeDateDemoState();
}

class _TimeDateDemoState extends State<TimeDateDemo> {
  DateTime date = DateTime(2022, 07, 26);
  TimeOfDay time = TimeOfDay(hour: 10, minute: 10);
  @override
  Widget build(BuildContext context) {
    final hours = time.hour.toString().padLeft(2, "0");
    final minutes = time.minute.toString().padLeft(2, "0");

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${date.year}/${date.month}/${date.day}",
              style: TextStyle(fontSize: 30),
            ),
            ElevatedButton(
                onPressed: () async {
                  DateTime? newDate = await showDatePicker(
                      context: context,
                      initialDate: date,
                      firstDate: DateTime(1990),
                      lastDate: DateTime(2090));

                  if (newDate == null) return;
                  setState(() {
                    date = newDate;
                  });
                },
                child: Text("Select Date")),
            Text(
              "${hours}:${minutes}",
              style: TextStyle(fontSize: 30),
            ),
            ElevatedButton(
                onPressed: () async {
                  TimeOfDay? newTime =
                      await showTimePicker(context: context, initialTime: time);
                  if (newTime == null) return;
                  setState(() {
                    time = newTime;
                  });
                },
                child: Text("Select Time"))
          ],
        ),
      ),
    );
  }
}
