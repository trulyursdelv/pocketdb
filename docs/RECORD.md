## Writing a record
Pocket Database automatically create a record if it doesn't exists yet. If it does, it overrides the record.

To write into a record, use the method `write(key, value)`. You can pass any data on the value, e.g. a string, a number, a class instance, etc.

```ruby
require "pocketdb"

pdb = PocketDatabase.new(token: "Your token here...")
pdb.write("my-record", {
  foo: {
    bar: "baz"
  }
})
```

## Reading a record
To read a record, use the method `read(key)`.

```ruby
require "pocketdb"

pdb = PocketDatabase.new(token: "Your token here...")
value = pdb.read("my-record")
puts value.inspect
```

Additionally, you can pass a fallback value on the second argument.

```ruby
require "pocketdb"

pdb = PocketDatabase.new(token: "Your token here...")
email = pdb.read("email", "No email provided.")
puts "Email: #{email}"
```

If the record doesn't exist, the fallback value will be returned.

## Deleting a record
According to Telegraph, you can't fully delete a page. Therefore, deleting a record is basically overriding a record into a nil.

Which means the data has been deleted but the page (record) still exists.

To delete a record, use the method `delete(key)`.

```ruby
require "pocketdb"

pdb = PocketDatabase.new(token: "Your token here...")
pdb.delete("email")
```

## Checking if a record exists

To check if a record exists, use the method `has(key)`. This will check if the record is not a nil.

```ruby
require "pocketdb"

pdb = PocketDatabase.new(token: "Your token here...")
has_email = pdb.has("email")
puts "Has email? #{has_email}"
```

## Clearing the cache
By default, Pocket Database uses caching system to speed up the process.

However, if you want to prevent it from caching, you need to consistently use the method `clear_cache()`.

```ruby
require "pocketdb"

pdb = PocketDatabase.new(token: "Your token here...")
pdb.write("my-record", {
  foo: {
    bar: "baz"
  }
})

pdb.clear_cache
value = pdb.read("my-record")
puts value.inspect
```

Clearing cache is suggested when you want to receive a fresh data, which requires you to clear the cache before reading a record.
