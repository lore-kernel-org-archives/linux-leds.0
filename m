From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v2 0/4] Allow to use leds-ns2 with n090401 boards
Date: Mon, 13 Jul 2015 14:24:31 +0200
Message-ID: <55A3ADFF.4090500@samsung.com>
References: <1435859803-19583-1-git-send-email-simon.guinot@sequanux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:45611 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751722AbbGMMYf (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 13 Jul 2015 08:24:35 -0400
In-reply-to: <1435859803-19583-1-git-send-email-simon.guinot@sequanux.org>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Simon Guinot <simon.guinot@sequanux.org>
Cc: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@free-electrons.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Vincent Donnefort <vdonnefort@gmail.com>

Hi Simon,

On 07/02/2015 07:56 PM, Simon Guinot wrote:
> Hello,
>
> This patch series allows to use the leds-ns2 driver with the n090401
> boards (Seagate NAS 4-Bay), based on an Armada-370 SoC.
>
> Here is the list changes:
>
> - Allow to configure the LED mode mapping.
> - Handle can_sleep GPIOs. On n090401, the LEDs are connected to an I2C
>    GPIO expander.
> - Make leds-ns2 depends on MACH_ARMADA_370.
>
> Changes for v2:
> - Fix gpio_{get,set}_*_cansleep() usage while holding a spinlock:
>    Holding a spinlock at this places was not needed.
> - Add Acked-by from Jacek Anaszewski for patch 4.
>
> Simon
>
> Simon Guinot (2):
>    leds: leds-ns2: handle can_sleep GPIOs
>    leds: leds-ns2: depends on MACH_ARMADA_370
>
> Vincent Donnefort (2):
>    leds: leds-ns2: move LED modes mapping outside of the driver
>    ARM: Kirkwood: add modes-map property to ns2-leds nodes
>
>   .../devicetree/bindings/leds/leds-ns2.txt          |   9 ++
>   arch/arm/boot/dts/kirkwood-d2net.dts               |   5 +
>   arch/arm/boot/dts/kirkwood-is2.dts                 |   5 +
>   arch/arm/boot/dts/kirkwood-ns2.dts                 |   5 +
>   arch/arm/boot/dts/kirkwood-ns2max.dts              |   5 +
>   arch/arm/boot/dts/kirkwood-ns2mini.dts             |   5 +
>   drivers/leds/Kconfig                               |  12 +-
>   drivers/leds/leds-ns2.c                            | 169 ++++++++++++---------
>   include/dt-bindings/leds/leds-ns2.h                |   8 +
>   include/linux/platform_data/leds-kirkwood-ns2.h    |  14 ++
>   10 files changed, 165 insertions(+), 72 deletions(-)
>   create mode 100644 include/dt-bindings/leds/leds-ns2.h
>

For the whole patch set:

Acked-by: Jacek Anaszewski <j.anaszewski@samsung.com>

-- 
Best Regards,
Jacek Anaszewski
