import 'package:flutter/material.dart';
import 'package:mask/mask/mask.dart';
import 'package:mask/models/hashtag_is.dart';
import 'package:payme/items/payme_item.dart';
import 'package:payme/models/payme_model.dart';
import 'package:payme/states.dart';
import 'package:payme/storage/storage.dart';

class AddPayme extends StatefulWidget {
  const AddPayme({super.key});

  @override
  State<AddPayme> createState() => _AddPaymeState();
}

class _AddPaymeState extends State<AddPayme> {
  TextEditingController card_number = TextEditingController();
  TextEditingController expire_date = TextEditingController();
  TextEditingController card_name = TextEditingController();
  bool _isValid = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Add card',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(children: [
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    )),
                Padding(
                    padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                    child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: items.length,
                        itemBuilder: ((context, index) {
                          return paymeItem(context, items[index]);
                        }))),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: card_number,
                    maxLength: 19,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      Mask.generic(
                        masks: ['#### #### #### ####'],
                        hashtag: Hashtag.numbers,
                      )
                    ],
                    decoration: InputDecoration(
                      labelText: 'Card number',
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue)),
                      border: OutlineInputBorder(borderSide: BorderSide()),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: expire_date,
                    maxLength: 5,
                    inputFormatters: [
                      Mask.generic(
                        masks: ['##/##'],
                        hashtag: Hashtag.numbers,
                      )
                    ],
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: 'Expire date',
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue)),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                          )),
                      border: OutlineInputBorder(borderSide: BorderSide()),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: card_name,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      labelText: 'Card name',
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: _isValid ? Colors.green : Colors.blue)),
                      border: OutlineInputBorder(borderSide: BorderSide()),
                    ),
                    validator: (value) {
                      if (!value!.contains('U')) {
                        return 'It just doesnt exist UZCARD and HUMO';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        _isValid = _formKey.currentState!.validate();
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Center(
                    child: ElevatedButton(
                        onPressed: () {
                          if (card_number.text != '' &&
                              expire_date.text != '' &&
                              card_name.text != '') {
                            Navigator.pop(context);
                            box!.add(PaymeModel(
                                kartaraqam: int.parse(card_number.text),
                              srok: int.parse(expire_date.text),
                              name: card_name.text, id: '',
                            ));
                            card_number.clear();
                            expire_date.clear();
                            card_name.clear();
                          }
                        },
                        child: Text('Done')),
                  )
                ]),
              ])),
        ),
      ),
    );
  }
}
