From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] cleanup LED documentation and make it match reality
Date: Mon, 03 Oct 2016 11:27:53 +0200
Message-ID: <a9dcb6e9-a1bf-df4e-7030-8480392a7955@samsung.com>
References: <CGME20161003081122eucas1p1d125c5f55f171b1ca5e4e1d28a3ad4b1@eucas1p1.samsung.com>
 <20161003081049.GA12419@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:21356 "EHLO
        mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752077AbcJCJ2A (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 3 Oct 2016 05:28:00 -0400
In-reply-to: <20161003081049.GA12419@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, kernel list <linux-kernel@vger.kernel.org>, Greg KH <greg@kroah.com>

Hi Pavel,

Thanks for the patch.

On 10/03/2016 10:10 AM, Pavel Machek wrote:
>
> sysfs-class-led fails to mention some important details. Also fix led
> vs LED and english.
>
> Signed-off-by: Pavel Machek <pavel@ucw.cz>
>
> --- a/Documentation/ABI/testing/sysfs-class-led
> +++ b/Documentation/ABI/testing/sysfs-class-led
> @@ -4,16 +4,25 @@ KernelVersion:	2.6.17
>  Contact:	Richard Purdie <rpurdie@rpsys.net>
>  Description:
>  		Set the brightness of the LED. Most LEDs don't
> -		have hardware brightness support so will just be turned on for
> +		have hardware brightness support, so will just be turned on for
>  		non-zero brightness settings. The value is between 0 and
>  		/sys/class/leds/<led>/max_brightness.
>
> +		Writing 0 to this file clears active trigger.
> +
> +		Writing non-zero to this file while trigger is active changes the
> +		top brightness trigger is going to use.

This is true only in case of timer trigger, as it uses blink_brightness
property from struct led_classdev to cache current brightness, when the
the LED is in the off cycle. This is part of software blink fallback
functionality.

In case of heartbeat trigger max_brightness is always used for top level
brightness. We'd need to refactor the trigger a bit to allow for
different top brightness levels.

> +		
> +
>  What:		/sys/class/leds/<led>/max_brightness
>  Date:		March 2006
>  KernelVersion:	2.6.17
>  Contact:	Richard Purdie <rpurdie@rpsys.net>
>  Description:
> -		Maximum brightness level for this led, default is 255 (LED_FULL).
> +		Maximum brightness level for this LED, default is 255 (LED_FULL).
> +
> +		If the LED does not support different brightness levels, this
> +		should be 1.
>
>  What:		/sys/class/leds/<led>/trigger
>  Date:		March 2006
> @@ -21,7 +30,7 @@ KernelVersion:	2.6.17
>  Contact:	Richard Purdie <rpurdie@rpsys.net>
>  Description:
>  		Set the trigger for this LED. A trigger is a kernel based source
> -		of led events.
> +		of LED events.
>  		You can change triggers in a similar manner to the way an IO
>  		scheduler is chosen. Trigger specific parameters can appear in
>  		/sys/class/leds/<led> once a given trigger is selected.
>


-- 
Best regards,
Jacek Anaszewski
