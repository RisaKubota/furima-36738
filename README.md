

## users table

| Column    | Type   | Options  | 
| --------- | ------ | -------- | 
| nickname  | string | NOT NULL | 
| mail      | string | NOT NULL | 
| password  | string | NOT NULL | 
| name1     | string | NOT NULL | 
| name2     | string | NOT NULL | 
| furigana1 | string | NOT NULL | 
| furigana2 | string | NOT NULL | 
| birthday  | date   | NOT NULL | 

### Association

- has_many :items
- has_many :orders


## items table

| Column       | Type      | Options       | 
| ------------ | --------- | ------------- | 
| user         | reference | NOT NULL      | 
| price        | string    | NOT NULL      | 
| description  | string    | NOT NULL      | 
| image        |           | ActiveStorage | 
| sellername   | string    | NOT NULL      | 
| category     | string    | NOT NULL      | 
| condition    | string    | NOT NULL      | 
| fee          | string    | NOT NULL      | 
| area         | string    | NOT NULL      | 
| shippingdate | date      | NOT NULL      | 

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
| prefectures    | string    | NOT NULL          | 
| municipalities | string    | NOT NULL          | 
| housenum       | string    | NOT NULL          | 
| building       | string    | NOT NULL          | 
| tel            | string    | NOT NULL          | 

- belongs_to :order