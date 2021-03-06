
##############################################################################
# AVISO IMPORTANTE!!!
# 2GB DE RAM MINIMO
# Ubuntu 20.04 LTS tested
# v2.8
# Last updated: 2021-18-10
##############################################################################
OS_NAME=$(lsb_release -cs)
usuario=$USER
DIR_PATH=$(pwd)
VCODE=14
VERSION=14.0
PORT=1469
DEPTH=1
PROJECT_NAME=odoo14
PATHBASE=/opt/$PROJECT_NAME
PATH_LOG=$PATHBASE/log
PATHREPOS=$PATHBASE/$VERSION/extra-addons
PATHREPOS_OCA=$PATHREPOS/oca

if [[ $OS_NAME == "disco" ]];

then
        echo $OS_NAME
        OS_NAME="bionic"

fi

if [[ $OS_NAME == "focal" ]];

then
        echo $OS_NAME
        OS_NAME="bionic"

fi

wk64="https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.5/wkhtmltox_0.12.5-1."$OS_NAME"_amd64.deb"
wk32="https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.5/wkhtmltox_0.12.5-1."$OS_NAME"_i386.deb"

sudo adduser --system --quiet --shell=/bin/bash --home=$PATHBASE --gecos 'ODOO' --group $usuario
sudo adduser $usuario sudo

# add universe repository & update (Fix error download libraries)
sudo add-apt-repository universe
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install -y git
# Update and install Postgresql
sudo apt-get install postgresql -y
sudo  -u postgres  createuser -s $usuario

sudo mkdir $PATHBASE
sudo mkdir $PATHBASE/$VERSION
sudo mkdir $PATHREPOS
sudo mkdir $PATHREPOS_OCA
sudo mkdir $PATH_LOG
cd $PATHBASE

sudo git clone https://github.com/odoo/odoo.git -b $VERSION --depth $DEPTH $PATHBASE/$VERSION/odoo
sudo git clone https://github.com/oca/web.git -b 14.0 --depth $DEPTH $PATHREPOS_OCA/web
sudo git clone https://github.com/MatiasBanega/CybroAddons.git -b 14.0 --depth $DEPTH $PATHREPOS/CybroAddons
sudo git clone https://github.com/OCA/account-analytic.git -b 14.0 --depth $DEPTH $PATHREPOS/account-analytic
sudo git clone https://github.com/OCA/account-financial-tools.git -b 14.0 --depth $DEPTH $PATHREPOS/account-financial-tools
sudo git clone https://github.com/OCA/account-payment.git -b 14.0 --depth $DEPTH $PATHREPOS/account-payment/account-payment
sudo git clone https://github.com/MatiasBanega/accounting_pdf_reports.git -b 14.0 --depth $DEPTH $PATHREPOS/accounting_pdf_reports
sudo git clone https://github.com/MatiasBanega/auto_backup.git -b 14.0 --depth $DEPTH $PATHREPOS/auto_backup
sudo git clone https://github.com/OCA/bank-payment.git -b 14.0 --depth $DEPTH $PATHREPOS/bank-payment
sudo git clone https://github.com/MatiasBanega/boton_mercadopago.git -b master --depth $DEPTH $PATHREPOS/boton_mercadopago
sudo git clone https://github.com/OCA/geospatial.git -b 14.0 --depth $DEPTH $PATHREPOS/geospatial
sudo git clone https://github.com/MatiasBanega/kg_hide_menu.git -b 14.0 --depth $DEPTH $PATHREPOS/kg_hide_menu
sudo git clone https://github.com/MatiasBanega/l10n_ar_local.git -b 14.0 --depth $DEPTH $PATHREPOS/l10n_ar_local
sudo git clone https://github.com/MatiasBanega/management-system.git -b 14.0 --depth $DEPTH $PATHREPOS/management-system
sudo git clone https://github.com/MatiasBanega/odoo-argentina.git -b 14.0 --depth $DEPTH $PATHREPOS/odoo-argentina
sudo git clone https://github.com/MatiasBanega/odoo-argentina-codize.git -b 14.0 --depth $DEPTH $PATHREPOS/odoo-argentina-codize
sudo git clone https://github.com/MatiasBanega/odoo-custom.git -b 14.0 --depth $DEPTH $PATHREPOS/odoo-custom
sudo git clone https://github.com/MatiasBanega/odoo_dhtmlxgantt.git -b 14.0 --depth $DEPTH $PATHREPOS/odoo_dhtmlxgantt
sudo git clone https://github.com/MatiasBanega/openeducat_erp.git -b 14.0 --depth $DEPTH $PATHREPOS/openeducat_erp
sudo git clone https://github.com/MatiasBanega/operating-unit.git -b 14.0 --depth $DEPTH $PATHREPOS/operating-unit
sudo git clone https://github.com/MatiasBanega/payment_mercadopago.git -b 14.0 --depth $DEPTH $PATHREPOS/payment_mercadopago
sudo git clone https://github.com/OCA/product-attribute.git -b 14.0 --depth $DEPTH $PATHREPOS/product-attribute
sudo git clone https://github.com/MatiasBanega/project-1.git -b 14.0 --depth $DEPTH $PATHREPOS/project-1
sudo git clone https://github.com/PyAr/pyafipws.git -b py3k --depth $DEPTH $PATHREPOS/pyafipws
sudo git clone https://github.com/MatiasBanega/odooapps.git -b 14.0 --depth $DEPTH $PATHREPOS/odooapps
sudo git clone https://github.com/MatiasBanega/query_deluxe.git -b 14.0 --depth $DEPTH $PATHREPOS/query_deluxe
sudo git clone https://github.com/OCA/reporting-engine.git -b 14.0 --depth $DEPTH $PATHREPOS/reporting-engine
sudo git clone https://github.com/MatiasBanega/sale-reporting.git -b 14.0 --depth $DEPTH $PATHREPOS/sale-reporting
sudo git clone https://github.com/OCA/server-brand.git -b 14.0 --depth $DEPTH $PATHREPOS/server-brand
sudo git clone https://github.com/MatiasBanega/server-tools.git -b 14.0 --depth $DEPTH $PATHREPOS/server-tools
sudo git clone https://github.com/MatiasBanega/server-ux.git -b 14.0 --depth $DEPTH $PATHREPOS/server-ux
sudo git clone https://github.com/MatiasBanega/transport-management-system.git -b 14.0 --depth $DEPTH $PATHREPOS/transport-management-system
sudo git clone https://github.com/OCA/website.git -b 14.0 --depth $DEPTH $PATHREPOS/website
sudo git clone https://github.com/MatiasBanega/website_iframe_snippet.git -b 14.0 --depth $DEPTH $PATHREPOS/website_iframe_snippet
sudo git clone https://github.com/MatiasBanega/wk_base_survey.git -b 14.0 --depth $DEPTH $PATHREPOS/wk_base_survey



