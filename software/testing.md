# Testing

- テストについての考え方など

## Static Tests

- Lint チェックや、型チェックなどの静的解析ツールを利用したテストのこと

## Unit Test

- モジュール単体をテストする手法
- あるモジュールが、複数のモジュールに依存しており、それらをまとめてテストするような場合も UnitTest である
  - 依存先のモジュールはそれはそれで UnitTest をする
  - 依存先のモジュールは必要に応じて Mock 化されてテストされる

## Integration Test

- モジュールを組み合わせてテストする手法
  - モジュールを二つ組み合わせる場合もあるし、十個以上組み合わせる場合もある
  - API 単位などのある程度のまとまりでテストする
  - 目的に応じていくつかの種類がある
    - FunctionalTest
      - 機能にフォーカスしてテストする
      - API であれば、API が意図した挙動をするかをテストする
      - Mock ではなく、実際に DB や外部依存の API を使う

## End-to-End Test

- API 個々や DB 個々でコンポーネントごとでテストするのではなく、そのシステムのすべてのコンポーネントをまとめてテストする
- 実際に動かしてのシナリオベースのテストとなる
  - テストが失敗したときに問題を特定しずらいので、うまくエラーをトレースできる仕組みがあると良い

## テストをどこまで実施すべきか？

- Static, Unit, Integration, End-to-End の順で、導入コストは高くなり、費用対効果は低くなる
  - どこまでやるかは、目標とする品質と、それにかけることのできるコストしだい
- Static Tests は、（テストコードを書く必要がないので）導入コストがとても低く、最低限これだけでもやるとよい
- Unit Test もなるべくやるとよいが、Integration Test もやるのであれば、すべてをきっちりやる必要はない
  - 細かいエラーハンドリングのテストは Integration Test ではやりずらい部分があるので、ある程度はやるべき
  - コードカバレッジのスフィートスポットは 80%程度だといわれてるが、使用する言語やプロジェクトによって異なるので、80%にみたないからダメというわけではない
- Integration Test は、Unit Test をある程度やっていれば、必ずしも必要ではない
  - 外部に依存する DB や API がない場合は、Unit Test だけである程度動作を保証できる
  - 外部に依存があり DB を扱う Unit テストで Mock を使ってる場合は、Integration Test で DB へのクエリなどが正常に処理されるかまで見るとよい
- End-to-End は、導入コストが高いうえに、Integration Test までである程度の品質が保証されてるので、ここまでやるケースは少ない
  - そのシステムの利用ユーザー数が圧倒的に多かったり、影響範囲が大きい場合は、ここまでやる価値がある
  - マイクロサービス郡を組み合わせた大規模なシステムなどでは、Integration Test では不十分な場合があり、End-to-End までやることがある
  - End-to-End はシナリオベースなので大雑把に動作を保証するだけなので、それよりも Unit Test, Integration Test をしっかりやるとよい

## 開発の進め方

- テスト駆動開発(TDD)よりもまずはプロトタイプを作る
  - 初めから設計がきっちりできれば TDD をしてもよいが、まずは動くものを作って全体のイメージを作る
  - 規模が大きくなりすぎないうちに、機能が確定したところからテストを書いていく
  - あらかじめ機能が確定してるなら、先にテストを書くとよい