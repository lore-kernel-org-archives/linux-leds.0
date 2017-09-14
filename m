From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v2 0/3] led: ledtrig-transient: add support for hrtimer
Date: Thu, 14 Sep 2017 21:42:00 +0200
Message-ID: <20170914194200.GA4007@amd>
References: <20170913175400.42744-1-dtwlin@google.com>
 <20170913202032.GA30844@amd>
 <CAPzFB+U_d+Jz4MFPJgpF3gbPt7hE_DhSjcz0LTF8csMgjdA5dw@mail.gmail.com>
 <20170913213424.GA2493@amd>
 <CAPzFB+XrhAUE3Qd+bicCCPk6V7xq7BV=90y=KXudZmGDaS2+cA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="oyUTqETQ0mS9luUI"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAPzFB+XrhAUE3Qd+bicCCPk6V7xq7BV=90y=KXudZmGDaS2+cA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Lin <dtwlin@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, rpurdie@rpsys.net, Jacek Anaszewski <jacek.anaszewski@gmail.com>, hdegoede@redhat.com, Greg KH <gregkh@linuxfoundation.org>, robh@kernel.org, Rom Lemarchand <romlem@google.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--oyUTqETQ0mS9luUI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > > NAK.
> > > >
> > > > LEDs do not need extra overhead, and vibrator control should not go
> > > > through LED subsystem.
> > > >
> > > > Input subsystem includes support for vibrations and force
> > > > feedback. Please use that instead.
> > >
> > > I thought we are already over this discussion. As of now, the support
> > > of vibrator through ledtrig is documented
> > > (Documentation/leds/ledtrig-transient.txt) and there are users using
> > > it.

Stop misleading people. No _users_ are using Android on mainline
kernel, as there is not a single Android phone supported by mainline
kernel.

> > I also thought we are over with that discussion.
> >
> > Yes, I'm working on fixing the docs.
> >
> > What mainline users are doing that?
>=20
> Please refer to patch:
> https://patchwork.kernel.org/patch/8664831/ and
> https://android.googlesource.com/platform%2Fhardware%2Flibhardware/+/6170=
1df363310a5cbd95e3e1638baa9526e42c9b
>=20
> I don't think currently there are drivers in the mainline using it
> yet, the reason being most of the Android devices are still on 4.4
> kernel which still uses the legacy timed_output device.

Ok. I'm sorry commit 61701df363310a5cbd95e3e1638baa9526e42c9b pushed
your libhardware into wrong direction, but that is exactly what
happened.

LED subsystem is not suitable for vibrations. We have input subsystem
for that, it is handling vibrations for 10+ years, and for example
Nokia N900 cellphone (which is supported by mainline) uses them.

Please fix libhardware accordingly.

Thank you,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--oyUTqETQ0mS9luUI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlm624gACgkQMOfwapXb+vJzkgCfT3RamaMQOJyr3GgcoKvr64In
ArEAn1jJ+iqIVYXrhN3kXUT5ZfGsMlbj
=TYoC
-----END PGP SIGNATURE-----

--oyUTqETQ0mS9luUI--
