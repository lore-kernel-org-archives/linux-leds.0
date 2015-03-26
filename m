From: Ingi Kim <ingi2.kim@samsung.com>
Subject: Re: [PATCH v4 3/3] leds: Add ktd2692 flash LED driver
Date: Thu, 26 Mar 2015 10:43:20 +0900
Message-ID: <55136438.9060303@samsung.com>
References: <1427247044-3748-1-git-send-email-ingi2.kim@samsung.com>
 <1427247044-3748-4-git-send-email-ingi2.kim@samsung.com>
 <55122B59.7050404@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:57866 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751899AbbCZBn0 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 25 Mar 2015 21:43:26 -0400
In-reply-to: <55122B59.7050404@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Varka Bhadram <varkabhadram@gmail.com>
Cc: cooloney@gmail.com, rpurdie@rpsys.net, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, sakari.ailus@iki.fi, j.anaszewski@samsung.com, sw0312.kim@samsung.com, cw00.choi@samsung.com, jh80.chung@samsung.com, ideal.song@samsung.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org

Hi Varka,

On 2015=EB=85=84 03=EC=9B=94 25=EC=9D=BC 12:28, Varka Bhadram wrote:
> On 03/25/2015 07:00 AM, Ingi Kim wrote:
>=20
>> This patch adds a driver to support the ktd2692 flash LEDs.
>> ktd2692 can control flash current by ExpressWire interface.
>>
>> Signed-off-by: Ingi Kim <ingi2.kim@samsung.com>
>> ---
>>   drivers/leds/Kconfig        |   9 +
>>   drivers/leds/Makefile       |   1 +
>>   drivers/leds/leds-ktd2692.c | 412 ++++++++++++++++++++++++++++++++=
++++++++++++
>>   3 files changed, 422 insertions(+)
>>   create mode 100644 drivers/leds/leds-ktd2692.c
>>
> (...)
>=20
>> +static int ktd2692_parse_dt(struct ktd2692_context *led, struct dev=
ice *dev,
>> +                u32 *flash_timeout_us)
>> +{
>> +    struct device_node *np =3D dev->of_node;
>> +
>=20
> Unnecessary one line space..
>=20

Oh, I missed it! Thanks

>> +    int ret;
>> +
>> +    led->ctrl_gpio =3D of_get_named_gpio(np, "ctrl-gpio", 0);
>> +    if (!gpio_is_valid(led->ctrl_gpio)) {
>> +        dev_err(dev, "no ctrl-gpio property found\n");
>> +        return -EINVAL;
>> +    }
>> +
>> +    led->aux_gpio =3D of_get_named_gpio(np, "aux-gpio", 0);
>> +    if (!gpio_is_valid(led->aux_gpio)) {
>> +        dev_err(dev, "no aux-gpio property found\n");
>> +        return -EINVAL;
>> +    }
>> +
>> +    ret =3D devm_gpio_request_one(dev, led->ctrl_gpio,
>> +                    GPIOF_OPEN_SOURCE, "ctrl-gpio");
>> +    if (ret) {
>> +        dev_err(dev, "failed to request ctrl-gpio %d error %d\n",
>> +                led->ctrl_gpio, ret);
>> +        return ret;
>> +    }
>> +
>> +    ret =3D devm_gpio_request_one(dev, led->aux_gpio,
>> +                    GPIOF_OPEN_SOURCE, "aux-gpio");
>> +    if (ret) {
>> +        dev_err(dev, "failed to request aux-gpio %d error %d\n",
>> +                led->aux_gpio, ret);
>> +        return ret;
>> +    }
>> +
>> +    ret =3D of_property_read_u32(np, "flash-timeout-us", flash_time=
out_us);
>> +    /* default setting */
>> +    if (ret)
>> +        *flash_timeout_us =3D KTD2692_FLASH_MODE_TIMEOUT_DEFAULT_US=
;
>> +
>> +    return 0;
>> +}
>> +
>> +static const struct led_flash_ops flash_ops =3D {
>> +    .strobe_set =3D ktd2692_led_flash_strobe_set,
>> +    .timeout_set =3D ktd2692_led_flash_timeout_set,
>> +};
>> +
>> +static int ktd2692_probe(struct platform_device *pdev)
>> +{
>> +    struct ktd2692_context *led;
>> +    struct led_classdev *led_cdev;
>> +    struct led_classdev_flash *fled_cdev;
>> +    struct led_flash_setting flash_timeout;
>> +    u32 flash_timeout_us;
>> +    int ret;
>> +
>> +    led =3D devm_kzalloc(&pdev->dev, sizeof(*led), GFP_KERNEL);
>> +    if (!led)
>> +        return -ENOMEM;
>> +
>> +    if (!pdev->dev.of_node)
>> +        return -ENXIO;
>> +
>=20
> Above operation dt related. So if you do that in ktd2692_parse_dt(), =
it will be good
>=20

Good point!
I'll do that

>> +    fled_cdev =3D &led->fled_cdev;
>> +    led_cdev =3D &fled_cdev->led_cdev;
>> +
>> +    ret =3D ktd2692_parse_dt(led, &pdev->dev, &flash_timeout_us);
>> +    if (ret)
>> +        return ret;
>> +
>> +    led->regulator =3D devm_regulator_get(&pdev->dev, "vin");
>> +    if (IS_ERR(led->regulator)) {
>> +        dev_err(&pdev->dev, "regulator get failed\n");
>> +        return PTR_ERR(led->regulator);
>> +    }
>> +
>> +    ktd2692_init_flash_timeout(flash_timeout_us, &flash_timeout);
>> +
>> +    fled_cdev->timeout =3D flash_timeout;
>> +    fled_cdev->ops =3D &flash_ops;
>> +
>> +    led_cdev->name =3D KTD2692_DEFAULT_NAME;
>> +    led_cdev->brightness_set =3D ktd2692_led_brightness_set;
>> +    led_cdev->brightness_set_sync =3D ktd2692_led_brightness_set_sy=
nc;
>> +    led_cdev->flags |=3D LED_CORE_SUSPENDRESUME;
>> +    led_cdev->flags |=3D LED_DEV_CAP_FLASH;
>> +
>> +    mutex_init(&led->lock);
>> +    INIT_WORK(&led->work_brightness_set, ktd2692_brightness_set_wor=
k);
>> +
>> +    platform_set_drvdata(pdev, led);
>> +
>> +    ret =3D led_classdev_flash_register(&pdev->dev, fled_cdev);
>> +    if (ret) {
>> +        dev_err(&pdev->dev, "can't register LED %s\n", led_cdev->na=
me);
>> +        cancel_work_sync(&led->work_brightness_set);
>=20
> Is the above API is correct to use in this place.?
>=20
> cancel_work_sync =E2=80=94 cancel a work and wait for it to finish...
>=20
> Work is not yet scheduled..?
>=20
> What about mutex destroy..?
>=20

Right, I should remove this API.
It seems to be useless in this place

And mutex_destroy() will be added, Thank you!

>> +        return ret;
>> +    }
>> +
>> +    ktd2692_setup(led);
>> +    ktd2692_led_regulator_enable(led);
>> +
>> +    return 0;
>> +}
>> +
>> +static int ktd2692_remove(struct platform_device *pdev)
>> +{
>> +    struct ktd2692_context *led =3D platform_get_drvdata(pdev);
>> +
>> +    ktd2692_led_regulator_disable(led);
>> +    led_classdev_flash_unregister(&led->fled_cdev);
>> +    cancel_work_sync(&led->work_brightness_set);
>> +
>> +    mutex_destroy(&led->lock);
>> +
>> +    return 0;
>> +}
>> +
>> +static const struct of_device_id ktd2692_match[] =3D {
>> +    { .compatible =3D "kinetic,ktd2692", },
>> +    { /* sentinel */ },
>> +};
>> +
>> +static struct platform_driver ktd2692_driver =3D {
>> +    .driver =3D {
>> +        .name  =3D "leds-ktd2692",
>> +        .of_match_table =3D ktd2692_match,
>> +    },
>> +    .probe  =3D ktd2692_probe,
>> +    .remove =3D ktd2692_remove,
>> +};
>> +
>> +module_platform_driver(ktd2692_driver);
>> +
>> +MODULE_AUTHOR("Ingi Kim <ingi2.kim@samsung.com>");
>> +MODULE_DESCRIPTION("Kinetic KTD2692 LED driver");
>> +MODULE_LICENSE("GPL v2");
>=20
>=20
