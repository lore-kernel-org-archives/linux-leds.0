From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH 2/2] leds: trigger: Introduce a MTD (NAND/NOR) trigger
Date: Tue, 12 Apr 2016 20:27:32 +0200
Message-ID: <20160412202732.30d291c2@bbrezillon>
References: <1460478395-25925-1-git-send-email-ezequiel@vanguardiasur.com.ar>
	<1460478395-25925-3-git-send-email-ezequiel@vanguardiasur.com.ar>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from down.free-electrons.com ([37.187.137.238]:45866 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S932222AbcDLS1q (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 12 Apr 2016 14:27:46 -0400
In-Reply-To: <1460478395-25925-3-git-send-email-ezequiel@vanguardiasur.com.ar>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: linux-mtd@lists.infradead.org, linux-leds@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>, Jacek Anaszewski <j.anaszewski@samsung.com>

Hi Ezequiel,

On Tue, 12 Apr 2016 13:26:35 -0300
Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> wrote:

> This commit introduces a MTD trigger for flash (NAND/NOR) device
> activity. The implementation is copied from IDE disk.
> 
> This deprecates the "nand-disk" LED trigger, but for backwards
> compatibility, we still keep the "nand-disk" trigger around.
> 
> The motivation for deprecating the "nand-disk" LED trigger is that
> it only works for NAND drivers, whereas the "mtd" LED trigger
> is more generic (in fact, "nand-disk" currently only works for
> certain NAND drivers).
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> ---
>  drivers/leds/trigger/Kconfig       |  8 +++++++
>  drivers/leds/trigger/Makefile      |  1 +
>  drivers/leds/trigger/ledtrig-mtd.c | 49 ++++++++++++++++++++++++++++++++++++++
>  drivers/mtd/mtdcore.c              |  7 ++++++
>  drivers/mtd/nand/nand_base.c       | 29 +---------------------
>  include/linux/leds.h               |  6 +++++

I'd suggest splitting this patch in 2, one adding ledtrig-mtd code, and
another one make use of ledtrig_mtd_activity() and removing
nand-trigger code.

IMHO, we should also factorize ledtrig-ide and ledtrig-mtd code
(after all, you just copied the implementation from ledtrig-ide).
How about renaming the ledtrig-ide into ledtrig-storage and
ledtrig_ide_activity() into ledtrig_storage_activity()?

You can then add a trigger named "storage" in addition to the existing
"nand-disk" and "ide-disk" ones.

Anyway, this is just a suggestion, and I let leds maintainers decide
whether this is appropriate or not.

Best Regards,

Boris

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
