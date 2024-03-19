import 'package:flutter/material.dart';
import 'package:maan_hrm/GlobalComponents/button_global.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../constant.dart';

// ignore_for_file: library_private_types_in_public_api
class SettingScree extends StatefulWidget {
  const SettingScree({Key? key}) : super(key: key);

  @override
  _SettingScreeState createState() => _SettingScreeState();
}

class _SettingScreeState extends State<SettingScree> {
  TimeOfDay selectedTime = TimeOfDay.now();
  @override
  void dispose() {
    _selectTime(context).dispose();
    super.dispose();
  }

  _selectTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.input,
    );
    if (timeOfDay != null && timeOfDay != selectedTime) {
      setState(() {
        selectedTime = timeOfDay;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kMainColor,
      appBar: AppBar(
        backgroundColor: kMainColor,
        elevation: 0.0,
        titleSpacing: 0.0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          'Settings',
          maxLines: 2,
          style: kTextStyle.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20.0,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  Material(
                    elevation: 2.0,
                    child: GestureDetector(
                      onTap: () async {
                        _selectTime(context);
                      },
                      child: Container(
                        width: context.width(),
                        padding: const EdgeInsets.all(10.0),
                        decoration: const BoxDecoration(
                          border: Border(
                            left: BorderSide(
                              color: Color(0xFFFD73B0),
                              width: 3.0,
                            ),
                          ),
                          color: Colors.white,
                        ),
                        child: ListTile(
                          leading: const Image(image: AssetImage('images/workinghour.png')),
                          title: Text(
                            'Working Hours (8.0 Hours)',
                            maxLines: 2,
                            style: kTextStyle.copyWith(color: kTitleColor, fontSize: 14.0),
                          ),
                          trailing: const Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Material(
                    elevation: 2.0,
                    child: Container(
                      width: context.width(),
                      padding: const EdgeInsets.all(10.0),
                      decoration: const BoxDecoration(
                        border: Border(
                          left: BorderSide(
                            color: Color(0xFFFFCA05),
                            width: 3.0,
                          ),
                        ),
                        color: Colors.white,
                      ),
                      child: ListTile(
                        onTap: () => showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                // ignore: sized_box_for_whitespace
                                child: SizedBox(
                                  height: 300.0,
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 20.0,
                                      ),
                                      const Image(
                                        image: AssetImage('images/clear.png'),
                                      ),
                                      const SizedBox(
                                        height: 50.0,
                                      ),
                                      Text(
                                        'Clear All Data',
                                        style: kTextStyle.copyWith(fontSize: 20.0, fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 5.0,
                                      ),
                                      Text(
                                        'Are you sure?',
                                        style: kTextStyle.copyWith(
                                          color: kGreyTextColor,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5.0,
                                      ),
                                      Text(
                                        'You want to clear all data.',
                                        style: kTextStyle.copyWith(
                                          color: kGreyTextColor,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20.0,
                                      ),
                                      ButtonGlobal(
                                          buttontext: 'OK',
                                          buttonDecoration: kButtonDecoration.copyWith(color: kMainColor),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          }),
                                    ],
                                  ),
                                ),
                              );
                            }),
                        leading: const Image(image: AssetImage('images/cleardata.png')),
                        title: Text(
                          'Clear All Data',
                          maxLines: 2,
                          style: kTextStyle.copyWith(color: kTitleColor, fontSize: 14.0),
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
