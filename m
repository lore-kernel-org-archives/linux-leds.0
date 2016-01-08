From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Locking in LED core really not needed or missing?
Date: Fri, 8 Jan 2016 21:31:12 +0100
Message-ID: <56901C90.2050801@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f51.google.com ([74.125.82.51]:35737 "EHLO
	mail-wm0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754375AbcAHUba (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 8 Jan 2016 15:31:30 -0500
Received: by mail-wm0-f51.google.com with SMTP id f206so148557701wmf.0
        for <linux-leds@vger.kernel.org>; Fri, 08 Jan 2016 12:31:29 -0800 (PST)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>

I'm a little puzzled about the more or less completely missing locking in the LED core.

Let's just take led_timer_function as example.
It modifies led_cdev->flags and led_cdev->brightness from soft irq context
(soft blink timer) w/o locking. Accessing these fields is not guaranteed to be atomic
and the function doesn't even use set_bit etc. for modifying the bitmap.

And brightness_set and other exported functions can even be called from
hard irq context (e.g. by triggers).

This seems to be quite unsafe to me. Just think of a soft or hard irq colliding
with a sysfs access. IMHO it's just due to the fact that these collision scenarios
are relatively unlikely that we don't have problems.
Am I missing something or is this actually an open issue?
