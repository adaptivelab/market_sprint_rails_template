# Include templates relative to this file.
def source_paths
  Array(super) + [File.expand_path(File.dirname(__FILE__))]
end

# ---- Gems --------------------------------------------------------------------

# By setting up these aliases (aliasi?), we can eval a Gemfile and the Rails
# templating mechanism will add them in the way it knows how.  Doing it this way
# is better than simply copying the Gemfile wholesale, in case the destination
# application has added gems of its own.
alias :source :add_source
alias :group :gem_group
eval IO.read(File.join(File.expand_path(File.dirname(__FILE__)), "Gemfile"))

# ---- Files, rspec, devise and active_admin -----------------------------------

copy_file ".editorconfig"
copy_file ".ruby-version"
copy_file ".travis.yml"
copy_file ".phantom-version"

inside "config" do
  append_to_file "application.rb", <<-CONFIG

# Active Admin caused some deprecation warnings.
# http://makandracards.com/makandra/20303-how-to-silence-i18n-enforce_available_locales-deprecation-warnings
I18n.enforce_available_locales = false
  CONFIG

  copy_file "unicorn.rb"
end

run "bundle install"

# Doesn't install rspec if there's already a spec directory
run "[ ! -d spec ] && bundle exec rails g rspec:install"
environment <<-ENVIRONMENT
config.generators do |g|
    g.test_framework :rspec
    end
ENVIRONMENT

# Doesn't install devise if there's already a devise.rb config file.
run "[ ! -e config/initializers/devise.rb ] && bundle exec rails g devise:install"
generate "devise:views"

# Doesn't install active_admin (causes error), if there's already an active_admin config file.
run "[ ! -e config/initializers/active_admin.rb ] && bundle exec rails g active_admin:install"

inside "app" do
  inside "admin" do
    copy_file "admin_page.rb"
  end

  inside "controllers" do
    copy_file "pages_controller.rb"
    copy_file "home_controller.rb"
  end

  inside "models" do
    copy_file "user.rb"
    copy_file "page.rb"
  end

  inside "views" do
    directory "home"
    directory "pages"

    inside "layouts" do
      remove_file "application.html.erb"
      copy_file "application.html.haml"
      copy_file "empty.html.haml"
    end
  end
end

inside "db" do
  inside "migrate" do
    copy_file "20140127195543_devise_create_users.rb"
    copy_file "20140129174540_create_pages.rb"
  end
end

directory "features"

inside "public" do
  remove_file "public.html"
end

inside "spec" do
  inside "controllers" do
    copy_file "home_controller_spec.rb"
    copy_file "pages_controller_spec.rb"
  end

  inside "factories" do
    copy_file "factories.rb"
  end

  inside "models" do
    remove_file "admin_user_spec.rb"
    copy_file "page_spec.rb"
    copy_file "user_spec.rb"
  end

  inside "support" do
    copy_file "vcr.rb"
  end

  inside "views" do
    inside "pages" do
      copy_file "show.html.haml_spec.rb"
    end
  end

  remove_file "spec_helper.rb"
  copy_file "spec_helper.rb"
end

route "devise_for :users"
route 'root "home#index"'
route "resources :pages, only: :show"

inside app_name do
  run "bundle exec rake db:create"
  run "bundle exec rake db:migrate"
end

remove_dir "test"