# Install python3 and dependencies for Odoo
sudo apt-get -y install gcc python3-dev libxml2-dev libxslt1-dev \
 libevent-dev libsasl2-dev libldap2-dev libpq-dev \
 libpng-dev libjpeg-dev xfonts-base xfonts-75dpi

sudo apt-get -y install python3 python3-pip python3-setuptools htop
sudo pip3 install virtualenv

# FIX wkhtml* dependencie Ubuntu Server 18.04
sudo apt-get -y install libxrender1

# Install nodejs and less
sudo apt-get install -y npm node-less
sudo ln -s /usr/bin/nodejs /usr/bin/node
sudo npm install -g less

# Download & install WKHTMLTOPDF
sudo rm $PATHBASE/wkhtmltox*.deb

if [[ "`getconf LONG_BIT`" == "32" ]];

then
        sudo wget $wk32
else
        sudo wget $wk64
fi

sudo dpkg -i --force-depends wkhtmltox_0.12.5-1*.deb
sudo apt-get -f -y install
sudo ln -s /usr/local/bin/wkhtml* /usr/bin
sudo rm $PATHBASE/wkhtmltox*.deb
sudo apt-get -f -y install

# install python requirements file (Odoo)
sudo rm -rf $PATHBASE/$VERSION/venv
sudo mkdir $PATHBASE/$VERSION/venv
sudo chown -R $usuario: $PATHBASE/$VERSION/venv
virtualenv -q -p python3 $PATHBASE/$VERSION/venv
# sed -i '/libsass/d' $PATHBASE/$VERSION/odoo/requirements.txt
$PATHBASE/$VERSION/venv/bin/pip3 install libsass vobject qrcode num2words
$PATHBASE/$VERSION/venv/bin/pip3 install -r $PATHBASE/$VERSION/odoo/requirements.txt

cd $DIR_PATH

sudo mkdir $PATHBASE/config
sudo rm $PATHBASE/config/odoo$VCODE.conf
sudo touch $PATHBASE/config/odoo$VCODE.conf

echo "
[options]
; This is the password that allows database operations:
;admin_passwd =
db_host = False
db_port = False
;db_user =
;db_password =
data_dir = $PATHBASE/data
logfile= $PATH_LOG/odoo$VCODE-server.log

