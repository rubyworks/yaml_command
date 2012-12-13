# YAML COMMAND

[Website](http://rubyworks.github.com/yaml_command) /
[Report Issue](http://github.com/rubyworks/yaml_command/issues) /
[Development](http://github.com/rubyworks/yaml_command) /
[IRC Channel](irc://chat.us.freenode.net/rubyworks)


## Description

YAML Command is a command line tool for working with YAML files.

While currently a work in progress, the goal is evolve the design
for a standardized `yaml` command line tool. While this early
implementation is written in Ruby, ultimately the final version
would be written in C and be widely available.

IMPORTANT NOTE! YPath is not yet implemented so only simple name
references can be used at this point.


## Usage

Commands are invoked on the command line with:

    $ yaml <command> [options...] [arguments...]

### Commands

The following commands are currently supported:

* **get** <br/>
  The `get` command simply extracts a portion of a YAML file and outputs
  it to stdout.

* **set** <br/>
  The `set` command is the opposite of `get` in that it lets you change
  a portion of a YAML file. By default the changed YAML document will go
  to stdout, using the `-s/--save` option rewrites the file with the change.

* **sort** <br/>
  The `sort` command can be used to sort portions of a YAML document.

* **slurp** <br/>
  The `slurp` command takes a directory and converts it's contents into a YAML file.

* **splat** <br/>
  The `splat` command take a YAML file and converts it into a file directory structure.
  It is essentially the opposite of slurp.

* **edit** <br/>
  Edit will open a YAML file for editing in the default editor (as defined by 
  $EDITOR), and allow you to edit it.

  If instead you edit a directory, then the directory will be automatically 
  slurped into a temporary file. After editing the temporary file will be
  splatted back out to update the directory and it's files.

* **view** <br/>
  Outputs a colorized rendering of the YAML file.

### Options

Some commands has special options. Use `yaml <command> --help` to learn about those.
All (or nearly all) commands support the following options.

* **-F** / **--file [PATH]** <br/>
  Use the given YAML file instead of using stdin.

* **-y** / **--yaml** <br/>
  Output results in YAML format.

* **-j** / **--json** <br/>
  Output results in JSON format.

* **-m** / **--mute** <br/>
  Suppress all output.

* **-f** / **--force** <br/>
  Used to force overwrites when necessary.

* **--debug** <br/>
  Turn on debug mode to get detailed error report if there is a problem.


## Installation

### Ruby Interpreter

The `yaml` command is a Ruby script, so you will need a Ruby interpreter installed on your system.
There are a few of these now, such as Rubinius, JRuby and the original MRI. The later is the typical
choice, and usually can be installed via your operating system's package manager. For example, on
dpkg-based systems like Ubuntu, you can type in a shell console:

    $ apt-get install ruby

### Using RubyGems

With Ruby installed, the easiest way to install a Ruby library is via RubyGems. To install YAML Command
just type:

    $ gem install yaml_command

### Requirements

YAML Command requires the following other packages be installed:

* [Executable](http://rubyworks.github.com/executable) library handle CLI parsing.
* [ANSI](http://rubyworks.github.com/ansi) library provides console colorization.

If you are using RubyGems these will be install automatically.


## Copyrights

Copyright (c) 2011 Rubyworks. All rights reserved.

YAML Command may be distributed in accordance with the **BSD-2-Clause** license.

See the LICENSE.txt file for details.
