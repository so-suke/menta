#!/bin/bash
############################################
#
#  wordpress_bkupシェルスクリプト
#
############################################

############################################
# 設定
############################################
#念の為PATHが通ってない環境用に定義
PATH=/bin:/usr/bin:/usr/local/bin
#日付定義
YMD=`date +%y%m%d`

#mysqlのバックアップ先を指定
MYS_BKDIR="/usr/share/nginx/html/BKUP/DB"
TODAYS_MYS_BKDIR="$MYS_BKDIR/`date +%Y%m%d`"

#mysqlデータベース一覧取得用
MYS_DATABASES=`mysql --defaults-extra-file=my.conf -NBe 'show databases'`
############################################
# DBバックアップ取得処理
############################################
# 当日分のDBバックアップ格納先を作成
[ ! -d $TODAYS_MYS_BKDIR ] && mkdir -p $TODAYS_MYS_BKDIR
echo $TODAYS_MYS_BKDIR 
# DBのダンプを取得
for MYSDB in $MYS_DATABASES
do
    if [[ $MYSDB == wordpress* || $MYSDB == wp* ]]; then
        mysqldump --defaults-extra-file=my.conf --opt --skip-lock-tables $MYSDB | gzip > $TODAYS_MYS_BKDIR/$MYSDB.dump.gz
    fi
done

# 5日以前のバックアップを削除するとなっています
find $MYS_BKDIR -type d -mtime +4 -print0 | xargs -0 rm -rf

