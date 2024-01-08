#!/bin/zsh
echo -e "Введите название проекта (Например example.local.site)";
read NAME_OF_PROJECT

# Создаем директории
mkdir www/$NAME_OF_PROJECT

# Добавляем виртуальный хост
add_to_apache_conf="
server {
    index index.php;
    server_name ${NAME_OF_PROJECT};

    location ~ \.php$ {
        try_files "'$uri'" =404;
        fastcgi_split_path_info ^(.+\.php)(/.+)$;
        fastcgi_pass php:9000;
        fastcgi_index index.php;
        include fastcgi_params;
        fastcgi_param SCRIPT_FILENAME /var/www/${NAME_OF_PROJECT}"'$fastcgi_script_name'";
        fastcgi_param PATH_INFO "'$fastcgi_path_info'";
    }
}
"
echo "$add_to_apache_conf" >> hosts/${NAME_OF_PROJECT}.conf
echo "127.0.0.1 ${NAME_OF_PROJECT}" | sudo tee -a /etc/hosts
sudo chmod -R 777 www/$NAME_OF_PROJECT


