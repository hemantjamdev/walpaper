import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'local_storage.g.dart';

@HiveType(typeId: 0)
class FavModel extends HiveObject {
  @HiveField(0)
  String? uid;
  @HiveField(1)
  String? imageUrl;

  @HiveField(2)
  DateTime? added;

  FavModel(this.uid,this.imageUrl, this.added);
}
