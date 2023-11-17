# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
DESCRIPTION="hello"
HOMEPAGE="https://ftp.hp.com"
SRC_URI="https://ftp.hp.com/pub/softlib/software13/printers/CLP150/uld-hp_V1.00.39.12_00.15.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

DEPEND="net-print/cups"
RDEPEND="${DEPEND}"
BDEPEND=""
S="/var/calculate/tmp/portage/net-print/rastertospl-1.00.39.12/work/uld"
src_unpack() {
        if [[ -n ${P}.tar.gz ]]; then
                unpack ${P}.tar.gz
        fi
}

pkg_preinst() {

basedirs="/opt/smfp-common/printer"
dodir /$basedirs/{bin,lib}

cp -a uld/x86_64/smfpnetdiscovery $basedirs/bin
cp -a uld/x86_64/rastertospl $basedirs/bin
cp -a uld/x86_64/pstosecps $basedirs/bin
cp -a uld/x86_64/libscmssc.so $basedirs/lib

cp -a noarch/share/ppd/cms /usr/share/ppd/HP/

for ppd in        HP_Color_Laser_15x_Series.ppd \
                HP_Color_Laser_MFP_17x_Series.ppd \
                HP_Laser_10x_Series.ppd
do
        gzip -c noarch/share/ppd/$ppd > /usr/share/ppd/HP/$ppd.gz
done

ln -s $basedirs/bin/smfpnetdiscovery /usr/libexec/cups/backend/
ln -s $basedirs/bin/pstosecps /usr/libexec/cups/filter/
ln -s $basedirs/bin/rastertospl /usr/libexec/cups/filter/
}
