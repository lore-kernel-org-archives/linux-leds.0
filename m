From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 0/6] Introduce audio-mute LED trigger (and
 conversions to it)
Date: Wed, 28 Nov 2018 22:01:45 +0100
Message-ID: <20181128210145.GD20670@amd>
References: <20181126171126.20280-1-tiwai@suse.de> <20181127084418.GA20504@amd>
 <20181128111806.cb3cncpjeq73sptg@pali>
 <s5hy39dv3dg.wl-tiwai@suse.de> <20181128122505.GA1193@amd>
 <8bb45cc6-9f98-9fed-9676-7f1429328c4a@gmail.com>
 <20181128203410.GA20670@amd> <20181128204612.l3bayhop4qmep2hj@pali>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1865404272012981392=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20181128204612.l3bayhop4qmep2hj@pali>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: alsa-devel@alsa-project.org, Ayman Bagabas <ayman.bagabas@gmail.com>, Takashi Iwai <tiwai@suse.de>, platform-driver-x86@vger.kernel.org, Hui Wang <hui.wang@canonical.com>, ibm-acpi-devel@lists.sourceforge.net, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--===============1865404272012981392==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NklN7DEeGtkPCoo3"
Content-Disposition: inline


--NklN7DEeGtkPCoo3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > >> A nice godfather is required here...
> > > >=20
> > > > Just use sys:: :-).
> > > >=20
> > > > laptop:: would work for me, too. (It is always laptop in the cases =
we
> > > > are handling now, right?)
> > > >=20
> > > > When we get a keyboard with mute led, we'll have to decide if it
> > > > should be input6::mute -- because it is on keyboard, or if it is
> > > > sys::mute -- because the key is expected to mute whole system.
> > >=20
> > > drivers/input/input-leds.c seems to already support mute LED.
> > > It will be exposed as inputN::mute.
> > >=20
> > > Documentation/leds/leds-class.txt defines LED naming pattern
> > > to <devicename:color:function> and "sys" does not look as
> > > something resembling device name.
> >=20
> > So what is your suggestion?
>=20
> I guess we should follow documentation. Or update documentation if it
> does not make sense to follow it.

That's actually in progress. Let me and Jacek deal with it. We don't
need great "how to name a LED" discussion here (google: bike shed paiting).

> > I don't care much as long as it is same in tpacpi and dell
> > case. (Neither are device names, btw :-).
> >=20
> > Actually "::mute" would make sense, too.
>=20
> "::mute" is not a good idea due to name uniqueness.
>=20
> In case you would have two drivers which both provides "mute" led, then
> they need to have different name. Reason also why generic name "sys" is
> not a good idea.

> I think that driver name or subsystem name would be usable together with
> number.
>=20
> Userspace application would be probably interested to distinguish
> between "mute led which is part of laptop" and "mute led which is
> available on external USB keyboard".
>=20
> If external USB keyboard is identified as "input7" device, then
> "input7::mute" is a good name for mute key. But "sys::mute" does not say
> anything to which device or hardware it belongs nor does not solve
> problem that which device/driver/subsystem should have privilege to take
> this "sys" name.

Well, "sys" says this is system-wide mute LED. There are not expected
to be two of those, and there never will be, with the drivers
currently proposed.

								Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--NklN7DEeGtkPCoo3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlv/AjkACgkQMOfwapXb+vJSFgCfSsbGVUgueTs3P7nYP5RkLvlb
r/8AnjiS4cgofYPQ8nbKXrrzqDN1DTax
=8OH5
-----END PGP SIGNATURE-----

--NklN7DEeGtkPCoo3--

--===============1865404272012981392==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============1865404272012981392==--
