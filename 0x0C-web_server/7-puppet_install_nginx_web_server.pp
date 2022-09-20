#config server

package { 'nginx':
provider => 'apt',
}
exec {'hlbtn_page':
command => 'echo "hello world" | sudo tee /usr/share/nginx/html/index.html',
}
exec {'redirect_page':

command => '/usr/bin/sudo /bin/sed -i "66i rewrite ^/redirect_me https://www.youtube.com/ permanent;" /etc/nginx/sites-available/default',
}
exec {'start_server':

command => '/usr/bin/sudo /usr/sbin/service nginx start',
}



