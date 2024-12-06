import 'package:flutter/material.dart';

class AddDataScreen extends StatefulWidget {
  const AddDataScreen({super.key});

  @override
  State<AddDataScreen> createState() => _AddDataScreenState();
}

class _AddDataScreenState extends State<AddDataScreen> {
  ScrollController scrollController = ScrollController();
  TextEditingController txtNotes = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade200,
        title: const Text("Notes"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(height: 30),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please Write some Notes";
                  }
                  return null;
                },
                controller: txtNotes,
                decoration: const InputDecoration(
                  hintText: "Title",
                  hintStyle:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 500,
                child: TextFormField(
                  expands: true,
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.justify,
                  textInputAction: TextInputAction.done,
                  minLines: null,
                  maxLines: null,
                  cursorHeight: 35,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Description",
                    enabled: true,
                    hintStyle: TextStyle(fontSize: 35, color: Colors.black38),
                  ),
                ),
              ),
              const Spacer(),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.8,
                child: MaterialButton(
                  onPressed: () {},
                  color: Colors.yellow.shade400,
                  child: const Text(
                    "Save",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
