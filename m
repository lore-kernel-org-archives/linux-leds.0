From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH 2/8] leds: gpio: set max_brightness to 1
Date: Tue, 13 Sep 2016 20:42:32 +0200
Message-ID: <8eeda0ff-aa41-f2f0-1d06-60ae19524df3@gmail.com>
References: <5432fb03-ea18-a949-ce53-10fedc15f5d9@gmail.com>
 <CGME20160913060410eucas1p2a02e6204477153843156938975d3b414@eucas1p2.samsung.com>
 <34a66492-d95f-0616-9eb1-84e283cf3f1d@gmail.com>
 <a5590de2-6b0b-f4cb-bd93-576795004bca@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:34084 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756845AbcIMSmm (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 13 Sep 2016 14:42:42 -0400
Received: by mail-wm0-f67.google.com with SMTP id g141so8585218wmd.1
        for <linux-leds@vger.kernel.org>; Tue, 13 Sep 2016 11:42:41 -0700 (PDT)
In-Reply-To: <a5590de2-6b0b-f4cb-bd93-576795004bca@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>

Am 13.09.2016 um 15:35 schrieb Jacek Anaszewski:
> Hi Heiner,
> 
> Thanks for the patches. I'll happily take them all except this
> one, as it could break existing userspace clients.
> 
You mean if there are userspace programs expecting the brightness
to be 255 if the LED is on? I see ..

> Could you please remove this patch and rebase the rest of the
> patch set on top of patch 1/8?
> 
Sure. Then I'll resend the remaining 6 patches with new
numbering (1/6 .. 6/6).

> Besides, please also cc linux-kernel@vger.kernel.org list.
> 
OK

Rgds, Heiner
> Thanks,
> Jacek Anaszewski
> 
> On 09/13/2016 08:03 AM, Heiner Kallweit wrote:
>> GPIO-controlled LED's just have the status on or off.
>> Set max_brightness to 1 to reflect this.
>>
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>> ---
>>  drivers/leds/leds-gpio.c | 13 ++++---------
>>  1 file changed, 4 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
>> index 3599b2e..3f64544 100644
>> --- a/drivers/leds/leds-gpio.c
>> +++ b/drivers/leds/leds-gpio.c
>> @@ -34,22 +34,16 @@ static void gpio_led_set(struct led_classdev *led_cdev,
>>  {
>>      struct gpio_led_data *led_dat =
>>          container_of(led_cdev, struct gpio_led_data, cdev);
>> -    int level;
>> -
>> -    if (value == LED_OFF)
>> -        level = 0;
>> -    else
>> -        level = 1;
>>
>>      if (led_dat->blinking) {
>> -        led_dat->platform_gpio_blink_set(led_dat->gpiod, level,
>> +        led_dat->platform_gpio_blink_set(led_dat->gpiod, value,
>>                           NULL, NULL);
>>          led_dat->blinking = 0;
>>      } else {
>>          if (led_dat->can_sleep)
>> -            gpiod_set_value_cansleep(led_dat->gpiod, level);
>> +            gpiod_set_value_cansleep(led_dat->gpiod, value);
>>          else
>> -            gpiod_set_value(led_dat->gpiod, level);
>> +            gpiod_set_value(led_dat->gpiod, value);
>>      }
>>  }
>>
>> @@ -106,6 +100,7 @@ static int create_gpio_led(const struct gpio_led *template,
>>              return -EINVAL;
>>      }
>>
>> +    led_dat->cdev.max_brightness = 1;
>>      led_dat->cdev.name = template->name;
>>      led_dat->cdev.default_trigger = template->default_trigger;
>>      led_dat->can_sleep = gpiod_cansleep(led_dat->gpiod);
>>
> 
> 
> 
