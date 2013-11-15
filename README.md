websocket_ember_demo
====================

##WebSocket &amp; Ember chat application for demonstration at Nov, 14th, 2013 Boston Ember.js Meetup

To get started install postgres and create a new database called socks_development
(easier said than done if it is your first time, email me if you have any trouble)

  > createdb socks_development


install ruby 2.0.0-p247 (I recommend using rbenv and homebrew if you are on a mac)
then install bundler
  > gem install bundle

Clone the repository, and cd into the app folder:
git clone git@github.com:patrickjholloway/websocket_ember_demo.git
cd websocket_ember_demo


then run
  > bundle install --path .bundle
  > rake db:migrate
  > rake db:seed
  > rails s

Then in your browser hit http://localhost:3000 and click signup

once again, hit me up with any questions
@digtalpixelpro
patrickjholloway@gmail.com