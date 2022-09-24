import 'package:flutter/material.dart';

class NotificationModel {
  final String id;
  final String message;
  final String type;
  final String typeId;
  final MaterialColor color;
  final IconData icon;
  bool isNew;

  NotificationModel({
    required this.id,
    required this.message,
    required this.type,
    required this.typeId,
    required this.color,
    required this.icon,
    required this.isNew,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'].toString(),
      message: json['message'] ?? '',
      type: json['type'].toString(),
      typeId: json['type_id'].toString(),
      color: _getColor(json['type'].toString()),
      icon: _getIcon(json['type'].toString()),
      isNew: json['is_new'] != null ? json['is_new'] == '1' : true,
    );
  }

  static MaterialColor _getColor(String type) {
    switch (type) {
      case 'memo':
        return Colors.red;
      case 'car':
        return Colors.orange;
      case 'invoice':
        return Colors.green;
      case 'general':
        return Colors.cyan;
      default:
        return Colors.cyan;
    }
  }

  static IconData _getIcon(String type) {
    switch (type) {
      case 'memo':
        return Icons.error_rounded;
      case 'car':
        return Icons.car_crash_rounded;
      case 'invoice':
        return Icons.monetization_on_rounded;
      case 'general':
        return Icons.info_rounded;
      default:
        return Icons.info_rounded;
    }
  }
}
