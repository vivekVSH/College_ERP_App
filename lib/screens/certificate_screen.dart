import 'package:flutter/material.dart';

class CertificateScreen extends StatefulWidget {
  const CertificateScreen({super.key});

  @override
  State<CertificateScreen> createState() => _CertificateScreenState();
}

class _CertificateScreenState extends State<CertificateScreen> {
  final List<Map<String, dynamic>> _certificates = [
    {
      'name': 'Degree Certificate',
      'type': 'Academic',
      'status': 'Available',
      'issueDate': '2023-06-15',
      'validUntil': 'Lifetime',
    },
    {
      'name': 'Character Certificate',
      'type': 'Conduct',
      'status': 'Available',
      'issueDate': '2023-06-10',
      'validUntil': 'Lifetime',
    },
    {
      'name': 'Transfer Certificate',
      'type': 'Academic',
      'status': 'Processing',
      'issueDate': null,
      'validUntil': 'Lifetime',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Certificates'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: Theme.of(context).primaryColor,
              child: const Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    Icon(Icons.card_membership, color: Colors.white, size: 40),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Digital Certificates',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Secure & Verifiable',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: _showRequestDialog,
                    icon: const Icon(Icons.add),
                    label: const Text('Request Certificate'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: _showVerifyDialog,
                    icon: const Icon(Icons.verified),
                    label: const Text('Verify Certificate'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'My Certificates',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _certificates.length,
                itemBuilder: (context, index) {
                  final certificate = _certificates[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: _getStatusColor(certificate['status']),
                        child: const Icon(
                          Icons.card_membership,
                          color: Colors.white,
                        ),
                      ),
                      title: Text(
                        certificate['name'],
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Type: ${certificate['type']}'),
                          if (certificate['issueDate'] != null)
                            Text('Issued: ${certificate['issueDate']}'),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: _getStatusColor(certificate['status']),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              certificate['status'],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                      trailing: certificate['status'] == 'Available'
                          ? IconButton(
                              icon: const Icon(Icons.download),
                              onPressed: () => _downloadCertificate(certificate),
                            )
                          : const Icon(Icons.schedule),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'available':
        return Colors.green;
      case 'processing':
        return Colors.orange;
      case 'rejected':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  void _showRequestDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Request Certificate'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: 'Certificate Type',
                border: OutlineInputBorder(),
              ),
              items: [
                'Degree Certificate',
                'Character Certificate',
                'Transfer Certificate',
                'Bonafide Certificate',
              ].map((cert) => DropdownMenuItem(
                value: cert,
                child: Text(cert),
              )).toList(),
              onChanged: (value) {},
            ),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Purpose',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Certificate request submitted')),
              );
            },
            child: const Text('Request'),
          ),
        ],
      ),
    );
  }

  void _showVerifyDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Verify Certificate'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: 'Certificate ID',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Certificate verified successfully')),
                );
              },
              icon: const Icon(Icons.qr_code_scanner),
              label: const Text('Scan QR Code'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Certificate verified')),
              );
            },
            child: const Text('Verify'),
          ),
        ],
      ),
    );
  }

  void _downloadCertificate(Map<String, dynamic> certificate) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${certificate['name']} downloaded successfully'),
        action: SnackBarAction(
          label: 'Open',
          onPressed: () {},
        ),
      ),
    );
  }
}