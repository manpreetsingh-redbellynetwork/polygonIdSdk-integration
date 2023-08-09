import 'dart:convert';

import 'package:envied/envied.dart';

// part 'env.g.dart';

@Envied()
abstract class Env {
  @EnviedField(varName: 'ENV_POLYGON_MUMBAI')

  // static const String polygonMumbai = _Env.polygonMumbai;
  static String polygonMumbai = jsonEncode({
    "blockchain": "polygon",
    "network": "mumbai",
    "web3Url": "https://polygon-mumbai.infura.io/v3/",
    "web3RdpUrl": "wss://polygon-mumbai.infura.io/v3/",
    "web3ApiKey": "YOUR_WEB3_API_KEY",
    "idStateContract": "0x134B1BE34911E39A8397ec6289782989729807a4",
    "ipfsUrl":
        "https://[YOUR-IPFS-API-KEY]:[YOUR-IPFS-API-KEY-SECRET]@ipfs.infura.io:5001",
    "pushUrl": "https://push-staging.polygonid.com/api/v1"
  });

  @EnviedField(varName: 'ENV_POLYGON_MAINNET')
  //static const String polygonMainnet = _Env.polygonMainnet;
  static String polygonMainnet = jsonEncode({
    "blockchain": "polygon",
    "network": "main",
    "web3Url": "https://polygon-mainnet.infura.io/v3/",
    "web3RdpUrl": "wss://polygon-mainnet.infura.io/v3/",
    "web3ApiKey": "YOUR_WEB3_API_KEY",
    "idStateContract": "0x624ce98D2d27b20b8f8d521723Df8fC4db71D79D",
    "ipfsUrl":
        "https://[YOUR-IPFS-API-KEY]:[YOUR-IPFS-API-KEY-SECRET]@ipfs.infura.io:5001",
    "pushUrl": "https://push-staging.polygonid.com/api/v1"
  });
}
