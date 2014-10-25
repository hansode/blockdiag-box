#!/bin/bash
#
# requires:
#  bash
#
set -e
set -o pipefail
set -x

function yum() {
  $(type -P yum) --disablerepo=updates "${@}"
}

# Add installation packages ...
addpkgs="
 python-setuptools
 python-imaging
 ipa-gothic-fonts
 gcc

 libjpeg-devel
 freetype-devel
 python-lcms
 lcms-devel
 tkinter
 tcl-devel
 tk-devel
"

if [[ -n "$(echo ${addpkgs})" ]]; then
  yum install -y ${addpkgs}
fi
