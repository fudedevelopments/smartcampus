import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartcampus/model/newonduty.dart';
import 'package:smartcampus/utils/apicall.dart';
import 'package:smartcampus/utils/authservices.dart';
import 'package:smartcampus/utils/utils.dart';



class StatusCard extends StatelessWidget {
  final OnDutyModel onDutyModel;
  final String index;
  final AuthService authService = AuthService();

  StatusCard({
    super.key,
    required this.onDutyModel,
    required this.index,
  });

  String _getStatusText() {
    switch (index) {
      case "Proctor":
        return onDutyModel.proctorStatus.toUpperCase();
      case "Academic Coordinator":
        return onDutyModel.acStatus.toUpperCase();
      case "HOD":
        return onDutyModel.hodStatus.toUpperCase();
      default:
        return "PENDING";
    }
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case "APPROVED":
        return Colors.green;
      case "REJECTED":
        return Colors.red;
      default:
        return Colors.orange;
    }
  }

  @override
  Widget build(BuildContext context) {
    final status = _getStatusText();
    final statusColor = _getStatusColor(status);

    return GestureDetector(
      onTap: () async {
        // if (result == true) {
        //   final ondutyController = Get.find<OndutyController>();
        //   ondutyController.fetchData(
        //     tablename: "onDutyModel-2jskpek75veajd4yfnqjmkppmu-NONE",
        //     indexname: _getIndexName(index),
        //     token: authService.idToken!,
        //     limit: 5,
        //     partitionKey: _getPartitionKey(index),
        //     partitionKeyValue: authService.sub!,
        //   );
        // }
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.1),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      Icons.event_note_rounded,
                      color: Theme.of(context).primaryColor,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          onDutyModel.eventName,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          onDutyModel.details,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: statusColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      status,
                      style: TextStyle(
                        color: statusColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _buildInfoRow(
                    context,
                    Icons.person_outline_rounded,
                    onDutyModel.name,
                    onDutyModel.regNo,
                  ),
                  const SizedBox(height: 12),
                  _buildInfoRow(
                    context,
                    Icons.location_on_outlined,
                    onDutyModel.location,
                    onDutyModel.date,
                  ),
                  if (onDutyModel.validDocuments.isNotEmpty) ...[
                    const SizedBox(height: 12),
                    _buildAttachmentRow(context),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(
    BuildContext context,
    IconData icon,
    String title,
    String subtitle,
  ) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            size: 20,
            color: Theme.of(context).primaryColor,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAttachmentRow(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            Icons.attach_file_rounded,
            size: 20,
            color: Theme.of(context).primaryColor,
          ),
        ),
        const SizedBox(width: 12),
        Text(
          '${onDutyModel.validDocuments.length} attachment(s)',
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  String _getIndexName(String category) {
    switch (category) {
      case 'Academic Coordinator':
        return 'onDutyModelsByAcAndCreatedAt';
      case 'HOD':
        return 'onDutyModelsByHodAndCreatedAt';
      default:
        return 'onDutyModelsByProctorAndCreatedAt';
    }
  }

  String _getPartitionKey(String category) {
    switch (category) {
      case 'Academic Coordinator':
        return 'Ac';
      case 'HOD':
        return 'Hod';
      default:
        return 'Proctor';
    }
  }
}
