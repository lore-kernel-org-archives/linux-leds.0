From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: Re: [PATCH 2/5] leds: triggers: Add a led_trigger_event_nosleep API
Date: Wed, 6 Apr 2016 01:38:18 -0300
Message-ID: <CAAEAJfCoJEM9+Y_=B=YKFG_zT5TMHEKqzrX-nns7L8Mx5WqSug@mail.gmail.com>
References: <1459801326-5541-1-git-send-email-ezequiel@vanguardiasur.com.ar>
	<1459801326-5541-3-git-send-email-ezequiel@vanguardiasur.com.ar>
	<57042FD8.1090100@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f45.google.com ([74.125.82.45]:34698 "EHLO
	mail-wm0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750774AbcDFEiT convert rfc822-to-8bit (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 6 Apr 2016 00:38:19 -0400
Received: by mail-wm0-f45.google.com with SMTP id l6so48101501wml.1
        for <linux-leds@vger.kernel.org>; Tue, 05 Apr 2016 21:38:19 -0700 (PDT)
In-Reply-To: <57042FD8.1090100@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: linux-leds@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>

On 5 April 2016 at 18:36, Jacek Anaszewski <jacek.anaszewski@gmail.com>=
 wrote:
> Hi Ezequiel,
>
>
> On 04/04/2016 10:22 PM, Ezequiel Garcia wrote:
>>
>> Now that we can mark any LED (even those in use by delayed blink
>> triggers) to trigger on a kernel panic, let's introduce a nosleep
>> led_trigger_event API.
>>
>> This API is needed to skip the delayed blink path on
>> led_trigger_event. LEDs that are switched on a kernel panic,
>> might be in use by a delayed blink trigger.
>>
>> This will be used by the panic LED trigger.
>>
>> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
>> ---
>>   drivers/leds/led-triggers.c | 26 ++++++++++++++++++++++----
>>   include/linux/leds.h        |  4 ++++
>>   2 files changed, 26 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers=
=2Ec
>> index f5c9d7c4d181..00b9d8497777 100644
>> --- a/drivers/leds/led-triggers.c
>> +++ b/drivers/leds/led-triggers.c
>> @@ -307,8 +307,9 @@ EXPORT_SYMBOL_GPL(devm_led_trigger_register);
>>
>>   /* Simple LED Tigger Interface */
>>
>> -void led_trigger_event(struct led_trigger *trig,
>> -                       enum led_brightness brightness)
>> +static void do_led_trigger_event(struct led_trigger *trig,
>> +                                enum led_brightness brightness,
>> +                                bool nosleep)
>>   {
>>         struct led_classdev *led_cdev;
>>
>> @@ -316,12 +317,29 @@ void led_trigger_event(struct led_trigger *tri=
g,
>>                 return;
>>
>>         read_lock(&trig->leddev_list_lock);
>> -       list_for_each_entry(led_cdev, &trig->led_cdevs, trig_list)
>> -               led_set_brightness(led_cdev, brightness);
>
>
> led_set_brightness() can gently disable blinking if passed 0 in the
> brightness argument. IMHO this patch is not needed then.
>
>

Yes, but the blinking disable is deferred, and so might never
run (e.g. I'd say it won't run on a non-preemptible kernel).

I think we need this API, or otherwise some way of circumventing
the deferred path on led_set_brightness. For instance, we
could turn off delay_on and delay_off in the panic atomic notifier.

I'm not strongly convinced by any approach, but this API seemed
slightly cleaner.
--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
