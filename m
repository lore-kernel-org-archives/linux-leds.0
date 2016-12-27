From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH] leds: Allow drivers to update the core, and generate
 events on changes
Date: Tue, 27 Dec 2016 23:57:26 +0100
Message-ID: <3560132e-ac79-b6fa-200c-da9c7ed9d435@gmail.com>
References: <20161227191136.4516-1-gabriele.mzt@gmail.com>
 <20161227200755.GA6345@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:36817 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753728AbcL0W6N (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 27 Dec 2016 17:58:13 -0500
In-Reply-To: <20161227200755.GA6345@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>, Gabriele Mazzotta <gabriele.mzt@gmail.com>
Cc: rpurdie@rpsys.net, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Gabriele, Pavel,

On 12/27/2016 09:07 PM, Pavel Machek wrote:
> Hi!
> 
>> Similarily to commit 325253a6b2de ("backlight: Allow drivers to update
>> the core, and generate events on changes"), inform userspace about
>> brightness changes and allow drivers to request updates of the
>> brightness value.
> 
> First... we had similar patch in tree, and it caused problems, we are
> now trying to figure out how to do it properly.
> 
> LED can be updated many times per second, uevent is probably _not_
> good mechanism to achieve that.
> 
> Generating uevent for /sys changes does not make much sense, right?
> 
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

I've recently submitted for a discussion the idea of "persistent
triggers" [0]. Any feedback is very much appreciated.

[0] https://www.spinics.net/lists/linux-leds/msg07332.html

-- 
Best regards,
Jacek Anaszewski
