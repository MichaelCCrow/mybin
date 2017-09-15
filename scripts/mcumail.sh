#!/bin/sh

while read LINE
do
  ADDR=$(echo $LINE|awk -F, '{print $1}')
  FIRST=$(echo $LINE|awk -F, '{print $2}')
  USER=$(echo $LINE|awk -F, '{print $3}')
  /var/qmail/bin/sendmail -t <<HERE
From: support-test@support.test
To: $ADDR
Subject: Testing Emails
Dear $FIRST,

Here's a thing: $USER

Sincerely,
Testmeister Testface
HERE
done
