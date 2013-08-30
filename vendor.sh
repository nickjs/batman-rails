#!/usr/bin/env bash
cd ~/Code/batman/batman
cake build

cp ~/Code/batman/batman/lib/batman.{js,jquery.js} ~/Code/batman/batman-rails/vendor/assets/javascripts/batman/
cp ~/Code/batman/batman/lib/extras/batman.rails.js ~/Code/batman/batman-rails/vendor/assets/javascripts/batman/
