server {
    listen 80;
    server_name bbqfinance.fun www.bbqfinance.fun;
    root /var/www/bbqfinance.fun;
    index index.html;
    location / {
        try_files $uri /index.html;
    }
    location /stats {
        proxy_pass http://localhost:3000/stats;
    }
    location /ws {
        proxy_pass http://localhost:3000/ws;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "Upgrade";
    }
}