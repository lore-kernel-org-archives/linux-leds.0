From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Subject: Re: [PATCH 24/43] docs: leds: convert to ReST
Date: Sat, 6 Jul 2019 07:41:26 -0300
Message-ID: <20190706074047.58c23fe9@coco.lan>
References: <cover.1561723979.git.mchehab+samsung@kernel.org>
        <2fecbe9a9cefda64771b43c5fc67495d897dd722.1561723980.git.mchehab+samsung@kernel.org>
        <0b2a2452-20ca-1651-e03b-a15a8502b028@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <0b2a2452-20ca-1651-e03b-a15a8502b028@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@infradead.org>, linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Vadim Pasternak <vadimp@mellanox.com>, Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>, Pablo Neira Ayuso <pablo@netfilter.org>, Jozsef Kadlecsik <kadlec@netfilter.org>, Florian Westphal <fw@strlen.de>, "David S. Miller" <davem@davemloft.net>, linux-leds@vger.kernel.org, netfilter-devel@vger.kernel.org, coreteam@netfilter.org, netdev@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Em Fri, 28 Jun 2019 21:01:40 +0200
Jacek Anaszewski <jacek.anaszewski@gmail.com> escreveu:

> Hi Mauro,
>=20
> On 6/28/19 2:20 PM, Mauro Carvalho Chehab wrote:
> > Rename the leds documentation files to ReST, add an
> > index for them and adjust in order to produce a nice html
> > output via the Sphinx build system.
> >=20
> > At its new index.rst, let's add a :orphan: while this is not linked to
> > the main index.rst file, in order to avoid build warnings.
> >=20
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> > Acked-by: Pavel Machek <pavel@ucw.cz>
> > ---
> >  Documentation/laptops/thinkpad-acpi.txt       |   4 +-
> >  Documentation/leds/index.rst                  |  25 ++
> >  .../leds/{leds-blinkm.txt =3D> leds-blinkm.rst} |  64 ++---
> >  ...s-class-flash.txt =3D> leds-class-flash.rst} |  49 ++--
> >  .../leds/{leds-class.txt =3D> leds-class.rst}   |  15 +-
> >  .../leds/{leds-lm3556.txt =3D> leds-lm3556.rst} | 100 ++++++--
> >  .../leds/{leds-lp3944.txt =3D> leds-lp3944.rst} |  23 +-
> >  Documentation/leds/leds-lp5521.rst            | 115 +++++++++
> >  Documentation/leds/leds-lp5521.txt            | 101 --------
> >  Documentation/leds/leds-lp5523.rst            | 147 ++++++++++++
> >  Documentation/leds/leds-lp5523.txt            | 130 ----------
> >  Documentation/leds/leds-lp5562.rst            | 137 +++++++++++
> >  Documentation/leds/leds-lp5562.txt            | 120 ----------
> >  Documentation/leds/leds-lp55xx.rst            | 224 ++++++++++++++++++
> >  Documentation/leds/leds-lp55xx.txt            | 194 ---------------
> >  Documentation/leds/leds-mlxcpld.rst           | 118 +++++++++
> >  Documentation/leds/leds-mlxcpld.txt           | 110 ---------
> >  ...edtrig-oneshot.txt =3D> ledtrig-oneshot.rst} |  11 +-
> >  ...ig-transient.txt =3D> ledtrig-transient.rst} |  63 +++--
> >  ...edtrig-usbport.txt =3D> ledtrig-usbport.rst} |  11 +-
> >  Documentation/leds/{uleds.txt =3D> uleds.rst}   |   5 +-
> >  MAINTAINERS                                   |   2 +-
> >  drivers/leds/trigger/Kconfig                  |   2 +-
> >  drivers/leds/trigger/ledtrig-transient.c      |   2 +-
> >  net/netfilter/Kconfig                         |   2 +-
> >  25 files changed, 996 insertions(+), 778 deletions(-)
> >  create mode 100644 Documentation/leds/index.rst
> >  rename Documentation/leds/{leds-blinkm.txt =3D> leds-blinkm.rst} (57%)
> >  rename Documentation/leds/{leds-class-flash.txt =3D> leds-class-flash.=
rst} (74%)
> >  rename Documentation/leds/{leds-class.txt =3D> leds-class.rst} (92%)
> >  rename Documentation/leds/{leds-lm3556.txt =3D> leds-lm3556.rst} (70%)
> >  rename Documentation/leds/{leds-lp3944.txt =3D> leds-lp3944.rst} (78%)
> >  create mode 100644 Documentation/leds/leds-lp5521.rst
> >  delete mode 100644 Documentation/leds/leds-lp5521.txt
> >  create mode 100644 Documentation/leds/leds-lp5523.rst
> >  delete mode 100644 Documentation/leds/leds-lp5523.txt
> >  create mode 100644 Documentation/leds/leds-lp5562.rst
> >  delete mode 100644 Documentation/leds/leds-lp5562.txt
> >  create mode 100644 Documentation/leds/leds-lp55xx.rst
> >  delete mode 100644 Documentation/leds/leds-lp55xx.txt
> >  create mode 100644 Documentation/leds/leds-mlxcpld.rst
> >  delete mode 100644 Documentation/leds/leds-mlxcpld.txt
> >  rename Documentation/leds/{ledtrig-oneshot.txt =3D> ledtrig-oneshot.rs=
t} (90%)
> >  rename Documentation/leds/{ledtrig-transient.txt =3D> ledtrig-transien=
t.rst} (81%)
> >  rename Documentation/leds/{ledtrig-usbport.txt =3D> ledtrig-usbport.rs=
t} (86%)
> >  rename Documentation/leds/{uleds.txt =3D> uleds.rst} (95%) =20
>=20
> Patches 4/9 and 24/43 applied to the for-next branch of linux-leds.git.

Thanks!

I'll keep this one on my tree:

	[PATCH 10/39] docs: leds: add it to the driver-api book

=46rom the other series. If everything goes well, either Jon or I should
be sending upstream by the end of the merge window, after rebasing it,
together with a bunch of other patches touching the driver-api index.rst.

That should hopefully avoid merge conflicts.

Regards,
Mauro
