import '/backend/backend.dart';
import '/components/messages/messages_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'chat_mobile_details_model.dart';
export 'chat_mobile_details_model.dart';

class ChatMobileDetailsWidget extends StatefulWidget {
  const ChatMobileDetailsWidget({
    super.key,
    this.chatListRef,
  });

  final ChatsListRecord? chatListRef;

  @override
  State<ChatMobileDetailsWidget> createState() =>
      _ChatMobileDetailsWidgetState();
}

class _ChatMobileDetailsWidgetState extends State<ChatMobileDetailsWidget> {
  late ChatMobileDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatMobileDetailsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: responsiveVisibility(
          context: context,
          tabletLandscape: false,
          desktop: false,
        )
            ? AppBar(
                backgroundColor:
                    FlutterFlowTheme.of(context).secondaryBackground,
                automaticallyImplyLeading: false,
                leading: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  borderWidth: 1.0,
                  buttonSize: 60.0,
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 30.0,
                  ),
                  onPressed: () async {
                    context.pop();
                  },
                ),
                title: Text(
                  'Chat Details',
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily: 'Figtree',
                        letterSpacing: 0.0,
                      ),
                ),
                actions: const [],
                centerTitle: false,
                elevation: 2.0,
              )
            : null,
        body: wrapWithModel(
          model: _model.messagesModel,
          updateCallback: () => setState(() {}),
          updateOnChange: true,
          child: MessagesWidget(
            chatListRef: widget.chatListRef,
          ),
        ),
      ),
    );
  }
}
