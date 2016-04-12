From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: Re: [PATCH 2/2] leds: trigger: Introduce a MTD (NAND/NOR) trigger
Date: Tue, 12 Apr 2016 15:40:17 -0300
Message-ID: <CAAEAJfBay646E3e3yX0aFpeXMHA=CruU7oQkJ_wAK4GsuHA-TQ@mail.gmail.com>
References: <1460478395-25925-1-git-send-email-ezequiel@vanguardiasur.com.ar>
	<1460478395-25925-3-git-send-email-ezequiel@vanguardiasur.com.ar>
	<20160412202732.30d291c2@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f48.google.com ([74.125.82.48]:35767 "EHLO
	mail-wm0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932831AbcDLSkT convert rfc822-to-8bit (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 12 Apr 2016 14:40:19 -0400
Received: by mail-wm0-f48.google.com with SMTP id a140so64896460wma.0
        for <linux-leds@vger.kernel.org>; Tue, 12 Apr 2016 11:40:18 -0700 (PDT)
In-Reply-To: <20160412202732.30d291c2@bbrezillon>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, Brian Norris <computersforpeace@gmail.com>, Jacek Anaszewski <j.anaszewski@samsung.com>

On 12 April 2016 at 15:27, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> Hi Ezequiel,
>
> On Tue, 12 Apr 2016 13:26:35 -0300
> Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> wrote:
>
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
>> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
>> ---
>>  drivers/leds/trigger/Kconfig       |  8 +++++++
>>  drivers/leds/trigger/Makefile      |  1 +
>>  drivers/leds/trigger/ledtrig-mtd.c | 49 +++++++++++++++++++++++++++=
+++++++++++
>>  drivers/mtd/mtdcore.c              |  7 ++++++
>>  drivers/mtd/nand/nand_base.c       | 29 +---------------------
>>  include/linux/leds.h               |  6 +++++
>
> I'd suggest splitting this patch in 2, one adding ledtrig-mtd code, a=
nd
> another one make use of ledtrig_mtd_activity() and removing
> nand-trigger code.
>

Sure, that sounds good.

> IMHO, we should also factorize ledtrig-ide and ledtrig-mtd code
> (after all, you just copied the implementation from ledtrig-ide).
> How about renaming the ledtrig-ide into ledtrig-storage and
> ledtrig_ide_activity() into ledtrig_storage_activity()?
>
> You can then add a trigger named "storage" in addition to the existin=
g
> "nand-disk" and "ide-disk" ones.
>

I'm not exactly following you: are you suggesting to suggest factorize
the code, or to meld the two triggers in a single "storage" trigger?

In the former, the code is so small, that I'm not sure it will be actua=
lly
reduced with some factorization. In the latter, wouldn't we loose
the capability to trigger on MTD and IDE activity independently?

> Anyway, this is just a suggestion, and I let leds maintainers decide
> whether this is appropriate or not.
>

Thanks for the reviewing Boris!

> Best Regards,
>
> Boris
>
> --
> Boris Brezillon, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com

--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
