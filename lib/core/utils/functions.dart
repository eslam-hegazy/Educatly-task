import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

String formatMessageTime({required Timestamp timestamp}) {
  var dateTime = timestamp.toDate();
  return DateFormat('h:mm a').format(dateTime); // Format to "6 AM"
}
