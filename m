From: Vadim Pasternak <vadimp@mellanox.com>
Subject: RE: [patch v4] leds: add driver for Mellanox systems LEDs
Date: Thu, 8 Sep 2016 10:39:06 +0000
Message-ID: <AM5PR0501MB20975BE9666D425C624A2A1AA2FB0@AM5PR0501MB2097.eurprd05.prod.outlook.com>
References: <1473319553-37195-1-git-send-email-vadimp@mellanox.com>
 <f1343a15-3553-023f-c492-6364ec79decb@samsung.com>
 <3fd4a32a-ea79-315a-486f-2dab6aa384d8@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <3fd4a32a-ea79-315a-486f-2dab6aa384d8@samsung.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>, "rpurdie@rpsys.net" <rpurdie@rpsys.net>
Cc: "dave@treblig.org" <dave@treblig.org>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "jiri@resnulli.us" <jiri@resnulli.us>, Michael Shych <michaelsh@mellanox.com>
List-Id: linux-leds@vger.kernel.org



> -----Original Message-----
> From: Jacek Anaszewski [mailto:j.anaszewski@samsung.com]
> Sent: Thursday, September 08, 2016 1:24 PM
> To: Vadim Pasternak <vadimp@mellanox.com>; rpurdie@rpsys.net
> Cc: dave@treblig.org; linux-leds@vger.kernel.org; linux-kernel@vger.kerne=
l.org;
> jiri@resnulli.us; Michael Shych <michaelsh@mellanox.com>
> Subject: Re: [patch v4] leds: add driver for Mellanox systems LEDs
>=20
> On 09/08/2016 12:20 PM, Jacek Anaszewski wrote:
> > On 09/08/2016 09:25 AM, vadimp@mellanox.com wrote:
> >> From: Vadim Pasternak <vadimp@mellanox.com>
> >
> >> diff --git a/Documentation/leds/leds-mlxcpld.txt
> >> b/Documentation/leds/leds-mlxcpld.txt
> >> new file mode 100644
> >> index 0000000..7b4c2a3
> >> --- /dev/null
> >> +++ b/Documentation/leds/leds-mlxcpld.txt
> >> @@ -0,0 +1,110 @@
> >> +ver LEDs-mlxcpld
> >
> > I noticed this only now - is it a stray line or you intended it was
> > something more meaningful?
>=20
> OK, I changed it to:
>=20
> Kernel driver for Mellanox systems LEDs
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> followed by an empty line.
>=20
> >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> >> +Driver for Mellanox systems LEDs.
> >> +Provide system LED support for the nex Mellanox systems:
> >> +"msx6710", "msx6720", "msb7700", "msn2700", "msx1410", "msn2410",
> >> +"msb7800", "msn2740", "msn2100".
> >
> >
OK.
Thank you very much for reviews.

When we'll have some docs available at WEB, I'll update leds-mlxcpld.txt wi=
th it.

Best regards,
Vadim.
>=20
>=20
> --
> Best regards,
> Jacek Anaszewski
