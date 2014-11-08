| [*Makers Academy*](http://www.makersacademy.com) | Week 6 |
| ------------------------------------------------ | ------ |

#Chitter
------------------------

####Overview
The challenge at the end of week six was to create a Twitter clone using the
technologies we'd been exposed to. I decided to learn [Haml] to create the front
end (which I styled to look a little bit like [Yo]), while buiding on what I'd
learned in the [Bookmark Manager] project regarding RDBMSs, sessions and user
management. I also chose to use [Cucumber] for my integration tests, as I really
enjoy using it to guide my BDD process.

####User experience

Users can log in, log out, and post messages which are associated with their
username and a timestamp.

See the app running: http://chitter.gypsydave5.com/

Technologies Used
-----------------

+ Production
  - [bcrypt]
  - [CSS]
  - [Data Mapper]
  - [Haml]
  - [HTML]
  - [Mailgun]
  - [PostgreSQL]
  - [rack flash]
  - [Ruby]
  - [Sinatra]

+ Testing
  - [Capybara]
  - [Cucumber]
  - [Database cleaner]
  - [RSpec]
  - [Timecop]

####Installation

Clone the repo with the following command (you will need to install [Git]):
```shell
$ git clone git@github.com:gypsydave5/chitter.git
```

Change into the project directory
```shell
$ cd chitter
```

Run Bundler to load the required gems (you will need an installation of [Ruby] 2.1.0 and the [Bundler] gem )
```shell
$ bundle install
```

You will need a local version of [PostgreSQL], along with a test and a development
database:

```SQL
=# CREATE DATABASE 'chiter_test';
=# CREATE DATABASE 'chiter_development';
```

Migrate the required tables:
```shell
rake auto_migrate
```
Then run the server using either `rackup` or, my preference, [Shotgun]:

```shell
$ shotgun

== Shotgun/Thin on http://127.0.0.1:9393/
Thin web server (v1.6.2 codename Doc Brown)
Maximum connections set to 1024
Listening on 127.0.0.1:9393, CTRL+C to stop
```

Send your browser to `http://127.0.0.1:9393` to use the app.

####Testing

The unit tests may be run using [RSpec]:

```shell
$ rspec
```

The integration tests may be run using [Cucumber]:
```shell
$ cucumber
```

#### Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

[Haml]: http://haml.info/
[Yo]: http://www.justyo.co/
[Bookmark Manager]: https://github.com/gypsydave5/bookmark-manager
[Cucumber]: http://cukes.info/
[Timecop]: https://github.com/travisjeffery/timecop
[bcrypt]: https://github.com/codahale/bcrypt-ruby
[CSS]: https://developer.mozilla.org/en-US/docs/Web/CSS
[Data Mapper]: http://datamapper.org/
[dotenv]: https://github.com/bkeepers/dotenv
[ERB]: http://www.stuartellis.eu/articles/erb/#other-resources
[HTML]: https://developer.mozilla.org/en-US/docs/Web/HTML
[Mailgun]: https://github.com/bkeepers/dotenv
[PostgreSQL]: http://www.postgresql.org/
[rack flash]: https://github.com/nakajima/rack-flash
[Ruby]: https://www.ruby-lang.org/en/
[Sinatra]: http://www.sinatrarb.com/
[Capybara]: http://jnicklas.github.io/capybara/
[Database cleaner]: https://github.com/DatabaseCleaner/database_cleaner
[RSpec]: http://rspec.info/
[Git]: http://git-scm.com/
[Bundler]: http://bundler.io/
[shotgun]: https://github.com/rtomayko/shotgun
