From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [[PATCH]] Revert "leds: handle suspend/resume in heartbeat trigger"
Date: Wed, 23 Aug 2017 16:02:57 +0200
Message-ID: <CAMuHMdUjZHpEQKmhCGnqtZjw_PK5PeQe2kEH6TTKfS8Ne2+drQ@mail.gmail.com>
References: <1497321560-46817-1-git-send-email-bo.zhang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pg0-f47.google.com ([74.125.83.47]:33807 "EHLO
        mail-pg0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754034AbdHWOC7 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 23 Aug 2017 10:02:59 -0400
Received: by mail-pg0-f47.google.com with SMTP id s14so799650pgs.1
        for <linux-leds@vger.kernel.org>; Wed, 23 Aug 2017 07:02:58 -0700 (PDT)
In-Reply-To: <1497321560-46817-1-git-send-email-bo.zhang@nxp.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Zhang Bo <bo.zhang@nxp.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Ulf Hansson <ulf.hansson@linaro.org>, Grygorii Strashko <grygorii.strashko@ti.com>, Linus Walleij <linus.walleij@linaro.org>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>

Hi Zhang,

On Tue, Jun 13, 2017 at 4:39 AM, Zhang Bo <bo.zhang@nxp.com> wrote:
> This reverts commit 5ab92a7cb82c66bf30685583a38a18538e3807db.
>
> System cannot enter suspend mode because of heartbeat led trigger.
> In autosleep_wq, try_to_suspend function will try to enter suspend
> mode in specific period. it will get wakeup_count then call pm_notifier
> chain callback function and freeze processes.
> Heartbeat_pm_notifier is called and it call led_trigger_unregister to
> change the trigger of led device to none. It will send uevent message
> and the wakeup source count changed. As wakeup_count changed, suspend
> will abort.
>
> Signed-off-by: Zhang Bo <bo.zhang@nxp.com>

While investigating an heartbeat LED issue in v4.9.40-ltsi, I stumpled on this
revert (commit 436c4c45b5b9562b ("Revert "leds: handle suspend/resume in
heartbeat trigger"") in v4.12-rc6), which was not backported to v4.9 (yet).

Interestingly, while running v4.9.x on r8a7791/koelsch with an LED configured
for heartbeat, I can actually suspend the system using s2ram.
However, after system resume the heartbeat LED no longer flashes.
/sys/class/leds/LED6/trigger shows the trigger is still "none", and thus
wasn't restored to "heartbeat" by the notifier.
There's no "could not re-register heartbeat trigger" message printed.

Backporting the revert fixes this.

Gr{oetje,eeting}s,

                        Geert
