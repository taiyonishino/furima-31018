# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| encrypted_password | string | null: false |
| email              | string | null: false |
| family_name_china  | string | null: false |
| first_name_china   | string | null: false |
| family_name_kana   | string | null: false |
| first_name_kana    | string | null: false |
| birthday           | date   | null: false |


<!-- devise導入により、emailとpasswordはカラム名に入れていません -->

### Association

- has_many :items
- has_many :purchases


## items テーブル

| Column      | Type       | Options     |
| ----------- | ---------- | ----------- |
| name        | string     | null: false |
| explanation | text       | null: false |
| category_id | integer    | null: false |
| status_id   | integer    | null: false |
| burden_id   | integer    | null: false |
|prefecture_id| integer    | null: false |
| days_id     | integer    | null: false |
| prace       | integer    | null: false |
| user       | references | null: false
foreign_key:true |

<!-- アクティブハッシュを使わないといけない -->
<!-- 選択肢のあるカラムの型はintegerと示す -->

### Association

- belongs_to :user
- has_one    :purchase


##  addressesテーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| postal_code   | string     | null: false |
| prefecture_id | integer    | null: false |
| municipality  | string     | null: false |
| address       | string     | null: false |
| building_name | string     |             |
| phone_number  | string     | null: false |
|purchase| references | null: false, foreign_key: true |

### Association

- belongs_to :purchase


## purchasesテーブル

| Column  | Type       | Options     |
| ------- | ---------- | ----------- |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one    :address
