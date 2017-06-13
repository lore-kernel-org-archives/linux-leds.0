From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [[PATCH]] Revert "leds: handle suspend/resume in heartbeat trigger"
Date: Tue, 13 Jun 2017 11:35:22 +0200
Message-ID: <CACRpkdY6-REXoXjWNUrfCuPn3GYHhV0di7Lhbb=wRhBtPC0+mA@mail.gmail.com>
References: <1497321560-46817-1-git-send-email-bo.zhang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-it0-f50.google.com ([209.85.214.50]:36240 "EHLO
        mail-it0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751834AbdFMJfX (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 13 Jun 2017 05:35:23 -0400
Received: by mail-it0-f50.google.com with SMTP id m47so37493039iti.1
        for <linux-leds@vger.kernel.org>; Tue, 13 Jun 2017 02:35:23 -0700 (PDT)
In-Reply-To: <1497321560-46817-1-git-send-email-bo.zhang@nxp.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Zhang Bo <bo.zhang@nxp.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Richard Purdie <rpurdie@rpsys.net>, Pavel Machek <pavel@ucw.cz>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>, Grygorii Strashko <grygorii.strashko@ti.com>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>

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

OK I was stupid, lesson learned.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
