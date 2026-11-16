# The rules on `main`

`main` in this repository is protected by one ruleset, `ruleset.json` in this folder. Anyone who
can read the repository can see it under **Settings › Rules** or at `/rules`; this file says the
same thing in words, using the five parts that
[Branch rules](https://uoftasic.com/ic102-d/guide/branch-rules.html) describes.

| Part | Setting | Why |
|---|---|---|
| Name | `main: pull request, one approval, green checks` | Says what it does, so a reader can check it against the rules below |
| Enforcement | Active | |
| Target | The default branch (`main`) | `~DEFAULT_BRANCH` keeps working if the branch is ever renamed |
| Rules | Restrict deletions | Nobody can delete `main` |
| | Block force pushes | Nobody can rewrite `main`'s history |
| | Require a pull request before merging, with 1 approval | Every change is seen by one person besides its author |
| | Dismiss stale approvals when new commits are pushed | An approval covers the commits the reviewer saw, not ones pushed after it |
| | Require approval of the most recent push | The person who pushed last can't be the one who approves |
| | Require conversation resolution | Every review comment is answered or resolved before a merge |
| | Allowed merge methods: merge, squash | Rebase merging is off, so every pull request leaves a merge or a single commit on `main` |
| | Require status checks to pass: `docs`, `test`, `gds`, `precheck`, `gl_test` | The jobs must be green on the pull request's latest commit |
| Bypass list | Repository admin (the owner), "For pull requests only" | The owner can merge a change of their own without an approval, but still only through a pull request where everyone can see it. Nobody can push to `main` directly, the owner included |

`viewer` isn't a required check, because it runs only on `main` (see `.github/workflows/gds.yaml`).
"Require branches to be up to date before merging" is off: with it on, every merge to `main` would
make every other open pull request run its 5-minute `gds` workflow again before it could merge.
Git still refuses a merge that conflicts, and you resolve that yourself (Lab 04, Part 5).

## Setting it up

The owner of the repository adds the ruleset once, after the first push to `main` (Lab 04,
Part 1): on GitHub, **Settings › Rules › Rulesets › New ruleset › Import a ruleset**, choose this
file, check that the page shows the settings in the table above, and press **Create**.

The `required_status_checks` names are job names. GitHub offers them in its menus only after each
job has run once in the repository, but an imported ruleset names them directly. The bypass entry
is the repository role "Admin" (role 5), which in a repository on a personal account is its
owner. The JSON follows the shape of an existing ruleset in the team's repositories; it hasn't
been imported into a repository yet.
