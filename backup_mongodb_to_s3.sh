#!/bin/bash
export HOME=/home/ubuntu/
HOST=localhost
DBNAME="jokes"
BUCKET="jokes_backups"
DEST="/tmp/jokes_backups"

while true
do
  TIME=`/bin/date +%d-%m-%Y-%T`
  TAR=$DEST/$TIME.tar

  /bin/mkdir -p $DEST
  echo "Backing up $HOST/$DBNAME to s3://$BUCKET/ on $TIME";

  /usr/bin/mongodump -h $HOST -d $DBNAME -o $DEST
  /bin/tar cvf $TAR -C $DEST .
  /usr/bin/aws s3 cp $TAR s3://$BUCKET/ --storage-class STANDARD_IA
  /bin/rm -f $TAR
  /bin/rm -rf $DEST

  echo "Backup available at https://s3.amazonaws.com/$BUCKET/$TIME.tar"

  sleep 30
done
