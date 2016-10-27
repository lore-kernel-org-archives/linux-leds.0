From: Matt Ranostay <matt@ranostay.consulting>
Subject: Re: [PATCH v3] leds: pca963x: enable low-power state
Date: Thu, 27 Oct 2016 11:19:02 -0700
Message-ID: <CAJ_EiSRGnAfyX8YE+WN_wru6Vve98PGtDeJipcHGaFOLcVNUjQ@mail.gmail.com>
References: <CGME20161027040451epcas4p2fb5c7c652494310445b94fe8b7ffa8a8@epcas4p2.samsung.com>
 <1477541084-4979-1-git-send-email-matt@ranostay.consulting> <38f53dfa-9097-390e-3d0b-29f29e6cd174@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-qt0-f194.google.com ([209.85.216.194]:35926 "EHLO
        mail-qt0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754434AbcJ0STE (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 27 Oct 2016 14:19:04 -0400
Received: by mail-qt0-f194.google.com with SMTP id n34so1555972qtb.3
        for <linux-leds@vger.kernel.org>; Thu, 27 Oct 2016 11:19:03 -0700 (PDT)
In-Reply-To: <38f53dfa-9097-390e-3d0b-29f29e6cd174@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Matt Ranostay <mranostay@gmail.com>, linux-leds@vger.kernel.org, Peter Meerwald <p.meerwald@bct-electronic.com>, Ricardo Ribalda <ricardo.ribalda@gmail.com>, Tony Lindgren <tony@atomide.com>

On Thu, Oct 27, 2016 at 2:13 AM, Jacek Anaszewski
<j.anaszewski@samsung.com> wrote:
> On 10/27/2016 06:04 AM, Matt Ranostay wrote:
>>
>> Allow chip to enter low power state when no LEDs are being lit or in
>> blink mode.
>>
>> Cc: Peter Meerwald <p.meerwald@bct-electronic.com>,
>> Cc: Ricardo Ribalda <ricardo.ribalda@gmail.com>
>> Cc: Tony Lindgren <tony@atomide.com>
>> Cc: Jacek Anaszewski <j.anaszewski@samsung.com>
>> Signed-off-by: Matt Ranostay <matt@ranostay.consulting>
>> ---
>>  drivers/leds/leds-pca963x.c | 33 ++++++++++++++++++++++++++++++---
>>  1 file changed, 30 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/leds/leds-pca963x.c b/drivers/leds/leds-pca963x.c
>> index b6ce1f2ec33e..e1767369776f 100644
>> --- a/drivers/leds/leds-pca963x.c
>> +++ b/drivers/leds/leds-pca963x.c
>> @@ -103,6 +103,7 @@ struct pca963x {
>>         struct mutex mutex;
>>         struct i2c_client *client;
>>         struct pca963x_led *leds;
>> +       int leds_on;
>>  };
>>
>>  struct pca963x_led {
>> @@ -180,14 +181,40 @@ static void pca963x_blink(struct pca963x_led
>> *pca963x)
>>         mutex_unlock(&pca963x->chip->mutex);
>>  }
>>
>> +static int pca963x_power_state(struct pca963x_led *pca963x)
>> +{
>> +       int i, ret = 0, leds_on = 0;
>> +       int prev_leds = pca963x->chip->leds_on;
>> +
>> +       for (i = 0; i < pca963x->chip->chipdef->n_leds; i++) {
>> +               if (pca963x->chip->leds[i].led_cdev.brightness > 0)
>> +                       leds_on++;
>> +       }
>
>
> You're still executing this loop on every brightness setting.
> It could be avoided if you cached current LED states in struct pca963x
> using bit flags and set_bit()/clear_bit().

Gah should have thought of that... fixing in v4..

>
> In pca963x_led_set() you would have to set bit related to
> pca963x->led_num if brightness > 0 and clear it otherwise.
>
> Then, you would have to check if any bit is on with a single
> readout, and update the power mode basing on that if needed.
>
>
>> +
>> +       if (leds_on != prev_leds && !(leds_on && prev_leds)) {
>> +               ret = i2c_smbus_write_byte_data(pca963x->chip->client,
>> +                                               PCA963X_MODE1,
>> +                                               leds_on ? 0 : BIT(4));
>> +       }
>> +
>> +       pca963x->chip->leds_on = leds_on;
>> +
>> +       return ret;
>> +}
>> +
>>  static int pca963x_led_set(struct led_classdev *led_cdev,
>>         enum led_brightness value)
>>  {
>>         struct pca963x_led *pca963x;
>> +       int ret;
>>
>>         pca963x = container_of(led_cdev, struct pca963x_led, led_cdev);
>>
>> -       return pca963x_brightness(pca963x, value);
>> +       ret = pca963x_brightness(pca963x, value);
>> +       if (ret < 0)
>> +               return ret;
>> +
>> +       return pca963x_power_state(pca963x);
>>  }
>>
>>  static unsigned int pca963x_period_scale(struct pca963x_led *pca963x,
>> @@ -403,8 +430,8 @@ static int pca963x_probe(struct i2c_client *client,
>>                         goto exit;
>>         }
>>
>> -       /* Disable LED all-call address and set normal mode */
>> -       i2c_smbus_write_byte_data(client, PCA963X_MODE1, 0x00);
>> +       /* Disable LED all-call address, and power down initially */
>> +       i2c_smbus_write_byte_data(client, PCA963X_MODE1, BIT(4));
>>
>>         if (pdata) {
>>                 /* Configure output: open-drain or totem pole (push-pull)
>> */
>>
>
>
> --
> Best regards,
> Jacek Anaszewski
