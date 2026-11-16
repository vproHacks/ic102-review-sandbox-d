# Claiming a slot

Every change to `main` arrives as a pull request with one approval and green checks
([RULESET.md](RULESET.md)). Lab 04 of IC102-D walks through all of this; this page is the short
version to come back to.

## Before you start

Look at the open pull requests and at the table in [docs/info.md](docs/info.md), and pick a pin
nobody has claimed: `uo0` to `uo7`, or `uio0` to `uio7`. Then open a draft pull request early,
titled `Claim uo[3]: parity` or similar, so that the next person can see your claim.

Unless you own this repository, you can't push to it: fork it, push your branch to your fork,
and open the pull request from there into this repository's `main`. Its workflows run on your
pull request once the owner has approved them for a first-time contributor.

## The change

On a branch of your own (`claim-uo3-parity`, say), change exactly these four things:

1. `src/slot_<pin>.v`: your block. Keep the port list. A `uio` slot also sets `oe` to 1 so the
   pin becomes an output. `claim.py` in the course's Lab 04 package writes a ready-made block.
2. `test/test_<pin>.py`: a test for your block that reads only the top-level pins, through the
   helpers in `test/sandbox.py`, because the `gl_test` job runs the same tests on the gate-level
   netlist.
3. `info.yaml`: your pin's line in `pinout`, with a short name for what it does. Don't change
   any other line.
4. `docs/info.md`: your pin's row in the table: the block, what it does, and your GitHub username.

Run the test locally before you push (`make test PROJECT=$PWD` in the course's
`labs/common/tt-tools`, from the top of your clone), and paste its summary into the pull request
description.

## Reviewing

Read the description first, then the diff, and check what the workflows can't:

- **The test.** Does it assert something? Would it fail if the block were wrong? A starter test
  from `claim.py` checks only two input values on purpose; say which other values matter for
  this block and ask for them.
- **The pin.** Does `info.yaml` name the pin the slot file drives? For a `uio` pin, is `oe` 1, and
  does the name describe an output?
- **Only four files.** Nothing else changed: not `clock_hz`, not another student's pin, not the
  workflows.
- **The description.** Does it match the diff, say how the change was tested, and say whether an
  AI tool wrote any of it?
- **The checks.** Are `docs`, `test`, `gds`, `precheck` and `gl_test` green on the latest commit?

Request changes when something needs fixing, and say what and why. When the author has pushed
the fix, look again and approve.

## Conflicts

Neighbouring pins sit on neighbouring lines of `info.yaml` and `docs/info.md`, and git can't
merge two changes to adjacent lines by itself. If GitHub says your branch has conflicts, merge
this repository's `main` into your branch, keep both claims, and push. In a clone of your fork,
where this repository is the remote `upstream`:

```bash
git fetch upstream
git merge upstream/main    # stops on the conflict; edit the files, keeping both lines
git add info.yaml docs/info.md
git commit --no-edit
git push
```

Pushing new commits dismisses the approval you had, so ask your reviewer to approve again.
