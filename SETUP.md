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

1. Go to https://github.com/settings/developers
2. Register a new application
3. Set the Authorization callback URL to `http://$ROPEBURN_HOST/users/auth/github/callback` (for `ROPEBURN_HOST`, see below on ngrok!)
4. Copy the client ID and secret, put it in your .env file:

Environment Variables should look like this:

```shell
ROPEBURN_HOST=your-subdomain.ngrok.io
ROPEBURN_GITHUB_KEY=deadbeef
ROPEBURN_GITHUB_SECRET=the_github_secret
ROPEBURN_WEBHOOK_SECRET=some_shared_secret_just_write_something
```

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

Set the environment `ROPEBURN_HOST` to your ngrok subdomain. Using
[`rbenv-vars`](https://github.com/sstephenson/rbenv-vars) is recommended for
this, but the project is already using
[dotenv](https://github.com/bkeepers/dotenv) so you can just use a `.env` file
in the project root.

Now, load the site and use it through your ngrok subdomain, instead of through Pow's `ropeburn.dev` URL.


## Making it all work!

You should be able to just load it up, and sign in through GitHub

After that, pick an Organization and Ropeburn will install the webhook.
