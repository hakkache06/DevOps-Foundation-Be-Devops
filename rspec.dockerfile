FROM ruby:alpine
MAINTAINER yhakkach <yassinhakkache@gmail.com

# Parsing xml
RUN apk add build-base ruby-nokogiri 
RUN gem install rspec capybara selenium-webdriver

ENTRYPOINT [ "rspec" ]
