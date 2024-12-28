// import 'package:mailer/mailer.dart';
// import 'package:mailer/smtp_server.dart';
//
// Future<void> sendOrderEmail(String recipientEmail, String orderDetails) async {
//   final smtpServer = gmail('ghadaragab1717@gmail.com',
//       '1718ghada'); // استخدم بيانات الدخول الخاصة بك
//
//   final message = Message()
//     ..from = Address('ghadaragab1717@gmail.com', 'ghada') // استخدم بريدك الخاص
//     ..recipients.add(recipientEmail)
//     ..subject = 'New Order Placed!'
//     ..text = orderDetails;
//
//   try {
//     final sendReport = await send(message, smtpServer);
//     print('Message sent: ' + sendReport.toString());
//   } on MailerException catch (e) {
//     print('Message not sent. \n' + e.toString());
//   }
// }
