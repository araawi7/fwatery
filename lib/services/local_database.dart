import 'package:hive/hive.dart';

final database = Hive.box('database');

void addPdfToDatabase(String pdfUrl) {
  List<String> pdfUrls = database.get('pdf', defaultValue: []);
  if (!pdfUrls.contains(pdfUrl)) {
    pdfUrls.add(pdfUrl);
    database.put('pdf', pdfUrls);
  }
}

List<String> getAllPdfUrls() => database.get('pdf', defaultValue: <String>[]);
