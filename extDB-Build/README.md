This build is for extDB https://github.com/Torndeco/extdb

To setup extDB you need to use the Windows pre-compiled build and edit the extdb-conf.ini Database 2 field with your Database name and login SQL user details to match pretty much your Arma2MySQL one.
Make sure the following files are in the root directory of your ARMA 3 server files (where the exe is):

extdb-conf.ini
sqlite.db
tbb.dll
tbbmalloc.dll

You can drag the extdb.dll to that folder as well or you can copy over @extdb over as a regular mod. If you choose to use @extdb as a regular mod your commandline will be:
-mod=@life_server;@extdb

If you are not using @extdb as a mod and choose to drag extdb.dll into the main arma 3 server directory then you only need @life_server in the commandline.

For Linux

Requirements:

Working Linux Arma3Server

Debian/Ubuntu

apt-get install libttb2:i386

RedHat/CentOS

yum install tbb.i686

Extract the static build (if you do not know how to build on a linux os) to the root directory.
