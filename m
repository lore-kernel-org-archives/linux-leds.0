From: Bruce Zhang <bo.zhang@nxp.com>
Subject: RE: [[PATCH v2]] drivers: leds/trigger: system cannot enter suspend
Date: Fri, 9 Jun 2017 02:57:49 +0000
Message-ID: <AM3PR04MB404B44A56FC58C12D3DF2A68ACE0@AM3PR04MB404.eurprd04.prod.outlook.com>
References: <1496803810-57154-1-git-send-email-bo.zhang@nxp.com>
 <20170607071256.GA3230@amd>
 <CACRpkdacymETLuRmpn07HUKHvrjWc85Jdj0s0qk44zTcaALa9w@mail.gmail.com>
 <20170607103129.GA13227@amd>
 <AM3PR04MB4045292078845DDB27718BD8AC90@AM3PR04MB404.eurprd04.prod.outlook.com>
 <711ac25b-ee32-1bd6-8a18-1e261b445920@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-ve1eur01on0077.outbound.protection.outlook.com ([104.47.1.77]:38741
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751479AbdFIC5w (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 8 Jun 2017 22:57:52 -0400
In-Reply-To: <711ac25b-ee32-1bd6-8a18-1e261b445920@gmail.com>
Content-Language: en-US
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Linus Walleij <linus.walleij@linaro.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Richard Purdie <rpurdie@rpsys.net>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>

Hi Jacek,

I think that no change need to make for __led_set_brightness() and __led_se=
t_brightness_blocking() function. Because led_classdev_suspend() need to tu=
rn off LED with these API. set_brightness_delayed() is the same level API a=
s __led_set_brightness(). No need to add LED_SUSPENDED checking as well.

Best Regards,
Bo

-----Original Message-----
From: Jacek Anaszewski [mailto:jacek.anaszewski@gmail.com]=20
Sent: Friday, June 09, 2017 4:28 AM
To: Bruce Zhang <bo.zhang@nxp.com>; Pavel Machek <pavel@ucw.cz>; Linus Wall=
eij <linus.walleij@linaro.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>; linux-arm-kernel@lists.infradead.=
org; Richard Purdie <rpurdie@rpsys.net>; linux-leds@vger.kernel.org
Subject: Re: [[PATCH v2]] drivers: leds/trigger: system cannot enter suspen=
d

Hi Bruce,

On 06/08/2017 04:57 AM, Bruce Zhang wrote:
> Hi,
>=20
> As suspend/resume procedure is as below:
> pm_notifier_call_chain(PM_SUSPEND_PREPARE)->device suspend -> syscore sus=
pend -> enter suspend mode -> syscore resume -> device resume -> pm_notifie=
r_call_chain(PM_POST_SUSPEND).
> If led brightness control depends on other device/hardware (such as I2C),=
 the LED turn off action should be earlier than device suspend. pm_notifier=
 may be a suitable method to turn off LED.

OK, so I agree that the most proper fix to the discussed problem would be i=
gnoring brightness setting requests after suspend, as Pavel suggested.

led_classdev_suspend() already turns the LED off and
led_classdev_resume() brings the brightness back.

Also led_set_brightness_nosleep() and led_set_brightness_sync() don't propa=
gate brightness change to the driver if LED_SUSPENDED is set.

There are two problems though:
1. __led_set_brightness() and __led_set_brightness_blocking() don't
   check the flag, and they can be called from set_brightness_delayed(),
   that was already queued at the time of setting LED_SUSPENDED flag.
2. LED_SUSPENDED flag is accessed in a non-atomic way.

The solution as I see it would be respectively:
1. Return from __led_set_brightness() and
   __led_set_brightness_blocking() if LED_SUSPENDED is set.
2. Switch to accessing struct led_classdev's flags with use of
   bitops. Fortunately those flags are mainly set prior LED class
   device registration and only LED_SYSFS_DISABLE, LED_SUSPENDED
   and LED_UNREGISTERING are accessed afterwards, and only in the LED
   core, so only those places would have to be modified.

Best regards,
Jacek Anaszewski

> -----Original Message-----
> From: Pavel Machek [mailto:pavel@ucw.cz]
> Sent: Wednesday, June 07, 2017 6:31 PM
> To: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bruce Zhang <bo.zhang@nxp.com>; Ulf Hansson=20
> <ulf.hansson@linaro.org>; linux-arm-kernel@lists.infradead.org; Jacek=20
> Anaszewski <jacek.anaszewski@gmail.com>; Richard Purdie=20
> <rpurdie@rpsys.net>; linux-leds@vger.kernel.org
> Subject: Re: [[PATCH v2]] drivers: leds/trigger: system cannot enter=20
> suspend
>=20
> Hi!
>=20
> On Wed 2017-06-07 11:46:10, Linus Walleij wrote:
>> On Wed, Jun 7, 2017 at 9:12 AM, Pavel Machek <pavel@ucw.cz> wrote:
>>
>>> Core reason is that 5ab92a7cb is wrong. (Very wrong; it papers over=20
>>> the issue for one trigger, but we have more than one... Even if=20
>>> special handling for heartbeat is warranted, that handling would be=20
>>> "turn the led off" not "unregister the trigger", which is=20
>>> userland-visible action.)
>>
>> OK yeah I guess you're right.
>>
>> I just couldn't think about anything better and didn't get any review=20
>> at the time, so mistakes were made.
>>
>>> That one should be reverted, then maybe the driver should be fixed=20
>>> to turn the led off during suspend.
>>
>> Do you mean that the heartbeat trigger driver should be fixed to turn=20
>> off the LED during sleep?
>>
>> That is essentially what I was trying to achieve.
>=20
> I don't think we should be fixing it at trigger level.
>=20
> If userspace keeps blinking using "brightness" attribute, would we like t=
he LED to be off during suspend? I think so.
>=20
>> The reason it is done as it is, is that the trigger sets up a timer=20
>> to do its job, and the timer may trigger between the point you turn=20
>> off the LED and the system really goes to suspend, again maybe=20
>> turning the LED on and again leaving the system with a glowing LED at su=
spend.
>=20
>> The patch also solves the following phenomenon, sorry for not writing=20
>> in the commit:
>>
>> - Turn off LED
>> - Suspend I2C hardware
>> - Timer trigger
>> - Trying to blink the LED using I2C
>> - Crap in the console about the failed I2C transaction
>> - Actual suspen happens
>> - System comes online
>> - Trying to blink the LED using I2C
>> - Crap in the console about the failed I2C transaction
>> - Resume I2C hardware
>>
>> It's just very fragile this trigger, turning off the LED from the PM=20
>> notifier is obviously not enough, we also need to disable the timer,=20
>> and then take it back online after resume.
>=20
> No, leave the timer alone, and actually leave the trigger alone.
>=20
> Simply make the driver turn the LED off in .suspend() callback, and then =
ignore further requests until .resume(). That will get rid of power drain _=
and_ "failed I2C transaction" messages, right?
>=20
> (Actually, I tested with the heartbeat trigger, and it is not re-installe=
d after resume. Another reason to revert the patch).
>=20
> Thanks,
>=20
> 									Pavel
> --
> (english) http://www.livejournal.com/~pavelmachek
> (cesky, pictures)=20
> http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
>=20
