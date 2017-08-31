From: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH] leds: pca955x: check for I2C errors
Date: Thu, 31 Aug 2017 09:34:02 +0930
Message-ID: <1504137842.5933.24.camel@aj.id.au>
References: <20170830112551.3493-1-clg@kaod.org>
         <f171c638-4190-30ba-94dc-36fdf9ed10de@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-HYqHzVAJnjOCyYRI1Tk8"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:54997 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1750761AbdHaAEN (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Wed, 30 Aug 2017 20:04:13 -0400
In-Reply-To: <f171c638-4190-30ba-94dc-36fdf9ed10de@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, linux-leds@vger.kernel.org
Cc: Richard Purdie <rpurdie@rpsys.net>, Pavel Machek <pavel@ucw.cz>


--=-HYqHzVAJnjOCyYRI1Tk8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2017-08-30 at 22:00 +0200, Jacek Anaszewski wrote:
> Hi Cedric,
>=20
> Thanks for the patch.
>=20
> On 08/30/2017 01:25 PM, C=C3=A9dric Le Goater wrote:
> > This should also allow probing to fail when a pca955x chip is not
> > found on a I2C bus.
> >=20
> > > > Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> > ---
> >=20
> > =C2=A0Andrew,
> >=20
> > =C2=A0The patch conflicts with your patch :
> >=20
> > =C2=A0=C2=A0=C2=A0"leds: pca955x: Don't invert requested value in pca95=
5x_gpio_set_value()"
> >=20
> > =C2=A0and I have chosen to be in sync with the 'for-next' branch of the
> > =C2=A0linux-leds git repo. Depending on the reviews we will have to res=
pin
> > =C2=A0one or the other.
>=20
> Applied yours as first.
>=20

No worries, I'll resend.

Cheers,

Andrew
--=-HYqHzVAJnjOCyYRI1Tk8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZp1JyAAoJEJ0dnzgO5LT5UbcP/0M+OaE6xslQ1EWb+o7DWL6z
wEGsaO5pSzGvS9Wii6ZDzv3n5u8Q4E6bMx2b8XPaaun7V1UE0qPzQAymCl8FMqZ3
h+rapRlbDAIlp9noKHIgHUIQkW4eDQXTNSRlivJYLAZ93zQMhE65rSNn8Ha7nmoC
rWb28Y7nDNlC/SFECtjTJ5eSPtVbUmiPV2+bMX1e8jfoiZrYYIrrB47xmhDrXFeQ
Cq6fEBKXzAOugSpP6dXEG4l134zAMY3WmWQ5XJ/7p2+FX39miqS8VG++LiF4A9L1
/cbsQEWAXg2SIhexLIXzOKetkYpj35bWrXinr44j2hCgqn6ioBiZNzV1vekygOWZ
qvbgCxVwAINdDbs4iGsrKUudHfOCQRzVWJcjxyjlrVbDxXDGmhmlCz+oEtnzG3YA
HrOQI/8eev88PYGyr1YbI1xAmI1YbIl8aFnDLdivc17Rbywpn2d3XsEDdvELow0x
ism4nMsmLzgFtTtkZuFitG4wrOl+j+l56ZYvse55iGWIv5q/aPcztRnQW6hhvksP
N0FN//MigoJN9ErYREttZWzVIuMTCO7ZIN7AbrVNHiE47P4m9zMTol45JD5vJtlL
l4GHgY4pWEWzAaH8hwRK5pPUZR1S3Y0kZrX7GAt5HqT48pSs/fLGyM+cWs7hDtXv
jZ8KpUIYZ9cv17/uddjy
=V2Wo
-----END PGP SIGNATURE-----

--=-HYqHzVAJnjOCyYRI1Tk8--
