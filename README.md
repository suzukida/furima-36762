# テーブル設計

## users テーブル　（ユーザー）

| Column             | Type          | Options                        |
| ------------------ | ------------- | ------------------------------ |
| name               | string        | null: false                    |  名前
| email              | string        | unique: true  null: false      |  アドレス
| encrypted_password | string        | null: false                    |  パスワード
| last_name          | string        | null: false                    |  苗字（全角）
| last_kana          | string        | null: false                    |  フリガナ（苗字）
| first_name         | string        | null: false                    |  名前（全角）
| first_kana         | string        | null: false                    |  フリガナ（名前）
| birthday           | date          | null: false                    |  生年月日


- has_many :items
- has_many :buy_items

## items テーブル　（商品　詳細）

| Column             | Type          | Options                        |
| ------------------ | ------------- | ------------------------------ |
| item_name          | string        | null: false                    |  商品名
| explanation        | text          | null: false                    |  商品説明
| category_id        | integer       | null: false                    |  カテゴリー
| condition_id       | integer       | null: false                    |  商品状態
| shipping_id        | integer       | null: false                    |  配送料
| prefecture_id      | integer       | null: false                    |  発送元の地域(プルダウン　都道府県)
| delivery_id        | integer       | null: false                    |  発送までの日数
| item_price         | integer       | null: false                    |  価格
| user               | references    | null: false, foreign_key: true |


- belongs_to :user
- has_one :buy_item


## buy_items テーブル （購入商品）

| Column             | Type          | Options                        |
| ------------------ | ------------- | ------------------------------ |
| item               | references    | null: false, foreign_key: true |  itemsテーブルの情報
| user               | references    | null: false, foreign_key: true |  usersテーブルの情報


- belongs_to :user
- belongs_to :item
- has_one :address


## addresses テーブル （配送先）


| Column             | Type          | Options                        |
| ------------------ | ------------- | ------------------------------ |
| post_code          | string        | null: false                    |  郵便番号
| send_area_id       | integer       | null: false                    |  都道府県（プルダウン）
| city               | string        | null: false                    |  市町
| city_address       | string        | null: false                    |  番地
| building_name      | string        |                                |  建物名（任意）
| phone_number       | string        | null: false                    |  電話番号
| buy_item           | references    | null: false, foreign_key: true |  buy_itemテーブルの情報


- belongs_to :buy_item

