From: Vadim Pasternak <vadimp-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Subject: RE: [patch v2 1/2] mfd: Add Mellanox regmap core driver
Date: Tue, 8 Aug 2017 08:32:14 +0000
Message-ID: <AM4PR05MB3330A3B5F71CCD4A21682320A28A0@AM4PR05MB3330.eurprd05.prod.outlook.com>
References: <1501108094-16898-1-git-send-email-vadimp@mellanox.com>
 <1501108094-16898-2-git-send-email-vadimp@mellanox.com>
 <20170807155836.uqa2nezqqheg6so6@dell>
 <AM4PR05MB3330A1043B618D723EFF4C8DA28A0@AM4PR05MB3330.eurprd05.prod.outlook.com>
 <20170808070211.ikxbzkygymlolavv@dell>
 <AM4PR05MB33301E39B8BB39F68D49B30DA28A0@AM4PR05MB3330.eurprd05.prod.outlook.com>
 <20170808074523.GA12854@amd>
 <AM4PR05MB33300159962297EEC58F1BDAA28A0@AM4PR05MB3330.eurprd05.prod.outlook.com>
 <20170808081711.GE12854@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170808081711.GE12854@amd>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org" <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, "linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "jiri-rHqAuBHg3fBzbRFIqnYvSA@public.gmane.org" <jiri-rHqAuBHg3fBzbRFIqnYvSA@public.gmane.org>, "jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-leds@vger.kernel.org



> -----Original Message-----
> From: Pavel Machek [mailto:pavel-+ZI9xUNit7I@public.gmane.org]
> Sent: Tuesday, August 08, 2017 11:17 AM
> To: Vadim Pasternak <vadimp-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
> Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>; robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org;
> devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org;
> rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org; linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; jiri-rHqAuBHg3fBzbRFIqnYvSA@public.gmane.org;
> jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
> Subject: Re: [patch v2 1/2] mfd: Add Mellanox regmap core driver
>=20
> Hi!
>=20
> > > > And such code can't be placed under drivers/platform/x86/.
> > >
> > > So aim for drivers/platform/mlx ...?
> > >
> >
> > So you suggest to move drivers/platform/x86/mlxcpld-hotplug.c to
> > drivers/platform/mellanox/mlxcpld-hotplug.c and extend thr driver with
> > DTS support (mlxreg_core_dev_enable/mlxreg_core_dev_disable)?
>=20
> If this leads to less code duplication -- yes, by all means do that.

OK.
So, I will remove from mlxreg-core IC related part and send the patches for=
 your
review.
In parallel I'll start to work with platform maintainers for moving mlxcpld=
-hotplug=20
and further extension for DTS support. After this is ready, I'll extend mlx=
reg-core
with IC activation.

Is sounds OK with you?

>=20
> 									Pavel
> --
> (english) http://www.livejournal.com/~pavelmachek
> (cesky, pictures)
> http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
