From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [[PATCH v2]] drivers: leds/trigger: system cannot enter suspend
Date: Wed, 7 Jun 2017 11:46:10 +0200
Message-ID: <CACRpkdacymETLuRmpn07HUKHvrjWc85Jdj0s0qk44zTcaALa9w@mail.gmail.com>
References: <1496803810-57154-1-git-send-email-bo.zhang@nxp.com> <20170607071256.GA3230@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-it0-f41.google.com ([209.85.214.41]:38348 "EHLO
        mail-it0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751458AbdFGJqM (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 7 Jun 2017 05:46:12 -0400
Received: by mail-it0-f41.google.com with SMTP id r63so4443048itc.1
        for <linux-leds@vger.kernel.org>; Wed, 07 Jun 2017 02:46:11 -0700 (PDT)
In-Reply-To: <20170607071256.GA3230@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Zhang Bo <bo.zhang@nxp.com>, Ulf Hansson <ulf.hansson@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>

On Wed, Jun 7, 2017 at 9:12 AM, Pavel Machek <pavel@ucw.cz> wrote:

> Core reason is that 5ab92a7cb is wrong. (Very wrong; it papers over
> the issue for one trigger, but we have more than one... Even if
> special handling for heartbeat is warranted, that handling would be
> "turn the led off" not "unregister the trigger", which is
> userland-visible action.)

OK yeah I guess you're right.

I just couldn't think about anything better and didn't get any
review at the time, so mistakes were made.

> That one should be reverted, then maybe the
> driver should be fixed to turn the led off during suspend.

Do you mean that the heartbeat trigger driver should be fixed to
turn off the LED during sleep?

That is essentially what I was trying to achieve.

The reason it is done as it is, is that the trigger sets up
a timer to do its job, and the timer may trigger between
the point you turn off the LED and the system really goes
to suspend, again maybe turning the LED on and
again leaving the system with a glowing LED at suspend.

The patch also solves the following phenomenon, sorry
for not writing in the commit:

- Turn off LED
- Suspend I2C hardware
- Timer trigger
- Trying to blink the LED using I2C
- Crap in the console about the failed I2C transaction
- Actual suspen happens
- System comes online
- Trying to blink the LED using I2C
- Crap in the console about the failed I2C transaction
- Resume I2C hardware

It's just very fragile this trigger, turning off the LED from
the PM notifier is obviously not enough, we also need to
disable the timer, and then take it back online after resume.

That is the tricky part, which is simplified by just removing
and adding back the trigger.

Yours,
Linus Walleij
