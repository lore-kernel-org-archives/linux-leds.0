From: David Lin <dtwlin@google.com>
Subject: Re: [PATCH] led: ledtrig-transient: replace timer_list with hrtimer
Date: Mon, 24 Apr 2017 20:05:59 -0700
Message-ID: <CAPzFB+U3aLkM7Q2cubdMmtnJp-oCqGKGp2_Q-n2nkbyeh07JgA@mail.gmail.com>
References: <20170424044254.145192-1-dtwlin@google.com> <d6b3d00b-938a-e61e-ce6d-96adacf73396@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-yw0-f170.google.com ([209.85.161.170]:34354 "EHLO
        mail-yw0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S980097AbdDYDGb (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 24 Apr 2017 23:06:31 -0400
Received: by mail-yw0-f170.google.com with SMTP id k11so43534816ywb.1
        for <linux-leds@vger.kernel.org>; Mon, 24 Apr 2017 20:06:31 -0700 (PDT)
In-Reply-To: <d6b3d00b-938a-e61e-ce6d-96adacf73396@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: rpurdie@rpsys.net, pavel@ucw.cz, robh@kernel.org, Rom Lemarchand <romlem@google.com>, Joel Fernandes <joelaf@google.com>, stable@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Jacek,

On Mon, Apr 24, 2017 at 12:59 PM, Jacek Anaszewski
<jacek.anaszewski@gmail.com> wrote:
>
> Hi David,
>
> Thanks for the patch.
>
> Unfortunately we cannot switch to using hr timers just like that
> without introducing side effects for many devices. We had similar
> attempt of increasing timer tirgger accuracy two years ago [0].
>
> In short words, for drivers that can sleep while setting brightness
> and/or are using a bus like I2C you will not be able to enforce
> 1ms delay period.
>
> I recommend you to go through the thread [0] so that we had
> a well defined ground for the discussion on how to address this
> issue properly.
>

I think I understand the background now, and would agree that not all
the LED driver require hrtimer as human eye can't probably tell
there's a 10ms variation in a blink. However, there's a need to
support hrtimer if the LED subsystem claims support the use case of
vibrator (please see Documentation/leds/ledtrig-transient.txt) as even
a 5ms of variation is perceivable to the user. I'm thinking if a
better interim solution is to introduce a
LEDS_TRIGGER_TRANSIENT_HRTIMER config to work with both timers in
compile time. Would you agree?

David
