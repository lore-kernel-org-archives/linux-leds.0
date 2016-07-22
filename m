From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] leds/trigger/cpu: move from CPU_STARTING to ONLINE level
Date: Fri, 22 Jul 2016 17:24:29 +0200
Message-ID: <CACRpkdZb_v3ebekPKP=DK0pj+JwoxN939bgf+F5Acttf3GkvWw@mail.gmail.com>
References: <1469028295-14702-1-git-send-email-bigeasy@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-oi0-f45.google.com ([209.85.218.45]:35270 "EHLO
	mail-oi0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751987AbcGVPYa (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 22 Jul 2016 11:24:30 -0400
Received: by mail-oi0-f45.google.com with SMTP id l72so167491228oig.2
        for <linux-leds@vger.kernel.org>; Fri, 22 Jul 2016 08:24:30 -0700 (PDT)
In-Reply-To: <1469028295-14702-1-git-send-email-bigeasy@linutronix.de>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@kernel.org>, Jacek Anaszewski <j.anaszewski@samsung.com>, Linus Torvalds <torvalds@linux-foundation.org>, Paul Gortmaker <paul.gortmaker@windriver.com>, Peter Zijlstra <peterz@infradead.org>, Richard Purdie <rpurdie@rpsys.net>, Thomas Gleixner <tglx@linutronix.de>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, rt@linutronix.de

On Wed, Jul 20, 2016 at 5:24 PM, Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:

> There is no need the ledtriger to be called *that* early in the hotplug
> process (+ with disabled interrupts). As explained by Jacek Anaszewski [0]
> there is no need for it.
> Therefore this patch moves it to the ONLINE/PREPARE_DOWN level using the
> dynamic registration for the id.
>
> [0] https://lkml.kernel.org/r/578C92BC.2070603@samsung.com
>
> Cc: Jacek Anaszewski <j.anaszewski@samsung.com>
> Cc: Linus Torvalds <torvalds@linux-foundation.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Paul Gortmaker <paul.gortmaker@windriver.com>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Richard Purdie <rpurdie@rpsys.net>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: linux-leds@vger.kernel.org
> Cc: rt@linutronix.de
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Read back on the discussion, this change makes all kind of sense.
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
