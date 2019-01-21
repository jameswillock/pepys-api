FROM ruby:2.6-alpine3.8

# Set local timezone
RUN apk add --update tzdata && \
    cp /usr/share/zoneinfo/Europe/London /etc/localtime && \
    echo "Europe/London" > /etc/timezone

# Install your app's runtime dependencies in the container
RUN apk add --update --virtual runtime-deps postgresql-client nodejs libffi-dev readline

# Bundle into the temp directory
WORKDIR /tmp
ADD Gemfile* ./

RUN apk add --virtual build-deps build-base postgresql-dev libc-dev linux-headers libxml2-dev libxslt-dev readline-dev && \
    bundle install --jobs=2 && \
    apk del build-deps

# Copy the app's code into the container
ENV APP_HOME /app
COPY . $APP_HOME
WORKDIR $APP_HOME

# Expose port 3000 from the container
EXPOSE 3000

LABEL maintainer="James Willock <james.willock@gmail.com>"

# Run puma server by default
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
