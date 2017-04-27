From: David Lin <dtwlin@google.com>
Subject: Re: [PATCH] led: ledtrig-transient: replace timer_list with hrtimer
Date: Wed, 26 Apr 2017 20:48:09 -0700
Message-ID: <CAPzFB+XPO4rW58tksTah1j3mLHOBaLi4EECnNiO5kZqPsT356w@mail.gmail.com>
References: <20170424044254.145192-1-dtwlin@google.com> <d6b3d00b-938a-e61e-ce6d-96adacf73396@gmail.com>
 <CAPzFB+U3aLkM7Q2cubdMmtnJp-oCqGKGp2_Q-n2nkbyeh07JgA@mail.gmail.com> <475626da-5fb2-c03c-cdf7-feb42ee6b672@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-yw0-f173.google.com ([209.85.161.173]:34344 "EHLO
        mail-yw0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751929AbdD0Dsl (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 26 Apr 2017 23:48:41 -0400
Received: by mail-yw0-f173.google.com with SMTP id k11so9948493ywb.1
        for <linux-leds@vger.kernel.org>; Wed, 26 Apr 2017 20:48:40 -0700 (PDT)
In-Reply-To: <475626da-5fb2-c03c-cdf7-feb42ee6b672@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: rpurdie@rpsys.net, pavel@ucw.cz, robh@kernel.org, Rom Lemarchand <romlem@google.com>, Joel Fernandes <joelaf@google.com>, stable@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Apr 25, 2017 at 1:15 PM, Jacek Anaszewski
<jacek.anaszewski@gmail.com> wrote:
>> However, there's a need to
>> support hrtimer if the LED subsystem claims support the use case of
>> vibrator (please see Documentation/leds/ledtrig-transient.txt) as even
>> a 5ms of variation is perceivable to the user. I'm thinking if a
>> better interim solution is to introduce a
>> LEDS_TRIGGER_TRANSIENT_HRTIMER config to work with both timers in
>> compile time. Would you agree?
>
> I think that it would be better if LED class driver set a flag
> marking itself as capable of setting brightness with high rate.
> I'd limit that only to leds-gpio and devices driven through
> memory mapped registers.
>
> Having the flag e.g. LED_BRIGHTNESS_FAST, we could add support for
> hr timers also to ledtrig-timer.

Can I resubmit the patch implementing LED_BRIGHTNESS_FAST using hrtimer?

>
> You can try also the other option mentioned by Pavel in [1].

Thanks, Pavel. It does look like that input-ff is a more appropriate
subsystem for implementing a vibrator/haptics driver. It also seems
that it's relying on the userspace to control the timing of the
play/stop events which is likely to be less accurate than a hrtimer in
the kernel. But it provides more effect control than the LED
subsystem.
