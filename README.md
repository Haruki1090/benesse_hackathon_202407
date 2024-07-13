# benesse_hackathon_202407

**Benesseハッカソン 2024_07**

## テーマ
```
中高生の学習を促進するような次世代のアプリを考え、開発せよ
```

## エンドユーザー
```
宿題を「忘れてしまう」高一 野球部
```
### エンドユーザーの課題
```
野球部の忙しさの中で宿題を忘れてしまうこと。
```

### 課題の解決目標
```
忙しい日常の中でも、宿題を忘れずに計画的に取り組めるようになること。ただ部活にも打ち込みたい！（制限したり、勉強一本！の提案はしない）
```

## サービス概要
### コミュニティ単位で助け合いと意欲の高め合いを促すアプリ
```
< リマインダー >
宿題の締め切りや予定に合わせて、自動的にリマインダーを設定する機能。
ユーザーが宿題を登録すると、自動的に部活や授業のスケジュールを考慮してリマインダーを設定。
```
```
< 進捗トラッキング >
コミュニティ単位で宿題の進捗を視覚的に確認できるダッシュボード。
→ 一目で進捗状況を把握でき、達成感を得やすい
→ 他の人の進捗をTLで流すことで自分もやらなきゃ感を演出
```
```
< クラス（部活）連携カレンダー >
クラス（部活）のスケジュール（大会、模試なども）を自動で取り込んで学習時間を提案。
```
### ポイント
- `特定のコミュニティ`を前提とし、ユーザー数の大幅獲得に繋げる
- 受験生も対応はできるが、ターゲットの大きい高１〜高２の`部活世代に注目`
- 生活サイクルに対応する

### 中間FB
```
進捗トラッキングについてどう実装し表現する？
```

### 利用者のメリットの特定
- 特定コミュニティに区切ることで、ユーザーにとって最も短な空間で利用していることを体験でき、アプリへの積極性を生み出すことができる。（不特定でのコミュニティでよくありがちな`見る専`などがない）
- 勉強一本のようなコンセプトではなく、所属しているコミュニティー（部活）などを大切にしながら実現できそうなアプリサービスであることで、ユーザーのハードルや飽きという概念を排除できるので長く利用されやすい。
- 同じコミュニティーのメンバーが宿題登録をしてくれればそれで全員分作成されるため便利。

### 想定される問題
- 誰が登録するか問題に当たりそう（重複を許すかどうか、、、）

## 開発環境
|環境項目|詳細|
|-|-|
|エディター|Android Studio|
|メインシュミレーター|iPhone15 (iOS17.5)|
|言語|Dart|
|フレームワーク|Flutter|
|状態管理|Riverpod|
|データベース|Firebase Firestore|

## データ構造
### ユーザーデータ
|項目|型|
|-|-|
|学校名|String|
|部活|String|
|ユーザー名|String|
|学年|Int|

### 宿題
|項目|型|
|-|-|
|授業クラス|String|
|教材名|String|
|締切日|DateTime|
|セクション数|Int|
|範囲|String|

## テストユーザー
|データ名|値|
|-|-|
|email|student01@test.com|
|password|std01test|
|学校名|ベネッセ高校|
|クラブ|野球|
|学年|高校1年|
|ユーザー名|谷|
