# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| family_name_china  | string | null: false |
| first_name_china   | string | null: false |
| family_name_kana   | string | null: false |
| first_name_kana    | string | null: false |
| birthday_year      | string | null: false |
| birthday_month     | string | null: false |
| birthday_day       | string | null: false |


<!-- devise導入により、emailとpasswordはカラム名に入れていません -->

### Association

- has_many : items
- has_many : purchases


## items テーブル

| Column     | Type       | Options     |
| ---------- | ---------- | ----------- |
| name       | string     | null: false |
| explanation| text       | null: false |
| category   | integer    | null: false |
| status     | integer    | null: false |
| burden     | integer    | null: false |
| prefecture | integer    | null: false |
| days       | integer    | null: false |
| price      | integer    | null: false |

| users      | references | null: false, foreign_key: true |

<!-- アクティブハッシュを使わないといけない -->
<!-- 選択肢のあるカラムの型はintegerと示す -->

### Association

- belong_to :user
- belong_to :purchase


##  addressesテーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| postal code   | string     | null: false |
| prefecture    | integer    | null: false |
| municipality  | string     | null: false |
| address       | string     | null: false |
| building_name | string     | null: false |
| phone_number  | string     | null: false |

|purchase| references | null: false, foreign_key: true |

### Association

- belongs_to : purchase


## purchaseテーブル

| Column  | Type       | Options     |
| ------- | ---------- | ----------- |

| users   | references | null: false, foreign_key: true |
| items   | references | null: false, foreign_key: true |

### Association

- has_many   :items
- has_one    :address
- belongs_to :user
