# OmniAuth Central ID
[![Build Status](https://semaphoreapp.com/api/v1/projects/a1479ff0-5ef6-4182-9577-116a668c090c/309883/badge.png)](https://semaphoreapp.com/olimart/omniauth-centralid)

This gem offers OmniAuth strategy for Central ID service.

## Usage

First start by adding this gem to your Gemfile:

```ruby
gem 'omniauth-centralid'
```

Next, tell OmniAuth about this provider. In a Rails app, create an initializer for instance `config/initializers/omniauth.rb` with:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :centralid, "API_KEY", "API_SECRET"
end
```

Replace "API_KEY" and "API_SECRET" with the appropriate values created earlier.

## Contributing

Run tests with `rake test`

## License

Copyright (c) 2014 by yafoy

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
