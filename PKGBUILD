pkgname=gd-installer
pkgver=1.0.0 
pkgrel=1
pkgdesc="Geometry Dash installer for Linux distros"
arch=('any')
url="https://github.com/valikos88/geometry-dash-installer"
license=('GPL')  # Лицензия
depends=('wine' 'wget')
source=("gd.sh")
sha256sums=('SKIP')

package() {
  install -Dm755 "${srcdir}/gd.sh" "${pkgdir}/usr/bin/${pkgname}"
}