epigram, a photo sharing app.
=============================

by Jake Kaad & Mike Goren

This is a simple Ruby/Rails photo sharing app.

Installation
------------

Install epigram by first cloning the repository.  
```
$ git clone http://github.com/mgoren/epigram.git
```

Start the database:
```
$ postgres
```

Create the databases, tables, and test environment by running the following:
```
$ rake db:create
$ rake db:migrate
$ rake db:test:prepare
```

Start the rails server:
```
$ rails s
```

In your web browser, go to http://localhost:3000

License
-------

GNU GPL v2. Copyright 2015