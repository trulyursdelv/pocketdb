## Pocket Database ⚡
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

### Why Pocket Database?
If you need an on-the-go database without hassle setups, Pocket Database is one of your best choice.

Creatinf database is limitless, which means you can create many databases as you want.

### Notice
Since Pocket Database utilizes Telegraph API, please expect that your data can be viewed publicly if your database token has been compromised.

However, all data written by Pocket Database is minimally encrypted. You cannot view the actual data on Telegraph's website but you can view it through Pocket Database.

Please use Pocket Database with caution, especially for sensitive data.

### Limitations

Even though creating databases is limitless, its content is not. According to Telegraph, you can only store 64kB of data per record (per page).

However, creating pages is also limitless, so I suggest you to expand and populate your data into multiple records.

### Live Demo

If you want a quick view and tour to your website, you can use Pocket Database Live Demo.

<!-- TODO: Fix the Live Demo and add it here. -->
[![Pocket Database Live Demo](https://flat.badgen.net/static/Pocket%20Database/Live%20Demo)](about:blank)
