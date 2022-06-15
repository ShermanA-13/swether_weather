# **Swether Weather**

![languages](https://img.shields.io/github/languages/top/ShermanA-13/swether_weather?color=red)
![rspec](https://img.shields.io/gem/v/rspec?color=blue&label=rspec)
![simplecov](https://img.shields.io/gem/v/simplecov?color=blue&label=simplecov) <!-- ALL-CONTRIBUTORS-BADGE:START - Do not remove or modify this section -->
[![All Contributors](https://img.shields.io/badge/contributors-1-orange.svg?style=flat)](#contributors-)
<!-- ALL-CONTRIBUTORS-BADGE:END -->


## **Background and Description**

You are a back-end developer working on a team that is building an application to plan road trips. This app will allow users to see the current weather as well as the forecasted weather at the destination.

Your team is working in a service-oriented architecture. The front-end will communicate with your back-end through an API. Your job is to expose that API that satisfies the front-end team’s requirements.
## **Table of Contents**
- [Background and Description](#background-and-description)
- [Learning Goals](#learning-goals)
- [Requirements and Setup (for Mac):](#requirements-and-setup-for-mac)
    - [Ruby and Rails Versions](#ruby-and-rails-versions)
    - [Gems Utilized](#gems-utilized)
    - [APIs](#apis-consumed)
    - [SetUp](#setup)
- [Endpoints](#endpoints-provided)
- [Contributors](#contributors-)
## **Learning Goals**

- Expose an API that aggregates data from multiple external APIs
- Expose an API that requires an authentication token
- Expose an API for CRUD functionality
- Determine completion criteria based on the needs of other developers
- Research, select, and consume an API based on your needs as a developer



## **Requirements and Setup (for Mac):**

### **Ruby and Rails**
- Ruby Version 2.7.4
- Rails Version 5.2.8

### **Gems Utilized**
- [bcryt](https://www.rubydoc.info/gems/bcrypt-ruby/3.1.5)
- [capybara](https://github.com/teamcapybara/capybara)
- [faraday](https://github.com/lostisland/faraday)
- [figaro](https://github.com/laserlemon/figaro)
- [jsonapi-serializer](https://github.com/jsonapi-serializer/jsonapi-serializer)
- [launchy](https://github.com/copiousfreetime/launchy)
- [pry](https://github.com/pry/pry)
- [rspec_junit_formatter](https://github.com/sj26/rspec_junit_formatter)
- [rspec](https://relishapp.com/rspec)
- [shoulda-matchers](https://github.com/thoughtbot/shoulda-matchers)
- [securerandom](https://github.com/ruby/securerandom)
- [simplecov](https://github.com/simplecov-ruby/simplecov)
- [vcr](https://github.com/vcr/vcr)
- [webmock](https://github.com/bblimke/webmock)

## **APIs Consumed**
- [MapQuest](https://developer.mapquest.com/documentation/)
- [OpenWeather](https://openweathermap.org/api)
- [Open Library](https://openlibrary.org/developers/api)
- [Pexel](https://www.pexels.com/api/documentation/)


## Setup
1. Clone this repository:
On your local machine open a terminal session and enter the following commands for SSH or HTTPS to clone the repositiory.


- using ssh key <br>
```shell
$ git clone git@github.com:ShermanA-13/swether_weather.git
```

- using https <br>
```shell
$ git clone https://github.com/ShermanA-13/swether_weather.git
```

Once cloned, you'll have a new local copy in the directory you ran the clone command in.

2. Change to the project directory:<br>
In terminal, use `$cd` to navigate to the backend Application project directory.

```shell
$ cd swether_weather
```

3. Install required Gems utilizing Bundler: <br>
In terminal, use Bundler to install any missing Gems. If Bundler is not installed, first run the following command.

```shell
$ gem install bundler
```

If Bundler is already installed or after it has been installed, run the following command.

```shell
$ bundle install
```

* There should be be verbose text diplayed of the installation process that looks similar to below. (this is not an actual copy of what will be output).

<details>
<summary><b>Click to see example!</b></summary>
<p>

```shell
$ bundle install
Fetching gem metadata from https://rubygems.org/...........
Fetching gem metadata from https://rubygems.org/.
Resolving dependencies...
Using rake 13.0.6
Using concurrent-ruby 1.1.10
...
...
...
Using simplecov_json_formatter 0.1.4
Using simplecov 0.21.2
Using spring 2.1.1
Using spring-watcher-listen 2.0.1
Using standard 1.12.1
Bundle complete! 23 Gemfile dependencies, 94 gems now installed.
Use `bundle info [gemname]` to see where a bundled gem is installed.
```

</p>
</details></br>

* If there are any errors, verify that bundler, Rails, and your ruby environment are correctly setup.

4. Figaro installation<br>

* Follow the [figaro](https://github.com/laserlemon/figaro) installation with the docs and get your [api keys](#apis-consumed). Add all keys to your newly created `config/application.yml` file and add it to your `.gitignore` file if it wasn't automatically created. Be sure to read the [all the docs](#apis-consumed) for a deeper undestanding of the app and how to properly use the endpoints.

```sh
$ bundle exec figaro install
```

5. Database Migration<br>
Before using the web application you will need to setup your databases locally by running the following command

```shell
$ rails db:{:drop,:create,:migrate}
```

6. Startup and Access<br>
Finally, in order to use the web app you will have to start the server locally and access the app through a web browser.
- Start server

```shell
$ rails s
```

- Open web browser and visit link
    http://localhost:3000

At this point you should be able to access the endpoints with postman.

## Endpoints provided
[]

<details>
<summary><b>Click to see example!</b></summary>
<p>

```sh
Prefix Verb URI Pattern                                           Controller#Action
           api_v1_weather GET  /api/v1/weather(.:format)          api/v1/weather#index
       api_v1_backgrounds GET  /api/v1/backgrounds(.:format)      api/v1/backgrounds#index
       api_v1_book_search GET  /api/v1/book-search(.:format)      api/v1/book_search#index
             api_v1_users POST /api/v1/users(.:format)            api/v1/users#create
          api_v1_sessions POST /api/v1/sessions(.:format)         api/v1/sessions#create
              api_v1_trip POST /api/v1/trip(.:format)             api/v1/trip#create
```

</p>
</details></br>

## **Contributors ✨**

Thanks go to these wonderful people ([emoji key](https://allcontributors.org/docs/en/emoji-key)):

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>

  <tr>

   <td align="center"><a href="https://github.com/ShermanA-13"><img src="https://avatars.githubusercontent.com/u/95321606?s=400&u=90b2d52424bfbec5411b711901d4789f2e40c470&v=4" width="100px;" alt=""/><br /><sub><b>Sherman A. (he/him)</b></sub></a><br /><a href="https://www.linkedin.com/in/sherman-au-2b4a69142/" title ="Linked In"><img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white" /></a><br /><a href="https://github.com/ShermanA-13/gear-up-be/commits?author=ShermanA-13" title="Code">💻</a> <a href="" title="Ideas, Planning, & Feedback">�</a> <a href="" title="Tests">⚠️</a> <a href="https://github.com/ShermanA-13/gear-up-be/pulls?q=is%3Apr+author%3AShermanA-13" title="Reviewed Pull Requests">👀</a></td>

  </tr>
</table>

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->

This project follows the [all-contributors](https://github.com/all-contributors/all-contributors) specification.
<!--


git remote add origin git@github.com:ShermanA-13/realational_rails.git
git branch -M main
git push -u origin main