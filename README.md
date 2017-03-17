= Introduction =

A packer.io template file for packing a slackware 14.2 vagrant box

= Requirements =

* packer (get it from packer.io or on stretch apt-get install packer)
* an internet connection

= Howto =

Just install packer and run

  packer build slackware64-14.2.json

You should end up with a .box file in the current directory. packer will
download the ISO images for slackware and virtualbox additions from the internet
so having a internet connection is a must. Note that these are cached between
runs but packer still requires an internet connection to run since it checks the
downloaded files in the local cache are correct.

= TODO =

Add custom tagfile support in order to minimize the resulting vbox size.
Currently `full` is the selected method which
