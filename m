From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: Re: nand-disk LED trigger: to remove, or not to remove
Date: Fri, 8 Apr 2016 00:02:48 -0300
Message-ID: <CAAEAJfC2Mdq9_jKhVuyvO809V4B5Oo3h5uyBvuAs=xkBwpDU8A@mail.gmail.com>
References: <20160405195120.GA6111@laptop.cereza>
	<20160408023232.16c1fe32@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f44.google.com ([74.125.82.44]:34308 "EHLO
	mail-wm0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752046AbcDHDCy convert rfc822-to-8bit (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 7 Apr 2016 23:02:54 -0400
Received: by mail-wm0-f44.google.com with SMTP id l6so48027385wml.1
        for <linux-leds@vger.kernel.org>; Thu, 07 Apr 2016 20:02:54 -0700 (PDT)
In-Reply-To: <20160408023232.16c1fe32@bbrezillon>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Brian Norris <computersforpeace@gmail.com>, Jacek Anaszewski <j.anaszewski@samsung.com>, Linux LED Subsystem <linux-leds@vger.kernel.org>

On 7 April 2016 at 21:32, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> Hi Ezequiel,
>
> On Tue, 5 Apr 2016 16:51:20 -0300
> Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> wrote:
>
>> Due to the way the 'nand-disk' LED trigger is implemented,
>> it currently does not work correctly for all NAND drivers.
>>
>> This is somewhat related to an old thread, where we discussed
>> the addition of an "mtd" LED trigger. See:
>>
>>   http://www.spinics.net/lists/linux-leds/msg01181.html
>>
>> My question is:
>>
>>  * given that nobody has complained about "nand-disk"
>>    working on just some NAND drivers, and...
>>  * given that nobody has complained (except that 2013 patch)
>>    about lacking a generic MTD LED trigger...
>>
>> Does it make any sense to have such a trigger at all?
>> In other words, should we simply get rid of "nand-disk" trigger?
>>
>> In case the answer is "We want to keep some LED trigger",
>> then here's a patch for you to f=CC=B6l=CC=B6a=CC=B6m=CC=B6e=CC=B6  =
review:
>
> I agree, we should either drop the whole thing or make it available t=
o
> all MTD devices. And since people might use that, I'd say we should
> make it available to all MTD devices.
>

Alright then, let's do it.

>>
>> From 88c7102bb67056b443da323bd3e28b60aca948a2 Mon Sep 17 00:00:00 20=
01
>> From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
>> Date: Sat, 2 Apr 2016 18:35:50 -0300
>> Subject: [PATCH] leds: trigger: Introduce a MTD (NAND/NOR) trigger
>>
>> This commit introduces a MTD trigger for flash (NAND/NOR) device
>> activity. The implementation is copied from IDE disk.
>>
>> This deprecates the "nand-disk" LED trigger, but for backwards
>> compatibility, we still keep the "nand-disk" trigger around.
>>
>> The motivation for deprecating the "nand-disk" LED trigger is that
>> it only works for NAND drivers, whereas the "mtd" LED trigger
>> is more generic (in fact, "nand-disk" currently only works for
>> certain NAND drivers).
>>
>>   TODO: Measure how the trigger affects MTD I/O performance.
>>   It should be cheap because the blink is deferred, but still
>>   it makes sense to provide some hard numbers.
>
> Hm, I don't expect that much overhead from this feature, and if peopl=
e
> really want to remove all the overhead, they can just disable
> LEDS_TRIGGER_MTD.
>
>>
>> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
>
> Few minor comments below, otherwise it looks good to me.
>
>> ---
>>  drivers/leds/trigger/Kconfig       |  8 +++++++
>>  drivers/leds/trigger/Makefile      |  1 +
>>  drivers/leds/trigger/ledtrig-mtd.c | 48 +++++++++++++++++++++++++++=
+++++++++++
>>  drivers/mtd/mtdcore.c              |  4 ++++
>>  drivers/mtd/nand/nand_base.c       | 29 +----------------------
>>  include/linux/leds.h               |  6 +++++
>>  6 files changed, 68 insertions(+), 28 deletions(-)
>>  create mode 100644 drivers/leds/trigger/ledtrig-mtd.c
>>
>> diff --git a/drivers/leds/trigger/Kconfig b/drivers/leds/trigger/Kco=
nfig
>> index 554f5bfbeced..b7044a0530c7 100644
>> --- a/drivers/leds/trigger/Kconfig
>> +++ b/drivers/leds/trigger/Kconfig
>> @@ -115,4 +115,12 @@ config LEDS_TRIGGER_PANIC
>>         This allows LEDs to be configured to blink on a kernel panic=
=2E
>>         If unsure, say Y.
>>
>> +config LEDS_TRIGGER_MTD
>> +     bool "LED MTD (NAND/NOR) Trigger"
>> +     depends on MTD
>> +     depends on LEDS_TRIGGERS
>> +     help
>> +       This allows LEDs to be controlled by MTD activity.
>> +       If unsure, say N.
>> +
>>  endif # LEDS_TRIGGERS
>> diff --git a/drivers/leds/trigger/Makefile b/drivers/leds/trigger/Ma=
kefile
>> index 547bf5c80e52..80e32add3b07 100644
>> --- a/drivers/leds/trigger/Makefile
>> +++ b/drivers/leds/trigger/Makefile
>> @@ -9,3 +9,4 @@ obj-$(CONFIG_LEDS_TRIGGER_DEFAULT_ON) +=3D ledtrig-d=
efault-on.o
>>  obj-$(CONFIG_LEDS_TRIGGER_TRANSIENT) +=3D ledtrig-transient.o
>>  obj-$(CONFIG_LEDS_TRIGGER_CAMERA)    +=3D ledtrig-camera.o
>>  obj-$(CONFIG_LEDS_TRIGGER_PANIC)     +=3D ledtrig-panic.o
>> +obj-$(CONFIG_LEDS_TRIGGER_MTD)               +=3D ledtrig-mtd.o
>> diff --git a/drivers/leds/trigger/ledtrig-mtd.c b/drivers/leds/trigg=
er/ledtrig-mtd.c
>> new file mode 100644
>> index 000000000000..badf72aa1f5f
>> --- /dev/null
>> +++ b/drivers/leds/trigger/ledtrig-mtd.c
>> @@ -0,0 +1,48 @@
>> +/*
>> + * LED MTD trigger
>> + *
>> + * Copyright 2016 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
>> + *
>> + * Based on LED IDE-Disk Activity Trigger
>> + *
>> + * Copyright 2006 Openedhand Ltd.
>> + *
>> + * Author: Richard Purdie <rpurdie@openedhand.com>
>> + *
>> + * This program is free software; you can redistribute it and/or mo=
dify
>> + * it under the terms of the GNU General Public License version 2 a=
s
>> + * published by the Free Software Foundation.
>> + *
>> + */
>> +
>> +#include <linux/kernel.h>
>> +#include <linux/init.h>
>> +#include <linux/leds.h>
>> +
>> +#define BLINK_DELAY 30
>> +
>> +DEFINE_LED_TRIGGER(ledtrig_mtd);
>> +DEFINE_LED_TRIGGER(ledtrig_nand);
>> +static unsigned long blink_delay =3D BLINK_DELAY;
>> +
>> +void ledtrig_mtd_activity(void)
>> +{
>> +     led_trigger_blink_oneshot(ledtrig_nand,
>> +                               &blink_delay, &blink_delay, 0);
>> +     led_trigger_blink_oneshot(ledtrig_mtd,
>> +                               &blink_delay, &blink_delay, 0);
>
> I'd recommend using a local variable for blink_delay, since this is
> something that seems to be modified by led_trigger_blink_oneshot().
> I don't know what led_trigger_blink_oneshot() does with those
> pointers, but making it a global variable seems dangerous to me (in
> case of concurrent calls to ledtrig_mtd_activity())
>

OK, I'll revisit this. FWIW, it's copy-pasted from the ide-disk.

>> +}
>> +EXPORT_SYMBOL(ledtrig_mtd_activity);
>
> [...]
>
>> diff --git a/include/linux/leds.h b/include/linux/leds.h
>> index f203a8f89d30..19eb10278bea 100644
>> --- a/include/linux/leds.h
>> +++ b/include/linux/leds.h
>> @@ -329,6 +329,12 @@ extern void ledtrig_ide_activity(void);
>>  static inline void ledtrig_ide_activity(void) {}
>>  #endif
>>
>> +#ifdef CONFIG_LEDS_TRIGGER_MTD
>> +extern void ledtrig_mtd_activity(void);
>
> You can drop the 'extern' specifier here.
>

I know, but it's declared like this in the leds.h header,
and I'm a big fan of code consistency :-)
--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
