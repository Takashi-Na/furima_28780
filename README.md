## テーブル設計

## usersテーブル
| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| check_password   | string | null: false |
| family_name      | string | null: false |
| first_name       | string | null: false |
| kana_family_name | string | null: false |
| kana_first_name  | string | null: false |
| birthday         | date   | null: false |

### Association
- has_many : items
- has_many : coments
- has_many : credit_cards
- has_many : shopping_addres


## itemsテーブル
| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| image               | string     | null: false                    |
| name                | string     | null: false                    |
| describe            | text       | null: false                    |
| category            | integer    | null: false                    |
| status              | integer    | null: false                    |
| delivery_fee        | integer    | null: false                    |
| ship_from           | integer    | null: false                    |
| days_until_shipping | integer    | null: false                    |
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

### Association
- belongs_to : user
- belongs_to : item
- has_one : shopping_address

## shopping_addressesテーブル
| Column               | Type       | Option                         |
| -------------------- | ---------- | -------------------------------|
| post_code            | string     | null: false                    |
| prefecture           | string     | null: false                    |
| city                 | integer    | null: false                    |
| address              | string     | null: false                    |
| billding_name        | string     |                                |
| tel_num              | string     | null: false                    |
| pruchase_manegiments | references | null: false, foreign_key: true |

### Association
- belongs_to : pruchase_manegiment
- belongs_to_active_hash :city