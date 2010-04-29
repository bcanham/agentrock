# Edit this Gemfile to bundle your application's dependencies.
source 'http://gemcutter.org'


#gem "rails", "3.0.0.beta"

## Bundle edge rails:
gem "rails", :git => "git://github.com/rails/rails.git"

# ActiveRecord requires a database adapter. By default,
# Rails has selected sqlite3.
gem "sqlite3-ruby", :require => "sqlite3"

gem "warden"
gem "devise", :git => "git://github.com/plataformatec/devise"
gem "meta-tags", :git =>"git://github.com/kpumuk/meta-tags.git", :require => 'meta_tags'
gem "sitemap_generator", :git => "git://github.com/adamsalter/sitemap_generator.git"

group :development do
	gem "hermes"
	#gem "rails-footnotes"
end

group :test do
	gem "test-unit"
	gem "capybara", :git => "http://github.com/jnicklas/capybara.git"
	gem "database_cleaner", :git => "http://github.com/bmabey/database_cleaner.git"
	gem "cucumber-rails", :git => "http://github.com/aslakhellesoy/cucumber-rails.git"
	gem "rspec-rails", :git => "git://github.com/rspec/rspec-rails.git"
end
