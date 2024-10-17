FROM timbru31/ruby-node:3.2-18

RUN apt-get update -qq && apt-get install -y nano
RUN apt-get install -y zip

# Speed up install of some gems
# RUN gem install sass-rails -v 6.0.0

WORKDIR /custom_table_demo
COPY Gemfile /custom_table_demo/Gemfile
COPY Gemfile.lock /custom_table_demo/Gemfile.lock
COPY embedded_gems /custom_table_demo/embedded_gems

RUN bundle install

COPY package.json /custom_table_demo/package.json
COPY yarn.lock /custom_table_demo/yarn.lock
RUN yarn install --frozen-lockfile --modules-folder /usr/local/node_modules

ADD . /custom_table_demo
RUN ln -sf /usr/local/node_modules /custom_table_demo/node_modules

RUN rm -rf /custom_table_demo/tmp/* /custom_table_demo/log/*

ARG WITHOUT_ASSETS
RUN if [[ -z "$WITHOUT_ASSETS" ]]; then RAILS_ENV=production SECRET_KEY_BASE=nokey rails assets:precompile; fi;

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
