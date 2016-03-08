From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v2 0/4] leds: Add driver for the ISSI IS31FL32xx family of
 LED controllers
Date: Tue, 08 Mar 2016 10:43:35 +0100
Message-ID: <56DE9EC7.9020600@samsung.com>
References: <1457398636-6485-1-git-send-email-drivshin.allworx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:25676 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932084AbcCHJnk (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 8 Mar 2016 04:43:40 -0500
In-reply-to: <1457398636-6485-1-git-send-email-drivshin.allworx@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: "David Rivshin (Allworx)" <drivshin.allworx@gmail.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Stefan Wahren <stefan.wahren@i2se.com>, linux-kernel@vger.kernel.org

Hi David,

Thanks for posting the final version. Very nice driver.
Applied whole series, after dropping leds-sn3218 with its
DT bindings. Stefan, thanks for testing the driver on the
Si-En hardware.

Thanks,
Jacek Anaszewski

On 03/08/2016 01:57 AM, David Rivshin (Allworx) wrote:
> From: David Rivshin <drivshin@allworx.com>
>
> This series adds support for the ISSI IS31FL32xx family of I2C LED
> controllers. Since the IS31FL3218/3216 are actually the same devices as
> the SN3218/3216, adds their compatible strings as aliases.
>
> As requested, this series is based on the current linux-leds/for-next, minus
> patch 2 and 3 of the standalone sn3218 driver. As such, it will not directly
> apply to the current linux-next without minor merges in the leds Kconfig
> and Makefile. This will apply cleanly to v4.5-rc7, albeit with a compiler
> warning in patch 3 (which is fixed elsewhere in linux-next).
>
> Changes from v1 [1]:
>   - swapped node name and label in binding example
>   - removed line stating filename from file header comment of is31fl32xx.c
>   - dropped #includes for err.h and of_platform.h
>   - added #includes for device.h, of.h, and of_device.h
>   - patch 4 no longer removes leds-sn3218, as that will be done separately
>   - patch 4 commit log no longer references leds-sn3218 driver
>   - added Rob's acks for patches 1, 2, and 4
>   - added Tested-By from Stefan (for SN3218)
>
> Changes from RFC [2]:
>   - Removed max-brightness DT property.
>   - Added #address-cells and #size-cells properties to the example DT.
>   - Refer to these devices as "LED controllers" in Kconfig.
>   - Removed redundant last sentence from Kconfig entry
>   - Removed unnecessary debug code.
>   - Do not set led_classdev.brightness to 0 explicitly, as it is
>     already initialized to 0 by devm_kzalloc().
>   - Used of_property_read_string() instead of of_get_property().
>   - Fail immediately on DT parsing error in a child node, rather than
>     continuing on with the non-faulty ones.
>   - Added additional comments for some things that might be non-obvious.
>   - Added constants for the location of the SSD bit in the SHUTDOWN
>     register, and the 3216's CONFIG register.
>   - Added special sw_shutdown_func for the 3216 device, as that bit
>     is in a different register, at a different position, and has reverse
>     polarity compared to all the other devices.
>   - Refactored is31fl32xx_init_regs() to separate out some logic into
>     is31fl32xx_reset_regs() and is31fl32xx_software_shutdown().
>   - Added 4th patch to replace the now-redundant leds-sn3218.
>
> [1] https://lkml.org/lkml/2016/3/2/1004
> [2] http://www.spinics.net/lists/linux-leds/msg05564.html
>
> David Rivshin (4):
>    DT: Add vendor prefix for Integrated Silicon Solutions Inc.
>    DT: leds: Add binding for the ISSI IS31FL32xx family of LED
>      controllers
>    leds: Add driver for the ISSI IS31FL32xx family of LED controllers
>    leds: Add SN3218 and SN3216 support to the IS31FL32XX driver
>
>   .../devicetree/bindings/leds/leds-is31fl32xx.txt   |  52 +++
>   .../devicetree/bindings/vendor-prefixes.txt        |   1 +
>   drivers/leds/Kconfig                               |   8 +
>   drivers/leds/Makefile                              |   1 +
>   drivers/leds/leds-is31fl32xx.c                     | 508 +++++++++++++++++++++
>   5 files changed, 570 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt
>   create mode 100644 drivers/leds/leds-is31fl32xx.c
>
