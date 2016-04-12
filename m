From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH 2/2] leds: trigger: Introduce a MTD (NAND/NOR) trigger
Date: Tue, 12 Apr 2016 21:11:30 +0200
Message-ID: <20160412211130.39dabeec@bbrezillon>
References: <1460478395-25925-1-git-send-email-ezequiel@vanguardiasur.com.ar>
	<1460478395-25925-3-git-send-email-ezequiel@vanguardiasur.com.ar>
	<20160412202732.30d291c2@bbrezillon>
	<CAAEAJfBay646E3e3yX0aFpeXMHA=CruU7oQkJ_wAK4GsuHA-TQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from down.free-electrons.com ([37.187.137.238]:46266 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S965342AbcDLTLe (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 12 Apr 2016 15:11:34 -0400
In-Reply-To: <CAAEAJfBay646E3e3yX0aFpeXMHA=CruU7oQkJ_wAK4GsuHA-TQ@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, Brian Norris <computersforpeace@gmail.com>, Jacek Anaszewski <j.anaszewski@samsung.com>

On Tue, 12 Apr 2016 15:40:17 -0300
Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> wrote:

> On 12 April 2016 at 15:27, Boris Brezillon
> <boris.brezillon@free-electrons.com> wrote:
> > Hi Ezequiel,
> >
> > On Tue, 12 Apr 2016 13:26:35 -0300
> > Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> wrote:
> >
> >> This commit introduces a MTD trigger for flash (NAND/NOR) device
> >> activity. The implementation is copied from IDE disk.
> >>
> >> This deprecates the "nand-disk" LED trigger, but for backwards
> >> compatibility, we still keep the "nand-disk" trigger around.
> >>
> >> The motivation for deprecating the "nand-disk" LED trigger is that
> >> it only works for NAND drivers, whereas the "mtd" LED trigger
> >> is more generic (in fact, "nand-disk" currently only works for
> >> certain NAND drivers).
> >>
> >> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> >> ---
> >>  drivers/leds/trigger/Kconfig       |  8 +++++++
> >>  drivers/leds/trigger/Makefile      |  1 +
> >>  drivers/leds/trigger/ledtrig-mtd.c | 49 ++++++++++++++++++++++++++++++++++++++
> >>  drivers/mtd/mtdcore.c              |  7 ++++++
> >>  drivers/mtd/nand/nand_base.c       | 29 +---------------------
> >>  include/linux/leds.h               |  6 +++++
> >
> > I'd suggest splitting this patch in 2, one adding ledtrig-mtd code, and
> > another one make use of ledtrig_mtd_activity() and removing
> > nand-trigger code.
> >
> 
> Sure, that sounds good.
> 
> > IMHO, we should also factorize ledtrig-ide and ledtrig-mtd code
> > (after all, you just copied the implementation from ledtrig-ide).
> > How about renaming the ledtrig-ide into ledtrig-storage and
> > ledtrig_ide_activity() into ledtrig_storage_activity()?
> >
> > You can then add a trigger named "storage" in addition to the existing
> > "nand-disk" and "ide-disk" ones.
> >
> 
> I'm not exactly following you: are you suggesting to suggest factorize
> the code, or to meld the two triggers in a single "storage" trigger?
> 
> In the former, the code is so small, that I'm not sure it will be actually
> reduced with some factorization. In the latter, wouldn't we loose
> the capability to trigger on MTD and IDE activity independently?

I was suggesting the latter, but didn't think about this mtd/nand vs ide
distinction. Not sure if this is really important, but it does change
the existing behavior.

Ideally, we should be able to select which device(s) trigger the
blinking, but that's clearly not trivial to implement.

BTW, you're already introducing a change in that non-NAND MTD devices
will now make the led blink even when only 'nand-disk' is set (I don't
think that's a real issue, but it slightly changes the
existing behavior).  


-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
