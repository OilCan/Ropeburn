# Ropeburn

A tool to reduce friction around pull requests.

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


