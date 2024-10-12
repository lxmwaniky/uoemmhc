import 'package:flutter/material.dart';
import 'package:uoemmhc/models/peer_counsellor.dart';
import 'package:url_launcher/url_launcher.dart';

class PeerCounselorPage extends StatelessWidget {
  final List<PeerCounselor> counselors = [
    PeerCounselor(
      name: 'John Doe',
      bio: 'Experienced counselor with a passion for mental health.',
      imageUrl: 'https://via.placeholder.com/150', // Replace with real image URLs
      contact: '254701343452', // Correct international format
    ),
    PeerCounselor(
      name: 'Jane Smith',
      bio: 'Specialist in youth mental health and counseling.',
      imageUrl: 'https://via.placeholder.com/150',
      contact: '254701343452', // Correct international format
    ),
    // Add more counselors here
  ];

  Future<void> _openWhatsApp(String contact) async {
    final Uri whatsappUrl = Uri.parse('https://wa.me/$contact');
    
    // Check if the URL can be launched
    if (await canLaunchUrl(whatsappUrl)) {
      // Try launching WhatsApp
      final bool launched = await launchUrl(
        whatsappUrl,
        mode: LaunchMode.externalApplication,
      );
      if (!launched) {
        // Error handling if WhatsApp cannot be opened
        throw 'Could not launch WhatsApp. Ensure WhatsApp is installed.';
      }
    } else {
      throw 'Could not open WhatsApp URL. Check the contact number.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Peer Counselors')),
      body: ListView.builder(
        itemCount: counselors.length,
        itemBuilder: (context, index) {
          final counselor = counselors[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(counselor.imageUrl),
            ),
            title: Text(counselor.name),
            subtitle: Text(counselor.bio),
            trailing: IconButton(
              icon: const Icon(Icons.message),
              onPressed: () => _openWhatsApp(counselor.contact),
            ),
          );
        },
      ),
    );
  }
}
