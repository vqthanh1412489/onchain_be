

import 'package:cli/extensions/extensions.dart';
import 'package:cli/models/models.dart';

final List<MyTokenM> myTokens = [
  // MyTokenM(
  //   name: 'BLUR',
  //   chains: [
  //     AddressByChainM(
  //         eNetwork: ENetwork.Ethereum,
  //         address: '0x5283d291dbcf85356a21ba090e6db59121208b44'),
  //   ],
  //   minBalance: 5000,
  // ),
  // MyTokenM(
  //   name: 'SUSHI',
  //   chains: [
  //     AddressByChainM(
  //         eNetwork: ENetwork.Ethereum,
  //         address: '0x6b3595068778dd592e39a122f4f5a5cf09c90fe2'),
  //     AddressByChainM(
  //         eNetwork: ENetwork.Polygon,
  //         address: '0x0b3f868e0be5597d5db7feb59e1cadbb0fdda50a'),
  //   ],
  //   minBalance: 200000,
  // ),
  MyTokenM(
    name: 'USDT',
    chains: [
      AddressByChainM(
          eNetwork: ENetwork.Ethereum,
          address: '0xdac17f958d2ee523a2206206994597c13d831ec7'),
      AddressByChainM(
          eNetwork: ENetwork.Avalanche,
          address: '0x9702230a8ea53601f5cd2dc00fdbc13d4df4a8c7'),
      AddressByChainM(
          eNetwork: ENetwork.Tron,
          address: 'TR7NHqjeKQxGTCi8q8ZY4pL8otSzgjLj6t')
    ],
    minBalance: 50000000,
  ),
  MyTokenM(
    name: 'USDC',
    chains: [
      AddressByChainM(
          eNetwork: ENetwork.Ethereum,
          address: '0xa0b86991c6218b36c1d19d4a2e9eb0ce3606eb48'),
      AddressByChainM(
          eNetwork: ENetwork.ArbitrumOne,
          address: '0xaf88d065e77c8cc2239327c5edb3a432268e5831'),
      AddressByChainM(
          eNetwork: ENetwork.Avalanche,
          address: '0xb97ef9ef8734c71904d8002f8b6bc66dd9c48a6e'),
      AddressByChainM(
          eNetwork: ENetwork.Base,
          address: '0x833589fcd6edb6e08f4c7c32d4f71b54bda02913'),
      AddressByChainM(
          eNetwork: ENetwork.Polygon,
          address: '0x3c499c542cef5e3811e1192ce70d8cc03d5c3359'),
      AddressByChainM(
          eNetwork: ENetwork.Optimism,
          address: '0x0b2c639c533813f4aa9d7837caf62653d097ff85'),
      AddressByChainM(
          eNetwork: ENetwork.Tron,
          address: 'TEkxiTehnzSmSe2XqrBj4w32RUN966rdz8'),
    ],
    minBalance: 10000000,
  ),
  MyTokenM(
    name: 'FDUSD',
    chains: [
      AddressByChainM(
          eNetwork: ENetwork.Ethereum,
          address: '0xc5f0f7b66764f6ec8c8dff7ba683102295e16409'),
      AddressByChainM(
          eNetwork: ENetwork.BSC,
          address: '0xc5f0f7b66764f6ec8c8dff7ba683102295e16409'),
    ],
    minBalance: 10000000,
  ),
  MyTokenM(
    name: 'APE',
    chains: [
      AddressByChainM(
          eNetwork: ENetwork.Ethereum,
          address: '0x4d224452801aced8b2f0aebe155379bb5d594381'),
      AddressByChainM(
          eNetwork: ENetwork.Polygon,
          address: '0xb7b31a6bc18e48888545ce79e83e06003be70930'),
    ],
    minBalance: 30000,
  ),
  MyTokenM(
    name: 'HOOK',
    chains: [
      AddressByChainM(
          eNetwork: ENetwork.BSC,
          address: '0xa260e12d2b924cb899ae80bb58123ac3fee1e2f0'),
    ],
    minBalance: 20000,
  ),
  MyTokenM(
    name: 'C98',
    chains: [
      AddressByChainM(
          eNetwork: ENetwork.Ethereum,
          address: '0xae12c5930881c53715b369cec7606b70d8eb229f'),
      AddressByChainM(
          eNetwork: ENetwork.BSC,
          address: '0xaec945e04baf28b135fa7c640f624f8d90f1c3a6'),
      AddressByChainM(
          eNetwork: ENetwork.Polygon,
          address: '0x77f56cf9365955486b12c4816992388ee8606f0e'),
    ],
    minBalance: 100000,
  ),
  MyTokenM(
    name: 'RPL',
    chains: [
      AddressByChainM(
          eNetwork: ENetwork.Ethereum,
          address: '0xd33526068d116ce69f19a9ee46f0bd304f21a51f'),
      AddressByChainM(
          eNetwork: ENetwork.Polygon,
          address: '0x7205705771547cf79201111b4bd8aaf29467b9ec'),
      AddressByChainM(
          eNetwork: ENetwork.ArbitrumOne,
          address: '0xb766039cc6db368759c1e56b79affe831d0cc507'),
    ],
    minBalance: 5000,
  ),
  MyTokenM(
    name: 'MEME',
    chains: [
      AddressByChainM(
          eNetwork: ENetwork.Ethereum,
          address: '0xb131f4a55907b10d1f0a50d8ab8fa09ec342cd74'),
    ],
    minBalance: 500000,
  ),
  MyTokenM(
    name: 'PDA',
    chains: [
      AddressByChainM(
          eNetwork: ENetwork.Ethereum,
          address: '0x0d3cbed3f69ee050668adf3d9ea57241cba33a2b'),
    ],
    minBalance: 5000,
  ),
  MyTokenM(
    name: 'MAVIA',
    chains: [
      AddressByChainM(
          eNetwork: ENetwork.Ethereum,
          address: '0x24fcfc492c1393274b6bcd568ac9e225bec93584'),
      AddressByChainM(
          eNetwork: ENetwork.Base,
          address: '0x24fcfc492c1393274b6bcd568ac9e225bec93584'),
    ],
    minBalance: 1000,
  ),
  MyTokenM(
    name: 'CRV',
    chains: [
      AddressByChainM(
          eNetwork: ENetwork.Ethereum,
          address: '0xd533a949740bb3306d119cc777fa900ba034cd52'),
      AddressByChainM(
          eNetwork: ENetwork.ArbitrumOne,
          address: '0x11cdb42b0eb46d95f990bedd4695a6e3fa034978'),
      AddressByChainM(
          eNetwork: ENetwork.Polygon,
          address: '0x172370d5cd63279efa6d502dab29171933a610af'),
      AddressByChainM(
          eNetwork: ENetwork.Optimism,
          address: '0x0994206dfe8de6ec6920ff4d779b0d950605fb53'),
    ],
    minBalance: 50000,
  ),
  MyTokenM(
    name: 'ARB',
    chains: [
      AddressByChainM(
          eNetwork: ENetwork.Ethereum,
          address: '0xb50721bcf8d664c30412cfbc6cf7a15145234ad1'),
      AddressByChainM(
          eNetwork: ENetwork.ArbitrumOne,
          address: '0x912ce59144191c1204e64559fe8253a0e49e6548'),
    ],
    minBalance: 100000,
  ),
  MyTokenM(
    name: 'WLD',
    chains: [
      AddressByChainM(
          eNetwork: ENetwork.Ethereum,
          address: '0x163f8c2467924be0ae7b5347228cabf260318753'),
      AddressByChainM(
          eNetwork: ENetwork.Optimism,
          address: '0xdc6ff44d5d932cbd77b52e5612ba0529dc6226f1'),
    ],
    minBalance: 5000,
  ),
  // solana
  // MyTokenM(
  //   name: 'GMT',
  //   chains: [
  //     AddressByChainM(
  //         eNetwork: ENetwork.Ethereum,
  //         address: '0xe3c408bd53c31c085a1746af401a4042954ff740'),
  //     AddressByChainM(
  //         eNetwork: ENetwork.BSC,
  //         address: '0x3019bf2a2ef8040c242c9a4c5c4bd4c81678b2a1'),
  //     AddressByChainM(
  //         eNetwork: ENetwork.Polygon,
  //         address: '0x714db550b574b3e927af3d93e26127d15721d4c2'),
  //   ],
  //   minBalance: 250000, // 0,365
  // ),
  // MyTokenM(
  //   name: 'BAT',
  //   chains: [
  //     AddressByChainM(
  //         eNetwork: ENetwork.Ethereum,
  //         address: '0x0d8775f648430679a709e98d2b0cb6250d2887ef'),
  //     AddressByChainM(
  //         eNetwork: ENetwork.Polygon,
  //         address: '0x3cef98bb43d732e2f285ee605a8158cde967d219'),
  //   ],
  //   minBalance: 300000, // 0,327
  // ),
  // MyTokenM(
  //   name: 'ENJ',
  //   chains: [
  //     AddressByChainM(
  //         eNetwork: ENetwork.Ethereum,
  //         address: '0xf629cbd94d3791c9250152bd8dfbdf380e2a3b9c'),
  //   ],
  //   minBalance: 230000, // 0,4
  // ),
  // MyTokenM(
  //   name: '1INCH',
  //   chains: [
  //     AddressByChainM(
  //         eNetwork: ENetwork.Ethereum,
  //         address: '0x111111111117dc0aa78b770fa6a738034120c302'),
  //     AddressByChainM(
  //         eNetwork: ENetwork.BSC,
  //         address: '0x111111111117dc0aa78b770fa6a738034120c302'),
  //   ],
  //   minBalance: 120000, // 0,6
  // ),
  // MyTokenM(
  //   name: 'SNX',
  //   chains: [
  //     AddressByChainM(
  //         eNetwork: ENetwork.Ethereum,
  //         address: '0xc011a73ee8576fb46f5e1c5751ca3b9fe0af2a6f'),
  //     AddressByChainM(
  //         eNetwork: ENetwork.Avalanche,
  //         address: '0xbec243c995409e6520d7c41e404da5deba4b209b'),
  //     AddressByChainM(
  //         eNetwork: ENetwork.Optimism,
  //         address: '0x8700daec35af8ff88c16bdf0418774cb3d7599b4'),
  //     AddressByChainM(
  //         eNetwork: ENetwork.Polygon,
  //         address: '0x50b728d8d964fd00c2d0aad81718b71311fef68a'),
  //   ],
  //   minBalance: 100000,
  // ),
];
