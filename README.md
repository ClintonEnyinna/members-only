Members Only!
==============

Microverse authentication project with the use of bcrypt gem to develop an application that allows users to create posts and the authors of the posts are displayed only if as a User you are logged in.

## What it does?
Exclusive clubhouse where your members can write embarrassing posts about non-members. Inside the clubhouse, members can see who the author of a post is but, outside, they can only see the story and wonder who wrote it.

## How it works?
The Model is working on top of the following resources:

- Ruby (version 2.6.5)
- Rails (version 5.2.4)
- Bcrypt (version 3.1.13)

And the next dependencies:


- sqlite3
- puma
- sass-rails
- uglifier
- coffee-rails
- turbolinks
- jbuilder
- bootsnap

## Usage
### Step 1: Clone and install dependencies
Clone the repo and run `bundle install` to get all the gems on your terminal.
### Step 2: Run database migration
From terminal type `rails db:migrate` to get your schema updated
### Step 3: Work on IRB
That's it on configuration. Now you can just open IRB and begin to sign up users with `rails console` and run some of the below commands:


- `User.create(name:"your_user_name", email:"your_email@mail.com", password:"YOUR_PASSWORD_HERE", password_confirmation:"YOUR_PASSWORD_HERE_AGAIN")` for creating a new sample user

Feel free to play with the db adding more users and just start the server with `rails server`.
### Step 4: View your app
Now you can navigate to `localhost:3000` on your browser to see your app working. Sign in with your previously created user credentials, and go on to make new post! You will only see the authors while you're logged in.


## 🤝 Contributing

Contributions are more than welcome!<br/>Feel free to check [issues page](https://github.com/ClintonEnyinna/members-only/issues).

1. Fork (https://github.com/ClintonEnyinna/members-only/development/fork)
2. Create your working branch (git checkout -b [branch_name])
3. Commit your changes (git commit -am 'what you will add or fix or improve')
4. Push (git push origin [branch_name])
5. Create a PR

## 🤖 Contributor

Clinton Enyinna - [GitHub](https://github.com/ClintonEnyinna)
<br>
Ricardo Valtierra - [GitHub](https://github.com/ricardovaltierra)

## 🙋‍♂ Support :)

Give a ⭐️ if you liked it!

## 📝 License

This project is under the [MIT](LICENSE) license.
