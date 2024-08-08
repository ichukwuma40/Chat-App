import '/components/messages/messages_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'chat_mobile_details_widget.dart' show ChatMobileDetailsWidget;
import 'package:flutter/material.dart';

class ChatMobileDetailsModel extends FlutterFlowModel<ChatMobileDetailsWidget> {
  ///  Local state fields for this page.

  bool showTime = false;

  bool showOtherTime = false;

  ///  State fields for stateful widgets in this page.

  // Model for messages component.
  late MessagesModel messagesModel;

  @override
  void initState(BuildContext context) {
    messagesModel = createModel(context, () => MessagesModel());
  }

  @override
  void dispose() {
    messagesModel.dispose();
  }
}
