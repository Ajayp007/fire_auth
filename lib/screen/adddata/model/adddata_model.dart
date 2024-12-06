import 'package:flutter/material.dart';

class AddDataModel {
  DateTime? date;
  TimeOfDay? time;
  String? notes, docId, id;

  AddDataModel({this.date, this.time, this.notes, this.docId, this.id});

  factory AddDataModel.mapToModel(Map m1) {
    return AddDataModel(
      date: m1['date'],
      time: m1['time'],
      notes: m1['notes'],
      docId: m1['docID'],
      id: m1['id'],
    );
  }

  Map<String, dynamic> modelToMap() {
    return {
      'date': date,
      'time': time,
      'notes': notes,
      'docId': docId,
      'id': id,
    };
  }
}
