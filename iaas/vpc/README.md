# VPC

## トンネリングプロトコル

- VXLANを利用する
- なぜVXLANか？
  - みんなが使ってるは正義
  - UDPによる実装なので5tuppleによるRSSのバランシングが期待できる
  - NICのオフロードが期待できる

## 用語
- VPC: テナント専用のネットワーク空間
- AZCluster: AZごとの管理システム
- VPCGW: VPCのデフォルトゲートウェイ相当（VPC外との通信や、VPC内でもルートが不明な場合はこれを利用する）
- VPCLB: VPC内でのLB（VIPにVMをメンバとして紐づけて利用する）
- VPCIP: VPC内でのVMのIPのこと
- VPCVIP: VPC内でのVIPのこと
- TUNVIP: VIPごとに割り当てられたVTEP用のIPのこと
- TUNHVIP: HVのVTEP用のIPのこと
- TUNGWIP: GWのVTEP用のIPのこと（同じVPCShardのGWは同じTUNGWIPを持ちます）


## 参考

- https://www.usenix.org/system/files/conference/nsdi18/nsdi18-dalton.pdf