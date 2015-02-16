From: "Imre Kaloz" <kaloz@openwrt.org>
Subject: Re: [PATCHv6 2/2] leds: tlc591xx: Driver for the TI 8/16 Channel i2c
 LED driver
Date: Mon, 16 Feb 2015 15:11:57 +0100
Message-ID: <op.xt5lp7ix2s3iss@ecaz>
References: <1422367161-16487-1-git-send-email-andrew@lunn.ch>
 <1422367161-16487-3-git-send-email-andrew@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from arrakis.dune.hu ([78.24.191.176]:56842 "EHLO arrakis.dune.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755684AbbBPOMA (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Mon, 16 Feb 2015 09:12:00 -0500
In-Reply-To: <1422367161-16487-3-git-send-email-andrew@lunn.ch>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: cooloney@gmail.com, rpurdie@rpsys.net, Andrew Lunn <andrew@lunn.ch>
Cc: devicetree@vger.kernel.org, vigneshr@ti.com, Matthew.Fatheree@belkin.com, tomi.valkeinen@ti.com, linux-leds@vger.kernel.org, linux ARM <linux-arm-kernel@lists.infradead.org>

Hi Andrew,

On Tue, 27 Jan 2015 14:59:21 +0100, Andrew Lunn <andrew@lunn.ch> wrote:

> The TLC59116 is an I2C bus controlled 16-channel LED driver.  The
> TLC59108 is an I2C bus controlled 8-channel LED driver, which is very
> similar to the TLC59116. Each LED output has its own 8-bit
> fixed-frequency PWM controller to control the brightness of the LED.
> The LEDs can also be fixed off and on, making them suitable for use as
> GPOs.
>
> This is based on a driver from Belkin, but has been extensively
> rewritten and extended to support both 08 and 16 versions.
>
> Signed-off-by: Andrew Lunn <andrew@lunn.ch>
> Cc: Matthew.Fatheree@belkin.com

I've tested the driver on the Mamba (WRT1900AC) and it has been integrated  
to OpenWrt trunk for a while now, and no issues has been reported by the  
community either.

Please feel free to add Tested-by: Imre Kaloz <kaloz@openwrt.org>.


Thanks,

Imre
