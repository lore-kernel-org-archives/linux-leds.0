From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v2 0/3] led: ledtrig-transient: add support for hrtimer
Date: Thu, 14 Sep 2017 22:03:30 +0200
Message-ID: <9bc70fee-40ee-350f-3624-7546b797c64e@gmail.com>
References: <20170913175400.42744-1-dtwlin@google.com>
 <20170913202032.GA30844@amd> <9c75c3a9-4123-c7f3-7725-45ba752d672a@gmail.com>
 <CAPzFB+W6tBFuUy3R4ujc1Qk2nZ2D3h03F2OuFp6SrWypZbq2EA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wr0-f196.google.com ([209.85.128.196]:34585 "EHLO
        mail-wr0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751277AbdINUEZ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 14 Sep 2017 16:04:25 -0400
In-Reply-To: <CAPzFB+W6tBFuUy3R4ujc1Qk2nZ2D3h03F2OuFp6SrWypZbq2EA@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: David Lin <dtwlin@google.com>
Cc: Pavel Machek <pavel@ucw.cz>, Jonathan Corbet <corbet@lwn.net>, rpurdie@rpsys.net, hdegoede@redhat.com, Greg KH <gregkh@linuxfoundation.org>, robh@kernel.org, Rom Lemarchand <romlem@google.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org

On 09/14/2017 09:38 PM, David Lin wrote:
> On Thu, Sep 14, 2017 at 12:31 PM, Jacek Anaszewski
> <jacek.anaszewski@gmail.com> wrote:
>> I would change one more thing in this patch, though. The hr_timer engine
>> should be made optional and not used by default for fast LEDs.
>> It could be made configurable by exposing additional sysfs file from
>> ledtrig-transient.c, e.g. hr_timer_support, accepting boolean value.
> 
> Do you mean in additional to checking the LED_BRIGHTNESS_FAST flag,
> userspace has to explicitly enable it via sysfs for ledtrig to select
> hrtimer? This seems to be redundant to me. Could you please explain
> your concerns and the benefit of doing this? Thanks.

My concern is that fast LED users would be automatically
imposed a hr_timer overhead, which they may not need.

-- 
Best regards,
Jacek Anaszewski
