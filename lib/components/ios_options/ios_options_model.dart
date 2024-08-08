import '/flutter_flow/flutter_flow_util.dart';
import 'ios_options_widget.dart' show IosOptionsWidget;
import 'package:flutter/material.dart';

class IosOptionsModel extends FlutterFlowModel<IosOptionsWidget> {
  ///  State fields for stateful widgets in this component.

  bool isDataUploading = false;
  List<FFUploadedFile> uploadedLocalFiles = [];
  List<String> uploadedFileUrls = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
