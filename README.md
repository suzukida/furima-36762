# テーブル設計

## users テーブル　（ユーザー）

| Column             | Type          | Options                        |
| ------------------ | ------------- | ------------------------------ |
| name               | string        | null: false                    |  名前
| email              | string        | null: false                    |   アドレス
| encrypted_password | integer       | null: false                    |  パスワード
| first_name         | string        | null: false                    |  苗字（全角）
| first_kana         | string        | null: false                    |  フリガナ（苗字）
| last_name          | string        | null: false                    |  名前（全角）
| last_kana          | string        | null: false                    |  フリガナ（名前）
| birthday           | string        | null: false                    |  生年月日


- has_many :items


## items テーブル　（商品　詳細）

| Column             | Type          | Options                        |
| ------------------ | ------------- | ------------------------------ |
| item_name          | string        | null: false                    |
| explanation        | text          | null: false                    |  商品説明
| category           | string        | null: false                    |  カテゴリー
| condition          | string        | null: false                    |  商品状態
| shipping_fee       | integer       | null: false                    |  配送料
| send_area          | string        | null: false                    |  発送元の地域(プルダウン　都道府県)
| delivery_days      | string        | null: false                    |  発送までの日数
| item_price         | integer       | null: false                    |  価格
| users              | references    | null: false, foreign_key: true |


- belongs_to :user
- has_one :buy_item


## buy_items テーブル （購入商品）

| Column             | Type          | Options                        |
| ------------------ | ------------- | ------------------------------ |
| item               | references    | null: false, foreign_key: true |  itemsテーブルの情報
| send               | references    | null: false, foreign_key: true |  sendsテーブル情報
| user               | references    | null: false, foreign_key: true |  usersテーブルの情報

- belongs_to :item
- has_one :send


## sends テーブル （配送先）


| Column             | Type          | Options                        |
| ------------------ | ------------- | ------------------------------ |
| post_code          | string        | null: false                    |  郵便番号
| send_area          | string        | null: false                    |  都道府県（プルダウン）
| city               | string        | null: false                    |  市町
| city_address       | string        | null: false                    |  番地
| building_name      | string        |                                |  建物名（任意）
| phone_number       | integer       | null: false                    |  電話番号


- belongs_to :buy_item

