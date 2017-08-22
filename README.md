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

### Step 2: Generate Rails Scaffold (Optional)

This step is optional. The idea is to show you what Rails actually help you to do by default. As this is more of a demonstration and not the actual coding of the application, we will not use the actual naming convention.

Generating scaffold is the fastest way to develop an application. A scaffold includes a controller (with the default 7 controller actions), model, and views.

This is a Todo list application. So the user will have to create a todo list, i.e. a list of things that the user want to do.

So let's assume that each todo list will need to have 2 fields:
* title: The title of the todo list (`string`)
* description: Description of the todo list (`text`)

Once you have decide on what field you want your Todo list to have, you can generate the scaffold with the following command:

```
rails generate scaffold Odot title:string description:text
```

I use Odot for the name of the todo list. It is the inverse of todo.

Migrate your database:

```
rails db:migrate
```

Migration means creating the table and the necessary columns in the database. The tables and the columns are also known as the schema.

Notice that once you run the command, you will see Rails create a list of files. They can serve as a good reference when we are building the actual todo list.

Looking at `config/routes.rb` file, you notice that there is an additional line added:

```ruby
resources :odots
```

This line added 7 default routes for the resource Odots. Try running `rails routes` in your bash/terminal, you will see the following:

```
Prefix Verb   URI Pattern               Controller#Action
    odots GET    /odots(.:format)          odots#index
          POST   /odots(.:format)          odots#create
 new_odot GET    /odots/new(.:format)      odots#new
edit_odot GET    /odots/:id/edit(.:format) odots#edit
     odot GET    /odots/:id(.:format)      odots#show
          PATCH  /odots/:id(.:format)      odots#update
          PUT    /odots/:id(.:format)      odots#update
          DELETE /odots/:id(.:format)      odots#destroy
```

For now, concentrate on the *URI Pattern* column. For example, if you see `/odots`, this means that the path is `<your root_url>/odots`. For example, if your home page is https://www.example.com, to access the `/odots`, means you have to go to https://www.example.com/odots.

In the third column *Controller#Action* tells you which controller and which action the path maps into. Let's just look at `/odots` first.

Start your rails server:

```
rails server
```

If you are using cloud9, use the following command instead:

```
rails server -b $IP -p $PORT
```

You will see a very simple page with a link to create new Odot.

![Odot Index Page](docs/img/1_Odot_index.png?raw=true "Odot Index")

Click on that link.

Then you see a form for you to fill in the title and the description. Notice that this is the fields that we have set when we generate scaffold.

![New Odot Page](docs/img/2_New_Odot.png?raw=true "New Odot Page")

Let's fill in some dummy names, then click on "Create Odot".

![Odot Created](docs/img/3_Odot_Created?raw=true "Odot Created")

With the Odot created, you will see the Odot that you have just created.

Click on "back", and you will go back the first page `\odots`.

![Odot Index Page](docs/img/4_Odot_index.png?raw=true "Odot Index")

Over here, you will see a list of Odots that you have created. Let's create 2 more.

![Odot Index with Many Items](docs/img/5_Odot_Index_with_many_items.png?raw=true "Odot Index with Many Items")

Notice that you can edit the title or description by clicking "Edit" link.

![Editing Odot](docs/img/6_Editing_Odot.png?raw=true "Editing Odot")

Now you will see the `\odots` with updated title and description:

![Odot Index with Edited Items](docs/img/7_Odot_index_with_edited_item.png?raw=true "Odot Index with Edited Items")

You can also delete the todo list by clicking "Destroy".

![Odot Destroyed](docs/img/8_Odot_destroyed.png?raw=true "Odot Destroyed")

Basically that's it. Right now you have a functioning application (although it is quite ugly). Not too bad with just a single line of command, right?
