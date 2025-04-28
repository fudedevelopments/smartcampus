// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';
import 'package:aws_common/vm.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:uuid/uuid.dart';

class FilePickerBoxUI extends StatefulWidget {
  final List<File> selectfiles;
  final Function(List<Map<String, String>>) onFilesUpdated;
  const FilePickerBoxUI({
    super.key,
    required this.selectfiles,
    required this.onFilesUpdated,
  });

  @override
  _FilePickerBoxUIState createState() => _FilePickerBoxUIState();
}

class _FilePickerBoxUIState extends State<FilePickerBoxUI> {
  List<Map<String, String>> uploadedFiles = [];
  Map<String, bool> uploadingStatus = {};
  Map<String, bool> uploadError = {};

  Future<void> _pickFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'pdf', 'doc'],
      allowMultiple: true,
    );

    if (result != null) {
      List<File> newFiles = result.paths.map((path) => File(path!)).toList();
      setState(() {
        widget.selectfiles.addAll(newFiles);
        for (var file in newFiles) {
          uploadingStatus[file.path] = true;
          uploadError[file.path] = false;
        }
      });
      for (var file in newFiles) {
        await _uploadFile(file);
      }
    }
  }

  Future<void> _uploadFile(File file) async {
    try {
      String fileName = file.path.split('/').last; // Extract file name
      String fileExtension = fileName.split('.').last; // Extract file extension
      String uniqueFileName =
          '${const Uuid().v4()}.$fileExtension'; // Unique name with extension

      final result = await Amplify.Storage.uploadFile(
        localFile: AWSFilePlatform.fromFile(file),
        path: StoragePath.fromString(
            'ondutydocs/$uniqueFileName'), // Preserve extension
      ).result;

      setState(() {
        uploadedFiles.add({
          'path': file.path,
          'url': result.uploadedItem.path,
        });
        uploadingStatus[file.path] = false;
        uploadError[file.path] = false;
      });
      widget.onFilesUpdated(uploadedFiles);
    } catch (e) {
      setState(() {
        uploadingStatus[file.path] = false;
        uploadError[file.path] = true;
      });
      print('Upload failed: $e');
    }
  }

  Future<void> _removeFile(int index) async {
    String? filePath = uploadedFiles[index]['url'];
    if (filePath != null) {
      try {
        await Amplify.Storage.remove(
          path: StoragePath.fromString(filePath),
        ).result;
      } catch (e) {
        print('Delete failed: $e');
      }
    }
    setState(() {
      String removedFilePath = widget.selectfiles[index].path;
      widget.selectfiles.removeAt(index);
      uploadedFiles.removeWhere((file) => file['path'] == removedFilePath);
      uploadingStatus.remove(removedFilePath);
      uploadError.remove(removedFilePath);
    });
    widget.onFilesUpdated(uploadedFiles);
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
            color: Colors.blueAccent[50],
            border: Border.all(color: Colors.blueAccent.shade200, width: 2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Expanded(
                child: widget.selectfiles.isEmpty
                    ? GestureDetector(
                        onTap: _pickFiles,
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.upload_file,
                                size: 40, color: Colors.blueAccent),
                            SizedBox(height: 10),
                            Text(
                              "Tap to select upload Poster or Images",
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
                        itemCount: widget.selectfiles.length,
                        itemBuilder: (context, index) {
                          File file = widget.selectfiles[index];
                          String fileName = file.path.split('/').last;
                          String shortenedFileName = _shortenFileName(fileName);
                          bool isUploading =
                              uploadingStatus[file.path] ?? false;
                          bool isError = uploadError[file.path] ?? false;
                          bool isUploaded =
                              uploadedFiles.any((f) => f['path'] == file.path);
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    fileName.endsWith('.jpg') ||
                                            fileName.endsWith('.png')
                                        ? Icons.image
                                        : Icons.insert_drive_file,
                                    size: 40,
                                    color: Colors.blueAccent,
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    shortenedFileName,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.blueAccent,
                                    ),
                                  ),
                                  if (isUploading)
                                    const SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: CircularProgressIndicator(
                                          strokeWidth: 2),
                                    ),
                                  if (isUploaded)
                                    const Icon(Icons.check_circle,
                                        color: Colors.green),
                                  if (isError)
                                    const Icon(Icons.error, color: Colors.red),
                                ],
                              ),
                              IconButton(
                                icon:
                                    const Icon(Icons.cancel, color: Colors.red),
                                onPressed: () => _removeFile(index),
                              ),
                            ],
                          );
                        },
                      ),
              ),
              if (widget.selectfiles.isNotEmpty)
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    icon: const Icon(Icons.add_circle,
                        color: Colors.blueAccent, size: 40),
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
