# Use the official lightweight Ruby image.
# https://hub.docker.com/_/ruby
FROM ruby:3.0.0

## ENV
ENV RAILS_ENV=production
ENV PORT=3000
ENV RAILS_LOG_TO_STDOUT=1

## YARN
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update -qq && apt-get install -y \
    build-essential \
    nodejs \
    yarn \
 && rm -rf /var/lib/apt/lists/*

# Install production dependencies.
WORKDIR /usr/src/app
COPY Gemfile Gemfile.lock ./
ENV BUNDLE_FROZEN=true
RUN gem install bundler -v 2.2.6 && bundle install

# Copy local code to the container image.
COPY . ./
RUN yarn install --check-files

# migration
RUN bin/rails db:migrate RAILS_ENV=production

# assets precompile
RUN bundle exec rake assets:precompile RAILS_ENV=production

# Remove a potentially pre-existing server.pid for Rails.
RUN rm -f tmp/pids/server.pid

# Run the web service on container startup.
CMD bundle exec rails server -p ${PORT} -b 0.0.0.0
