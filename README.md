# YC - YAML COMMAND

[Website](http://rubyworks.github.com/yc) /
[Report Issue](http://github.com/rubyworks/yc/issues) /
[Development](http://github.com/rubyworks/yc) /
[IRC Channel](irc://chat.us.freenode.net/rubyworks)


## Description

YC is a command line tool for working with YAML.

Currently it is very much a work in progress, so please expect potential
issues and interface changes! In paricular, YC won't be a useful as it
should be until a solid YPath library is available.

## Commands

Commands are invoked simply enough:

    $ yc <command> [options...] [arguments...]

### get

The `get` command simply extracts a portion of a YAML file and outputs
it to stdout.

### set

The `set` commnd is the opposite of `get` in that it lets you change
a portion of a YAML file. By defult the changes YAML document will go
to stdout, using the `--save` option rewrites the file with the change.

### sort

The sort command can be used to sort portions of a YAML document.

### slurp

Slurp takes a directory and converts it's contents into a YAML file.

### splat

Splat take a YAML file and converts it into a file directory structure.
It is essentially the opposite of slurp.

### edit

Edit will open a YAML file for editing in the default editor (as defined by 
$EDITOR), and allow you to edit it.

If instead you edit a directory, the the directory will be automatically 
slurped into a temporary file. After editing the temporary file will be
splatted back out to update the directory and it's files.

### view

Outputs a colized rendering of the YAML file.


## Requirements

YC uses the [Executable](http://rubyworks.github.com/executable) library for
command line parsing and the [ANSI](http://rubyworks.github.com/ansi)
library for handling console colorization.


## Copyrights

Copyright (c) 2011 Rubyworks. All rights reserved.

YC may be distributed in accordance with the **BSD-2-Clause** license.

See the LICENSE.txt file for details.



