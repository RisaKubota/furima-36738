

## users table

| Column              | Type   | Options                | 
| ------------------- | ------ | ---------------------- | 
| nickname            | string | NOT NULL               | 
| mail                | string | NOT NULL, UNIQUE: true | 
| encrypted_password  | string | NOT NULL               | 
| name1               | string | NOT NULL               | 
| name2               | string | NOT NULL               | 
| furigana1           | string | NOT NULL               | 
| furigana2           | string | NOT NULL               | 
| birthday            | date   | NOT NULL               | 

### Association

- has_many :items
- has_many :orders


## items table

| Column          | Type      | Options                     | 
| --------------- | --------- | --------------------------- | 
| user            | reference | NOT NULL, foreign_key: true | 
| price           | integer   | NOT NULL                    | 
| description     | text      | NOT NULL                    | 
| sellername      | string    | NOT NULL                    | 
| category_id     | integer   | NOT NULL, ActiveHash        | 
| condition_id    | integer   | NOT NULL, ActiveHash        | 
| fee_id          | integer   | NOT NULL, ActiveHash        | 
| area_id         | integer   | NOT NULL, ActiveHash        | 
| shippingdate_id | integer   | NOT NULL, ActiveHash        | 

## Association

- belongs_to :user
- has_one :order



## order table

| Column | Type      | Options           | 
| ------ | --------- | ----------------- | 
| user   | reference | foreign_key: true | 
| item   | reference | foreign_key: true | 

## Association

- belongs_to :user
- belongs_to :order
- has_one :shippingaddress



## shippingaddress tabel

| Column         | Type      | Options           | 
| -------------- | --------- | ----------------- | 
| order          | reference | foreign_key: true | 
| postalcode     | string    | NOT NULL          | 
| prefecture_id  | integer   | NOT,ActiveHash    | 
| municipalities | string    | NOT NULL          | 
| housenum       | string    | NOT NULL          | 
| building       | string    |                   | 
| tel            | string    | NOT NULL          | 

- belongs_to :order