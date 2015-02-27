From: Ingi Kim <ingi2.kim@samsung.com>
Subject: Re: [PATCH 3/3] leds: Add ktd2692 flash LED driver
Date: Fri, 27 Feb 2015 15:55:08 +0900
Message-ID: <54F014CC.2000605@samsung.com>
References: <1424998891-25591-1-git-send-email-ingi2.kim@samsung.com>
 <1424998891-25591-4-git-send-email-ingi2.kim@samsung.com>
 <CAEUmHybnzdVk59UTsVczW59hpLrimoMeF+j5Gbtue2jNayHHuw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:54119 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750794AbbB0GzM (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 27 Feb 2015 01:55:12 -0500
In-reply-to: <CAEUmHybnzdVk59UTsVczW59hpLrimoMeF+j5Gbtue2jNayHHuw@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Varka Bhadram <varkabhadram@gmail.com>
Cc: robh+dt@kernel.org, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Bryan Wu <cooloney@gmail.com>, rpurdie@rpsys.net, treding@nvidia.com, Philipp Zabel <p.zabel@pengutronix.de>, Andrew Lunn <andrew@lunn.ch>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, florian.vaussard@epfl.ch, arno@natisbad.org, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Hayato Suzuki <hytszk@gmail.com>, antonynpavlov@gmail.com, sw0312.kim@samsung.com, ideal.song@samsung.com, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-leds@vger.kernel.org


hi

On 2015=EB=85=84 02=EC=9B=94 27=EC=9D=BC 12:36, Varka Bhadram wrote:
> On 02/27/2015 06:31 AM, Ingi Kim wrote:
>> This patch adds a driver to support the ktd2692 flash LEDs.
>> ktd2692 can control flash current by ExpressWire interface.
>>
>> Signed-off-by: Ingi Kim <ingi2.kim@samsung.com>
>> ---
>>   drivers/leds/Kconfig        |    8 ++
>>   drivers/leds/Makefile       |    1 +
>>   drivers/leds/leds-ktd2692.c |  245 +++++++++++++++++++++++++++++++=
++++++++++++
>>   3 files changed, 254 insertions(+)
>>   create mode 100644 drivers/leds/leds-ktd2692.c
>>
> (...)
>=20
>> +static struct ktd2692_context *ktd2692_parse_dt(struct device *dev)
>> +{
>> + struct device_node *np =3D dev->of_node;
>> + struct ktd2692_context *led;
>> +
>> + led =3D devm_kzalloc(dev, sizeof(struct ktd2692_context), GFP_KERN=
EL);
>> + if (!led)
>> + return ERR_PTR((long)led);
>=20
> What about using sizeof(*led) in place of sizeof(struct ktd2692_conte=
xt)..?
>=20
> Also the error return for devm_kzalloc() should be -ENOMEM.
>=20

Thanks, I'll check and change sizeof() and error return style.

>> +
>> + led->strobe_gpio =3D of_get_named_gpio(np, "strobe-gpio", 0);
>> + if (!gpio_is_valid(led->strobe_gpio)) {
>> + dev_err(dev, "no strobe_gpio property found\n");
>> + return ERR_PTR(led->strobe_gpio);
>> + }
>> +
>> + return led;
>> +}
>> +
>> +static int ktd2692_probe(struct platform_device *pdev)
>> +{
>> + struct device *dev =3D &pdev->dev;
>> + struct ktd2692_context *led;
>> + int ret;
>> +
>> + if (!dev->of_node)
>> + return -ENODEV;
>> +
>> + led =3D ktd2692_parse_dt(dev);
>> + if (IS_ERR(led))
>> + return PTR_ERR(led);
>> +
>> + led->cdev.name =3D KTD2692_DEFAULT_NAME;
>> + led->cdev.brightness =3D LED_OFF;
>> + led->cdev.max_brightness =3D LED_FULL;
>> + led->cdev.flags |=3D LED_CORE_SUSPENDRESUME;
>> + led->cdev.brightness_set =3D ktd2692_brightness_set;
>> + led->cdev.brightness_get =3D ktd2692_brightness_get;
>> + led->mode =3D KTD2692_REG_MODE_BASE | KTD2692_MODE_DISABLE;
>> +
>> + platform_set_drvdata(pdev, led);
>> +
>> + ret =3D led_classdev_register(&pdev->dev, &led->cdev);
>> + if (ret) {
>> + dev_err(dev, "couldn't register LED %s\n", led->cdev.name);
>> + return ret;
>> + }
>> +
>> + ret =3D ktd2692_brightness_set_gpio(led);
>> + if (ret) {
>> + led_classdev_unregister(&led->cdev);
>> + return ret;
>> + }
>> +
>> + ktd2692_expresswire_reset(led);
>> +
>> + return ret;
>=20
> return 0 instead of ret...?
>=20
>=20
>=20

I'll check and try
Thanks,
