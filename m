From: Gabriele Mazzotta <gabriele.mzt@gmail.com>
Subject: Re: [PATCH] leds: Allow drivers to update the core, and generate
 events on changes
Date: Tue, 27 Dec 2016 21:23:28 +0100
Message-ID: <5f442764-825b-1bdc-2763-1c4c8dc1c098@gmail.com>
References: <20161227191136.4516-1-gabriele.mzt@gmail.com>
 <20161227200755.GA6345@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wj0-f193.google.com ([209.85.210.193]:34448 "EHLO
        mail-wj0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755344AbcL0UXb (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 27 Dec 2016 15:23:31 -0500
In-Reply-To: <20161227200755.GA6345@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: rpurdie@rpsys.net, jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org

On 27/12/2016 21:07, Pavel Machek wrote:
> Hi!
> 
>> Similarily to commit 325253a6b2de ("backlight: Allow drivers to update
>> the core, and generate events on changes"), inform userspace about
>> brightness changes and allow drivers to request updates of the
>> brightness value.
> 
> First... we had similar patch in tree, and it caused problems, we are
> now trying to figure out how to do it properly.

Oh, I didn't know that, sorry.

> LED can be updated many times per second, uevent is probably _not_
> good mechanism to achieve that.

Ummm, right, I didn't think of that.

> Generating uevent for /sys changes does not make much sense, right?

I planned to use this patch mostly for keyboard backlights, for
which some DEs provide a UI similar to the one for screen backlights.
Having uevents also for /sys changes means having the UI always in
sync with the kernel/hardware, as it happens for screen backlights.
In case of LEDs only the application changing the brightness is
aware of the change.

>> +extern void led_brightness_force_update(struct led_classdev *led_cdev,
>> +				enum led_brightness_update_reason reason);
> 
> I see this may make some sense, but there are no uses for this in this
> patch.
> 
> My preffered solution would be ... for hardware that changes led
> brightness itself, introduce a "trigger", so that userspace knows this
> led is special, and then provide poll()able /sys fs file interested
> parties can read.

OK, I'll see if I can come up something good.

Regards,
Gabriele

> Best regards,
> 
> 								Pavel
> 
