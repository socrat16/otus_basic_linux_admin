#!/bin/bash


# Путь для сохранения резервных копий
BACKUP_DIR="/home/naagapov/mysql_bac"

# Создание каталога для резервных копий с именем базы данных, если он не существует

# Получение списка DB
DB_NAMES=$(mysql  -e "show databases\g;" | awk '{print $1}' | grep -v '^Database')

for DB_NAME in $DB_NAMES
do
    mkdir -p "${BACKUP_DIR}/${DB_NAME}"
    TABLES=$(mysql -uroot $DB_NAME -e "SHOW TABLES;" | awk '{ print $1}' | grep -v '^Tables' )
    for TABLE in $TABLES
    do
        mysqldump --skip-opt -uroot   $DB_NAME $TABLE > "${BACKUP_DIR}/${DB_NAME}/${TABLE}.sql" 
    
    done

done



# mysql -uroot  digmath < mysql_bac/digmath/prod_dig.sql таблица из бекапа

