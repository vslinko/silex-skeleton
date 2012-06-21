# Silex skeleton

## Installation

    PROJECT_NAME=symfony-skeleton
    git clone git://github.com/rithis/silex-skeleton.git $PROJECT_NAME
    cd $PROJECT_NAME
    git remote set-url origin git://github.com/rithis/$PROJECT_NAME.git
    git remote add silex-skeleton git://github.com/rithis/silex-skeleton.git
    composer.phar install

## Server configuration

### Apache

    <VirtualHost *:80>
        DocumentRoot /var/www/project-name/current
        ServerName project-name.localhost

        RewriteEngine on
        RewriteCond %{DOCUMENT_ROOT}/web%{REQUEST_URI} !-f
        RewriteRule ^ /app/index.php [L]
        RewriteRule (.*) /web$1
    </VirtualHost>

### nginx

    server {
        server_name project-name.localhost;
        root /var/www/project-name/current;

        location / {
            try_files /web$uri @fallback;
        }

        location @fallback {
            fastcgi_pass unix:/var/run/php5-fpm.sock;
            include fastcgi_params;
            fastcgi_param SCRIPT_FILENAME $document_root/app/index.php;
        }
    }
