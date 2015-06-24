From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v2] leds: fix brightness changing when software blinking is
 active
Date: Wed, 24 Jun 2015 11:53:54 +0200
Message-ID: <558A7E32.6040806@samsung.com>
References: <5554BE12.7050209@list.ru>
 <20150502145957.GB8156@xo-6d-61-c0.localdomain> <5589906F.4070901@list.ru>
 <20150624084421.GB17732@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:62651 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751743AbbFXJx6 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 24 Jun 2015 05:53:58 -0400
In-reply-to: <20150624084421.GB17732@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Stas Sergeev <stsp@list.ru>, linux-leds@vger.kernel.org, Linux kernel <linux-kernel@vger.kernel.org>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Kyungmin Park <kyungmin.park@samsung.com>, Stas Sergeev <stsp@users.sourceforge.net>

On 06/24/2015 10:44 AM, Pavel Machek wrote:
> On Tue 2015-06-23 19:59:27, Stas Sergeev wrote:
>> 02.05.2015 17:59, Pavel Machek =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>> On Thu 2015-05-14 18:24:02, Stas Sergeev wrote:
>>>>
>>>> The following sequence:
>>>> echo timer >/sys/class/leds/<name>/trigger
>>>> echo 1 >/sys/class/leds/<name>/brightness
>>>> should change the ON brightness for blinking.
>>>> The function led_set_brightness() was mistakenly initiating the
>>>> delayed blink stop procedure, which resulted in no blinking with
>>>> the timer trigger still active.
>>>>
>>>> This patch fixes the problem by changing led_set_brightness()
>>>> to not initiate the delayed blink stop when brightness is not 0.
>>>
>>> Could we get this part of API documented? It is quite non-obvious..=
=2E 0 clears the trigger,
>>> other values do not, I thought it is a bug when I saw it...
>> I guess the thinking was that if ON brightness differs
>> from OFF brightness, you should not clear the trigger.
>> But if you put ON brightness similar to OFF brightness,
>> then you can as well stop blinking at all.
>
> And none of this is documented. So what about this?

It is documented in Documentation/leds/leds-class.txt:

"However, if you set the brightness value to LED_OFF it will
also disable the timer trigger".

Nonetheless, obviously it should be also covered in the
ABI documentation.

>
> diff --git a/Documentation/ABI/testing/sysfs-class-led b/Documentatio=
n/ABI/testing/sysfs-class-led
> index 3646ec8..b734d7f 100644
> --- a/Documentation/ABI/testing/sysfs-class-led
> +++ b/Documentation/ABI/testing/sysfs-class-led
> @@ -4,16 +4,25 @@ KernelVersion:	2.6.17
>   Contact:	Richard Purdie <rpurdie@rpsys.net>
>   Description:
>   		Set the brightness of the LED. Most LEDs don't
> -		have hardware brightness support so will just be turned on for
> +		have hardware brightness support, so will just be turned on for
>   		non-zero brightness settings. The value is between 0 and
>   		/sys/class/leds/<led>/max_brightness.
>
> +		Writing 0 to this file clears active trigger.
> +
> +		Writing non-zero to this file while trigger is active changes the
> +		top brightness trigger is going to use.

This currently will not be true e.g. for heartbeat trigger which
uses max_brightness.

> +	=09
> +
>   What:		/sys/class/leds/<led>/max_brightness
>   Date:		March 2006
>   KernelVersion:	2.6.17
>   Contact:	Richard Purdie <rpurdie@rpsys.net>
>   Description:
> -		Maximum brightness level for this led, default is 255 (LED_FULL).
> +		Maximum brightness level for this LED, default is 255 (LED_FULL).
> +
> +		If the LED does not support different brightness levels, this
> +		should be 1.
>
>   What:		/sys/class/leds/<led>/trigger
>   Date:		March 2006
> @@ -21,7 +30,7 @@ KernelVersion:	2.6.17
>   Contact:	Richard Purdie <rpurdie@rpsys.net>
>   Description:
>   		Set the trigger for this LED. A trigger is a kernel based source
> -		of led events.
> +		of LED events.
>   		You can change triggers in a similar manner to the way an IO
>   		scheduler is chosen. Trigger specific parameters can appear in
>   		/sys/class/leds/<led> once a given trigger is selected.
>


--=20
Best Regards,
Jacek Anaszewski
