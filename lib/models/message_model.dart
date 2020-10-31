
import 'package:petrescue/Profile/models/user_model.dart';
import 'package:petrescue/bloc/app_general/global.dart';
import 'package:petrescue/models/user.dart';
import 'package:petrescue/repository/data/user_list.dart';

class Message{
  final User sender;
  final String time;
  final String text;
  final bool unread;

  Message({this.sender, this.time, this.text, this.unread});
}

List<Message> chats = [
  Message(
      sender:  userList[0],
      text: 'XIn chao',
      time: '5:30 PM',
      unread: true
  ),

];

List<Message> messages = [
  Message(
    sender: userList[0],
    time: '5:30 PM',
    text: 'OK! Tôi sẽ gửi hình cho bạn ngay',
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '4:30 PM',
    text: 'Xin chào,bạn có thể cập nhật tình trạng chó bạn đã nhận nuôi trước đó không ? ',
    unread: true,
  ),

];