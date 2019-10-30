# Dhall Concourse
**Note:** A lot of this README is inspired (some of it copied) from the [dhall-kubernetes README](https://github.com/dhall-lang/dhall-kubernetes/blob/master/README.md), so thanks to the authors!

Dhall Concourse provides Dhall bindings for Concourse, so you can generate concourse pipelines from Dhall expressions. This will let you easily typecheck, template and modularize your Concourse pipelines.

## Why do I need this?

There are a lot of issues one could face while building any non-trivial pipeline. Few of them could be:
1. Pipeline yaml becomes very big and unmanageable
2. Same set of jobs are required to be run in different environments
3. Same set of hooks but with slight changes in all jobs. E.g. slack notifications, releasing resources on failure, etc.

Most common way to deal with these have been to use a templating language like erb, but it gets very messy very fast. We can do a lot better.

Dhall solves all of this, being a programming language with builtin templating, all while being non-Turing complete, strongly typed and [strongly normalizing](https://en.wikipedia.org/wiki/Normalization_property_(abstract_rewriting)) (i.e.: reduces everything to a normal form, no matter how much abstraction you build), so saving you from the _"oh-noes-I-made-my-config-in-code-and-now-its-too-abstract"_ nightmare.

For a Dhall Tutorial, see the [readme of the project](https://github.com/dhall-lang/dhall-lang), or the [full tutorial](http://hackage.haskell.org/package/dhall-1.17.0/docs/Dhall-Tutorial.html).

## Prerequisites

You need a patched version of dhall for this which supports the type `JSON` and function `toJSON : forall(a : Type) -> a -> JSON`. It is implemented at https://github.com/akshaymankar/dhall-recursive-json. It can be installed using instructions in the [README](https://github.com/akshaymankar/dhall-recursive-json/blob/master/README.md).

## Examples
There are a few examples in the [examples](https://github.com/akshaymankar/dhall-concourse/tree/master/examples) directory.
