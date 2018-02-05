# NoMAD group condition
Deploy Munki packages based on NoMAD group membership

### What is this?

This is a script to provide Munki with a user's AD groups, supplied by NoMAD. You can add manifest items, based on the presence of particular groups.

### How do I use it?

It's easiest if you have [The Luggage](https://github.com/unixorn/luggage) installed. If you do, make sure you have my [luggage.local file](https://github.com/flammable/luggage_local) in place (or the relevant portions copied to your luggage.local file). You'll also need to be using [Munki](https://github.com/munki/munki) and [NoMAD](https://nomad.menu).

If you have all of that in place, just `cd` into the directory and run `make dmg`, `make pkg`, or `make munkiimport`.

See the script for instructions on how to deploy a package based on your users' AD groups.

### Requirements

I've tested this on macOS 10.12 and 10.13, though it should work on any OS that both Munki and NoMAD support.