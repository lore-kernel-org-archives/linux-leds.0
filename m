From: Manfred Schlaegl <manfred.schlaegl@gmx.at>
Subject: Re: [PATCH] leds: trigger: ledtrig-backlight: Fix invalid memory
 access in fb_event notification callback
Date: Thu, 29 Aug 2013 16:31:34 +0200
Message-ID: <521F5B46.4070505@gmx.at>
References: <520A15B1.2030401@gmx.at> <CAK5ve-Jo-NfTpMnXtQ5QybbW4iqDFnD7-RcdoCDSNL21-1dNHw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.17.21]:62662 "EHLO mout.gmx.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753568Ab3H2OcP (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Thu, 29 Aug 2013 10:32:15 -0400
Received: from [192.168.1.104] ([90.146.13.66]) by mail.gmx.com (mrgmx103)
 with ESMTPSA (Nemesis) id 0MSdRI-1VeJsP3JHI-00RXQS for
 <linux-leds@vger.kernel.org>; Thu, 29 Aug 2013 16:32:14 +0200
In-Reply-To: <CAK5ve-Jo-NfTpMnXtQ5QybbW4iqDFnD7-RcdoCDSNL21-1dNHw@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, Jingoo Han <jg1.han@samsung.com>, "Milo(Woogyom) Kim" <milo.kim@ti.com>, Sachin Kamat <sachin.kamat@linaro.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>

On 2013-08-27 02:51, Bryan Wu wrote:
> On Tue, Aug 13, 2013 at 4:17 AM, Manfred Schlaegl
> <manfred.schlaegl@gmx.at> wrote:
>> fb_notifier_callback is called on any event fired by fb_notifier_call_chain. Events may, or may not contain some data (fb_event.data).
>> In case of FB_EVENT_BLANK fb_event.data contains a pointer to an integer holding the blank state. The Problem is, that in ledtrig-backlight.c - fb_notifier_callback the pointer to blank state is
>> dereferenced BEFORE the event-type is checked.
>> Obviously this leads to problems with other events than FB_EVENT_BLANK, where fb_event.data is undefined or NULL.
>> It seems, that this problem existed ever since the driver was added.
>>
>> Like in drivers/video/backlight/backlight.c line 43 I would suggest to return immediately on events other than FB_EVENT_BLANK.
>>
> 
> Indeed, this is an issue. Thanks for this nice catch and fixing.
> 
> I merged this patch into my tree and it will hit 3.11 release.
> 
> Thanks,
> -Bryan

That would be great.
Thanks too.

-manfred


> 
>> Signed-off-by: Manfred Schlaegl <manfred.schlaegl@gmx.at>
>> ---
>>
>> Background information:
>> I'm currently working on a IMX53(ARM) based hardware and Linux 3.11-rc5 and detected a problem in drivers/leds/trigger/ledtrig-backlight.c
>> ledtrig is used on our hardware (besides pwm-backlight) to switch off a gpio-line connected to display-supply enable-line, when the display is blanked.
>> On first boot after configuring ledtrig I detected an invalid memory access in ledtrig-backlight.c - fb_notifier_callback. In my special case the segfault was caused by an FB_EVENT_FB_REGISTERED,
>> fired with undefined fb_event.data in drivers/video/fbmem.c line 1653.
>>
>>
>> diff --git a/drivers/leds/trigger/ledtrig-backlight.c b/drivers/leds/trigger/ledtrig-backlight.c
>> index 3c9c88a..2538dbe 100644
>> --- a/drivers/leds/trigger/ledtrig-backlight.c
>> +++ b/drivers/leds/trigger/ledtrig-backlight.c
>> @@ -36,26 +36,28 @@ static int fb_notifier_callback(struct notifier_block *p,
>>                                         struct bl_trig_notifier, notifier);
>>         struct led_classdev *led = n->led;
>>         struct fb_event *fb_event = data;
>> -       int *blank = fb_event->data;
>> -       int new_status = *blank ? BLANK : UNBLANK;
>> +       int *blank;
>> +       int new_status;
>> +
>> +       /* If we aren't interested in this event, skip it immediately ... */
>> +       if (event != FB_EVENT_BLANK)
>> +               return 0;
>>
>> -       switch (event) {
>> -       case FB_EVENT_BLANK:
>> -               if (new_status == n->old_status)
>> -                       break;
>> +       blank = fb_event->data;
>> +       new_status = *blank ? BLANK : UNBLANK;
>>
>> -               if ((n->old_status == UNBLANK) ^ n->invert) {
>> -                       n->brightness = led->brightness;
>> -                       __led_set_brightness(led, LED_OFF);
>> -               } else {
>> -                       __led_set_brightness(led, n->brightness);
>> -               }
>> +       if (new_status == n->old_status)
>> +               return 0;
>>
>> -               n->old_status = new_status;
>> -
>> -               break;
>> +       if ((n->old_status == UNBLANK) ^ n->invert) {
>> +               n->brightness = led->brightness;
>> +               __led_set_brightness(led, LED_OFF);
>> +       } else {
>> +               __led_set_brightness(led, n->brightness);
>>         }
>>
>> +       n->old_status = new_status;
>> +
>>         return 0;
>>  }
>>
>>
>>
>>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-leds" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

