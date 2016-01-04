From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: Chromebook Keyboard LEDs
Date: Mon, 04 Jan 2016 10:24:15 +0100
Message-ID: <568A3A3F.6030700@samsung.com>
References: <1451771642.25561.10.camel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:19067 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751340AbcADJYT (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 4 Jan 2016 04:24:19 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O0F001CD8SHOD50@mailout1.w1.samsung.com> for
 linux-leds@vger.kernel.org; Mon, 04 Jan 2016 09:24:17 +0000 (GMT)
In-reply-to: <1451771642.25561.10.camel@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Evan McClain <aeroevan@gmail.com>
Cc: linux-leds@vger.kernel.org

Hi Evan,

Please submit the driver officially, according to the rules
stated in the Documentation/SubmittingPatches, so that we could
discuss it. You'll also need to add your Signed-off-by tag.

On 01/02/2016 10:54 PM, Evan McClain wrote:
> Hi list,
>
> I'm not sure how kosher it is to submit changes that I didn't author
> (cherry-picks from the chromium kernel), but since these patches are a
> few years old and having support in the mainline kernel would be nice I
> thought I'd give it a shot.
>
> I have tested on my Chromebook Pixel 2 (samus) which runs fine but is
> missing a few drivers (this and ASoC, but ASoC isn't as easy).
>
>
> The following changes since commit
> 376886d44f4cba72c4942aa1ac834ba00f6f222d:
>
>    leds: bcm6358: remove unneeded busy status check (2015-12-17 09:39:02
> +0100)
>
> are available in the git repository at:
>
>    https://github.com/aeroevan/linux.git for-leds
>
> for you to fetch changes up to
> 589e241e11fa01a5fef59b40c9ad826e11322e4f:
>
>    leds-chromeos-keyboard: Add ACPI _HID probing (2016-01-01 02:04:09
> -0500)
>
> ----------------------------------------------------------------
> Duncan Laurie (1):
>        leds-chromeos-keyboard: Add ACPI _HID probing
>
> Simon Que (3):
>        leds: Add Chrome OS keyboard LEDs driver
>        leds: chromeos keyboard name should contain "kbd_backlight"
>        leds: Fix chromeos keyboard LED suspend behavior
>
>   drivers/leds/Kconfig                  |   7 ++
>   drivers/leds/Makefile                 |   1 +
>   drivers/leds/leds-chromeos-keyboard.c | 127
> ++++++++++++++++++++++++++++++++++
>   3 files changed, 135 insertions(+)
>   create mode 100644 drivers/leds/leds-chromeos-keyboard.c
>
> Thanks
>


-- 
Best Regards,
Jacek Anaszewski
