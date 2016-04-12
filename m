From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: Re: [PATCH 2/2] leds: trigger: Introduce a MTD (NAND/NOR) trigger
Date: Tue, 12 Apr 2016 16:35:43 -0300
Message-ID: <CAAEAJfA38ykPJb4yvs75ZqkQNkDJm4OrvW=f=wq2KZ7P9nh-PQ@mail.gmail.com>
References: <1460478395-25925-1-git-send-email-ezequiel@vanguardiasur.com.ar>
	<1460478395-25925-3-git-send-email-ezequiel@vanguardiasur.com.ar>
	<20160412202732.30d291c2@bbrezillon>
	<CAAEAJfBay646E3e3yX0aFpeXMHA=CruU7oQkJ_wAK4GsuHA-TQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f42.google.com ([74.125.82.42]:37361 "EHLO
	mail-wm0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751981AbcDLTfo convert rfc822-to-8bit (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 12 Apr 2016 15:35:44 -0400
Received: by mail-wm0-f42.google.com with SMTP id n3so41546014wmn.0
        for <linux-leds@vger.kernel.org>; Tue, 12 Apr 2016 12:35:44 -0700 (PDT)
In-Reply-To: <CAAEAJfBay646E3e3yX0aFpeXMHA=CruU7oQkJ_wAK4GsuHA-TQ@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, Brian Norris <computersforpeace@gmail.com>, Jacek Anaszewski <j.anaszewski@samsung.com>

On 12 April 2016 at 15:40, Ezequiel Garcia
<ezequiel@vanguardiasur.com.ar> wrote:
> On 12 April 2016 at 15:27, Boris Brezillon
> <boris.brezillon@free-electrons.com> wrote:
>> Hi Ezequiel,
>>
>> On Tue, 12 Apr 2016 13:26:35 -0300
>> Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> wrote:
>>
>>> This commit introduces a MTD trigger for flash (NAND/NOR) device
>>> activity. The implementation is copied from IDE disk.
>>>
>>> This deprecates the "nand-disk" LED trigger, but for backwards
>>> compatibility, we still keep the "nand-disk" trigger around.
>>>
>>> The motivation for deprecating the "nand-disk" LED trigger is that
>>> it only works for NAND drivers, whereas the "mtd" LED trigger
>>> is more generic (in fact, "nand-disk" currently only works for
>>> certain NAND drivers).
>>>
>>> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
>>> ---
>>>  drivers/leds/trigger/Kconfig       |  8 +++++++
>>>  drivers/leds/trigger/Makefile      |  1 +
>>>  drivers/leds/trigger/ledtrig-mtd.c | 49 ++++++++++++++++++++++++++=
++++++++++++
>>>  drivers/mtd/mtdcore.c              |  7 ++++++
>>>  drivers/mtd/nand/nand_base.c       | 29 +---------------------
>>>  include/linux/leds.h               |  6 +++++
>>
>> I'd suggest splitting this patch in 2, one adding ledtrig-mtd code, =
and
>> another one make use of ledtrig_mtd_activity() and removing
>> nand-trigger code.
>>
>
> Sure, that sounds good.
>

One comment about the above: notice that if we split in two patches
as  you suggest, we would create a dependency between patches.

I don't have any problem doing this, but it sounds like it might make
maintainers
life harder.
--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
