import 'package:flutter/material.dart';

class AccountsScreen extends StatefulWidget {
  const AccountsScreen({super.key});

  @override
  State<AccountsScreen> createState() => _AccountsScreenState();
}

class _AccountsScreenState extends State<AccountsScreen> {
  final List<Map<String, dynamic>> _transactions = [
    {
      'type': 'Fee Payment',
      'amount': -50000,
      'date': '2024-01-15',
      'status': 'Completed',
    },
    {
      'type': 'Scholarship',
      'amount': 25000,
      'date': '2024-01-10',
      'status': 'Credited',
    },
    {
      'type': 'Library Fine',
      'amount': -500,
      'date': '2024-01-05',
      'status': 'Pending',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accounts'),
        actions: [
          IconButton(
            icon: const Icon(Icons.receipt),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Fee receipt downloaded')),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: Theme.of(context).primaryColor,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Account Balance',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                    const Text(
                      '₹ 25,500',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Due Amount: ₹ 5,000',
                          style: TextStyle(color: Colors.white70),
                        ),
                        Text(
                          'Last Updated: ${DateTime.now().toString().substring(0, 10)}',
                          style: const TextStyle(color: Colors.white70),
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
                    onPressed: _showPaymentDialog,
                    icon: const Icon(Icons.payment),
                    label: const Text('Pay Fees'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: _showFeeStructure,
                    icon: const Icon(Icons.list_alt),
                    label: const Text('Fee Structure'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Recent Transactions',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: _transactions.length,
                itemBuilder: (context, index) {
                  final transaction = _transactions[index];
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: transaction['amount'] > 0 
                          ? Colors.green 
                          : Colors.red,
                        child: Icon(
                          transaction['amount'] > 0 
                            ? Icons.arrow_downward 
                            : Icons.arrow_upward,
                          color: Colors.white,
                        ),
                      ),
                      title: Text(transaction['type']),
                      subtitle: Text(transaction['date']),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '₹ ${transaction['amount'].abs()}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: transaction['amount'] > 0 
                                ? Colors.green 
                                : Colors.red,
                            ),
                          ),
                          Text(
                            transaction['status'],
                            style: TextStyle(
                              fontSize: 12,
                              color: transaction['status'] == 'Completed' 
                                ? Colors.green 
                                : Colors.orange,
                            ),
                          ),
                        ],
                      ),
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

  void _showPaymentDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Pay Fees'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Due Amount: ₹ 5,000'),
            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Amount',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
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
                const SnackBar(content: Text('Payment initiated successfully')),
              );
            },
            child: const Text('Pay Now'),
          ),
        ],
      ),
    );
  }

  void _showFeeStructure() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Fee Structure'),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Tuition Fee: ₹ 40,000'),
            Text('Lab Fee: ₹ 8,000'),
            Text('Library Fee: ₹ 2,000'),
            Text('Development Fee: ₹ 5,000'),
            Divider(),
            Text('Total: ₹ 55,000', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}