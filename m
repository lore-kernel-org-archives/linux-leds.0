From: Vadim Pasternak <vadimp@mellanox.com>
Subject: RE: [patch v1 1/1] leds: verify vendor and change license in mlxcpld
 driver
Date: Fri, 4 Nov 2016 10:18:09 +0000
Message-ID: <AM5PR0501MB209782547DD4F220935BCA96A2A20@AM5PR0501MB2097.eurprd05.prod.outlook.com>
References: <CGME20161103171933epcas3p44d4939851092122a5fb9c985eb125770@epcas3p4.samsung.com>
 <1478200639-190079-1-git-send-email-vadimp@mellanox.com>
 <e4180b0b-f09f-a9f4-930d-127311704e36@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-db5eur01on0069.outbound.protection.outlook.com ([104.47.2.69]:27669
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S932283AbcKDRtB (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 4 Nov 2016 13:49:01 -0400
In-Reply-To: <e4180b0b-f09f-a9f4-930d-127311704e36@samsung.com>
Content-Language: en-US
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>, "rpurdie@rpsys.net" <rpurdie@rpsys.net>
Cc: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "jiri@resnulli.us" <jiri@resnulli.us>

Hi Jacek,

Thank you very much.
Vadim.

> -----Original Message-----
> From: Jacek Anaszewski [mailto:j.anaszewski@samsung.com]
> Sent: Friday, November 04, 2016 10:38 AM
> To: Vadim Pasternak <vadimp@mellanox.com>; rpurdie@rpsys.net
> Cc: linux-leds@vger.kernel.org; linux-kernel@vger.kernel.org; jiri@resnul=
li.us
> Subject: Re: [patch v1 1/1] leds: verify vendor and change license in mlx=
cpld
> driver
>=20
> Hi Vadim,
>=20
> On 11/03/2016 08:17 PM, Vadim Pasternak wrote:
> > Verify that vendor is Mellanox as the first step of initialization.
> > If it is not - return ENODEV.
> > Change module license from "GPL v2" to "Dual BSD/GPL".
> >
> > Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
> > ---
> >  drivers/leds/leds-mlxcpld.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/leds/leds-mlxcpld.c b/drivers/leds/leds-mlxcpld.c
> > index 197ab9b..281482e 100644
> > --- a/drivers/leds/leds-mlxcpld.c
> > +++ b/drivers/leds/leds-mlxcpld.c
> > @@ -400,6 +400,9 @@ static int __init mlxcpld_led_init(void)
> >  	struct platform_device *pdev;
> >  	int err;
> >
> > +	if (!dmi_match(DMI_CHASSIS_VENDOR, "Mellanox Technologies Ltd."))
> > +		return -ENODEV;
> > +
> >  	pdev =3D platform_device_register_simple(KBUILD_MODNAME, -1, NULL,
> 0);
> >  	if (IS_ERR(pdev)) {
> >  		pr_err("Device allocation failed\n"); @@ -426,5 +429,5 @@
> > module_exit(mlxcpld_led_exit);
> >
> >  MODULE_AUTHOR("Vadim Pasternak <vadimp@mellanox.com>");
> > MODULE_DESCRIPTION("Mellanox board LED driver"); -
> MODULE_LICENSE("GPL
> > v2");
> > +MODULE_LICENSE("Dual BSD/GPL");
> >  MODULE_ALIAS("platform:leds_mlxcpld");
> >
>=20
> Thanks for the patch. Applied.
>=20
> --
> Best regards,
> Jacek Anaszewski
