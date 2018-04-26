Pegex Testing
=============

This repo is for testing how the Pegex API works in general, and how it works
specifically in Perl and JavaScript.

## Running Tests

This should work:

```
make test
```

You'll need:

* Git
* NodeJS and `npm`
* Perl

## Running Specific Tests

There is a Pegex grammar file called `grammar.pgx`.

You can run a specific input against a specific grammar starting rule like so:

```
./test.sh 'rule-name' 'input text'        # JS and Perl
./test.coffee 'rule-name' 'input text'    # JS
./test.pl 'rule-name' 'input text'        # Perl
```

There also a file called `tests` that has a set of test specs in it. You can
run it like this:
```
./test.sh tests
```