############# addons path ######################################

addons_path =
    $PATHREPOS,
    $PATHREPOS_OCA/web,
    $PATHBASE/$VERSION/odoo/addons,
    $PATHREPOS/CybroAddons,
    $PATHREPOS/account-analytic,
    $PATHREPOS/account-financial-tools,
    $PATHREPOS/account-payment,
    $PATHREPOS/accounting_pdf_reports,
    $PATHREPOS/auto_backup,
    $PATHREPOS/bank-payment,
    $PATHREPOS/boton_mercadopago,
    $PATHREPOS/geospatial,
    $PATHREPOS/kg_hide_menu,
    $PATHREPOS/l10n_ar_local,
    $PATHREPOS/management-system,
    $PATHREPOS/odoo-argentina,
    $PATHREPOS/odoo-argentina-codize,
    $PATHREPOS/odoo-custom,
    $PATHREPOS/odoo_dhtmlxgantt,
    $PATHREPOS/openeducat_erp,
    $PATHREPOS/operating-unit,
    $PATHREPOS/payment_mercadopago,
    $PATHREPOS/product-attribute,
    $PATHREPOS/project-1,
    $PATHREPOS/pyafipws,
    $PATHREPOS/odooapps,
    $PATHREPOS/query_deluxe,
    $PATHREPOS/reporting-engine,
    $PATHREPOS/sale-reporting,
    $PATHREPOS/server-brand,
    $PATHREPOS/server-tools,
    $PATHREPOS/server-ux,
    $PATHREPOS/transport-management-system,
    $PATHREPOS/website,
    $PATHREPOS/website_iframe_snippet,
    $PATHREPOS/wk_base_survey

#################################################################

xmlrpc_port = $PORT
;dbfilter = odoo$VCODE
logrotate = True
limit_time_real = 6000
limit_time_cpu = 6000
" | sudo tee --append $PATHBASE/config/odoo$VCODE.conf

sudo rm /etc/systemd/system/odoo$VCODE.service
sudo touch /etc/systemd/system/odoo$VCODE.service
sudo chmod +x /etc/systemd/system/odoo$VCODE.service
echo "
[Unit]
Description=Odoo$VCODE
After=postgresql.service

[Service]
Type=simple
User=$usuario
ExecStart=$PATHBASE/$VERSION/venv/bin/python $PATHBASE/$VERSION/odoo/odoo-bin --config $PATHBASE/config/odoo$VCODE.conf

[Install]
WantedBy=multi-user.target
" | sudo tee --append /etc/systemd/system/odoo$VCODE.service
sudo systemctl daemon-reload
sudo systemctl enable odoo$VCODE.service
sudo systemctl start odoo$VCODE

echo "Instalando nginx"
sudo apt-get -y install nginx


echo "Instalando Let???s Encrypt"
sudo apt install -y certbot python3-certbot-nginx


echo "Creando scripts de comandos"
cd $DIR_PATH

echo "Creando carpeta scrips"
sudo mkdir $PATHBASE/scripts



echo "Creando script para host odoo nginx "
sudo rm $PATHBASE/scripts/nginx-odoo-host.sh
sudo touch $PATHBASE/scripts/nginx-odoo-host.sh
echo "#!/bin/bash
echo 'Creando /etc/nginx/sites-available/odoo.host'
sudo touch /etc/nginx/sites-available/odoo.host
sudo rm /etc/nginx/sites-enabled/default
cd /etc/nginx/sites-enabled/
sudo ln -s /etc/nginx/sites-available/odoo.host odoo.host
echo '
upstream odoo {
 server 127.0.0.1:$PORT;
}
upstream odoochat {
 server 127.0.0.1:8072;
}

