# yard-bond

* [Homepage](https://github.com/postmodern/yard-bond#readme)
* [Issues](https://github.com/postmodern/yard-bond/issues)
* [Documentation](http://rubydoc.info/gems/yard-bond/frames)
* [Email](mailto:postmodern.mod3 at gmail.com)

## Description

Provides a rake task for generating [Bond.complete] rules from YARD
documentation. The rake task ensures the generated Bond completion rules
are regenerated when the YARD documentation is updated.

## Features

* Generates completions for method options.

## Examples

### Rakefile

Defines a rake file task for `lib/bond/completions/mylibrary.rb`:

    require 'yard/bond/task'
    YARD::Bond::Task.new('mylibrary')

### mylibrary.gemspec

Ensure the completion file is included in the gem:

    spec.files << 'lib/bond/completions/mylibrary.rb'

## Requirements

* [yard] ~> 0.8

## Install

    $ gem install yard-bond

## Copyright

Copyright (c) 2014 Hal Brodigan

See {file:LICENSE.txt} for details.

[yard]: https://github.com/lsegal/yard#readme
[Bond.complete]: http://rubydoc.org/gems/bond/Bond#complete-instance_method
