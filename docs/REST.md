## Guide to Rest API

Pocket Database Rest API supports all the features available, from creating a database to deleting a record.

```
https://pocketdatabase.vercel.app/v1/api/<ENDPOINT>?token=<TOKEN?>&record=<RECORD>
```

## Writing a record

| Method | Endpoint |
|:-----:|:-----:|
| `POST` | `/write` |

This endpoint writes a record to a new database or to an existing database. If the token is not provided, a new database will be created.

```http
POST https://pocketdatabase.vercel.app/v1/api/write?token=<TOKEN>&record=<RECORD>
```

<details>
<summary> <kbd>:rocket:</kbd> Request Object</summary>
  
The parameter **record** is required, and the request body must be a JSON.

</details>

<details>
<summary> <kbd>:comet:</kbd> Response Object</summary>

```javascript
{
  "success": Boolean,
  "result": {
    // List of records
    "list": Array<String>,
    "token": String
  }
}
```

</details>

## Reading a record

| Method | Endpoint |
|:-----:|:-----:|
| `GET` | `/read` |

This endpoint reads a record from an existing database.

```http
GET https://pocketdatabase.vercel.app/v1/api/read?token=<TOKEN>&record=<RECORD>
```

<details>
<summary> <kbd>:rocket:</kbd> Request Object</summary>
  
The parameter **record** and **token** are required.

</details>

<details>
<summary> <kbd>:comet:</kbd> Response Object</summary>

```javascript
{
  "success": Boolean,
  "result": {
    // List of records
    "list": Array<String>,
    "token": String,
    // Data of the record
    "data": Any
  }
}
```

</details>

## Checking if a record exists

| Method | Endpoint |
|:-----:|:-----:|
| `POST` | `/write` |

This endpoint checks if a record exists from an existing database.

I suggest you to check on the `list` instead for optimization and less performance cost.

```http
GET https://pocketdatabase.vercel.app/v1/api/has?token=<TOKEN>&record=<RECORD>
```

<details>
<summary> <kbd>:rocket:</kbd> Request Object</summary>
  
The parameter **record** and **token** are required.

</details>

<details>
<summary> <kbd>:comet:</kbd> Response Object</summary>

```javascript
{
  "success": Boolean,
  "result": {
    // List of records
    "list": Array<String>,
    "token": String,
    // Result of the checking
    "exists": Boolean
  }
}
```

</details>

## Deleting a record

| Method | Endpoint |
|:-----:|:-----:|
| `GET` | `/delete` |

This endpoint deletes a record from an existing database. Please take note that this will only override the data into a nil. Thus, the record will still exist but its data aren't.

```http
GET https://pocketdatabase.vercel.app/v1/api/delete?token=<TOKEN>&record=<RECORD>
```

<details>
<summary> <kbd>:rocket:</kbd> Request Object</summary>
  
The parameter **record** and **token** are required.

</details>

<details>
<summary> <kbd>:comet:</kbd> Response Object</summary>

```javascript
{
  "success": Boolean,
  "result": {
    // List of records
    "list": Array<String>,
    "token": String
  }
}
```

</details>
