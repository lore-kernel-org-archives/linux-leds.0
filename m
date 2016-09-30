From: Matt Ranostay <mranostay@gmail.com>
Subject: Re: [PATCH] leds: leds-pca963x: add power management support
Date: Fri, 30 Sep 2016 15:57:45 -0700
Message-ID: <CAKzfze_cBgxtekprHzAMxcpVCmp2UmJVA5j=4igdibgu0Rdp5g@mail.gmail.com>
References: <1475263662-14149-1-git-send-email-matt@ranostay.consulting> <cb494ad2-c8fe-271a-8537-46c50964f82a@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:36727 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751866AbcI3W61 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 30 Sep 2016 18:58:27 -0400
In-Reply-To: <cb494ad2-c8fe-271a-8537-46c50964f82a@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-leds@vger.kernel.org, Matt Ranostay <matt@ranostay.consulting>, Tony Lindgren <tony@atomide.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Liam Breck <liam@networkimprov.net>

On Fri, Sep 30, 2016 at 2:23 PM, Jacek Anaszewski
<jacek.anaszewski@gmail.com> wrote:
> Hi Matt,
>
> Thanks for the patch.
>
>
> On 09/30/2016 09:27 PM, Matt Ranostay wrote:
>>
>> Turn off LEDS on suspend and put device in low power state, and restore
>> settings on resume.
>>
>> Cc: Tony Lindgren <tony@atomide.com>
>> Cc: Richard Purdie <rpurdie@rpsys.net>
>> Cc: Jacek Anaszewski <j.anaszewski@samsung.com>
>> Signed-off-by: Matt Ranostay <matt@ranostay.consulting>
>> ---
>>  drivers/leds/leds-pca963x.c | 31 +++++++++++++++++++++++++++++++
>>  1 file changed, 31 insertions(+)
>>
>> diff --git a/drivers/leds/leds-pca963x.c b/drivers/leds/leds-pca963x.c
>> index 407eba11e187..4840bdaa1b48 100644
>> --- a/drivers/leds/leds-pca963x.c
>> +++ b/drivers/leds/leds-pca963x.c
>> @@ -382,6 +382,7 @@ static int pca963x_probe(struct i2c_client *client,
>>
>>                 pca963x[i].led_cdev.name = pca963x[i].name;
>>                 pca963x[i].led_cdev.brightness_set_blocking =
>> pca963x_led_set;
>> +               pca963x[i].led_cdev.flags = LED_CORE_SUSPENDRESUME;
>>
>>                 if (pdata && pdata->blink_type == PCA963X_HW_BLINK)
>>                         pca963x[i].led_cdev.blink_set = pca963x_blink_set;
>> @@ -422,10 +423,40 @@ static int pca963x_remove(struct i2c_client *client)
>>         return 0;
>>  }
>>
>> +static int pca963x_set_power(struct i2c_client *client, bool state)
>> +{
>> +       return i2c_smbus_write_byte_data(client, PCA963X_MODE1,
>> +                                        state ? 0 : BIT(4));
>> +}
>> +
>> +static int pca963x_suspend(struct device *dev)
>> +{
>> +       struct i2c_client *client = to_i2c_client(dev);
>> +
>> +       return pca963x_set_power(client, false);
>> +}
>> +
>> +static int pca963x_resume(struct device *dev)
>> +{
>> +       struct i2c_client *client = to_i2c_client(dev);
>> +       int ret;
>> +
>> +       ret = pca963x_set_power(client, true);
>> +
>> +       /* wait for oscillator enabling */
>> +       if (!ret)
>> +               usleep_range(500, 1000);
>> +
>> +       return ret;
>> +}
>> +
>> +static SIMPLE_DEV_PM_OPS(pca963x_pm, pca963x_suspend, pca963x_resume);
>> +
>>  static struct i2c_driver pca963x_driver = {
>>         .driver = {
>>                 .name   = "leds-pca963x",
>>                 .of_match_table = of_match_ptr(of_pca963x_match),
>> +               .pm     = &pca963x_pm,
>
>
> pm ops are initialized in led-class.c. If LED_CORE_SUSPENDRESUME
> flag is set by a LED class driver, then the brightness will be
> set to 0 on suspend and brought back on resume.

Understood.

>
> LED class driver's responsibility is to enter power down mode if
> all LED class devices it exposes have their brightness set to 0.
>
> Effectively, you should avoid defining pm ops, but instead
> just track how many LEDs are on, and set the device in the power
> down mode if brightness of the last active LED is set to LED_OFF.
> Similarly the device should be powered up if any of LEDs brightness
> is set to a value greater than 0.

Ok in this case it would make sense to use runtime PM..   which
shouldn't be too hard to do.  Will fix in v2

>
>>         },
>>         .probe  = pca963x_probe,
>>         .remove = pca963x_remove,
>>
>
> --
> Best regards,
> Jacek Anaszewski
