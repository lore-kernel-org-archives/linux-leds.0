From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [BUG 4.9] New led trigger usbport gets the kernel to panic
Date: Tue, 6 Dec 2016 18:26:20 +0100
Message-ID: <20161206172619.GB4406@amd>
References: <20161121094022.30478a37@gmail.com>
 <43ea90fb-780a-3612-77dd-265e877ac18e@milecki.pl>
 <20161201152825.3b2686db@gmail.com>
 <b7fb9a03-a7aa-97e9-0923-de11b71c1951@milecki.pl>
 <20161202094818.6b9c1ed2@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="aVD9QWMuhilNxW9f"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20161202094818.6b9c1ed2@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ralph Sennhauser <ralph.sennhauser@gmail.com>, linux-leds@vger.kernel.org, j.anaszewski@samsung.com, rpurdie@rpsys.net
Cc: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
List-Id: linux-leds@vger.kernel.org


--aVD9QWMuhilNxW9f
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri 2016-12-02 09:48:18, Ralph Sennhauser wrote:
> On Thu, 1 Dec 2016 17:56:07 +0100
> Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl> wrote:
>=20
> > On 12/01/2016 03:28 PM, Ralph Sennhauser wrote:
> > > Below the oops with your debug patch applied.
> > >
> > > (...)
> > >
> > > root@wrt1900acs:/# cd sys/class/leds/pca963x\:shelby\:white\:usb2/
> > > root@wrt1900acs:/sys/devices/platform/soc/soc:internal-regs/f1011000.=
i2c/i2c-0/0-0068/leds/pca963x:shelby:white:usb2#
> > > echo usbport > trigger [  124.727665] leds
> > > pca963x:shelby:white:usb2: [usbport_trig_add_port] port:dd708240
> > > [  124.735266] leds pca963x:shelby:white:usb2:
> > > [usbport_trig_add_port] port->port_name:usb1-port1
> > > port->data:dd708140 [  124.745671] leds pca963x:shelby:white:usb2:
> > > [usbport_trig_add_port] port:dd7083c0 [  124.753194] leds
> > > pca963x:shelby:white:usb2: [usbport_trig_add_port]
> > > port->port_name:usb2-port1 port->data:dd708140 [  124.763594] leds
> > > pca963x:shelby:white:usb2: [usbport_trig_add_port] port:dd708300
> > > [  124.771114] leds pca963x:shelby:white:usb2:
> > > [usbport_trig_add_port] port->port_name:usb3-port1
> > > port->data:dd708140
> > > root@wrt1900acs:/sys/devices/platform/soc/soc:internal-regs/f1011000.=
i2c/i2c-0/0-0068/leds/pca963x:shelby:white:usb2#
> > > echo 1 > ports/usb2-port1[  171.649751] leds
> > > pca963x:shelby:white:usb2: [usbport_trig_port_store] buf:1
> > > [  171.649751]  size:2
> > >
> > > [  171.660160] leds pca963x:shelby:white:usb2:
> > > [usbport_trig_port_store] port:dd7083c0 [  171.668103] leds
> > > pca963x:shelby:white:usb2: [usbport_trig_port_store]
> > > port->port_name:usb2-port1 port->data:dd708140 [  171.678678]
> > > [usbport_trig_update_count] usbport_data->count:0 [  171.684457]
> > > [usbport_trig_update_count] usbport_data->count:0 [  171.690253]
> > > Unable to handle kernel NULL pointer dereference at virtual address
> > > 00000000 =20
> >=20
> > Oh, so this happens a bit later than I expected or I could read from
> > the backtrace. Anyway this debugging was still helpful, I think I can
> > see a possible problem.
> >=20
> > So most likely the crash happens at the:
> > led_cdev->brightness_set(led_cdev, ...);
> > call. I'm not sure what I was thinking when writing that code. It
> > looks wrong.
> >=20
> > The thing is some LEDs (drivers) don't provide brightness_set op.
> > It's fine, we should just use brightness_set_blocking op when that
> > happens. Of course kernel has proper helpers for that, we don't have
> > to worry about the choice of op or scheduling the work. I have no
> > idea why I didn't use a proper helper in the first place.
> >=20
> > So we should simply replace above call with one of following ones:
> > 1) led_set_brightness(led_cdev, ...);
> > 2) led_set_brightness_nosleep(led_cdev, ...);
> > 3) led_set_brightness_sync(led_cdev, ...);
> >=20
> > I still have to check which one is correct. In theory we don't deal
> > blinking at this point so we shouldn't need to use led_set_brightness.
> >=20
> > led_set_brightness_nosleep looks like the most likely correct choice.
> >=20
> > led_set_brightness_sync requires brightness_set_blocking which is not
> > always present so most likely we don't want this one.
> >=20
> >=20
> > If you have some free time and you want to play with this, please
> > replace led_cdev->brightness_set
> > with
> > led_set_brightness_nosleep
> > and give it a try. This should fix crashes for you.
> >=20
> > I'll look at this again during next days.
>=20
> Hi Rafa=C5=82
>=20
> I just gave 2) led_set_brightness_nosleep a try. The kernel no longer
> crashes and the led does work as expected.

Do you have any patch that needs to be applied?

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--aVD9QWMuhilNxW9f
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlhG9LsACgkQMOfwapXb+vJ+tACeKV8U9+vJCQckYjpgmUunMcG2
zzwAn1E4vltPD5Uo2hk3bi310tTpXmsD
=336J
-----END PGP SIGNATURE-----

--aVD9QWMuhilNxW9f--
