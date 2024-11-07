FROM ruby:3.3.6

RUN gem install bridgetown -N 

RUN apt-get update && \
    apt-get install -y curl && \
    curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs && \
    npm install --global yarn && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /src

COPY Gemfile Gemfile.lock package.json yarn.lock /src/

RUN bundle install --jobs $(nproc) --retry 3 && yarn install

EXPOSE 4000

ENTRYPOINT ["bin/bridgetown", "start"]
