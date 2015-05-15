From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v2] leds: fix brightness changing when software blinking is
 active
Date: Fri, 15 May 2015 16:09:03 +0200
Message-ID: <5555FDFF.5060402@samsung.com>
References: <5554BE12.7050209@list.ru> <5555AA7F.1000001@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <5555AA7F.1000001@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stas Sergeev <stsp@list.ru>
Cc: linux-leds@vger.kernel.org, Linux kernel <linux-kernel@vger.kernel.org>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Kyungmin Park <kyungmin.park@samsung.com>, Stas Sergeev <stsp@users.sourceforge.net>
List-Id: linux-leds@vger.kernel.org

On 05/15/2015 10:12 AM, Jacek Anaszewski wrote:
> Hi Stas,
>
> On 05/14/2015 05:24 PM, Stas Sergeev wrote:
>>
>> The following sequence:
>> echo timer >/sys/class/leds/<name>/trigger
>> echo 1 >/sys/class/leds/<name>/brightness
>> should change the ON brightness for blinking.
>> The function led_set_brightness() was mistakenly initiating the
>> delayed blink stop procedure, which resulted in no blinking with
>> the timer trigger still active.
>>
>> This patch fixes the problem by changing led_set_brightness()
>> to not initiate the delayed blink stop when brightness is not 0.

This commit message is not valid for this version of the patch.
Current patch just allows to change the LED brightness while
timer trigger is active. Please fix this description.

>>
>> CC: Bryan Wu <cooloney@gmail.com>
>> CC: Richard Purdie <rpurdie@rpsys.net>
>> CC: Jacek Anaszewski <j.anaszewski@samsung.com>
>> CC: Kyungmin Park <kyungmin.park@samsung.com>
>> CC: linux-leds@vger.kernel.org
>> CC: linux-kernel@vger.kernel.org
>>
>> Signed-off-by: Stas Sergeev <stsp@users.sourceforge.net>
>> ---
>>   drivers/leds/led-class.c |    5 +++++
>>   drivers/leds/led-core.c  |    5 +++--
>>   2 files changed, 8 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
>> index 795ec99..65c2c80 100644
>> --- a/drivers/leds/led-class.c
>> +++ b/drivers/leds/led-class.c
>> @@ -121,6 +121,11 @@ static void led_timer_function(unsigned long data)
>>       brightness = led_get_brightness(led_cdev);
>>       if (!brightness) {
>>           /* Time to switch the LED on. */
>> +        if (led_cdev->delayed_set_value) {
>> +            led_cdev->blink_brightness =
>> +                    led_cdev->delayed_set_value;
>> +            led_cdev->delayed_set_value = 0;
>> +        }
>>           brightness = led_cdev->blink_brightness;
>>           delay = led_cdev->blink_delay_on;
>>       } else {
>> diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
>> index 356e851..a90dd26 100644
>> --- a/drivers/leds/led-core.c
>> +++ b/drivers/leds/led-core.c
>> @@ -119,10 +119,11 @@ void led_set_brightness(struct led_classdev
>> *led_cdev,
>>   {
>>       int ret = 0;
>>
>> -    /* delay brightness setting if need to stop soft-blink timer */
>> +    /* delay brightness if soft-blink is active */
>>       if (led_cdev->blink_delay_on || led_cdev->blink_delay_off) {
>>           led_cdev->delayed_set_value = brightness;
>> -        schedule_work(&led_cdev->set_brightness_work);
>> +        if (brightness == LED_OFF)
>> +            schedule_work(&led_cdev->set_brightness_work);
>>           return;
>>       }
>>
>
> Acked-by: Jacek Anaszewski <j.anaszewski@samsung.com>
>


-- 
Best Regards,
Jacek Anaszewski
