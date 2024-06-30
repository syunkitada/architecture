# SAML

- mod_auth_mellonの設定に必要なもの
    - アイデンティティープロバイダー (IdP) エンティティー記述子 XML ファイル
        - SAML IdP への接続を記述します。
    - セキュリティー保護するアプリケーションの SAML 接続および設定を記述する SP エンティティー記述子 XML ファイル。
    - 秘密鍵 PEM ファイル。
        - これは、アプリケーションがドキュメントの署名に使用するプライベートキーを定義する PEM 形式のテキストファイルです。
    - アプリケーションの証明書を定義するテキストファイルである証明書 PEM ファイル。

SAML IdP および SP は、XML 形式の SAML メタデータを交換します。メタデータのスキーマは標準であるため、参加している SAML エンティティが互いのメタデータを消費できるようにします。以下が必要です。

SP が使用する IdP のメタデータ
IdP に提供された SP を記述するメタデータ


SAML メタデータのコンポーネントの 1 つは X509 証明書です。これらの証明書は 2 つの目的で使用されます。

SAML メッセージを署名し、メッセージが予期されたパーティーから発信されたことを受信側が証明できるようにします。
トランスポート中にメッセージを暗号化します (SAML メッセージは通常 TLS で保護されているトランスポートで発生するため、ほとんど使用されません)。


- 参考
    - [RedHat: 3.2. Apache HTTPD モジュール mod_auth_mellon](https://access.redhat.com/documentation/ja-jp/red_hat_single_sign-on/7.4/html/securing_applications_and_services_guide/_mod_auth_mellon)