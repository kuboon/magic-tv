gem 'delayed_job_active_record'
gem 'acts-as-taggable-on'
gem 'omniauth-twitter'
gem 'omniauth-facebook'
gem 'omniauth-openid'

inside "." do
  run "rvm `cat .ruby-version` do bundle install"
end

generate "bootstrap:install"
generate "bootstrap:layout application fluid"
generate "delayed_job"
generate "acts_as_taggable_on:migration"

git :init
git :add => "."
git :commit => "-a -m 'Initial commit'"

print "rake rails:template LOCATION=lib/scaffold.rb"
