import 'package:financeapp/model/add_date.dart';
import 'package:financeapp/widgets/tap_effect.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Add_Screen extends StatefulWidget {
  const Add_Screen({super.key});

  @override
  State<Add_Screen> createState() => _Add_ScreenState();
}

class _Add_ScreenState extends State<Add_Screen> {
 final box=Hive.box<Add_data>('data');
  DateTime date = DateTime.now();

  String? selectedItem;
  String? selectedItemi;
  final TextEditingController expalin_c = TextEditingController();
  FocusNode ex = FocusNode();
  final TextEditingController amount_c = TextEditingController();
  FocusNode amount_ = FocusNode();
  final List<String> _item = [
    'Food',
    'Transfer',
    'Transportation',
    'Education',
  ];
  final List<String> _itemi = [
    'Income',
    'Expand',
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ex.addListener(() {
      setState(() {});
    });

    amount_.addListener(() {
      setState(() {});
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            background_container(context),
            Positioned(
              top: 120,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                height: 550,
                width: 340,
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    name(),
                    SizedBox(
                      height: 30,
                    ),
                    explain(),
                    SizedBox(
                      height: 30,
                    ),
                    amount(),
                    SizedBox(
                      height: 30,
                    ),
                    How(),
                    SizedBox(
                      height: 30,
                    ),
                    date_time(context),
                    Spacer(),
                    TapEffect(child: save()),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  GestureDetector save() {
    return GestureDetector(
      onTap: () {
        var add=Add_data(  
          selectedItemi!,amount_c.text,date,expalin_c.text,selectedItem!
        );
        box.add(add);
        Navigator.of(context).pop();
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color(0xff368983),
        ),
        width: 120,
        height: 50,
        child: Text(
          'Save',
          style: TextStyle(
              fontFamily: 'f',
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontSize: 17),
        ),
      ),
    );
  }

  Widget date_time(BuildContext context) {
    return Container(
      alignment: Alignment.bottomLeft,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 2,
          color: Color(0xffC5C5C5),
        ),
      ),
      width: 300,
      child: TextButton(
        onPressed: () async {
          DateTime? newDate = await showDatePicker(
              context: context,
              initialDate: date,
              firstDate: DateTime(2023),
              lastDate: DateTime(2100));
          if (newDate == Null) return;
          setState(() {
            date = newDate!;
          });
        },
        child: Text(
          'Date:${date.year}/${date.day}/${date.month}',
          style: TextStyle(fontSize: 15, color: Colors.black),
        ),
      ),
    );
  }

  Padding How() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        width: 300,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              width: 2,
              color: Color(0xffc5c5c5),
            )),
        child: DropdownButton<String>(
          value: selectedItemi,
           onChanged: ((value) {
            setState(() {
              selectedItemi = value!;
            });
          }),
          items: _itemi
              .map((e) => DropdownMenuItem(
                  child: Container(
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                       
                        Text(
                          e,
                          style: TextStyle(fontSize: 10),
                        )
                      ],
                    ),
                  ),
                  value: e,))
              .toList(),
          selectedItemBuilder: (BuildContext context) => _itemi
              .map((e) => Row(
                    children: [
                    
                      Text(
                        e,
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ))
              .toList(),
          hint: Text(
            'How',
            style: TextStyle(color: Colors.grey),
          ),
          dropdownColor: Colors.white,
          isExpanded: true,
          underline: Container(),
         
        ),
      ),
    );
  }

  Padding amount() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextField(
        keyboardType: TextInputType.number,
        focusNode: amount_,
        controller: amount_c,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            labelText: 'amount',
            labelStyle: TextStyle(fontSize: 17, color: Colors.grey.shade500),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(width: 2, color: Color(0xffC5C5C5)),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(width: 2, color: Color(0xff368983)))),
      ),
    );
  }

  Padding explain() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextField(
        focusNode: ex,
        controller: expalin_c,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            labelText: 'explain',
            labelStyle: TextStyle(fontSize: 17, color: Colors.grey.shade500),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(width: 2, color: Color(0xffC5C5C5)),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(width: 2, color: Color(0xff368983)))),
      ),
    );
  }

  Padding name() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        width: 300,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              width: 2,
              color: Color(0xffc5c5c5),
            )),
        child: DropdownButton<String>(
          value: selectedItem,
          items: _item
              .map((e) => DropdownMenuItem(
                  child: Container(
                    child: Row(
                      children: [
                        Container(
                          width: 40,
                          child: Icon(Icons.person),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          e,
                          style: TextStyle(fontSize: 10),
                        )
                      ],
                    ),
                  ),
                  value: e))
              .toList(),
          selectedItemBuilder: (BuildContext context) => _item
              .map((e) => Row(
                    children: [
                      Container(
                        width: 42,
                        child: Icon(Icons.person),
                        //child:Image.asset('images/${e}.png'),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        e,
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ))
              .toList(),
          hint: Text(
            'Name',
            style: TextStyle(color: Colors.grey),
          ),
          dropdownColor: Colors.white,
          isExpanded: true,
          underline: Container(),
          onChanged: ((value) {
            setState(() {
              selectedItem = value!;
            });
          }),
        ),
      ),
    );
  }

  Column background_container(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 240,
          decoration: BoxDecoration(
              color: Color(0xff368983),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Adding",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Icon(
                      Icons.attach_file_outlined,
                      color: Colors.white,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
