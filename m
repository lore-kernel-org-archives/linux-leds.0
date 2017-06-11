From: Bruce Zhang <bo.zhang@nxp.com>
Subject: RE: [[PATCH v2]] drivers: leds/trigger: system cannot enter suspend
Date: Sun, 11 Jun 2017 04:43:57 +0000
Message-ID: <AM3PR04MB4046350735A24BB7E9B63208ACC0@AM3PR04MB404.eurprd04.prod.outlook.com>
References: <1496803810-57154-1-git-send-email-bo.zhang@nxp.com>
 <20170607071256.GA3230@amd>
 <CACRpkdacymETLuRmpn07HUKHvrjWc85Jdj0s0qk44zTcaALa9w@mail.gmail.com>
 <20170607103129.GA13227@amd>
 <AM3PR04MB4045292078845DDB27718BD8AC90@AM3PR04MB404.eurprd04.prod.outlook.com>
 <711ac25b-ee32-1bd6-8a18-1e261b445920@gmail.com>
 <AM3PR04MB404B44A56FC58C12D3DF2A68ACE0@AM3PR04MB404.eurprd04.prod.outlook.com>
 <e83c61cd-2895-aff7-f0a8-8a7e02d8d8e1@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-ve1eur01on0048.outbound.protection.outlook.com ([104.47.1.48]:44166
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751763AbdFKEoC (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sun, 11 Jun 2017 00:44:02 -0400
In-Reply-To: <e83c61cd-2895-aff7-f0a8-8a7e02d8d8e1@gmail.com>
Content-Language: en-US
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Linus Walleij <linus.walleij@linaro.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Richard Purdie <rpurdie@rpsys.net>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>

Hi Jacek,

Of course I can submit the patch. But we need to confirm that it does not b=
ring back the problem the commit 5ab92a7cb8 was solving. Maybe we can use r=
eference counter to record if some device used by other device. When some d=
evice suspend, it should decrease the reference count of the other device t=
hat it depends on. Only when reference count of some device decrease to zer=
o, it can enter suspend mode. By the way, we should avoid devices call loop=
.

Best Regards,
Bo

-----Original Message-----
From: Jacek Anaszewski [mailto:jacek.anaszewski@gmail.com]=20
Sent: Saturday, June 10, 2017 4:47 AM
To: Bruce Zhang <bo.zhang@nxp.com>; Pavel Machek <pavel@ucw.cz>; Linus Wall=
eij <linus.walleij@linaro.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>; linux-arm-kernel@lists.infradead.=
org; Richard Purdie <rpurdie@rpsys.net>; linux-leds@vger.kernel.org
Subject: Re: [[PATCH v2]] drivers: leds/trigger: system cannot enter suspen=
d

Hi Bruce,

On 06/09/2017 04:57 AM, Bruce Zhang wrote:
> Hi Jacek,
>=20
> I think that no change need to make for __led_set_brightness() and __led_=
set_brightness_blocking() function. Because led_classdev_suspend() need to =
turn off LED with these API. set_brightness_delayed() is the same level API=
 as __led_set_brightness(). No need to add LED_SUSPENDED checking as well.

Indeed, it would be even harmful with the current sequence of instructions =
in the led_classdev_suspend().

So, the only action to take is to revert the commit 5ab92a7cb8.

Would you mind submitting the patch so that everyone interested could give =
their ack?

Best regards,
Jacek Anaszewski

> -----Original Message-----
> From: Jacek Anaszewski [mailto:jacek.anaszewski@gmail.com]
> Sent: Friday, June 09, 2017 4:28 AM
> To: Bruce Zhang <bo.zhang@nxp.com>; Pavel Machek <pavel@ucw.cz>; Linus=20
> Walleij <linus.walleij@linaro.org>
> Cc: Ulf Hansson <ulf.hansson@linaro.org>;=20
> linux-arm-kernel@lists.infradead.org; Richard Purdie=20
> <rpurdie@rpsys.net>; linux-leds@vger.kernel.org
> Subject: Re: [[PATCH v2]] drivers: leds/trigger: system cannot enter=20
> suspend
>=20
> Hi Bruce,
>=20
> On 06/08/2017 04:57 AM, Bruce Zhang wrote:
>> Hi,
>>
>> As suspend/resume procedure is as below:
>> pm_notifier_call_chain(PM_SUSPEND_PREPARE)->device suspend -> syscore su=
spend -> enter suspend mode -> syscore resume -> device resume -> pm_notifi=
er_call_chain(PM_POST_SUSPEND).
>> If led brightness control depends on other device/hardware (such as I2C)=
, the LED turn off action should be earlier than device suspend. pm_notifie=
r may be a suitable method to turn off LED.
>=20
> OK, so I agree that the most proper fix to the discussed problem would be=
 ignoring brightness setting requests after suspend, as Pavel suggested.
>=20
> led_classdev_suspend() already turns the LED off and
> led_classdev_resume() brings the brightness back.
>=20
> Also led_set_brightness_nosleep() and led_set_brightness_sync() don't pro=
pagate brightness change to the driver if LED_SUSPENDED is set.
>=20
> There are two problems though:
> 1. __led_set_brightness() and __led_set_brightness_blocking() don't
>    check the flag, and they can be called from set_brightness_delayed(),
>    that was already queued at the time of setting LED_SUSPENDED flag.
> 2. LED_SUSPENDED flag is accessed in a non-atomic way.
>=20
> The solution as I see it would be respectively:
> 1. Return from __led_set_brightness() and
>    __led_set_brightness_blocking() if LED_SUSPENDED is set.
> 2. Switch to accessing struct led_classdev's flags with use of
>    bitops. Fortunately those flags are mainly set prior LED class
>    device registration and only LED_SYSFS_DISABLE, LED_SUSPENDED
>    and LED_UNREGISTERING are accessed afterwards, and only in the LED
>    core, so only those places would have to be modified.
>=20
> Best regards,
> Jacek Anaszewski
>=20
>> -----Original Message-----
>> From: Pavel Machek [mailto:pavel@ucw.cz]
>> Sent: Wednesday, June 07, 2017 6:31 PM
>> To: Linus Walleij <linus.walleij@linaro.org>
>> Cc: Bruce Zhang <bo.zhang@nxp.com>; Ulf Hansson=20
>> <ulf.hansson@linaro.org>; linux-arm-kernel@lists.infradead.org; Jacek=20
>> Anaszewski <jacek.anaszewski@gmail.com>; Richard Purdie=20
>> <rpurdie@rpsys.net>; linux-leds@vger.kernel.org
>> Subject: Re: [[PATCH v2]] drivers: leds/trigger: system cannot enter=20
>> suspend
>>
>> Hi!
>>
>> On Wed 2017-06-07 11:46:10, Linus Walleij wrote:
>>> On Wed, Jun 7, 2017 at 9:12 AM, Pavel Machek <pavel@ucw.cz> wrote:
>>>
>>>> Core reason is that 5ab92a7cb is wrong. (Very wrong; it papers over=20
>>>> the issue for one trigger, but we have more than one... Even if=20
>>>> special handling for heartbeat is warranted, that handling would be=20
>>>> "turn the led off" not "unregister the trigger", which is=20
>>>> userland-visible action.)
>>>
>>> OK yeah I guess you're right.
>>>
>>> I just couldn't think about anything better and didn't get any=20
>>> review at the time, so mistakes were made.
>>>
>>>> That one should be reverted, then maybe the driver should be fixed=20
>>>> to turn the led off during suspend.
>>>
>>> Do you mean that the heartbeat trigger driver should be fixed to=20
>>> turn off the LED during sleep?
>>>
>>> That is essentially what I was trying to achieve.
>>
>> I don't think we should be fixing it at trigger level.
>>
>> If userspace keeps blinking using "brightness" attribute, would we like =
the LED to be off during suspend? I think so.
>>
>>> The reason it is done as it is, is that the trigger sets up a timer=20
>>> to do its job, and the timer may trigger between the point you turn=20
>>> off the LED and the system really goes to suspend, again maybe=20
>>> turning the LED on and again leaving the system with a glowing LED at s=
uspend.
>>
>>> The patch also solves the following phenomenon, sorry for not=20
>>> writing in the commit:
>>>
>>> - Turn off LED
>>> - Suspend I2C hardware
>>> - Timer trigger
>>> - Trying to blink the LED using I2C
>>> - Crap in the console about the failed I2C transaction
>>> - Actual suspen happens
>>> - System comes online
>>> - Trying to blink the LED using I2C
>>> - Crap in the console about the failed I2C transaction
>>> - Resume I2C hardware
>>>
>>> It's just very fragile this trigger, turning off the LED from the PM=20
>>> notifier is obviously not enough, we also need to disable the timer,=20
>>> and then take it back online after resume.
>>
>> No, leave the timer alone, and actually leave the trigger alone.
>>
>> Simply make the driver turn the LED off in .suspend() callback, and then=
 ignore further requests until .resume(). That will get rid of power drain =
_and_ "failed I2C transaction" messages, right?
>>
>> (Actually, I tested with the heartbeat trigger, and it is not re-install=
ed after resume. Another reason to revert the patch).
>>
>> Thanks,
>>
>> 									Pavel
>> --
>> (english) http://www.livejournal.com/~pavelmachek
>> (cesky, pictures)
>> http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
>>
>=20
>=20
