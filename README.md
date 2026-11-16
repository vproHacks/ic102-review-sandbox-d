![](../../workflows/gds/badge.svg) ![](../../workflows/docs/badge.svg) ![](../../workflows/test/badge.svg)

# IC102-D review sandbox

A Tiny Tapeout project for Lab 04 of [IC102-D](https://uoftasic.com/ic102-d/). Each student
makes one from this folder in their own account, and their partner contributes to it through a
pull request from a fork. Each of its sixteen output pins is driven by a small block, added in a
pull request. It's built from Tiny Tapeout's Verilog template (`ttsky-verilog-template` at `a42e666`,
action tag `ttsky26d`) and is never submitted to a shuttle.

- [CONTRIBUTING.md](CONTRIBUTING.md): how to claim a slot, and what a reviewer checks.
- [RULESET.md](RULESET.md): the rules on `main`, and why.
- [docs/info.md](docs/info.md): which pin does what, and who claimed it.

The writeup that uses this repository is
[Lab 04: A change through review](https://uoftasic.com/ic102-d/labs/lab-04-a-change-through-review-overview.html).

## What's different from the template

| File | Change |
|---|---|
| `.github/workflows/*.yaml` | Run on pushes to `main` and on pull requests (from forks too), instead of on every push; the `viewer` job runs only for `main`. `fpga.yaml` is left out. |
| `src/project.v`, `src/slot_*.v` | The top module wires sixteen slot modules to `uo_out` and `uio_out`/`uio_oe` |
| `test/Makefile` | Lists every slot's file and test module, so claiming a slot doesn't change it |
| `test/sandbox.py`, `test/test_*.py` | A helper module and one test module per slot |
| `.github/pull_request_template.md` | The sections every pull request description fills in |
