import 'package:flutter/material.dart';

class IvgDetail extends StatelessWidget {
  final String indicativo;
  final String modo;
  final String qrg;
  final String tone;
  final String avatar;

  // ignore: use_key_in_widget_constructors
  const IvgDetail({
    required this.avatar,
    required this.indicativo,
    required this.modo,
    required this.qrg,
    required this.tone,
  }) : super();

  @override
  Widget build(BuildContext context) {
    String frequency;
    if (tone == '-') {
      frequency = 'QRG ' + qrg;
    } else {
      frequency = 'QRG ' + qrg + ' - ' + tone;
    }

    String network;

    switch (modo) {
      case 'BM-DMR':
        {
          network = 'BrandMeinster Brazil';
        }
        break;

      case 'MS-DMR':
        {
          network = 'DMR Master Sul';
        }
        break;

      case 'Fusion-C4FM':
        {
          network = 'Fusion-C4FM';
        }
        break;

      case 'D-Star':
        {
          network = 'D-Star';
        }
        break;

      case 'Outro':
        {
          network = 'Outro';
        }
        break;

      default:
        {
          network = 'Analógica';
        }
        break;
    }

    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(avatar),
        radius: 30,
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            indicativo,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          Text(
            frequency,
            style: const TextStyle(fontSize: 14),
          ),
          const Divider(height: 7.0, color: Colors.teal),
          Text(
            network,
            style: const TextStyle(fontSize: 9),
          ),
        ],
      ),
      trailing: Text(modo),
    );
  }
}
