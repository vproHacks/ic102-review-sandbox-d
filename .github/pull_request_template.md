<!-- Fill in every section. A reviewer reads this before the diff. -->

## What this changes

<!-- One or two sentences: which slot you claim, and what your block does. -->

## Pins

<!-- The pin you claim, its name in info.yaml, and for a uio pin, whether it's an output. -->

## How I tested it

<!-- The command you ran and the lines of output that show the result, for example the
     test summary table from `make test` in labs/common/tt-tools. Say what your test checks
     and what it doesn't. -->

## AI tools

<!-- Did an AI tool write any of this change or this description? If so, which parts, and what
     did you check yourself? "None" is a fine answer. -->

## Checklist

- [ ] The test asserts something, and fails if the block is wrong
- [ ] `info.yaml` names the pin, and only that pin's line changed
- [ ] The pin's row in `docs/info.md` is filled in
- [ ] For a `uio` pin: `oe` is 1 in the slot, so the pin is an output
- [ ] `make test` passes locally with the course's tools
