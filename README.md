# Capistrano recipe to inspect remote log files

Provides a couple of tasks for downloading and tail-following remote log files.

## Installation

The following assumes you use bundler. If you are working on a Rails 3 project, this should be the case.

To use this gem, first add the following to your Gemfile:

    gem "capistrano_tail_logs", :git => "git@github.com:amfranz/capistrano_tail_logs.git"

Then install the gem by executing:

    $ bundle install

Afterwards, add the following to your config/deploy.rb:

    require "tail_logs/capistrano"

## Usage

To tail-follow the remote log file, use this command:

    bundle exec cap log:tail

To download the remote log file, use this command:

    bundle exec cap log:download

## License

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the 'Software'), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
