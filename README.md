# PrxAccess

Welcome to PRX Access. This gem allows programmatic to the PRX HAL apis.

## Installation

Add this line to your application's Gemfile:

```
ruby gem 'prx_access'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install prx_access

## Usage

PRXAccess is meant to be used as a mixin for your classes. Here's a
short example of how to fetch podcasts from feeder in Ruby:

```
Running via Spring preloader in process 35676
Loading development environment (Rails 4.2.10)
irb(main):001:0> include PRXAccess
=> Object
irb(main):002:0> feeder_api = api(root: feeder_root)
=> #<PRXAccess::PRXHyperResource:0x3fce3bda28e0 @root="https://feeder.prx.org/api/v1" @href=nil @loaded=false @namespace="PRXAccess::PRXHyperResource" ...>
irb(main):003:0> root_api = feeder_api.get
=> #<PRXAccess::PRXHyperResource:0x3fce3bd1be08 @root="https://feeder.prx.org/api/v1" @href="/api/v1" @loaded=true @namespace="PRXAccess::PRXHyperResource" ...>
irb(main):004:0> podcasts_api = root_api.podcasts.first
=> #<PRXAccess::PRXHyperResource::Link:0x00007f9c779ee510 @resource=#<PRXAccess::PRXHyperResource:0x3fce3bd1be08 @root="https://feeder.prx.org/api/v1" @href="/api/v1" @loaded=true @namespace="PRXAccess::PRXHyperResource" ...>, @base_href="/api/v1/podcasts{?page,per,zoom}", @name=nil, @templated=true, @params={}, @default_method="get", @headers={}, @type=nil, @profile="http://meta.prx.org/model/collection/podcasts">
irb(main):005:0> podcasts_api.get.body
=> {"count"=>10, "total"=>122, "_embedded"=>{"prx:items"=>[  ... <snip json>
```

It's also possible to chain the calls:

```
api(root: feeder_root)
	.get
	.podcasts.first
	.get
	.body
```

## Development

After checking out the repo, run `bin/setup` to install dependencies.
Then, run `rake` to run the tests. You can also run `bin/console`
for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake
install`. To release a new version, update the version number in
`version.rb`, and then run `bundle exec rake release`, which will create
a git tag for the version, push git commits and tags, and push the
`.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/[USERNAME]/prx_access. This project is intended to be
a safe, welcoming space for collaboration, and contributors are expected
to adhere to the [Contributor Covenant](http://contributor-covenant.org)
code of conduct.

## Code of Conduct

Everyone interacting in the PrxAccess project’s codebases, issue
trackers, chat rooms and mailing lists is expected to follow the [code
of
conduct](https://github.com/[USERNAME]/prx_access/blob/master/CODE_OF_CONDUCT.md).
