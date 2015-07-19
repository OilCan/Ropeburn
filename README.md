# Ropeburn

Inbox for Pull Requests!

Lets reduce friction around pull requests.

## What friction?

Most teams in medium to large organizations, and even some small, have so many
repositories that it becomes frustrating to submit PRs. I want to review
requests when they come in, yet keeping track is challenging. Trusting
notifications is dangerous.

## How does this work?

Well, it doesn't yet. This is an early application that I'm going to be
experimenting different models with. It's going to be developed publicly,
though, so hopefully you can help me make it better.

### The Idea

When a user authenticates via GitHub, all repositories they have access to will
be displayed. They can then select which repositories they want to monitor.

All monitored repositories will have webhooks setup to receive data when a PR
is acted upon.

When a PR event happens, the webhook receives data and the magic starts.

1. If the PR is new, run it through a basic analysis. This should determine what type of change it is, whether it is ready for review (if there are checkboxes, like `* [ ]` that are unchecked... let it linger), etc.
2. Add it to the dashboard for anybody monitoring that repository (obvious)
3. Periodically, run through some checks. This should be highly extensible, rule based and allow easy detection of dropped PRs or PRs that have become overly stale (drift between branches)
4. Send out emails when things need to get done. No email, all is good. This should be up to the user. I'd prefer to get one right before lunch!

### Data Model

The model here aims to be pretty straight forward.

Each time we see a new repository, we create a `Repository` model. Users then
have `UserRepository` relationships, which allow `user.repositories` to be the
list of repositories the user is monitoring.

The Ropeburn webhook listens to all actions on Pull Requests for these repositories.

When a new Pull Request is submitted, a `PullRequest` model is created (which `belongs_to` the `Repository`).

The `PullRequest` has some basic statistics applied, and imports the description (and subsequent changes, only preserving the most recent).

* It has an `analyzed` attribute to signal the need to be analyzed (with a cooldown delay, so any changes to the description and what not are quieted)
* It has a `ready_to_review` boolean attribute, defaulting to true(?), which is set by analysis

## Contributing

Read the [SETUP.md](SETUP.md) guide, it will detail how to get the app setup and working.

We aren't using tickets yet, because it's still a bit early on. We probably
should. Feel free to convert the TODOs into Issues. I'm pretty bad at that.

## TODO

* [ ] Finish PullRequest Model
* [ ] Write Analysis Pipeline
* [ ] Import list of repositories the user is watching from the GitHub API
* [ ] How to determine when a PR is ready for review?
* [ ] Notifiers when a PR changes to "ready to review"
* [ ] Determine when a review is done (presence of :ship:, "lgtm", etc)
