#!/bin/bash

rm -r temp
mkdir temp
cd temp

printf "\ncreating base\n"
lein new re-frame base
cd base
lein cljsbuild once min
cd resources/public
google-chrome index.html
cd ../../..

printf "\ncreating base +routes\n"
lein new re-frame base-routes +routes
cd base-routes
lein cljsbuild once min
cd resources/public
google-chrome index.html
cd ../../..

printf "\ncreating base +re-com\n"
lein new re-frame base-recom +re-com
cd base-recom
lein cljsbuild once min
cd resources/public
google-chrome index.html
cd ../../..

printf "\ncreating base +routes +re-com\n"
lein new re-frame base-routes-recom +routes +re-com
cd base-routes-recom
lein cljsbuild once min
cd resources/public
google-chrome index.html
cd ../../..

printf "\ncreating base +cider +routes +re-com +test +garden +handler +less +re-frisk +10x +dirac +re-pressed +breaking-point\n"
lein new re-frame everything +cider +routes +re-com +test +garden +handler +less +re-frisk +10x +dirac +re-pressed +breaking-point
cd everything
lein cljsbuild once min
npm install -g karma-cli
npm install karma karma-cljs-test karma-chrome-launcher --save-dev
lein doo chrome-headless test once
cd resources/public
google-chrome index.html
cd ../../..
