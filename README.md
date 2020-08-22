## テーブル設計

## usersテーブル
| Column         | Type   | Options     |
| -------------- | ------ | ----------- |
| nickname       | string | null: false |
| email          | string | null: false |
| password       | string | null: false |
| check_password | string | null: false |
| mane           | string | null: false |
| kana_name      | string | null: false |
| birthday       | date   | null: false |

### Association
- has_many : items
- has_many : coments
- has_many : credit_cards
- has_many : shopping_addres


## itemsテーブル
| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| item_image          | text       | null: false                    |
| item_name           | string     | null: false                    |
| item_describe       | text       | null: false                    |
| item_category       | string     | null: false                    |
| item_status         | string     | null: false                    |
| delivery_fee        | string     | null: false                    |
| ship_from           | string     | null: false                    |
| days_until_sjipping | string     | null: false                    |
| price               | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association
- belongs_to : user
- has_many : coments
- has_one : shopping_addresses


## comentsテーブル
| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| content        | text       | null: false                    |
| user           | references | null: false, foreign_key: true |
| item           | references | null: false, foreign_key: true |

### Association
- belongs_to : user
- belongs_to : item


## pruchase_manegimentsテーブル
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |
| card_num        | integer    | null: false                    |
| expiration_date | date       | null: false                    |
| security_code   | integer    | null: false                    |

### Association
- belongs_to : user
- belongs_to : item
- has_one : shopping_address

## shopping_addressesテーブル
| Column          | Type       | Option                         |
| --------------- | ---------- | -------------------------------|
| post_code       | string     | null: false                    |
| prefecture      | string     | null: false                    |
| city            | string     | null: false                    |
| address         | string     | null: false                    |
| billding_name   | string     |                                |
| tel_num         | string     | null: false                    |
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |

### Association
- belongs_to : pruchase_manegiment