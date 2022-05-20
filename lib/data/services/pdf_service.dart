import 'dart:io';

import 'package:open_file/open_file.dart';
// import 'package:open_document/open_document.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart';

class PdfService {
  Future<File> saveDocument({
    required String name,
    required Document pdf,
  }) async {
    final bytes = await pdf.save();

    final dir = await getApplicationDocumentsDirectory();
    // final dir = await getTemporaryDirectory();

    // final file = File('${dir.path}/$name');
    // final file = await File(tempDocumentPath).create(recursive: true);
    final file = File.fromUri(Uri.parse('${dir.path}/$name'));

    file.writeAsBytesSync(bytes);
    // final isExist = await file.exists();
    // // file.writeAsStringSync(bytes);
    // final bool isExist = file.existsSync();
    // if (isExist) {
    //   print('File exists------------------>getLocalFile()');
    // } else {
    //   print('file does not exist---------->getLocalFile()');
    // }

    return file;
  }

  // Future openFile(File file) async {
  //   final url = file.path;

  //   return OpenDocument.openDocument(filePath: url);
  // }

  Future openFile(File file) async {
    final url = file.path;

    await OpenFile.open(url);
  }
}
