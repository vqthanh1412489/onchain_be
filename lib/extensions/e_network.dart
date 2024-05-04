enum ENetwork {
  Ethereum,
  Polygon,
  BSC,
  Avalanche,
  ArbitrumOne,
  Optimism,
  Base,
  // zkSync,
  Tron,
}

Map<ENetwork, dynamic> mapENetworkToChainbaseProvider = {
  ENetwork.Ethereum: 1,
  ENetwork.BSC: 56,
  ENetwork.Polygon: 137,
  ENetwork.Avalanche: 43114,
  ENetwork.ArbitrumOne: 42161,
  ENetwork.Optimism: 10,
  ENetwork.Base: 8453,
  ENetwork.Tron: 0,
};

Map<ENetwork, dynamic> mapENetworkToCovalentProvider = {
  ENetwork.Ethereum: 'eth-mainnet',
  ENetwork.BSC: 'bsc-mainnet',
  ENetwork.Polygon: 'matic-mainnet',
  ENetwork.Avalanche: 'avalanche-mainnet',
  ENetwork.ArbitrumOne: 'arbitrum-mainnet',
  ENetwork.Optimism: 'optimism-mainnet',
  ENetwork.Base: 'base-mainnet',
  ENetwork.Tron: '0',
};

// extension ENetworkExtension on ENetwork {
//   int get value {
//     switch (this) {
//       case ENetwork.Ethereum:
//         return 1;
//       case ENetwork.Polygon:
//         return 137;
//       case ENetwork.BSC:
//         return 56;
//       case ENetwork.Avalanche:
//         return 43114;
//       case ENetwork.ArbitrumOne:
//         return 42161;
//       case ENetwork.Optimism:
//         return 10;
//       case ENetwork.Base:
//         return 8453;
//       // case ENetwork.zkSync:
//       //   return 324;
//       case ENetwork.Tron:
//         return 0;
//       default:
//         throw Exception("Invalid CryptoNetwork");
//     }
//   }
// }
