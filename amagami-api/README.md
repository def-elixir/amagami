# アマガミAPI

## API仕様書

## 概要

アマガミのデータを取得するAPI

## API一覧

| No. | API名                      | 機能概要               | 
| --- | ------------------------- | --------------------- | 
| 1   | [キャラクター一覧取得API](#1) | キャラクターの一覧を取得  | 

### <a id="1">No.1 キャラクター一覧取得API</a>

#### URL

```
GET /api/characters
```

#### Header

| パラメータ名 　| 値               | 
| ------------ | ---------------- | 
| Accept       | application/json | 

#### パラメータ

| パラメータ名   | 型      | 必須 | 内容       |
| ------------ | ------- | --- | ---------- |
| id           | integer |     | ID         |
| name         | string  |     | 名前       |
| class        | string  |     | 学年、クラス |
| blood_type   | string  |     | 血液型      |
| age          | integer |     | 年齢       |
| birthday     | string  |     | 誕生日      |
| description  | string  |     | プロフィール | 

#### リクエストサンプル

```
curl -X GET -H 'Accept: application/json' \
'https://{domain}/api/characters'
```

#### レスポンスデータ

| パラメータ名  | 型      | NULL | 内容         　　| 
| ------------- | ------- | ---- | ------------ | 
| data          | array   |      |              | 
|   id          | integer |      | ID           | 
|   name        | string  |      | 名前         | 
|   description | string  |      | 詳細         | 
|   sign        | string  |      | 星座         | 
|   like        | string  |      | 好きなもの   | 
|   age         | integer |      | 年齢         | 
|   birthday    | string  |      | 誕生日       | 
|   blood_type  | string  |      | 血液型       | 
|   class       | string  |      | 学年、クラス | 
|   club        | string  | ◯   | 所属部活動   　| 
|   cv          | string  |      | 声優         | 
|   dislike     | string  |      | 苦手なもの   |  

#### レスポンスサンプル

```
{
  "data": [
    {
      "id": 1,
      "name": "絢辻 詞",
      "description": "クラス委員と創設祭実行委員を掛け持ちする、絵に描いたような優等生。文武両道で、クラスメイトのみならず教師からも一目置かれる存在。面倒見もよく、彼女の周りにはいつも人の輪ができている。静かな場所を好み、放課後は図書室によくいる模様。",
      "sign": "天秤座",
      "like": "勉強・テスト・読書・貯金・自分を高める行為・自分のプラン",
      "age": 17,
      "birthday": "10月8日",
      "blood_type": "AB型",
      "class": "2年A組",
      "club": null,
      "cv": "名塚佳織",
      "dislike": "昆虫や爬虫類・意地っ張りな自分・鏡・家族（特に姉）・自分の品位を下げる行為・自分のプランを邪魔する者"
    }
  ]
}
```

#### ステータスコード

| ステータス  | 共個 　| 内容                |
| ---------- | ---- | ------------------- |
| 200        | 共通 | 成功                 |
| 500        | 共通 | サーバー内でエラーが発生 | 