From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v2 0/3] led: ledtrig-transient: add support for hrtimer
Date: Thu, 14 Sep 2017 21:31:31 +0200
Message-ID: <9c75c3a9-4123-c7f3-7725-45ba752d672a@gmail.com>
References: <20170913175400.42744-1-dtwlin@google.com>
 <20170913202032.GA30844@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:34346 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751550AbdINTc0 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 14 Sep 2017 15:32:26 -0400
In-Reply-To: <20170913202032.GA30844@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>, David Lin <dtwlin@google.com>
Cc: corbet@lwn.net, rpurdie@rpsys.net, hdegoede@redhat.com, gregkh@linuxfoundation.org, robh@kernel.org, romlem@google.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org

Hi David and Pavel,

On 09/13/2017 10:20 PM, Pavel Machek wrote:
> Hi!
> 
>> These patch series add the LED_BRIGHTNESS_FAST flag support for
>> ledtrig-transient to use hrtimer so that platforms with high-resolution timer
>> support can have better accuracy in the trigger duration timing. The need for
>> this support is driven by the fact that Android has removed the timed_ouput [1]
>> and is now using led-trigger for handling vibrator control which requires the
>> timer to be accurate up to a millisecond. However, this flag support would also
>> allow hrtimer to co-exist with the ktimer without causing warning to the
>> existing drivers [2].
> 
> NAK.
> 
> LEDs do not need extra overhead, and vibrator control should not go
> through LED subsystem.
> 
> Input subsystem includes support for vibrations and force
> feedback. Please use that instead.

I think that most vital criterion here is the usability of the
interface. If it can be harnessed for doing the work seemingly
unrelated to the primary subsystem's purpose, that's fine.
Moreover, it is extremely easy to use in comparison to the force
feedback one.

I would change one more thing in this patch, though. The hr_timer engine
should be made optional and not used by default for fast LEDs.
It could be made configurable by exposing additional sysfs file from
ledtrig-transient.c, e.g. hr_timer_support, accepting boolean value.

-- 
Best regards,
Jacek Anaszewski
