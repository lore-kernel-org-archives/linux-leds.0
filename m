From: David Lin <dtwlin@google.com>
Subject: Re: [PATCH v2 0/3] led: ledtrig-transient: add support for hrtimer
Date: Thu, 14 Sep 2017 12:38:38 -0700
Message-ID: <CAPzFB+W6tBFuUy3R4ujc1Qk2nZ2D3h03F2OuFp6SrWypZbq2EA@mail.gmail.com>
References: <20170913175400.42744-1-dtwlin@google.com> <20170913202032.GA30844@amd>
 <9c75c3a9-4123-c7f3-7725-45ba752d672a@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wr0-f178.google.com ([209.85.128.178]:49108 "EHLO
        mail-wr0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751686AbdINTjK (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 14 Sep 2017 15:39:10 -0400
Received: by mail-wr0-f178.google.com with SMTP id 108so257564wra.5
        for <linux-leds@vger.kernel.org>; Thu, 14 Sep 2017 12:39:10 -0700 (PDT)
In-Reply-To: <9c75c3a9-4123-c7f3-7725-45ba752d672a@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, Jonathan Corbet <corbet@lwn.net>, rpurdie@rpsys.net, hdegoede@redhat.com, Greg KH <gregkh@linuxfoundation.org>, robh@kernel.org, Rom Lemarchand <romlem@google.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org

On Thu, Sep 14, 2017 at 12:31 PM, Jacek Anaszewski
<jacek.anaszewski@gmail.com> wrote:
> I would change one more thing in this patch, though. The hr_timer engine
> should be made optional and not used by default for fast LEDs.
> It could be made configurable by exposing additional sysfs file from
> ledtrig-transient.c, e.g. hr_timer_support, accepting boolean value.

Do you mean in additional to checking the LED_BRIGHTNESS_FAST flag,
userspace has to explicitly enable it via sysfs for ledtrig to select
hrtimer? This seems to be redundant to me. Could you please explain
your concerns and the benefit of doing this? Thanks.
