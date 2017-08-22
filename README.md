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

![Odot Created](docs/img/3_Odot_Created.png?raw=true "Odot Created")

With the Odot created, you will see the Odot that you have just created.

Click on "back", and you will go back the first page `\odots`.

![Odot Index Page](docs/img/4_Odot_Index.png?raw=true "Odot Index")

Over here, you will see a list of Odots that you have created. Let's create 2 more.

![Odot Index with Many Items](docs/img/5_Odot_Index_with_many_items.png?raw=true "Odot Index with Many Items")

Notice that you can edit the title or description by clicking "Edit" link.

![Editing Odot](docs/img/6_Editing_Odot.png?raw=true "Editing Odot")

Now you will see the `\odots` with updated title and description:

![Odot Index with Edited Items](docs/img/7_Odot_index_with_edited_item.png?raw=true "Odot Index with Edited Items")

You can also delete the todo list by clicking "Destroy".

![Odot Destroyed](docs/img/8_Odot_destroyed.png?raw=true "Odot Destroyed")

Basically that's it. Right now you have a functioning application (although it is quite ugly). Not too bad with just a single line of command, right?

### Step 3: Create Todo List without using Scaffold

Scaffold is great. But it has too much "magic" involved. There are also situations where you do not need to generate scaffold. As with most other learning programs, it is better for you to plan your application, then generate the model/controller respectively.

#### User stories

One way to plan web application is to do use "user stories". User stories are features your web application should do from the user perspectives. For the purpose of this application, I came out with the following user stories for Todo List:

1. As a user, I should be able to view all my todo lists.
2. As a user, I should be able to create todo list.
3. As a user, I should be able to archive my todo list.
4. As a user, I should be able to delete my todo list.
5. As a user, I should be able to edit the title and description of the todo list.
6. As a user, I should be able to view only my non-archive todo list.

Notice that user stories is in the form of "As a user, I should be able to ...". This make sure that the perspective is always from the user.

#### View all Todo Lists

Let's try coding the first feature. In this learning group, we are adopting the practice of test-driven development. This means that we write the test first, then we attempt to make the test pass.

You already have installed rspec from Step 1. So the first thing to do is generate a feature spec:

```
rails generate rspec:feature todo_lists
```

A file is created under `spec/features/` with the name `todo_lists_spec.rb`. Go to this file, and type the below code:

*spec/features/todo_lists_spec.rb*
```ruby
require 'rails_helper'

RSpec.feature "TodoLists", type: :feature do

  feature "view all todo lists" do

    it "should render the page successfully" do
      visit "/todo_lists"
      expect(page).to have_http_status(:success)
    end

  end

end
```

Can you guess what is this file about? It is a spec (or a test) that you have written based on a user story "I should be able to view all my todo list".

So imagine you are the user, you try to visit "/todo_lists" path, and you expect that the page to render successfully. For grouping purpose, I categorize this under the feature "view all todo lists", and the description of this spec is "should render the page successfully".

Now try running the spec:

```
bundle exec rspec spec/features/todo_lists_spec.rb
```

The test will fail. This is because of an error:

```
1) TodoLists view all todo lists should render the page successfully
     Failure/Error: visit "/todo_lists"

     ActionController::RoutingError:
       No route matches [GET] "/todo_lists"
```

Pay special attention to this sentence:

```
ActionController::RoutingError:
  No route matches [GET] "/todo_lists"
```

The test fail because there is no route that matches "/todo_lists".

Imagine every request is a visitor to your office. You are the boss of the company. The first thing the visitor see is your receptionist. Right now, this visitor is asking for "/todo_list". Your receptionist need to know what to do when any visitor ask for "/todo_list".

In this case, your receptionist is your route. You can tell your route (or receptionist) what to do in the `config/routes.rb` file. Insert the following line into your `routes.rb` file. It should be insert before the `end` keyword.

*config/routes.rb*
```ruby
get "/todo_lists", to: "todo_lists#index"
```

Your file should look something like this now:
```ruby
Rails.application.routes.draw do
  resources :odots
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/todo_lists", to: "todo_lists#index"
end
```

This line `get "/todo_lists", to: "todo_lists#index"` tells your routes that whenever it gets a request to "/todo_lists", direct them to the controller named "todo_lists" with the "index" action. You can think of the controller "todo_lists" as a department, and the action "index" as a person in the department.

You are telling the receptionist that as long as she sees the request "/todo_lists", direct them to "index" person in the "todo_lists" department.

At this point, the receptionist job is done.

Now try running the test again. You will still fail for a different reason. The error is:

```
1) TodoLists view all todo lists should render the page successfully
    Failure/Error: visit "/todo_lists"

    ActionController::RoutingError:
      uninitialized constant TodoListsController
```
