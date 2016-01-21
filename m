From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH] led: core: fix misleading comment after workqueue removal
 from drivers
Date: Thu, 21 Jan 2016 10:50:30 +0100
Message-ID: <CAFSsGVv-7dmjoo2kShhEMXi-597gsPXuKeV1x8Va9zzoYj4A-Q@mail.gmail.com>
References: <56929204.3080404@gmail.com>
	<56A09EC8.1080807@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f51.google.com ([74.125.82.51]:36096 "EHLO
	mail-wm0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759176AbcAUJub (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 21 Jan 2016 04:50:31 -0500
Received: by mail-wm0-f51.google.com with SMTP id l65so212471478wmf.1
        for <linux-leds@vger.kernel.org>; Thu, 21 Jan 2016 01:50:30 -0800 (PST)
In-Reply-To: <56A09EC8.1080807@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org

On Thu, Jan 21, 2016 at 10:03 AM, Jacek Anaszewski
<j.anaszewski@samsung.com> wrote:
> Hi Heiner,
>
> On 01/10/2016 06:16 PM, Heiner Kallweit wrote:
>>
>> Now that workqueues have been removed from individual drivers and
>> were replaced with a core-internal workqueue we shouldn't
>> encourage people to add new workqueues to drivers.
>>
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>> ---
>>   include/linux/leds.h | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/linux/leds.h b/include/linux/leds.h
>> index bc1476f..4429887 100644
>> --- a/include/linux/leds.h
>> +++ b/include/linux/leds.h
>> @@ -50,7 +50,10 @@ struct led_classdev {
>>   #define LED_DEV_CAP_FLASH     (1 << 23)
>>
>>         /* Set LED brightness level */
>> -       /* Must not sleep, use a workqueue if needed */
>> +       /* Must not sleep. If no non-blocking version can be provided
>> +        * set brightness_set_blocking only. The LED core will use an
>> +        * internal work queue to create a non-blocking version.
>> +        */
>
>
> This comment isn't easily comprehensible at first glance.
>
> How about:
>
> "Must not sleep. Use brightness_set_blocking for drivers
> that can sleep while setting brightness."
>
Yes, this is better. It's simpler and clearer.
Are you going to fix the comment on your own or would you like me
to submit it as a patch?

Regards, Heiner

>>         void            (*brightness_set)(struct led_classdev *led_cdev,
>>                                           enum led_brightness brightness);
>>         /*
>>
>
>
> --
> Best Regards,
> Jacek Anaszewski
