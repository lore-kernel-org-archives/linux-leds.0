From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH 0/7] Move dell-led to drivers/platform/x86
Date: Sun, 11 Dec 2016 11:45:37 +0100
Message-ID: <201612111145.37777@pali>
References: <CGME20161208123909epcas3p23229f5e0d337e19a27b272211798d364@epcas3p2.samsung.com> <20161208123618.28603-1-kernel@kempniu.pl> <327c8edc-5a1e-8a94-85b2-4a2febc03352@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart9382632.rKynATlCas";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <327c8edc-5a1e-8a94-85b2-4a2febc03352@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>, mario.limonciello@dell.com
Cc: =?utf-8?q?Micha=C5=82_K=C4=99pie=C5=84?= <kernel@kempniu.pl>, Richard Purdie <rpurdie@rpsys.net>, Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Louis Davis <Louis_Davis@dell.com>, Jim Dailey <Jim_Dailey@dell.com>, Alex Hung <alex.hung@canonical.com>, Hui Wang <hui.wang@canonical.com>, linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

--nextPart9382632.rKynATlCas
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thursday 08 December 2016 15:26:37 Jacek Anaszewski wrote:
> Hi Micha=C5=82,
>=20
> Thanks for the patch set.
>=20
> On 12/08/2016 01:36 PM, Micha=C5=82 K=C4=99pie=C5=84 wrote:
> > This patch series moves the dell-led driver from the LED subsystem
> > to the x86 platform driver subsystem.  I decided to also CC the
> > sound subsystem contacts for the whole series as
> > sound/pci/hda/dell_wmi_helper.c is also affected.
> >=20
> > The original motivation behind this effort was to move all code
> > using the dell-smbios module to the x86 platform driver subsystem.
> >  While I was investigating the possibilites to do that, it quickly
> > emerged that dell-led can and in fact should be moved to the x86
> > platform driver subsystem in its entirety.
> >=20
> > dell-led consists of two major parts:
> >   - the part exposing a microphone mute LED interface, introduced
> >   in
> >  =20
> >     db6d8cc ("dell-led: add mic mute led interface"); this
> >     interface is used by sound/pci/hda/dell_wmi_helper.c; while
> >     the original implementation used a WMI interface, it was
> >     changed to use dell-smbios in cf0d7ea ("dell-led: use
> >     dell_smbios_find_token() for finding mic DMI tokens") and
> >     0c41a08 ("dell-led: use
> >     dell_smbios_send_request() for performing SMBIOS calls"),
> >  =20
> >   - the part handling an activity LED present in Dell Latitude 2100
> >  =20
> >     netbooks, introduced in 72dcd8d ("leds: Add Dell Business Class
> >     Netbook LED driver"); it binds to a specific WMI GUID and then
> >     registers a LED device which is controlled using WMI (i.e. it
> >     is basically a WMI driver).
> >=20
> > Patches 1-4 clean up the microphone mute LED interface to minimize
> > the amount of code moved around.
> >=20
> > Patch 5 moves the microphone mute LED interface to
> > drivers/platform/x86/dell-laptop.c, effectively causing
> > sound/pci/hda/dell_wmi_helper.c to depend on CONFIG_DELL_LAPTOP
> > instead of CONFIG_LEDS_DELL_NETBOOKS.
> >=20
> > Patch 6 reverts dell-led to the state it was in after its initial
> > commit 72dcd8d ("leds: Add Dell Business Class Netbook LED
> > driver") by removing all remnants of the microphone mute LED
> > handling code.
> >=20
> > Patch 7 moves all that is left of dell-led (i.e. the activity LED
> > part, as originally implemented), to a new module which is placed
> > in drivers/platform/x86/dell-wmi-led.c.
> >=20
> > This patch series is based on linux-leds/for-4.11 as the LED
> > subsystem is affected by all patches except patch 3.
> >=20
> > If anyone reading this has access to a Dell device which has an
> > activity LED and/or a microphone mute LED currently supported by
> > dell-led, I would love to hear from you as I do not have the
> > hardware needed to practically test this patch series.
>=20
> I think that it is necessary to find someone who will give their
> Tested-by.
>=20
> What I can accept immediately is moving the driver in the current
> shape to x86 platform drivers. I could expose a stable branch with
> that patch for the x86 platform maintainers then.

Adding Mario Limonciello from @dell to discussion.

Mario, any chance you could be able to test this patch series?

> >  drivers/leds/Kconfig                               |  9 ---
> >  drivers/leds/Makefile                              |  1 -
> >  drivers/platform/x86/Kconfig                       |  8 +++
> >  drivers/platform/x86/Makefile                      |  1 +
> >  drivers/platform/x86/dell-laptop.c                 | 28 ++++++++
> >  .../dell-led.c =3D> platform/x86/dell-wmi-led.c}     | 75
> >  +++------------------- include/linux/dell-led.h                 =20
> >          |  6 +- sound/pci/hda/dell_wmi_helper.c                 =20
> >   | 18 +++--- 8 files changed, 55 insertions(+), 91 deletions(-)
> >  rename drivers/{leds/dell-led.c =3D> platform/x86/dell-wmi-led.c}
> >  (73%)

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart9382632.rKynATlCas
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlhNLlEACgkQi/DJPQPkQ1IcQACgpW6xP38Wv7FV6PzQVSp+Cudj
4MkAn0wsnppyy5pYIM3sZkyMPWWzrNQJ
=iluJ
-----END PGP SIGNATURE-----

--nextPart9382632.rKynATlCas--
