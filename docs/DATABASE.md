## Creating new database
To create a database, simply define a new instance of PocketDatabase. It will automatically create a new database.

```ruby
require "pocketdb"

pdb = PocketDatabase.new
token = pdb.token
puts "Token: #{token}"
```

To prevent losing your data, please keep the database token, which can be obtained with the `token` method.

## Using an existing database

Alternatively, if you want to use an existing database, simply pass the token on the initialization.

```ruby
require "pocketdb"

pdb = PocketDatabase.new(token: "Your token here...")
```

If that database does not exist, an error will be raised.

## List all records

To list all the created records, use the `records()` method. This method will return a list of string, which is all the record keys.

Please take note that this method will also include the deleted records.

```ruby
require "pocketdb"

pdb = PocketDatabase.new(token: "Your token here...")
puts pdb.records.inspect
```
