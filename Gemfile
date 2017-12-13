source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# core application gems
gem 'rails', '~> 5.1.4'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'

# for http queries
gem 'typhoeus', '~> 1.3'

# front end / UI
gem 'sass-rails', '~> 5.0'
gem 'jquery-rails', '~> 4.3'
gem 'coffee-rails', '~> 4.2'
gem 'haml', '~> 5.0'

group :development, :test do
  gem 'rspec-rails', '~> 3.7'
end

group :development do
  gem 'better_errors', '~> 2.4'
  gem 'guard-rspec', '~> 4.7', require: false
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
end

group :test do
  gem 'shoulda-matchers', '~> 3.1'
end
