# GifOptimizer

This gem allows you to simply optimize gifs via gifsicle.
Inspired by [image_optimizer](https://github.com/jtescher/image_optimizer).

## Installation

##### This gem uses the following utilities for optimizing gifs:

1. gifsicle, which can be found and installed from [this link](http://www.lcdf.org/gifsicle/)

Or install the utilities via homebrew:

```bash
$ brew install gifsicle
```

Then add this line to your application's Gemfile:

    gem 'gif_optimizer'

And then execute:

```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install gif_optimizer
```

## Usage

#### Optimize:

```ruby
GifOptimizer::Optimizer.new("path/to/file.gif").optimize
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
