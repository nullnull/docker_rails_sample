FROM ruby:2.4.1

RUN apt-get update -qq && \
    apt-get install -y apt-utils build-essential apt-transport-https mysql-client libxml2-dev

RUN apt-get install -y nodejs npm && \
    npm install -g n && \
    n lts && \
    ln -fs /usr/local/bin/node /usr/bin/node && \
    ln -fs /usr/local/bin/npm /usr/bin/npm && \
    npm install -g phantomjs-prebuilt --unsafe-perm && \
    apt-get purge -y nodejs npm

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo 'deb https://dl.yarnpkg.com/debian/ stable main' > /etc/apt/sources.list.d/yarn.list && \
    apt-get update && \
    apt-get install -y yarn && \
    apt-get clean -y && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*

ENV BUNDLE_PATH vendor/bundle/ruby/2.4.1
ENV APP_ROOT /app

RUN mkdir $APP_ROOT
WORKDIR $APP_ROOT

ADD Gemfile ${APP_ROOT}/Gemfile
ADD Gemfile.lock ${APP_ROOT}/Gemfile.lock
RUN bundle install

ADD package.json $APP_ROOT
ADD yarn.lock $APP_ROOT
RUN yarn install --frozen-lockfile

COPY . $APP_ROOT

RUN bundle exec rake assets:precompile

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
