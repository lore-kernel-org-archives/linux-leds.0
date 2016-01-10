From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: Locking in LED core really not needed or missing?
Date: Sun, 10 Jan 2016 09:17:31 +0100
Message-ID: <5692139B.3070804@gmail.com>
References: <56901C90.2050801@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f47.google.com ([74.125.82.47]:34730 "EHLO
	mail-wm0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751699AbcAJIRu (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Sun, 10 Jan 2016 03:17:50 -0500
Received: by mail-wm0-f47.google.com with SMTP id u188so181006121wmu.1
        for <linux-leds@vger.kernel.org>; Sun, 10 Jan 2016 00:17:49 -0800 (PST)
In-Reply-To: <56901C90.2050801@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-leds@vger.kernel.org, Jacek Anaszewski <j.anaszewski@samsung.com>

Hi Heiner,

On 01/08/2016 09:31 PM, Heiner Kallweit wrote:
> I'm a little puzzled about the more or less completely missing locking in the LED core.
>
> Let's just take led_timer_function as example.
> It modifies led_cdev->flags and led_cdev->brightness from soft irq context
> (soft blink timer) w/o locking. Accessing these fields is not guaranteed to be atomic
> and the function doesn't even use set_bit etc. for modifying the bitmap.
>
> And brightness_set and other exported functions can even be called from
> hard irq context (e.g. by triggers).

led_set_brightness() behaves differently when blink timer is enabled.
This issue was initially addressed by the patch [1].
Currently even more related improvements sit on linux-next.

> This seems to be quite unsafe to me. Just think of a soft or hard irq colliding
> with a sysfs access. IMHO it's just due to the fact that these collision scenarios
> are relatively unlikely that we don't have problems.
> Am I missing something or is this actually an open issue?
> --
> To unsubscribe from this list: send the line "unsubscribe linux-leds" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

[1] http://www.spinics.net/lists/linux-leds/msg00006.html

-- 
Best Regards,
Jacek Anaszewski
