# Adjust

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

```ruby
Adjust.configure do |config|
  config.app_token = '<YOUR_ADJUST_APP_TOKEN>'
  config.environment = '<production|sandbox>'
end
```

##### Event tracking

*`idfa` can also be any other values such as `android_id` or `gps_adid` check Adjust's documentation for details.*

```ruby
Adjust.event(token: :token, idfa: :idfa).track!
```


##### Revenue tracking

*`idfa` can also be any other values such as `android_id` or `gps_adid` check Adjust's documentation for details.*

```ruby
Adjust.revenue(token: :token, revenue: 1.25, currency: 'USD|CAD|EUR', idfa: :idfa).track!
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/adjust/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
