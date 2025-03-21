FROM ruby:3.2

# Install system dependencies
RUN apt-get update -qq && apt-get install -y nodejs yarn build-essential

# Set working directory
WORKDIR /myapp

# Copy Gemfiles first and install dependencies
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN gem install bundler && bundle install

# Copy the rest of your app
COPY . /myapp

# Expose port 3000
EXPOSE 3000

# Start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0", "-p", "3000"]
