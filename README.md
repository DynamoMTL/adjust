# Adjust [![Build Status](https://travis-ci.org/DynamoMTL/adjust.svg?branch=master)](https://travis-ci.org/DynamoMTL/adjust)

This gem is meant for use with server to server integration with Adjust. More information can be found here: [Server-side event tracking](https://docs.adjust.com/en/event-tracking/#reference-server-side-event-tracking)

## Installation

##### Add this line to your application's Gemfile:

    gem 'adjust'

##### And then execute:

    $ bundle

##### Or install it yourself as:

    $ gem install adjust

## Usage

##### Configuration

By default the configurations will be read from `config/adjust.yml`. Also of note the environment loaded will be that of RACK_ENV, RAILS_ENV or as a last resort default of 'development'.

Example config:
```yaml
development:
  environment: sandbox
  dev_app:
    app_token: app_token
    event1:
      event_token: event_token
```

We would then be able to refer to the token using the key given in the config:

```ruby
Adjust.event(app: :dev_app, event: :event1, idfa: :idfa).track!
```

Or by their tokens

```ruby
Adjust.event(app: :app_token, event: :event_token, idfa: :idfa).track!
```

Loading the configurations

```ruby
Adjust.load(environment: 'test') # => {...}
Adjust.load('path/to/adjust.yml')  # => {...}
Adjust.load('path/to/adjust.yml', environment: 'staging') # => {...}
Adjust.load(config: {...}) # => {...}
Adjust.load(config: {...}, environment: 'staging') # => {...}
Adjust.load(config: Rails.application.secrets.adjust) # => {...}

```

##### Event tracking

*`idfa` can also be any other values such as `android_id` or `gps_adid` check Adjust's documentation for details.*

```ruby
Adjust.event(app: :app, event: :event, idfa: :idfa).track!
```


##### Revenue tracking

*`idfa` can also be any other values such as `android_id` or `gps_adid` check Adjust's documentation for details.*

```ruby
Adjust.revenue(app: :app, event: :event, revenue: 1.25, currency: 'USD|CAD|EUR', idfa: :idfa).track!
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/adjust/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
