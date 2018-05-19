#! /bin/bash
set -e

REPO=rsync://ftp.acc.umu.se/mirror/archlinux
DEST=/srv/arch_mirror/archlinux

mkdir -p $DEST

# Common rsync options
RSYNC_OPTS="-rtlH -4 --safe-links --no-motd --exclude=.*"

# Only be verbose on tty
if tty -s; then
  RSYNC_OPTS="$RSYNC_OPTS -v"
fi

# first get new package files (the pool) and don't delete anything
/usr/bin/rsync $RSYNC_OPTS $REPO/pool/ $DEST/pool/

# … and only then get the database, links and the structure
/usr/bin/rsync $RSYNC_OPTS --delete-after --delay-updates $REPO $DEST \
        --exclude iso/ --exclude other/ --exclude archive/ --exclude sources/

# --delete-before so that it frees disk space earlier
/usr/bin/rsync $RSYNC_OPTS --delete-before $REPO/iso/ $DEST/iso/ --exclude archboot
