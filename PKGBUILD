pkgname=pass-shell
pkgver=1.0
pkgrel=1
pkgdesc="Tiny shell for pass utility"
arch=('any')

package() {
	mkdir -p "${pkgdir}/usr/bin"
	cp "${srcdir}/ppass.sh" "${pkgdir}/usr/bin/ppass"
	chmod +x "${pkgdir}/usr/bin/ppass"
}
