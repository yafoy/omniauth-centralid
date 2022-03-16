# OmniAuth Central ID
[![Build Status](https://semaphoreci.com/api/v1/olimart/omniauth-centralid-2/branches/master/badge.svg)](https://semaphoreci.com/olimart/omniauth-centralid-2)

This gem offers OmniAuth strategy for Central ID service.

## Usage

First start by adding this gem to your Gemfile:

```ruby
gem "omniauth-centralid"
```

Next, let OmniAuth know about provider. In a Rails app, create an initializer for instance `config/initializers/omniauth.rb` with:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :centralid, "CENTRALID_KEY", "CENTRALID_SECRET"
end
```
You can override config, like
```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :centralid, "CENTRALID_KEY", "CENTRALID_SECRET",
  client_options: {
    site: "http://localhost:3000"
  }
end
```
In your routes file:

```ruby
get "auth/:provider/callback", to: "oauths#create"
get "auth/failure",            to: "oauths#failure" # optional (to override default redirect behaviour)
```

Add a controller (oauths_controller.rb as defined in your routes)

```ruby
  # sends the user on a trip to the provider,
  # and after authorizing there back to the callback url.
  def create
    auth = request.env["omniauth.auth"]
    user = User.find_by(provider: auth["provider"], uid: auth["uid"]).try(:user) || User.create_with_omniauth(auth)
    # Sign in the user
    session[:user_id] = user.id
    redirect_to dashboard_path
  end

  # By default, it is supposed to raise an exception in development mode
  # and redirect otherwise. Override if needed.
  def failure
    redirect_to login_path
  end
```

And finally add a `create_with_omniauth` method in your user model.

```ruby
  private

  def self.create_with_omniauth(auth)
    user = create! do |user|
      user.full_name   = auth["info"]["name"]
      user.email       = auth["info"]["email"]
      user.password    = SecureRandom.hex
      user.authentications.new(
        provider: auth["provider"],
        uid:      auth["uid"]
      )
    end
    user
  end
```

## Contributing

Run tests with `rake test`
