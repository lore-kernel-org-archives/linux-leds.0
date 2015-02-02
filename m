From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH] leds: leds-gpio: Pass on error codes unmodified
Date: Mon, 2 Feb 2015 14:43:32 -0800
Message-ID: <CAK5ve-LOhv+RWBot-XZCiccPcKeawpHR+5QGQJ-fAug9YLWtdQ@mail.gmail.com>
References: <1422760500-21793-1-git-send-email-soren.brinkmann@xilinx.com> <20150201165954.GX13057@xsjandreislx>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-ig0-f169.google.com ([209.85.213.169]:38492 "EHLO
	mail-ig0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753728AbbBBWnx convert rfc822-to-8bit (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 2 Feb 2015 17:43:53 -0500
In-Reply-To: <20150201165954.GX13057@xsjandreislx>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann@xilinx.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, Linux LED Subsystem <linux-leds@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, Michal Simek <michal.simek@xilinx.com>

On Sun, Feb 1, 2015 at 8:59 AM, S=C3=B6ren Brinkmann
<soren.brinkmann@xilinx.com> wrote:
> + Andreas who actually reported this issue and also tested the patch.
>
> On Sat, 2015-01-31 at 07:15PM -0800, Soren Brinkmann wrote:
>> Instead of overriding error codes, pass them on unmodified. This
>> way a EPROBE_DEFER is correctly passed to the driver core. This resu=
lts
>> in the LED driver correctly requesting probe deferral in cases the G=
PIO
>> controller is not yet available.
>>
>> Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>
>
> Here should be a:
> Reported-and-tested-by: Andreas F=C3=A4rber <afaerber@suse.de>
>

Good catch. I merged it to my tree.

Thanks,
-Bryan

>> ---
>> Adding pinctrl on Zynq shuffled with probing order quite a bit and a=
 lot
>> of deferred probing is going on. With those changes I saw the LEDs
>> failing to probe due to the GPIO controller deferring probe until th=
e
>> pincontroller is available. With this patch things work again:
>>
>> dmesg | grep -i led:
>>   of_get_named_gpiod_flags: parsed 'gpios' property of node '/leds/d=
s23[0]' - status (-517)
>>   platform leds: Driver leds-gpio requests probe deferral
>>   of_get_named_gpiod_flags: parsed 'gpios' property of node '/leds/d=
s23[0]' - status (0)
>>
>>       Soren
>> ---
>>  drivers/leds/leds-gpio.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
>> index 7ea1ea42c2d2..d26af0a79a90 100644
>> --- a/drivers/leds/leds-gpio.c
>> +++ b/drivers/leds/leds-gpio.c
>> @@ -187,6 +187,7 @@ static struct gpio_leds_priv *gpio_leds_create(s=
truct platform_device *pdev)
>>               led.gpiod =3D devm_get_gpiod_from_child(dev, child);
>>               if (IS_ERR(led.gpiod)) {
>>                       fwnode_handle_put(child);
>> +                     ret =3D PTR_ERR(led.gpiod);
>>                       goto err;
>>               }
>>
>> @@ -229,7 +230,7 @@ static struct gpio_leds_priv *gpio_leds_create(s=
truct platform_device *pdev)
>>  err:
>>       for (count =3D priv->num_leds - 2; count >=3D 0; count--)
>>               delete_gpio_led(&priv->leds[count]);
>> -     return ERR_PTR(-ENODEV);
>> +     return ERR_PTR(ret);
>>  }
>>
>>  static const struct of_device_id of_gpio_leds_match[] =3D {
>> --
>> 2.2.2.1.g63c5777
>>
