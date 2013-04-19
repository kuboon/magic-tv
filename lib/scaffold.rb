#run 'git reset --hard'
#run 'git clean -f -d'

generate(:scaffold, "user name:uniq email")
generate(:model, "auth user:belongs_to provider uid")

generate(:scaffold, "program uid:uniq url name description start_at end_at")

generate :mailer, "UserMailer programs"

route "root :to => 'programs#index'"

run 'rm app/views/layouts/application.html.erb'
run 'rm app/assets/stylesheets/scaffolds.css.scss'

rake("db:migrate:reset")
run 'rm app/views/users/*'
generate "bootstrap:themed users"
run 'rm app/views/programs/*'
generate "bootstrap:themed programs"

print "rake rails:template LOCATION=lib/heroku.rb"
