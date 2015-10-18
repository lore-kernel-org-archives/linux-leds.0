From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v3 04/10] leds: core: Use set_brightness_work for the
 blocking op
Date: Sun, 18 Oct 2015 09:06:07 +0200
Message-ID: <562344DF.3050207@gmail.com>
References: <1444209048-29415-1-git-send-email-j.anaszewski@samsung.com> <1444209048-29415-5-git-send-email-j.anaszewski@samsung.com> <20151016154358.GN26916@valkosipuli.retiisi.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wi0-f169.google.com ([209.85.212.169]:37060 "EHLO
	mail-wi0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752707AbbJRHGO (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Sun, 18 Oct 2015 03:06:14 -0400
In-Reply-To: <20151016154358.GN26916@valkosipuli.retiisi.org.uk>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Sakari Ailus <sakari.ailus@iki.fi>, Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, pavel@ucw.cz, sakari.ailus@linux.intel.com, andrew@lunn.ch

Hi Sakari,

Thanks for the review.

On 10/16/2015 05:43 PM, Sakari Ailus wrote:
> Hi Jacek,
>
> I think I'd rearrange patches 3 and 4; delayed_set_brightness is briefly
> needed in patch 3 but again no longer here.

The impression that delayed_set_brightness is not needed is caused
by my mistake in set_brightness_delayed(), please see my explanation
below.

> I have to say I quite like the set, it cleans up the framework a lot.
> Thanks!
>
> On Wed, Oct 07, 2015 at 11:10:42AM +0200, Jacek Anaszewski wrote:
>> This patch makes LED core capable of setting brightness for drivers
>> that implement brightness_set_blocking op. It removes from LED class
>> drivers responsibility for using work queues on their own.
>>
>> In order to achieve this set_brightness_delayed callback is being
>> modified to directly call one of available ops for brightness setting.
>>
>> led_set_brightness_async() function didn't set brightness in an
>> asynchronous way in all cases. It was mistakenly assuming that all
>> LED subsystem drivers used work queue in their brightness_set op,
>> whereas only half of them did that. Since it has no users now,
>> it is being removed.
>>
>> Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
>> ---
>>   drivers/leds/led-core.c |   12 +++++++++++-
>>   drivers/leds/leds.h     |   10 ----------
>>   include/linux/leds.h    |    2 +-
>>   3 files changed, 12 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
>> index a1f53aa..7d2512f 100644
>> --- a/drivers/leds/led-core.c
>> +++ b/drivers/leds/led-core.c
>> @@ -83,6 +83,7 @@ static void set_brightness_delayed(struct work_struct *ws)
>>   {
>>   	struct led_classdev *led_cdev =
>>   		container_of(ws, struct led_classdev, set_brightness_work);
>> +	int ret = 0;
>>
>>   	if (led_cdev->flags & LED_BLINK_DISABLE) {
>>   		led_cdev->delayed_set_value = LED_OFF;
>> @@ -90,7 +91,16 @@ static void set_brightness_delayed(struct work_struct *ws)
>>   		led_cdev->flags &= ~LED_BLINK_DISABLE;
>>   	}
>>
>> -	led_set_brightness_async(led_cdev, led_cdev->delayed_set_value);
>> +	if (led_cdev->brightness_set)
>> +		led_cdev->brightness_set(led_cdev, led_cdev->brightness);

s/led_cdev->brightness/led_cdev->delayed_set_value/

>> +	else if (led_cdev->brightness_set_blocking)
>> +		ret = led_cdev->brightness_set_blocking(led_cdev,
>> +							led_cdev->brightness);

s/led_cdev->brightness/led_cdev->delayed_set_value/

led_set_brightness_nopm() wouldn't have effect if we relied here on
led_cdev->brightness. The former, being called from
led_classdev_suspend(), turns the LED off, but without overwriting
led_cdev->brightness, so that led_classdev_resume could restore it.

I will submit the fixed set soon.

-- 
Best Regards,
Jacek Anaszewski