server {
        #listen 80 default_server;
        #listen [::]:80 default_server;


        server_name _;
        proxy_buffers 16 64k;
        proxy_buffer_size 128k;
        proxy_read_timeout 900s;
        proxy_connect_timeout 900s;
        proxy_send_timeout 900s;

        # Add Headers for odoo proxy mode
        proxy_set_header X-Forwarded-Host \$host;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
        proxy_set_header X-Real-IP \$remote_addr;
        add_header X-Frame-Options \"SAMEORIGIN\";
        add_header X-XSS-Protection \"1; mode=block\";
        proxy_set_header X-Client-IP \$remote_addr;
        proxy_set_header HTTP_X_FORWARDED_HOST \$remote_addr;

        #   odoo    log files
        access_log  /var/log/nginx/odoo.com-access.log;
        error_log   /var/log/nginx/odoo.com-error.log;

        #   force   timeouts    if  the backend dies
        proxy_next_upstream error   timeout invalid_header  http_500    http_502
        http_503;
        types {
        text/less less;
        text/scss scss;
        }

        #   enable  data    compression
        gzip    on;
        gzip_min_length 1100;
        gzip_buffers    4   32k;
        gzip_types  text/css text/less text/plain text/xml application/xml application/json application/javascript application/pdf image/jpeg image/png;
        gzip_vary   on;
        client_header_buffer_size 4k;
        large_client_header_buffers 4 64k;
        client_max_body_size 0;
	# Redirect longpoll requests to odoo longpolling port
        location /longpolling {
                 proxy_pass http://odoochat;
        }
        # Redirect requests to odoo backend server

        location / {
                proxy_pass http://odoo;
                proxy_redirect off;

        }



        location ~* .(js|css|png|jpg|jpeg|gif|ico)$ {
        expires 2d;
        proxy_pass http://127.0.0.1:$PORT;
        add_header Cache-Control \"public, no-transform\";
        }
        # cache some static data in memory for 60mins.
        location ~ /[a-zA-Z0-9_-]*/static/ {
        proxy_cache_valid 200 302 60m;
        proxy_cache_valid 404      1m;
        proxy_buffering    on;
        expires 864000;
        proxy_pass    http://127.0.0.1:$PORT;
        }




}' > /etc/nginx/sites-enabled/odoo.host" | sudo tee --append $PATHBASE/scripts/nginx-odoo-host.sh
sudo chmod +x $PATHBASE/scripts/nginx-odoo-host.sh
sudo sh $PATHBASE/scripts/nginx-odoo-host.sh

#econf
sudo touch $PATHBASE/scripts/econf
echo "#!/bin/bash
vim /opt/odoo14/config/odoo14.conf" | sudo tee --append $PATHBASE/scripts/econf
sudo chmod +x $PATHBASE/scripts/econf

#log
sudo touch $PATHBASE/scripts/log
echo "#!/bin/bash
cat /opt/odoo14/log/odoo14-server.log" | sudo tee --append $PATHBASE/scripts/log
sudo chmod +x $PATHBASE/scripts/log

#pconf
sudo touch $PATHBASE/scripts/pconf
echo "#!/bin/bash

if [[ ! -f "/etc/postgresql/12/main/pg_hba.conf.bak" ]]
then
    sudo cp /etc/postgresql/12/main/pg_hba.conf /etc/postgresql/12/main/pg_hba.conf.bak
fi
sudo vim /etc/postgresql/12/main/pg_hba.conf

sudo /etc/init.d/postgresql restart" | sudo tee --append $PATHBASE/scripts/pconf
sudo chmod +x $PATHBASE/scripts/pconf


#restart
sudo touch $PATHBASE/scripts/restart
echo "#!/bin/bash
truncate -s 0 /opt/odoo14/log/odoo14-server.log
sudo systemctl restart odoo14
date" | sudo tee --append $PATHBASE/scripts/restart
sudo chmod +x $PATHBASE/scripts/restart


#start
sudo touch $PATHBASE/scripts/start
echo "#!/bin/bash
sudo systemctl start odoo14" | sudo tee --append $PATHBASE/scripts/start
sudo chmod +x $PATHBASE/scripts/start

#stop
sudo touch $PATHBASE/scripts/stop
echo "#!/bin/bash
sudo systemctl stop odoo14" | sudo tee --append $PATHBASE/scripts/stop
sudo chmod +x $PATHBASE/scripts/stop


#status
sudo touch $PATHBASE/scripts/status
echo "#!/bin/bash
systemctl status odoo14" | sudo tee --append $PATHBASE/scripts/status
sudo chmod +x $PATHBASE/scripts/status


#status
sudo touch $PATHBASE/scripts/tlog
echo "#!/bin/bash
truncate -s 0 /opt/odoo14/log/odoo14-server.log" | sudo tee --append $PATHBASE/scripts/tlog
sudo chmod +x $PATHBASE/scripts/tlog




echo "Copiando scripts a /usr/bin/"
cd $PATHBASE/scripts
sudo cp $PATHBASE/scripts/* /usr/bin/




sudo chown -R $usuario: $PATHBASE

echo "Odoo $VERSION Instalado!!!"
IP=$(ip route get 8.8.8.8 | head -1 | cut -d' ' -f7)
echo "Puedes acceder desde: http://$IP:$PORT  or http://localhost:$PORT"