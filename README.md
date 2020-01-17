## Instagram Clone アプリ

### バージョン
Ruby:2.6.3

Rails:5.2.4

### テーブル設計

#### pictures
|culumn  |type  |
|---|---|
|id  |integer  |
|title |string  |
|content |text  |
|image |string  |
|user_id |integer |


#### users
|culumn  |type  |
|---|---|
|id  |integer  |
|name |string  |
|email |string  |
|image | string |
|password |password_digest |

#### favorites
|culumn  |type  |
|---|---|
|id  |integer  |
|user_id |integer  |
|picture_id |integer  |
