# Setting up Ropeburn

## Dependencies

### Postgres!

We use Postgres, and the easiest way for doing this on OS X is [Postgres.app](http://postgresapp.com/).

### Setting up Ruby

Use [rbenv](https://github.com/sstephenson/rbenv). In OS X, this is really easy with Homebrew:

From the Ropeburn directory, this should all you need to do!

```shell
brew install rbenv ruby-build
rbenv install 2.2.2 # Double-check the latest version, we try to keep .ruby-version modern
gem install bundle
rbenv rehash
```

Now you need to install Ropeburn's dependencies.

Note: You will probably need to modify your `PATH` to point to Postgres.app's
embedded binaries. This works for me, but you may want to update your PATH to
include that always, so you have psql in your path:

```shell
PATH=/Applications/Postgres.app/Contents/Versions/9.4/bin:$PATH bundle install
```

If you aren't using Postgres.app, then a simple `bundle install` should work
(and unless we're updating the `pg` gem, you shouldn't need to set the PATH
again)

### Pow

[Pow](http://pow.cx/) is a way of running all of your apps without managing the
servers. They just stay running while you use them, or shut down when you
aren't. It's pretty great.

```shell
curl get.pow.cx | sh
cd ~/.pow
ln -sf ~/path/to/ropeburn ropeburn
```

Also, it's highly recommended to make things easier and just default `localhost` to ropeburn (sorry if you have something on localhost already)

```shell
ln -sf ~/path/to/ropeburn default
```

Now you can load Ropeburn by hitting http://localhost/ -- almost magic. _Almost_. Instead, just useful code!

## Setting up the GitHub App

Since Ropeburn uses GitHub OAuth, you'll need to register an application. This is pretty painless.


## nGrok makes your life better

Since Ropeburn works through webhooks, GitHub needs to talk to your server. In development, this is a bit of a pain.

Fortunately, [ngrok](https://ngrok.io) is a thing and it is totally awesome. I
highly recommend upgrading to a paid account, and getting your own persistent
subdomain.

Since Jay is greedy, he has ropeburn already:
```
ngrok http -subdomain=$YOURNGROKSUBDOMAIN ropeburn.dev:80
```

Now you have a URL all ready to go! Use this for the webhook URL, and GitHub can start tunneling requests to you.

Make sure that you have a `github_webhook_secret` configured (defaults to `ENV["ROPEBURN_WEBHOOK_SECRET"])

## Making it all work!

The demo script in `db/seeds.rb` should have everything to get you going. You can set this up by simply running:

```shell
bundle install
bundle exec rake db:reset
```

If you then visit [getstarting.dev](http://getstarting.dev) (make sure you
installed Pow!) you can sign in as an admin with the following accounts:

* jay@getstarting.com - test1234
* cory@getstarting.com - test1234

Or the non-admin:

* bob_hope@getstarting.com - still living

There are tracks and teams already created. Click around and explore!
