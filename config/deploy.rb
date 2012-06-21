set :application, "silex-skeleton"

set :repository,  "git://github.com/rithis/#{application}.git"
set :scm, :git

set :shared_files, ["app/config.php"]
set :shared_children, []

role :web, application
set :user, "www-data"
set :deploy_to, "/var/www/#{application}"

namespace :deploy do
    task :finalize_update do
        run "cd #{deploy_to} && wget -q http://getcomposer.org/composer.phar && php ./composer.phar install"
    end
end
