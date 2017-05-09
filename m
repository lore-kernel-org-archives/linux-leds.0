From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH 0/3] led: ledtrig-transient: add support for hrtimer
Date: Tue, 9 May 2017 22:43:45 +0200
Message-ID: <d9f9dd95-b5c4-8447-1391-594b461f805c@gmail.com>
References: <20170430213701.12297-1-dtwlin@google.com>
 <20170508210602.GA7260@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wr0-f195.google.com ([209.85.128.195]:34039 "EHLO
        mail-wr0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750795AbdEIUod (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 9 May 2017 16:44:33 -0400
In-Reply-To: <20170508210602.GA7260@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>, David Lin <dtwlin@google.com>
Cc: corbet@lwn.net, rpurdie@rpsys.net, hdegoede@redhat.com, mark.rutland@arm.com, tony.makkiel@daqri.com, linz@li-pro.net, robh@kernel.org, romlem@google.com, joelaf@google.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org

On 05/08/2017 11:06 PM, Pavel Machek wrote:
> On Sun 2017-04-30 14:36:58, David Lin wrote:
>> Hi,
>>
>> These patch series add the LED_BRIGHTNESS_FAST flag support for
>> ledtrig-transient to use hrtimer so that platforms with high-resolution timer
>> support can have better accuracy in the trigger duration timing. The need for
>> this support is driven by the fact that Android has removed the timed_ouput [1]
>> and is now using led-trigger for handling vibrator control which requires the
>> timer to be accurate up to a millisecond. However, this flag support would also
>> allow hrtimer to co-exist with the ktimer without causing warning to the
>> existing drivers [2].
> 
> Yes, and objection still stands: You are misusing LED subsystem for
> vibration motors. We already have support for haptic feedback in input
> subsystem.

Regardless of whether it is a misuse or not (ledtrig-transient
documentation suggests that it is one of use cases) we have to keep
it as it has been around for a long time and it has userspace users [0].

Moreover there seems to be broad consensus about it among kernel
people [1].


[0]
https://android.googlesource.com/platform%2Fhardware%2Flibhardware/+/61701df363310a5cbd95e3e1638baa9526e42c9b
[1] https://patchwork.kernel.org/patch/8664831/

-- 
Best regards,
Jacek Anaszewski
