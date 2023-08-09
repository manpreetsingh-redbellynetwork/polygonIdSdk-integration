import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:polygonid_flutter_sdk/iden3comm/domain/entities/common/iden3_message_entity.dart';
import 'package:polygonid_flutter_sdk/identity/domain/entities/private_identity_entity.dart';
import 'package:polygonid_flutter_sdk/sdk/polygon_id_sdk.dart';
import 'package:polygonid_flutter_sdk_example/src/data/secure_storage.dart';
import 'package:polygonid_flutter_sdk_example/utils/secure_storage_keys.dart';

late PrivateIdentityEntity identity;
final sdk = PolygonIdSdk.I;

class TmpScreen extends StatefulWidget {
  const TmpScreen({super.key});

  @override
  State<TmpScreen> createState() => _TmpScreenState();
}

class _TmpScreenState extends State<TmpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PolygonID Flutter SDK Example'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Row(
            children: [
              SizedBox(
                height: 15,
              ),
            ],
          ),
          ElevatedButton(
              onPressed: () async {
                addIdentity();
              },
              child: const Text('generate identity')),
          ElevatedButton(
              onPressed: () async {
                await sdk.iden3comm.fetchAndSaveClaims(
                  message: await sdk.iden3comm.getIden3Message(
                      message: jsonEncode({
                    "id": "55f711c6-6264-4452-ab55-e34fac6e0f5a",
                    "typ": "application/iden3comm-plain-json",
                    "type":
                        "https://iden3-communication.io/credentials/1.0/offer",
                    "thid": "55f711c6-6264-4452-ab55-e34fac6e0f5a",
                    "body": {
                      "url":
                          "https://self-hosted-platform.polygonid.me/v1/agent",
                      "credentials": [
                        {
                          "id": "07b1b205-35b7-11ee-9b36-0242ac120006",
                          "description": "KYCAgeCredential"
                        }
                      ]
                    },
                    "from":
                        "did:polygonid:polygon:mumbai:2qLhNLVmoQS7pQtpMeKHDqkTcENBZUj1nkZiRNPGgV",
                    "to":
                        "did:polygonid:polygon:mumbai:2qGfh5zj9SMNhwA5zK9Mv5emGjRAuQbqs5MJs7MszT"
                  })),
                  genesisDid:
                      'did:polygonid:polygon:mumbai:2qKSecwhM1ayW7VMCVvAZnLH7fuWAePxFKjAEXstpn',
                  privateKey:
                      "428f5ad6b1c4b8950fe10f7a364600a25a6909980713acbbc743c7ff7f350419",
                );
              },
              child: const Text('authenticate')),
        ],
      ),
    );
  }
}

////////functions/////////------->>>>>>>.

Future<void> addIdentity() async {
  final sdk = PolygonIdSdk.I;
  identity = await sdk.identity.addIdentity();

  inspect(identity);
}
