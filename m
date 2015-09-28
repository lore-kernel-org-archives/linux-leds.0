From: Simon Guinot <simon.guinot-jKBdWWKqtFpg9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v6 5/5] leds: netxbig: set led_classdev max_brightness
Date: Mon, 28 Sep 2015 13:50:33 +0200
Message-ID: <20150928115033.GZ7306@kw.sim.vm.gnt>
References: <1443301358-2131-1-git-send-email-simon.guinot@sequanux.org>
 <1443301358-2131-6-git-send-email-simon.guinot@sequanux.org>
 <5608F41B.4020307@samsung.com>
 <20150928091956.GY7306@kw.sim.vm.gnt>
 <5609133A.3050802@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2fowzm2eVyDiEwGH"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5609133A.3050802-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Vincent Donnefort <vdonnefort-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Yoann Sculo <yoann-SEL7PEOQfnBQFI55V6+gNQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-leds@vger.kernel.org


--2fowzm2eVyDiEwGH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2015 at 12:15:22PM +0200, Jacek Anaszewski wrote:
> On 09/28/2015 11:19 AM, Simon Guinot wrote:
> >On Mon, Sep 28, 2015 at 10:02:35AM +0200, Jacek Anaszewski wrote:
> >>Hi Simon,
> >
> >Hi Jacek,
> >
> >>
> >>Does your device support reading the brightness currently set?
> >
> >No it don't.
> >
> >>If so, it would be good to implement brightness_get op, because
> >>AFAIR you mentioned that the firmware you are working with sets
> >>always maximum brightness value. Having the op implemented would
> >>allow to find this out.
> >
> >I don't understand how this can help. I mean, the only issue is that at
> >startup the initial LED state is unknown. And the software brightness
> >value could be false. But once the LED is configured, the brightness
> >values for software and hardware are synchronized. The brightness value
> >is stored/cached in led_classdev and it can be retrieved by the user via
> >sysfs...
> >
> >For my own knowledge, is there some interest in having brightness_get(),
> >aside of guessing the LED initial state ?
>=20
> Some LED controllers can adjust brightness in case battery voltage level
> falls below some threshold.

OK, thanks for the explanation.

>=20
> >What does the embedded firmware is writing 255 or 0 into the brightness
> >sysfs attribute. The max_brightness value is ignored. After this patch,
> >writing 255 and 0 still allows to configure the LED in the same way:
> >maximum brightness or off. Thus, I believe there is no compatibility
> >issue.
>=20
> LED core always assures that brightness value passed to brightness_set
> op does not exceed max_brightness value. So, now after executing
> "echo 255 > brightness", LED core will adjust it to max_brightness
> (e.g. 7) before passing to brightness_set.
>=20
> In the message [1], you mentioned that "LEDs are only enabled at their
> maximum level", so IIUC following is possible:
>=20
> #echo 3 > "brightness"
>=20
> firmware sets brightness to max_brightness from DT (e.g. 7), but
>=20
> #cat brightness
> #3
>=20
> Is it true?

Oh no sorry, it is a misunderstanding. By "LEDs are only enabled at
their maximum level", I was meaning "LEDs are only enabled at their
maximum level by the LaCie stock firmware". The firmware don't make
use of the different hardware brightness levels available. But the
feature works perfectly. If you write 3 into sysfs "brightness", then
you get the third brightness level.

OK, I understand you remark now. Sorry for not being very clear in a
first place.

Simon

--2fowzm2eVyDiEwGH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlYJKYkACgkQgtp0PDeOcDoz9ACcCnjADwVGNAoa1l4vIc1/Ro5w
su8AmgOLV2wgBvNjK3k3/UR0G2M6vP3X
=L2F3
-----END PGP SIGNATURE-----

--2fowzm2eVyDiEwGH--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
