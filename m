From: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
Subject: Re: [PATCH 2/2] leds: gpio: Allow LED to retain state at shutdown
Date: Mon, 28 Aug 2017 09:30:19 +0930
Message-ID: <1503878419.32695.9.camel@aj.id.au>
References: <20170825063503.31577-1-andrew@aj.id.au>
         <20170825063503.31577-3-andrew@aj.id.au> <20170825073239.GB15494@amd>
         <3b89ad70-7024-b4ac-bf4e-49a02d12da51@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-uxUCu/RNPok7omOLWy6A"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3b89ad70-7024-b4ac-bf4e-49a02d12da51-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, openbmc-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: linux-leds@vger.kernel.org


--=-uxUCu/RNPok7omOLWy6A
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jacek, Pavel

On Sun, 2017-08-27 at 13:01 +0200, Jacek Anaszewski wrote:
> Hi Andrew,
>=20
> On 08/25/2017 09:32 AM, Pavel Machek wrote:
> > On Fri 2017-08-25 16:05:03, Andrew Jeffery wrote:
> > > In some systems, such as BMCs, we want to retain the state of LEDs
> > > across a reboot of the BMC whilst the host remains up.
> >=20
> > I'd spell out what BMC is...
>=20
> I agree with Pavel. Please give the expansion of the acronym
> in both DT patch and the driver commit message.

No worries, will reword and resend.

Thanks for the review.

Andrew

>=20
> >=20
> > Otherwise series looks good.
> >=20
> > Acked-by: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
>=20
>=20
--=-uxUCu/RNPok7omOLWy6A
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZo10TAAoJEJ0dnzgO5LT5rB8QAKaheT4+T4uH++dwNNuXJ5DP
PIFclCZ9oaFSkzyyMRecNMcifRRnhtMnQdlnOkQBzCaq10OxPFGKin/wr8BoANMw
Z4Y6wM90XuTJEayg1b/4Cf35zDEpXr+SJTNvXsf8VootjkAysK5Y+2yLSORbf9tG
v6ayMPmek4CYYMzZrDi1vlyFYJvKFsBe0eB/ngSCiwVZBp1GZG4CA7NhQ9+FiUYV
831oZjoRTMRtVCqMJZAPEHe++OAKb5FCy0gb1O7bfQjqn1HG9LfN+TbgiCb4CwMo
aabK2e+60NF+UpQ6r9j/HmMrDE3SOpxLyNoyj+/hR4DBuw+MQCqBY4B6f3xwHdTE
m9p1BgGdLEyAxHBhsDbeeAT+jCMHLC3inwZkiU1EWa5bO+6VABk6iQOH/yFHA/Ph
stuEtsY9koXiOxjciV9rx5CZRHzf54PcKkFbBGuZB52KkpwLrBBB1pIWE6ah/akt
eMS01TR+8L6wiJaZa3qtJH+PR35feGtzuRmWQLUzi898UWuEtGxaVJn/0dwefbkV
CKLSmMQLwzsrLCVZYO2zpUitEZkhOQzdSs5CEHyCiNtpuRABX4Zg5zEJuaHlsD+z
gXF4YGCrK1HGz79ekeBvYD1eQZLHw9BDWoi4xOxhrPYTHCpJkjVIs6t6TD2CyOk2
WdQrpgpyGwe4tg8zb0d0
=nw0M
-----END PGP SIGNATURE-----

--=-uxUCu/RNPok7omOLWy6A--

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
