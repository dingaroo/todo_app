# Todo List App

This application is the demonstration of the first session in Singapore Rails Learning Group. It uses SQLite as the database.

## Steps to develop this application

### Step 1: Update your gemfile to include the testing suite

Update your gemfile to include the below gems:

```ruby
group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  gem 'rspec-rails'
  gem 'factory_girl_rails'
end

group :test do
  gem 'rails-controller-testing'
  gem 'faker'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'selenium-webdriver'
end
```

Then run the following command to install rspec:

```
rails generate rspec:install
```

This will add the following files:

* `.rspec`
* `spec/spec_helper.rb`
* `spec/rails_helper.rb`

Use the `rspec` command to run your specs:

```
bundle exec rspec
```

You should see `0 examples, 0 failures` in your terminal/bash.
