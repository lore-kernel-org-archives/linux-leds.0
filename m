From: Ingi Kim <ingi2.kim@samsung.com>
Subject: Re: [PATCH v5 3/3] leds: Add ktd2692 flash LED driver
Date: Fri, 10 Apr 2015 15:40:44 +0900
Message-ID: <5527706C.9020300@samsung.com>
References: <1427860708-32559-1-git-send-email-ingi2.kim@samsung.com>
 <1427860708-32559-4-git-send-email-ingi2.kim@samsung.com>
 <551B948D.5060905@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <551B948D.5060905@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: cooloney@gmail.com, rpurdie@rpsys.net, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, sakari.ailus@iki.fi, varkabhadram@gmail.com, sw0312.kim@samsung.com, cw00.choi@samsung.com, jh80.chung@samsung.com, ideal.song@samsung.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi Jacek,

On 2015=EB=85=84 04=EC=9B=94 01=EC=9D=BC 15:47, Jacek Anaszewski wrote:
> Hi Ingi,
>=20
> On 04/01/2015 05:58 AM, Ingi Kim wrote:
>> This patch adds a driver to support the ktd2692 flash LEDs.
>> ktd2692 can control flash current by ExpressWire interface.
>>

=2E..

>> +    ktd2692_init_flash_timeout(flash_timeout_us, &flash_timeout);
>> +
>> +    fled_cdev->timeout =3D flash_timeout;
>> +    fled_cdev->ops =3D &flash_ops;
>> +
>> +    led_cdev->name =3D KTD2692_DEFAULT_NAME;
>=20
> Device Tree label should be used for the LED class device name.
> Please refer to :
> Documentation/devicetree/bindings/leds/common.txt
>=20
> Also the documentation states that the LED should be represented
> by DT child node of the LED controller.
>=20
> You can parse the label as follows:
>=20
> led_cdev->name =3D of_get_property(child, "label", NULL) ? :
>                            child->name;
>=20

Sorry about late comments,
I fix the name and DT such as LED style
Thank you!

>> +    led_cdev->brightness_set =3D ktd2692_led_brightness_set;
>> +    led_cdev->brightness_set_sync =3D ktd2692_led_brightness_set_sy=
nc;
>> +    led_cdev->flags |=3D LED_CORE_SUSPENDRESUME | LED_DEV_CAP_FLASH=
;
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
>> +        mutex_destroy(&led->lock);
>> +        return ret;
>> +    }
>> +
>> +    ktd2692_setup(led);
>> +
>> +    return 0;
>> +}
>> +
>> +static int ktd2692_remove(struct platform_device *pdev)
>> +{
>> +    struct ktd2692_context *led =3D platform_get_drvdata(pdev);
>> +    int ret;
>> +
>> +    led_classdev_flash_unregister(&led->fled_cdev);
>> +    cancel_work_sync(&led->work_brightness_set);
>> +
>> +    ret =3D regulator_disable(led->regulator);
>> +    if (ret)
>> +        dev_err(&pdev->dev, "Failed to disable supply: %d\n", ret);
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
>>
>=20
>=20
