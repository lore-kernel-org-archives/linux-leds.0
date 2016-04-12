From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH v2 0/4] LED trigger on MTD activity
Date: Tue, 12 Apr 2016 22:58:48 +0200
Message-ID: <20160412225848.7c386393@bbrezillon>
References: <1460494002-8578-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from down.free-electrons.com ([37.187.137.238]:47956 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1756364AbcDLU64 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 12 Apr 2016 16:58:56 -0400
In-Reply-To: <1460494002-8578-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: linux-mtd@lists.infradead.org, linux-leds@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>, Jacek Anaszewski <j.anaszewski@samsung.com>

On Tue, 12 Apr 2016 17:46:38 -0300
Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> wrote:

> After our recent discussion [1], here's a proper patchset.
> 
> The first patch is a minor cleanup which moves mtd_write_oob
> out of mtd.h header.
> 
> The second patch introduces the LED MTD trigger.
> 
> The third patch removes the "nand-disk" LED trigger
> from the NAND core.
> 
> The fourth patch completes the series by calling ledtrig_mtd_activity
> on all MTD I/O activity paths.

LGTM.

Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>

> 
> Changes from v1:
> 
>   * Split the patches, suggested by Boris.
> 
> Feedback is welcome!
> 
> [1] http://www.spinics.net/lists/linux-leds/msg05906.html
> 
> Ezequiel Garcia (4):
>   mtd: Uninline mtd_write_oob and move it to mtdcore.c
>   leds: trigger: Introduce a MTD (NAND/NOR) trigger
>   mtd: nand: Remove the "nand-disk" LED trigger
>   mtd: Hook I/O activity to the MTD LED trigger
> 
>  drivers/leds/trigger/Kconfig       |  8 +++++++
>  drivers/leds/trigger/Makefile      |  1 +
>  drivers/leds/trigger/ledtrig-mtd.c | 45 ++++++++++++++++++++++++++++++++++++++
>  drivers/mtd/mtdcore.c              | 19 ++++++++++++++++
>  drivers/mtd/nand/nand_base.c       | 29 +-----------------------
>  include/linux/leds.h               |  6 +++++
>  include/linux/mtd/mtd.h            | 12 +---------
>  7 files changed, 81 insertions(+), 39 deletions(-)
>  create mode 100644 drivers/leds/trigger/ledtrig-mtd.c
> 



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
