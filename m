From: Simon Guinot <simon.guinot@sequanux.org>
Subject: Re: [patch 2/2] leds: netxbig: clean up a data type issue
Date: Thu, 9 Apr 2015 21:25:57 +0200
Message-ID: <20150409192557.GD1509@kw.sim.vm.gnt>
References: <20150409090712.GF17605@mwanda>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pHzye94IkqcvRa/c"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from vm1.sequanux.org ([188.165.36.56]:44370 "EHLO vm1.sequanux.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932855AbbDIT0B (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Thu, 9 Apr 2015 15:26:01 -0400
Content-Disposition: inline
In-Reply-To: <20150409090712.GF17605@mwanda>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, kernel-janitors@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory Clement <gregory.clement@free-electrons.com>, linux-arm-kernel@lists.infradead.org


--pHzye94IkqcvRa/c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 09, 2015 at 12:07:12PM +0300, Dan Carpenter wrote:
> This driver is pretty hardware specific so it's unlikely that we're
> going to be using it on 64 big endian systems.  Still, the current code
> causes a static checker warning so we may as well change the type from
> "unsigned long" to "u32" and remove the casting.

Hi Dan,

Thanks for the patch.

Why do you think it would be an issue to use the u32 type for this
variables on a 64-bit big-endian machine ? Note that this LED mechanism
is actually used on ARM 32-bits and x86-64 NAS platforms. The latter are
not mainlined yet. But indeed, for now, there is no plan to use it on a
64-bit big-endian machine.

Since the whole LED code uses the unsigned long type to hold the delay
values, if possible, I would prefer to keep the delay_{on,off} variables
consistent with that.

Is there an another way to make the "static checker" happy ?

Thanks,

Simon

>=20
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>=20
> diff --git a/include/linux/platform_data/leds-kirkwood-netxbig.h b/includ=
e/linux/platform_data/leds-kirkwood-netxbig.h
> index d2be19a..bbd1d99 100644
> --- a/include/linux/platform_data/leds-kirkwood-netxbig.h
> +++ b/include/linux/platform_data/leds-kirkwood-netxbig.h
> @@ -29,9 +29,9 @@ enum netxbig_led_mode {
>  #define NETXBIG_LED_INVALID_MODE NETXBIG_LED_MODE_NUM
> =20
>  struct netxbig_led_timer {
> -	unsigned long		delay_on;
> -	unsigned long		delay_off;
> -	enum netxbig_led_mode	mode;
> +	u32 delay_on;
> +	u32 delay_off;
> +	enum netxbig_led_mode mode;
>  };
> =20
>  struct netxbig_led {
> diff --git a/drivers/leds/leds-netxbig.c b/drivers/leds/leds-netxbig.c
> index d0b743c..3da87be 100644
> --- a/drivers/leds/leds-netxbig.c
> +++ b/drivers/leds/leds-netxbig.c
> @@ -447,9 +447,9 @@ static int netxbig_leds_get_of_pdata(struct device *d=
ev,
>  			of_property_read_u32_index(np, "timers", 3 * i,
>  						&timers[i].mode);
>  			of_property_read_u32_index(np, "timers", 3 * i + 1,
> -						(u32 *) &timers[i].delay_on);
> +						   &timers[i].delay_on);
>  			of_property_read_u32_index(np, "timers", 3 * i + 2,
> -						(u32 *) &timers[i].delay_off);
> +						   &timers[i].delay_off);
>  		}
>  		pdata->timer =3D timers;
>  		pdata->num_timer =3D num_timers;

--pHzye94IkqcvRa/c
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlUm0kUACgkQgtp0PDeOcDpOPQCghyu1OXLlEwRkPmOdEXa6E5y5
qgYAn2ADJZ3QBdioNgz7d08MF7fX9peA
=PeXs
-----END PGP SIGNATURE-----

--pHzye94IkqcvRa/c--
