From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH AUTOSEL for 4.14 065/110] led: core: Fix brightness
 setting when setting delay_off=0
Date: Sun, 4 Feb 2018 18:31:16 +0100
Message-ID: <20180204173116.GB1388@amd>
References: <20180203180015.29073-1-alexander.levin@microsoft.com>
 <20180203180015.29073-65-alexander.levin@microsoft.com>
 <20180203203525.GA5860@amd>
 <20180204003029.2lkcmh6wvzpnlrls@sasha-lappy>
 <20180204090531.GA29468@amd>
 <20180204154859.zfkp4oia5iorewo5@sasha-lappy>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="oC1+HKm2/end4ao3"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180204154859.zfkp4oia5iorewo5@sasha-lappy>
Sender: linux-kernel-owner@vger.kernel.org
To: Sasha Levin <Alexander.Levin@microsoft.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>, Matthieu CASTET <matthieu.castet@parrot.com>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, Jacek Anaszewski <jacek.anaszewski@gmail.com>
List-Id: linux-leds@vger.kernel.org


--oC1+HKm2/end4ao3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun 2018-02-04 15:49:06, Sasha Levin wrote:
> On Sun, Feb 04, 2018 at 10:05:31AM +0100, Pavel Machek wrote:
> >On Sun 2018-02-04 00:30:36, Sasha Levin wrote:
> >> On Sat, Feb 03, 2018 at 09:35:26PM +0100, Pavel Machek wrote:
> >> >On Sat 2018-02-03 18:00:59, Sasha Levin wrote:
> >> >> From: Matthieu CASTET <matthieu.castet@parrot.com>
> >> >>
> >> >> [ Upstream commit 2b83ff96f51d0b039c4561b9f95c824d7bddb85c ]
> >> >>
> >> >> With the current code, the following sequence won't work :
> >> >> echo timer > trigger
> >> >>
> >> >> echo 0 >  delay_off
> >> >> * at this point we call
> >> >> ** led_delay_off_store
> >> >> ** led_blink_set
> >> >> *** stop timer
> >> >> ** led_blink_setup
> >> >> ** led_set_software_blink
> >> >> *** if !delay_on, led off
> >> >> *** if !delay_off, set led_set_brightness_nosleep <--- LED_BLINK_SW=
 is set but timer is stop
> >> >> *** otherwise start timer/set LED_BLINK_SW flag
> >> >>
> >> >> echo xxx > brightness
> >> >> * led_set_brightness
> >> >> ** if LED_BLINK_SW
> >> >> *** if brightness=3D0, led off
> >> >> *** else apply brightness if next timer <--- timer is stop, and wil=
l never apply new setting
> >> >> ** otherwise set led_set_brightness_nosleep
> >> >>
> >> >> To fix that, when we delete the timer, we should clear LED_BLINK_SW.
> >> >
> >> >Can you run the tests on the affected stable kernels? I have feeling
> >> >that the problem described might not be present there.
> >>
> >> Hm, I don't seem to have HW to test that out. Maybe someone else does?
> >
> >Why are you submitting patches you have no way to test?
>=20
> Because.... that's how the process works? -stable maintainers don't test
> every single patch that goes in. Never happened and I doubt it ever
> will.

Well, see my reply to Greg. According to documentation, stable tree is
for

 - It must be obviously correct and tested.
 - It must fix a real bug that bothers people (not a, "This could
   be a   problem..." type thing).
 - It must fix a problem that causes a build error (but not for
   things marked CONFIG_BROKEN), an oops, a hang, data corruption, a real
   security issue, or some "oh, that's not good" issue.  In short,=20
   something critical.
   =20
=2E This one was not tested in the stable trees, and it was not really
bothering anyone. It was not even present in some of the kernels... It
was not an oops, hang... etc.

> >Plus... you don't have PC keyboard? You don't have thinkpad notebook?
>=20
> Nope, all the (limited) testing I do happens in VMs, which don't expose
> leds as far as I know.

You still use keyboard to access the VMs, right?

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--oC1+HKm2/end4ao3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlp3Q2QACgkQMOfwapXb+vItuwCfTLFvw7oyhyNmBi7ZypGB6AXs
+X8AoLVxLA22chFVfiUMhyRawQ7w5+rB
=BRMa
-----END PGP SIGNATURE-----

--oC1+HKm2/end4ao3--
