# NoMAD group condition
Deploy Munki packages based on NoMAD group membership

### What is this?

This is a script to provide Munki with a user's AD groups, supplied by NoMAD. You can add manifest items, based on the presence of particular groups.

### How do I use it?

You can build the pkg using [munkipkg](https://github.com/munki/munki-pkg). You'll also need to be using [Munki](https://github.com/munki/munki) and [NoMAD](https://nomad.menu).

See the script for instructions on how to deploy a package based on your users' AD groups.

### Requirements

I've deployed this on macOS 10.12, 10.13, and 10.14. It should work on any OS that both Munki and NoMAD support.