From: Simon Guinot <simon.guinot@sequanux.org>
Subject: Re: [PATCH v6 5/5] leds: netxbig: set led_classdev max_brightness
Date: Mon, 28 Sep 2015 11:19:56 +0200
Message-ID: <20150928091956.GY7306@kw.sim.vm.gnt>
References: <1443301358-2131-1-git-send-email-simon.guinot@sequanux.org>
 <1443301358-2131-6-git-send-email-simon.guinot@sequanux.org>
 <5608F41B.4020307@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Vx/u1Rx7tHHd/cso"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from vm1.sequanux.org ([188.165.36.56]:47843 "EHLO vm1.sequanux.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757184AbbI1JSf (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Mon, 28 Sep 2015 05:18:35 -0400
Content-Disposition: inline
In-Reply-To: <5608F41B.4020307@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@free-electrons.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Vincent Donnefort <vdonnefort@gmail.com>, Yoann Sculo <yoann@printk.fr>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh@kernel.org>, linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org


--Vx/u1Rx7tHHd/cso
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2015 at 10:02:35AM +0200, Jacek Anaszewski wrote:
> Hi Simon,

Hi Jacek,

>=20
> Does your device support reading the brightness currently set?

No it don't.

> If so, it would be good to implement brightness_get op, because
> AFAIR you mentioned that the firmware you are working with sets
> always maximum brightness value. Having the op implemented would
> allow to find this out.

I don't understand how this can help. I mean, the only issue is that at
startup the initial LED state is unknown. And the software brightness
value could be false. But once the LED is configured, the brightness
values for software and hardware are synchronized. The brightness value
is stored/cached in led_classdev and it can be retrieved by the user via
sysfs...

For my own knowledge, is there some interest in having brightness_get(),
aside of guessing the LED initial state ?

What does the embedded firmware is writing 255 or 0 into the brightness
sysfs attribute. The max_brightness value is ignored. After this patch,
writing 255 and 0 still allows to configure the LED in the same way:
maximum brightness or off. Thus, I believe there is no compatibility
issue.

But of course, I will update the firmware as well :)

Thanks,

Simon

>=20
> On 09/26/2015 11:02 PM, Simon Guinot wrote:
> >This patch sets the led_classdev max_brightness to the maximum level
> >value supported by hardware. This allows to get rid of the brightness
> >conversion operation (from software [0:LED_FULL] to hardware ranges) in
> >brightness_set().
> >
> >Signed-off-by: Simon Guinot <simon.guinot@sequanux.org>
> >---
> >  drivers/leds/leds-netxbig.c | 12 ++++--------
> >  1 file changed, 4 insertions(+), 8 deletions(-)
> >
> >diff --git a/drivers/leds/leds-netxbig.c b/drivers/leds/leds-netxbig.c
> >index b166fd9f4186..4b88b93244be 100644
> >--- a/drivers/leds/leds-netxbig.c
> >+++ b/drivers/leds/leds-netxbig.c
> >@@ -116,7 +116,6 @@ struct netxbig_led_data {
> >  	int			mode_addr;
> >  	int			*mode_val;
> >  	int			bright_addr;
> >-	int			bright_max;
> >  	struct			netxbig_led_timer *timer;
> >  	int			num_timer;
> >  	enum netxbig_led_mode	mode;
> >@@ -178,7 +177,7 @@ static void netxbig_led_set(struct led_classdev *led=
_cdev,
> >  	struct netxbig_led_data *led_dat =3D
> >  		container_of(led_cdev, struct netxbig_led_data, cdev);
> >  	enum netxbig_led_mode mode;
> >-	int mode_val, bright_val;
> >+	int mode_val;
> >  	int set_brightness =3D 1;
> >  	unsigned long flags;
> >
> >@@ -204,12 +203,9 @@ static void netxbig_led_set(struct led_classdev *le=
d_cdev,
> >  	 * SATA LEDs. So, change the brightness setting for a single
> >  	 * SATA LED will affect all the others.
> >  	 */
> >-	if (set_brightness) {
> >-		bright_val =3D DIV_ROUND_UP(value * led_dat->bright_max,
> >-					  LED_FULL);
> >+	if (set_brightness)
> >  		gpio_ext_set_value(led_dat->gpio_ext,
> >-				   led_dat->bright_addr, bright_val);
> >-	}
> >+				   led_dat->bright_addr, value);
> >
> >  	spin_unlock_irqrestore(&led_dat->lock, flags);
> >  }
> >@@ -306,11 +302,11 @@ static int create_netxbig_led(struct platform_devi=
ce *pdev,
> >  	 */
> >  	led_dat->sata =3D 0;
> >  	led_dat->cdev.brightness =3D LED_OFF;
> >+	led_dat->cdev.max_brightness =3D template->bright_max;
> >  	led_dat->cdev.flags |=3D LED_CORE_SUSPENDRESUME;
> >  	led_dat->mode_addr =3D template->mode_addr;
> >  	led_dat->mode_val =3D template->mode_val;
> >  	led_dat->bright_addr =3D template->bright_addr;
> >-	led_dat->bright_max =3D template->bright_max;
> >  	led_dat->timer =3D pdata->timer;
> >  	led_dat->num_timer =3D pdata->num_timer;
> >  	/*
> >
>=20
>=20
> --=20
> Best Regards,
> Jacek Anaszewski
> --
> To unsubscribe from this list: send the line "unsubscribe linux-leds" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--Vx/u1Rx7tHHd/cso
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlYJBjwACgkQgtp0PDeOcDr2EwCdGnuwC+STsB4Ugvlnaxe5xWr5
9h0AoIpDB9CfMi1peEcK4DlNzq4lWYX6
=E9Pd
-----END PGP SIGNATURE-----

--Vx/u1Rx7tHHd/cso--
