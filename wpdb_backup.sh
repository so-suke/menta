#!/bin/bash

# mysqlのバックアップ先を指定
MYS_BKDIR="/home/BKUP/DB"
TODAYS_MYS_BKDIR="$MYS_BKDIR/`date +%Y%m%d`"
DUMP="$TODAYS_MYS_BKDIR/all_db.dump"
# 当日分のDBバックアップ格納先を作成
[ ! -d $TODAYS_MYS_BKDIR ] && mkdir -p $TODAYS_MYS_BKDIR
echo $TODAYS_MYS_BKDIR 
# DBのダンプを取得して格納
mysqldump -u 'root' -p 'f3Dd3<Diz' -A > $DUMP 
# (毎日実行前提)5日前のバックアップのみ削除します。
OLD_DATE=`date +%Y%m%d --date "5 days ago"`
rm -rf $MYS_BKDIR/$OLD_DATE
