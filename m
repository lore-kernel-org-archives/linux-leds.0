From: Vadim Pasternak <vadimp@mellanox.com>
Subject: RE: [patch v3 1/1] leds: add driver for support Mellanox regmap LEDs
 for BMC
Date: Wed, 2 Aug 2017 09:16:57 +0000
Message-ID: <AM4PR05MB33304B09E2DACFBA55BABD1FA2B00@AM4PR05MB3330.eurprd05.prod.outlook.com>
References: <1501518091-100730-1-git-send-email-vadimp@mellanox.com>
 <1501518091-100730-2-git-send-email-vadimp@mellanox.com>
 <20170802083858.GA754@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-db5eur01on0067.outbound.protection.outlook.com ([104.47.2.67]:28079
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752344AbdHBJRA (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 2 Aug 2017 05:17:00 -0400
In-Reply-To: <20170802083858.GA754@amd>
Content-Language: en-US
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: "j.anaszewski@samsung.com" <j.anaszewski@samsung.com>, "rpurdie@rpsys.net" <rpurdie@rpsys.net>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "lee.jones@linaro.org" <lee.jones@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "jiri@resnulli.us" <jiri@resnulli.us>, "=jacek.anaszewski@gmail.com" <=jacek.anaszewski@gmail.com>



> -----Original Message-----
> From: Pavel Machek [mailto:pavel@ucw.cz]
> Sent: Wednesday, August 02, 2017 11:39 AM
> To: Vadim Pasternak <vadimp@mellanox.com>
> Cc: j.anaszewski@samsung.com; rpurdie@rpsys.net; linux-
> leds@vger.kernel.org; lee.jones@linaro.org; robh+dt@kernel.org;
> jiri@resnulli.us; =3Djacek.anaszewski@gmail.com
> Subject: Re: [patch v3 1/1] leds: add driver for support Mellanox regmap
> LEDs for BMC
>=20
> Hi!

Hi Pavel,

Thank you for review.

Would it be possible to review alos [patch v2 1/2] mfd: Add Mellanox regmap=
 core driver , which is after applying you comments for v1?

>=20
> > Driver obtains LED devices according to system configuration and
> > creates devices in form: "devicename:color:function", like The full
> > path is to be:
> > /sys/class/leds/mlxreg\:status\:amber/brightness
> > After timer trigger activation:
> > echo timer > /sys/class/leds/mlxreg\:status\:amber/trigger
> > Attributes for LED blinking will appaer in sysfs infrastructure:
> > /sys/class/leds/mlxreg\:status\:amber/delay_off
> > /sys/class/leds/mlxreg\:status\:amber/delay_on
> >
> > LED setting is controlled through the on-board programmable devices,
> > which exports its register map. This device could be attached to any
> > bus type, for which register mapping is supported.
> >
> > Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
>=20
> ...
>=20
> > +/* Codes for LEDs. */
> > +#define MLXREG_LED_OFFSET_HALF	0x01 /* Offset from solid:
> 3Hz blink */
> > +#define MLXREG_LED_OFFSET_FULL	0x02 /* Offset from solid:
> 6Hz
>=20
> Can it do half brightness?


This is about blinking  frequency. Hardware support 6 hz blinking mode and =
3hz blinking mode.
If solid orange f.e. has bit mask 1100, setting 1101 or 1110 will blink ora=
nge with 3 or 6 KHz.

>=20
> > +	ret =3D regmap_read(pdata->regmap, led_pdata->led->reg, &regval);
> > +	if (ret < 0) {
> > +		dev_warn(led_pdata->led_cdev.dev, "Failed to get current
> brightness, error: %d\n",
> > +			 ret);
> > +		/* Assume the LED is OFF */
> > +		ret =3D LED_OFF;
> > +		goto access_error;
>=20
> Just "return  LED_OFF;".

ACK

>=20
> > +	if (regval >=3D led_pdata->base_color &&
> > +	    regval <=3D (led_pdata->base_color + MLXREG_LED_OFFSET_FULL))
> > +		ret =3D LED_FULL;
> > +	else
> > +		ret =3D LED_OFF;
>=20
> Because it does not seem so here.
>=20
> > +	for (i =3D 0; i < pdata->counter; i++, data++) {
> > +		led_data =3D &pdata->data[i];
> > +		led_cdev =3D &led_data->led_cdev;
> > +		led_data->data_parent =3D priv;
> > +		if (strstr(data->label, "red")) {
> > +			brightness =3D LED_OFF;
> > +			led_data->base_color =3D MLXREG_LED_RED_SOLID;
> > +		} else if (strstr(data->label, "amber")) {
> > +			brightness =3D LED_OFF;
> > +			led_data->base_color =3D
> MLXREG_LED_AMBER_SOLID;
> > +		} else {
> > +			brightness =3D LED_OFF;
> > +			led_data->base_color =3D
> MLXREG_LED_GREEN_SOLID;
> > +		}
>=20
> i don't know about the future, but you may check for "green"
> substring, too? (Besides the fact that substring search is
> "interesting"...)

OK

>=20
> 									Pavel
> --
> (english) http://www.livejournal.com/~pavelmachek
> (cesky, pictures)
> http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
