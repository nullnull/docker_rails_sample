FROM ruby:2.4.1

RUN apt-get update -qq && \
    apt-get install -y apt-utils build-essential apt-transport-https nodejs npm mysql-client libxml2-dev && \
    npm install -g n && \
    n lts && \
    ln -fs /usr/local/bin/node /usr/bin/node && \
    ln -fs /usr/local/bin/npm /usr/bin/npm && \
    npm install -g phantomjs-prebuilt && \
    apt-get purge -y nodejs npm && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo 'deb https://dl.yarnpkg.com/debian/ stable main' > /etc/apt/sources.list.d/yarn.list && \
    apt-get update && \
    apt-get install -y yarn && \
    apt-get clean -y && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/* && \
    gem update --system && \
    gem install bundler

ENV BUNDLE_PATH vendor/bundle/ruby/2.4.1

RUN mkdir /app
WORKDIR /app

EXPOSE 3000

COPY . /app
RUN bundle install
RUN yarn install

CMD ["rails", "server", "-b", "0.0.0.0"]
