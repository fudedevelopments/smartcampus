// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';

class FilePickerBoxUI extends StatefulWidget {
  final List<File> selectFiles;
  const FilePickerBoxUI({
    super.key,
    required this.selectFiles,
  });

  @override
  _FilePickerBoxUIState createState() => _FilePickerBoxUIState();
}

class _FilePickerBoxUIState extends State<FilePickerBoxUI> {
  Future<void> _pickFiles() async {
    const XTypeGroup fileTypeGroup = XTypeGroup(
      label: 'Documents',
      extensions: ['jpg', 'png', 'pdf', 'doc'],
    );
    final List<XFile> result = await openFiles(acceptedTypeGroups: [fileTypeGroup]);

    if (result.isNotEmpty) {
      setState(() {
        widget.selectFiles.addAll(result.map((xFile) => File(xFile.path)));
      });
    }
  }

  void _removeFile(int index) {
    setState(() {
      widget.selectFiles.removeAt(index);
    });
  }

  String _shortenFileName(String fileName, [int maxLength = 15]) {
    return (fileName.length > maxLength)
        ? '${fileName.substring(0, maxLength)}...'
        : fileName;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          height: 200,
          decoration: BoxDecoration(
            color: Colors.blue[50],
            border: Border.all(color: Colors.blue, width: 2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Expanded(
                child: widget.selectFiles.isEmpty
                    ? GestureDetector(
                        onTap: _pickFiles,
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.upload_file, size: 40, color: Colors.blue),
                            SizedBox(height: 10),
                            Text(
                              "Tap to select upload valid Documents",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.deepPurple,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Supported documents: PNG, JPG , PDF, DOC",
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.deepPurple,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        itemCount: widget.selectFiles.length,
                        itemBuilder: (context, index) {
                          File file = widget.selectFiles[index];
                          String fileName = file.path.split('/').last;
                          String shortenedFileName = _shortenFileName(fileName);
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    fileName.endsWith('.jpg') || fileName.endsWith('.png')
                                        ? Icons.image
                                        : Icons.insert_drive_file,
                                    size: 40,
                                    color: Colors.blue,
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    shortenedFileName,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.deepPurple,
                                    ),
                                  ),
                                ],
                              ),
                              IconButton(
                                icon: const Icon(Icons.cancel, color: Colors.red),
                                onPressed: () => _removeFile(index),
                              ),
                            ],
                          );
                        },
                      ),
              ),
              if (widget.selectFiles.isNotEmpty)
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    icon: const Icon(Icons.add_circle, color: Colors.deepPurple, size: 40),
                    onPressed: _pickFiles,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
