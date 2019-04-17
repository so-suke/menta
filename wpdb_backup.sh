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

#mysqlのバックアップ先を指定
MYS_BKDIR="/usr/share/nginx/html/BKUP/DB"
DATE_FMT="+%Y%m%d"
TODAYS_MYS_BKDIR="$MYS_BKDIR/`date ${DATE_FMT}`"

############################################
# DBバックアップ取得処理
############################################
# 当日分のDBバックアップ格納先を作成
[ ! -d $TODAYS_MYS_BKDIR ] && mkdir -p $TODAYS_MYS_BKDIR
echo $TODAYS_MYS_BKDIR 
# DBのダンプを取得して格納
mysqldump --defaults-extra-file=my.conf --opt --skip-lock-tables -A | gzip > $TODAYS_MYS_BKDIR/all_db.dump.gz
# (毎日実行前提)5日前のバックアップのみ削除します。
OLD_DATE=`date ${DATE_FMT} --date "5 days ago"`
rm -rf $MYS_BKDIR/$OLD_DATE
