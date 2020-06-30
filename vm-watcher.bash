#!/bin/bash
set -eo pipefail
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd $DIR
# On first run, the user will specify --daemon so the script re-runs itself detatched and passes in the VM name as $2
case "$1" in
    -d|--daemon)
        $0 $2 $3 < /dev/null &> /dev/null & disown
        exit 0
    ;;
    *) ;;
esac
[[ -z $1 ]] && echo "MUST POPULATE \$2 with VM name" && exit 1
[[ -z $2 ]] && echo "MUST POPULATE \$3 with EMULATOR PID TO KILL" && exit 1
while anka show $1 status; do
  sleep 2
done
kill -15 $2
