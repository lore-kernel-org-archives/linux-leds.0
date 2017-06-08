From: Bruce Zhang <bo.zhang@nxp.com>
Subject: RE: [[PATCH v2]] drivers: leds/trigger: system cannot enter suspend
Date: Thu, 8 Jun 2017 02:57:16 +0000
Message-ID: <AM3PR04MB4045292078845DDB27718BD8AC90@AM3PR04MB404.eurprd04.prod.outlook.com>
References: <1496803810-57154-1-git-send-email-bo.zhang@nxp.com>
 <20170607071256.GA3230@amd>
 <CACRpkdacymETLuRmpn07HUKHvrjWc85Jdj0s0qk44zTcaALa9w@mail.gmail.com>
 <20170607103129.GA13227@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-db5eur01on0045.outbound.protection.outlook.com ([104.47.2.45]:41888
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751433AbdFHC5U (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 7 Jun 2017 22:57:20 -0400
In-Reply-To: <20170607103129.GA13227@amd>
Content-Language: en-US
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>, Linus Walleij <linus.walleij@linaro.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>

Hi,

As suspend/resume procedure is as below:
pm_notifier_call_chain(PM_SUSPEND_PREPARE)->device suspend -> syscore suspe=
nd -> enter suspend mode -> syscore resume -> device resume -> pm_notifier_=
call_chain(PM_POST_SUSPEND).
If led brightness control depends on other device/hardware (such as I2C), t=
he LED turn off action should be earlier than device suspend. pm_notifier m=
ay be a suitable method to turn off LED.

Best Regards,
Bo

-----Original Message-----
From: Pavel Machek [mailto:pavel@ucw.cz]=20
Sent: Wednesday, June 07, 2017 6:31 PM
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bruce Zhang <bo.zhang@nxp.com>; Ulf Hansson <ulf.hansson@linaro.org>; l=
inux-arm-kernel@lists.infradead.org; Jacek Anaszewski <jacek.anaszewski@gma=
il.com>; Richard Purdie <rpurdie@rpsys.net>; linux-leds@vger.kernel.org
Subject: Re: [[PATCH v2]] drivers: leds/trigger: system cannot enter suspen=
d

Hi!

On Wed 2017-06-07 11:46:10, Linus Walleij wrote:
> On Wed, Jun 7, 2017 at 9:12 AM, Pavel Machek <pavel@ucw.cz> wrote:
>=20
> > Core reason is that 5ab92a7cb is wrong. (Very wrong; it papers over=20
> > the issue for one trigger, but we have more than one... Even if=20
> > special handling for heartbeat is warranted, that handling would be=20
> > "turn the led off" not "unregister the trigger", which is=20
> > userland-visible action.)
>=20
> OK yeah I guess you're right.
>=20
> I just couldn't think about anything better and didn't get any review=20
> at the time, so mistakes were made.
>=20
> > That one should be reverted, then maybe the driver should be fixed=20
> > to turn the led off during suspend.
>=20
> Do you mean that the heartbeat trigger driver should be fixed to turn=20
> off the LED during sleep?
>=20
> That is essentially what I was trying to achieve.

I don't think we should be fixing it at trigger level.

If userspace keeps blinking using "brightness" attribute, would we like the=
 LED to be off during suspend? I think so.

> The reason it is done as it is, is that the trigger sets up a timer to=20
> do its job, and the timer may trigger between the point you turn off=20
> the LED and the system really goes to suspend, again maybe turning the=20
> LED on and again leaving the system with a glowing LED at suspend.

> The patch also solves the following phenomenon, sorry for not writing=20
> in the commit:
>=20
> - Turn off LED
> - Suspend I2C hardware
> - Timer trigger
> - Trying to blink the LED using I2C
> - Crap in the console about the failed I2C transaction
> - Actual suspen happens
> - System comes online
> - Trying to blink the LED using I2C
> - Crap in the console about the failed I2C transaction
> - Resume I2C hardware
>=20
> It's just very fragile this trigger, turning off the LED from the PM=20
> notifier is obviously not enough, we also need to disable the timer,=20
> and then take it back online after resume.

No, leave the timer alone, and actually leave the trigger alone.

Simply make the driver turn the LED off in .suspend() callback, and then ig=
nore further requests until .resume(). That will get rid of power drain _an=
d_ "failed I2C transaction" messages, right?

(Actually, I tested with the heartbeat trigger, and it is not re-installed =
after resume. Another reason to revert the patch).

Thanks,

									Pavel
