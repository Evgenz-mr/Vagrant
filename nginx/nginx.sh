#!/bin/bash
#copy nginx_conf
rm -r /etc/nginx/conf.d/*
cp /vagrant/default.conf /etc/nginx/conf.d/default.conf

