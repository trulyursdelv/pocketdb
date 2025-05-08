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

## Next Step
- [Manipulating a record](RECORD.md)
