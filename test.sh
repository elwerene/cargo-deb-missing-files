#!/bin/bash
rm -rf deb *.deb

for i in {1..100}
do
  dd if=/dev/urandom of=data/$i.raw bs=1K count=1 status=none
done

cargo deb -o .
dpkg-deb -R *.deb deb
