pkgname=pass-shell
pkgver=1.2
pkgrel=2
pkgdesc="Tiny shell for pass utility"
arch=('any')
depends=('xclip' 'pass' 'libnotify')

package() {
	install -Dm755 "${srcdir}/ppass.sh" "${pkgdir}/usr/bin/ppass"
}
