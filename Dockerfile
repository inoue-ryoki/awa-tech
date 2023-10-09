FROM ruby:2.6.5
RUN apt-get update && apt-get install -y nodejs npm && npm install n -g && n 14.19.3 --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get install -y mariadb-client --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
# install yarn
RUN npm install --global yarn@1.22.19
RUN yarn install --check-files
RUN mkdir /workdir
WORKDIR /workdir
ADD Gemfile /workdir/Gemfile
ADD Gemfile.lock /workdir/Gemfile.lock
RUN gem install bundler:2.1.4
RUN bundle install
RUN bundle exec rails webpacker:compile
ADD . /workdir
CMD ["rails", "server", "-b", "0.0.0.0"]
