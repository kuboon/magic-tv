run 'git reset --hard'
run 'git clean -f -d'

generate(:scaffold, "account name:uniq")

generate(:scaffold, "customer name mail")
generate(:model, "email customer:belongs_to addr:uniq priority:integer")

generate :mailer, "CustomerMailer welcome seeyou blank"

route "root :to => 'customers#index'"

run 'rm app/views/layouts/application.html.erb'
run 'rm app/assets/stylesheets/scaffolds.css.scss'

rake("db:migrate:reset")
run 'rm app/views/accounts/*'
generate "bootstrap:themed accounts"
run 'rm app/views/customers/*'
generate "bootstrap:themed customers"

print "rake rails:template LOCATION=lib/heroku.rb"
