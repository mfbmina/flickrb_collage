# FlickrbCollage

This gem should:

* accepts a list of search keywords as arguments
* queries the Flickr API for the top-rated (term: interestingness) image for each keyword
* downloads the results
* crops them rectangularly
* assembles a collage grid from ten images and
* writes the result to a user-supplied filename

If given less than ten keywords, or if any keyword fails to
result in a match, it will retrieve random words from a dictionary
source such as `/usr/share/dict/words`. 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'flickrb_collage'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install flickrb_collage

## Usage

You need a config file named  ```config/flickr.yml``` with:

```yml
flickr:
  api_key: "yourapikey"
  secret: "yoursecret"
```

Create a file with:
```ruby
require 'flickrb_collage'

# you should pass an array of keywords. If you dont, the system will get random keywords
FlickrbCollage.create(ARGV)
```

And then:
```
ruby yourfile.rb
```

Or you can:
```
ruby yourfile.rb cat horse cow dog fish pig lion tiger wolf shark
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mfbmina/flickrb_collage.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
