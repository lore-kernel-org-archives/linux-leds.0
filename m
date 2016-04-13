From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v2 0/4] LED trigger on MTD activity
Date: Wed, 13 Apr 2016 10:36:22 +0200
Message-ID: <570E0506.4040705@samsung.com>
References: <1460494002-8578-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:19949 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754681AbcDMIg1 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 13 Apr 2016 04:36:27 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O5K00IDRD8O7L00@mailout1.w1.samsung.com> for
 linux-leds@vger.kernel.org; Wed, 13 Apr 2016 09:36:24 +0100 (BST)
In-reply-to: <1460494002-8578-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: linux-mtd@lists.infradead.org, linux-leds@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <boris.brezillon@free-electrons.com>

Hi Ezequiel,

Thanks for the update. From the previous discussion I've inferred
that it has been agreed on the whole patch to go through the LED tree.

Applied whole patch set to the for-next branch of linux-leds.git,
with acks from Boris, then.

Thanks,
Jacek Anaszewski

On 04/12/2016 10:46 PM, Ezequiel Garcia wrote:
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
>
> Changes from v1:
>
>    * Split the patches, suggested by Boris.
>
> Feedback is welcome!
>
> [1] http://www.spinics.net/lists/linux-leds/msg05906.html
>
> Ezequiel Garcia (4):
>    mtd: Uninline mtd_write_oob and move it to mtdcore.c
>    leds: trigger: Introduce a MTD (NAND/NOR) trigger
>    mtd: nand: Remove the "nand-disk" LED trigger
>    mtd: Hook I/O activity to the MTD LED trigger
>
>   drivers/leds/trigger/Kconfig       |  8 +++++++
>   drivers/leds/trigger/Makefile      |  1 +
>   drivers/leds/trigger/ledtrig-mtd.c | 45 ++++++++++++++++++++++++++++++++++++++
>   drivers/mtd/mtdcore.c              | 19 ++++++++++++++++
>   drivers/mtd/nand/nand_base.c       | 29 +-----------------------
>   include/linux/leds.h               |  6 +++++
>   include/linux/mtd/mtd.h            | 12 +---------
>   7 files changed, 81 insertions(+), 39 deletions(-)
>   create mode 100644 drivers/leds/trigger/ledtrig-mtd.c
>
