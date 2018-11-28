From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH 0/6] Introduce audio-mute LED trigger (and
 conversions to it)
Date: Wed, 28 Nov 2018 21:46:12 +0100
Message-ID: <20181128204612.l3bayhop4qmep2hj@pali>
References: <20181126171126.20280-1-tiwai@suse.de> <20181127084418.GA20504@amd>
 <20181128111806.cb3cncpjeq73sptg@pali>
 <s5hy39dv3dg.wl-tiwai@suse.de> <20181128122505.GA1193@amd>
 <8bb45cc6-9f98-9fed-9676-7f1429328c4a@gmail.com>
 <20181128203410.GA20670@amd>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5765325218007474193=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20181128203410.GA20670@amd>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Pavel Machek <pavel@ucw.cz>
Cc: alsa-devel@alsa-project.org, Ayman Bagabas <ayman.bagabas@gmail.com>, Takashi Iwai <tiwai@suse.de>, platform-driver-x86@vger.kernel.org, Hui Wang <hui.wang@canonical.com>, ibm-acpi-devel@lists.sourceforge.net, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--===============5765325218007474193==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ggjsn5ok52cn4a37"
Content-Disposition: inline


--ggjsn5ok52cn4a37
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wednesday 28 November 2018 21:34:10 Pavel Machek wrote:
> Hi!
>=20
> > >>>> Looks good... except one detail: you have "tpacpi::micmute" and
> > >>>> "dell::micmute". I know it follows "tradition", but we are trying =
to
> > >>>> fix that at the moment. Laptop micmute button is a laptop micmute
> > >>>> button, and userspace should not need to know what prefix to use
> > >>>> depending on vendor.
> > >>>>
> > >>>> I'd suggest using "sys::micmute".
> > >>>
> > >>> I can imagine that in future some devices like keyboards would have=
 also
> > >>> mute led. We already have keyboards with mute key, so it is somethi=
ng
> > >>> not unrealistic. What should be name convention for these mute leds?
> > >>>
> > >>> Is not "sys::" prefix too generic?
> > >>
> > >> Good point.  I thought of "laptop::" but it's not always laptop.
> > >> "builtin::"?  Doesn't sound great, either.
> > >>
> > >> A nice godfather is required here...
> > >=20
> > > Just use sys:: :-).
> > >=20
> > > laptop:: would work for me, too. (It is always laptop in the cases we
> > > are handling now, right?)
> > >=20
> > > When we get a keyboard with mute led, we'll have to decide if it
> > > should be input6::mute -- because it is on keyboard, or if it is
> > > sys::mute -- because the key is expected to mute whole system.
> >=20
> > drivers/input/input-leds.c seems to already support mute LED.
> > It will be exposed as inputN::mute.
> >=20
> > Documentation/leds/leds-class.txt defines LED naming pattern
> > to <devicename:color:function> and "sys" does not look as
> > something resembling device name.
>=20
> So what is your suggestion?

I guess we should follow documentation. Or update documentation if it
does not make sense to follow it.

> I don't care much as long as it is same in tpacpi and dell
> case. (Neither are device names, btw :-).
>=20
> Actually "::mute" would make sense, too.

"::mute" is not a good idea due to name uniqueness.

In case you would have two drivers which both provides "mute" led, then
they need to have different name. Reason also why generic name "sys" is
not a good idea.

input subsystem seems to solved this problem by appending number after
"input" word.

I think that driver name or subsystem name would be usable together with
number.

Userspace application would be probably interested to distinguish
between "mute led which is part of laptop" and "mute led which is
available on external USB keyboard".

If external USB keyboard is identified as "input7" device, then
"input7::mute" is a good name for mute key. But "sys::mute" does not say
anything to which device or hardware it belongs nor does not solve
problem that which device/driver/subsystem should have privilege to take
this "sys" name.

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--ggjsn5ok52cn4a37
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQS4VrIQdKium2krgIWL8Mk9A+RDUgUCW/7+kgAKCRCL8Mk9A+RD
UsZwAKDDLE4h7T36qDxwtfS0zM3bio/AbACgkrxtaI5DhrrP3h4G8jiMW001Mvs=
=jfwb
-----END PGP SIGNATURE-----

--ggjsn5ok52cn4a37--

--===============5765325218007474193==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============5765325218007474193==--
