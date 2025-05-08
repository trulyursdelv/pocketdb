## Pocket Database ⚡

<!-- TODO: Upload to rubygems -->
[![Pocket Database Rest API](https://badgers.space/badge/PocketDB/on%20Rubygems?icon=feather-package&color=c41e3a&scale=1.2&corner_radius=3)](https://rubygems.org/gems/pocketdb)

Pocket Database is a lightweight tool that utilizes [Telegraph API](https://telegra.ph) as a database. It is limitless, public, and on-the-go.

```ruby
require "pocketdb"

pdb = PocketDatabase.new
pdb.write("users", [{
  name: "Jane Doe",
  gender: "Female",
  age: 24
}])
```

## Installation
Install Pocket Database via **gem**:
```bash
gem install pocketdb
```

Alternatively, add Pocket Database in your **gemfile**:
```ruby
gem "pocketdb", "~> 1.0"
```

## Documentations
- [Getting Started](docs/README.md)
- [Connecting to a database](docs/DATABASE.md)
- [Manipulating a record](docs/RECORD.md)

## Live Demo

If you want a quick view and tour to your website, you can use Pocket Database Live Demo.

<!-- TODO: Fix the Live Demo and add it here. -->
[![Pocket Database Live Demo](https://badgers.space/badge/PocketDB/Live%20Demo?icon=feather-database&color=53a584&scale=1.2&corner_radius=3)](about:blank)

## Rest API

To be fully committed on being an on-the-go database, I implemented a simple CRUD-operated Rest API for Pocket Database.

<!-- TODO: Fix the Rest API and add it here. -->
[![Pocket Database Rest API](https://badgers.space/badge/PocketDB/Rest%20API?icon=feather-activity&color=e97451&scale=1.2&corner_radius=3)](about:blank)

## Why Pocket Database?
If you need an on-the-go database without hassle setups, Pocket Database is one of your best choice.

Creating database and creating records (pages) is limitless, which means you can create many databases and records as you want.

## Notice
Since Pocket Database utilizes Telegraph API, please expect that your data can be viewed publicly if your database token has been compromised.

However, all data written by Pocket Database is minimally encrypted. You cannot view the actual data on Telegraph's website but you can view it through Pocket Database.

Please use Pocket Database with caution, especially for sensitive data.

## Limitations

Even though creating databases is limitless, its content is not. According to Telegraph, you can only store 64kB of data per record (per page).

Since creating records is limitless, I suggest you to expand and populate your data into multiple records.
