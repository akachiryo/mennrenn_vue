# [MennRenn](https://mennrenn.com/) 気軽に練習相手探せるアプリ
![profileproduct2](https://user-images.githubusercontent.com/85982768/154615526-52b626ec-77e1-4674-ab8c-15d5614466e5.gif)
サイトURLは[mennrenn.com](https://mennrenn.com/)

面接練習がしたいとき、**気軽に練習相手をマッチング**して見つけることができるアプリです。
面接練習の条件（時間、業種等）を指定した部屋を作成し、マッチングする相手を探します。こちらから、条件に合う部屋を探すこともできます。


### テーマを選んだ理由
　終身雇用が当たり前だった時代から、自分のスキルに見合った企業への転職が増加しており、日本の働き方が変化しています。転職活動するうえで、合否を大きく分けるのが面接です。「スキルはあるのに面接で失敗してしまった」という人も多いはずです。ただし、面接練習をしようと考えるも１人で練習することが難しいです。この難点を、「MennRenn」を使うことで**練習相手を見つけ、面接力を高めよう**というアプリです。このアプリを活用することで、就活・転職している方のサポートができればよいと考えております。
 
### ターゲットユーザ
就活生、転職者

## 機能
- ユーザー登録、ログイン
  - ユーザー
  - 管理者
- 画像投稿機能(ActiveStorage)
- ルーム機能
- タグ機能
- ページネーション機能(kaminari)
- ビデオ通話機能(skyway)

## 技術
### フロント
- Vue.js
[リポジトリ](https://github.com/akachiryo/mennrenn_vue_front)
### API
- Ruby on Rails 6.0.4
### RDB
- MySQL 5.7
### サーバー
- Nginx
- Puma
- AWS
  - EC2
  - VPC
  - RDS
  - Route53
  - S3
  - ロードバランサ―
- GitActions（CI/CD）

### 開発
- レスポンシブデザイン（Vuetify）
- 環境変数化（bash_profile）
- N+1問題(bullet)
- 可読性の高いコード(Rubocop)
- デバッグ(pry-byebug)

## 設計書
![ER図](https://user-images.githubusercontent.com/85982768/136347420-79a556ab-3542-432d-aa05-789b2e6c2654.png)
- [ER図](https://drive.google.com/file/d/1nWENUMw2PwqOee9tHfykloUeg7Y1wXMW/view?usp=sharing)
- [テーブル定義書](https://docs.google.com/spreadsheets/d/1N5JukksgXzsvlRtoKJJcxqni-p9SH7Ef/edit?usp=sharing&ouid=111121812190906123216&rtpof=true&sd=true)
- [詳細設計](https://docs.google.com/spreadsheets/d/1N5JukksgXzsvlRtoKJJcxqni-p9SH7Ef/edit?usp=sharing&ouid=111121812190906123216&rtpof=true&sd=true)
- ※まだ追加されていない機能は随時追加していきます。

## インフラ構造図
![インフラ構造図](https://user-images.githubusercontent.com/85982768/154964093-eeaa022f-a118-4d94-b20c-fdd1e202b698.PNG)
- [インフラ構造図](https://app.diagrams.net/#G1PJ7jegyAWn8Pz5R1UjNcNBBmPciJ0ihJ)
