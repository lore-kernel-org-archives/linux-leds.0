From: Milo Kim <milo.kim@ti.com>
Subject: Re: [PATCH v2 9/9] regulator: add LM363X driver
Date: Thu, 14 Jan 2016 16:56:03 +0900
Message-ID: <56975493.7050900@ti.com>
References: <1448521025-2796-1-git-send-email-milo.kim@ti.com>
 <1448521025-2796-10-git-send-email-milo.kim@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from arroyo.ext.ti.com ([192.94.94.40]:58413 "EHLO arroyo.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750786AbcANH4O (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Thu, 14 Jan 2016 02:56:14 -0500
In-Reply-To: <1448521025-2796-10-git-send-email-milo.kim@ti.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: lee.jones@linaro.org, broonie@kernel.org
Cc: robh+dt@kernel.org, j.anaszewski@samsung.com, devicetree@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org

Lee and Mark,

On 11/26/2015 03:57 PM, Milo Kim wrote:
> LM363X regulator driver supports LM3631 and LM3632.
> LM3631 has 5 regulators. LM3632 provides 3 regulators.
> One boost output and LDOs are used for the display module.
> Boost voltage is configurable but always on.
> Supported operations for LDOs are enabled/disabled and voltage change.
>
> Two LDOs of LM3632 can be controlled by external pins.
> Those are configured through the DT properties.
>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Jacek Anaszewski <j.anaszewski@samsung.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-leds@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Milo Kim <milo.kim@ti.com>

I'm creating the 3rd patch-set but this driver is found in linux-next 
tree. And Axel Lin has patched this driver. In my patch v3, modified 
part is DT properties for external enable pins. (Use '-gpios' instead of 
'-gpio')

diff --git a/drivers/regulator/lm363x-regulator.c 
b/drivers/regulator/lm363x-regulator.c
index f53e633..4a11290 100644
--- a/drivers/regulator/lm363x-regulator.c
+++ b/drivers/regulator/lm363x-regulator.c
@@ -227,9 +227,9 @@ static int 
lm363x_regulator_of_get_enable_gpio(struct device_node *np, int id)
*/
switch (id) {
case LM3632_LDO_POS:
- return of_get_named_gpio(np, "ti,lcm-en1-gpio", 0);
+ return of_get_named_gpio(np, "ti,lcm-en1-gpios", 0);
case LM3632_LDO_NEG:
- return of_get_named_gpio(np, "ti,lcm-en2-gpio", 0);
+ return of_get_named_gpio(np, "ti,lcm-en2-gpios", 0);
default:
return -EINVAL;
}

So, I'd like to know which is better for you.
a) Create a patch based on linux-next tree (the above patch)
Or
b) Re-generate a patch based on linux-mfd tree

Best regards,
Milo
