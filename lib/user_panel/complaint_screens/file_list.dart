import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class FileList extends StatefulWidget {
  final List<PlatformFile> files;
  final ValueChanged<PlatformFile> onOpenedFile;

  const FileList({Key? key, required this.files, required this.onOpenedFile})
      : super(key: key);

  @override
  State<FileList> createState() => _FileListState();
}

class _FileListState extends State<FileList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("File List"),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[
                  Color.fromARGB(226, 42, 123, 189),
                  Colors.blue
                ])),
          ),
        ),
        body: ListView.builder(
            itemCount: widget.files.length,
            itemBuilder: (context, index) {
              final files = widget.files[index];
              return buildListFile(files);
            }));
  }

  Widget buildListFile(PlatformFile files) {
    // ignore: prefer_typing_uninitialized_variables
    var file;
    return ListTile(
      title: Text('${file.name}'),
      subtitle: Text('${file.size}'),
      trailing: Text('${file.extention}'),
    );
  }
}
