# benesse_hackathon_202407

**Benesseハッカソン 2024_07**

## 各画面紹介
- `Firebase Authentication`による認証後自動で`school`にリダイレクト

以下ログインしていることを前提とする画面

|スクリーンショット|ページ名|
|-|-|
|<img width=150 src="https://github.com/user-attachments/assets/a6e0fbf1-fa85-42f4-b3ed-93f1492d05a4">|学校トップページ|
|<img width=150 src="https://github.com/user-attachments/assets/d95eaa12-9238-4e56-89a3-bd99cb2c90ee">|クラスページ（主に宿題登録など）|
|<img width=150 src="https://github.com/user-attachments/assets/e0fe7cc8-60f0-4f2a-b9f9-24144dc2c5d9">|部活ページ|
|<img width=150 src="https://github.com/user-attachments/assets/dafaf212-4d54-4826-a3d2-c0c746e3b013">|プロフィールページ|

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
|ユーザー認証|Firebase Authentication|
|ストレージ|Firebase Strage|

## dependencies
- すべて最新バージョン（2024/7/14）

|パッケージ|使用目的|
|-|-|
|firebase_core||
|firebase_auth|認証|
|firebase_storage|プロフィール画像の保存|
|cloud_firestore|データベース|
|freezed_annotation|freezed|
|json_annotation|freezed|
|intl|DateFormater|
|fl_chart|円グラフ|
|image_picke|カメラロールへのアクセス|
|flutter_svg|初期画像のアクセス|

## dev_dependencies
- すべて最新バージョン（2024/7/14）

|パッケージ|使用目的|
|-|-|
|freezed|データクラスの生成|
|json_serializable|jsonの取り回し|
|build_runner|コード生成|


## データ構造
### ユーザーデータ
|項目|型|
|-|-|
|club|String|
|educationLevel|String|
|email|String|
|grade|String|
|id|String|
|profileImageUrl|String|
|school|String|
|username|String|


### 宿題
|項目|型|
|-|-|
|className|String|
|content|String|
|deadline|TimeStamp|
|progress|Number|
|subject|String|
|timeStamp|TimeStamp|

## テストユーザー情報
- 開発のために作成したユーザー
- 認証機能を取り入れているため`Authenticaton`を経由してログイン認証を行う

|データ名|値|
|-|-|
|email|student01@test.com|
|password|std01test|
|学校名|ベネッセ高校|
|クラブ|野球|
|学年|高校1年|
|ユーザー名|谷|
