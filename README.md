# OmniAuth Central ID
[![Build Status](https://semaphoreapp.com/api/v1/projects/a1479ff0-5ef6-4182-9577-116a668c090c/309883/badge.png)](https://semaphoreapp.com/olimart/omniauth-centralid)

This gem contains the Central ID strategy for OmniAuth.

## Usage

First start by adding this gem to your Gemfile:

```ruby
gem 'omniauth-centralid'
```

Next, tell OmniAuth about this provider. For a Rails app, your config/initializers/omniauth.rb file should look like this:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :centralid, "CENTRALID_KEY", "CENTRALID_SECRET"
end
```

Replace "CENTRALID_KEY" and "CENTRALID_SECRET" with the appropriate values created earlier.

In your routes file

```ruby
get 'auth/:provider/callback', to: 'oauths#create'
get 'auth/failure',            to: 'oauths#failure' # optional (to override default redirect behaviour)
```

Add controller (oauths_controller.rb as per defined in routes)

```ruby
  # sends the user on a trip to the provider,
  # and after authorizing there back to the callback url.
  def create
    auth = request.env['omniauth.auth']
    user = User.find_by(provider: auth['provider'], uid: auth['uid']).try(:user) || User.create_with_omniauth(auth)
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

And finally add `create_with_omniauth` method in your user model.

```ruby
  private

  def self.create_with_omniauth(auth)
    user = create! do |user|
      user.full_name   = auth['info']['name']
      user.email       = auth['info']['email']
      user.password    = SecureRandom.hex
      user.authentications.new(
        provider: auth['provider'],
        uid:      auth['uid']
      )
    end
    user
  end
```
