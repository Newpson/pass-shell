pkgname=pass-shell
pkgver=1.2
pkgrel=1
pkgdesc="Tiny shell for pass utility"
arch=('any')
depends=('xclip' 'pass')

package() {
	install -Dm755 "${srcdir}/ppass.sh" "${pkgdir}/usr/bin/ppass"
}
