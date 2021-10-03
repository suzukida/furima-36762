class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping
  belongs_to :prefecture
  belongs_to :delivery
  has_one_attached :image
  # has_one :buy_item
  validates :image, presence: true
  validates :item_name, presence: true 
  validates :explanation, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :shipping_id, presence: true
  validates :prefecture_id, presence: true
  validates :delivery_id, presence: true
  validates :item_price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "¥300~¥9,999,999の間で入力してください"}
  validates :item_price, presence: true ,format: { with: /\A[0-9]+\z/ }
  validates :category_id, numericality: { other_than: 0 , message: "を選択してください"}
  validates :condition_id, numericality: { other_than: 0 , message: "を選択してください"}
  validates :shipping_id, numericality: { other_than: 0 , message: "を選択してください"}
  validates :prefecture_id, numericality: { other_than: 0 , message: "を選択してください"}
  validates :delivery_id, numericality: { other_than: 0 , message: "を選択してください"}

end
