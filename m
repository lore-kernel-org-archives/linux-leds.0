From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH 2/4] ARM: dts: omap4-droid4: Update backlight dt
 properties
Date: Wed, 3 Apr 2019 17:03:16 -0700
Message-ID: <20190404000316.GV49658@atomide.com>
References: <20190321142838.22985-1-dmurphy@ti.com>
 <20190321142838.22985-2-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190321142838.22985-2-dmurphy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>
Cc: robh+dt@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz, lee.jones@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi,

* Dan Murphy <dmurphy@ti.com> [190321 14:29]:
> Update the properties for the lm3532 device node for droid4.
> With this change the backlight LED string and the keypad
> LED strings will be controlled separately.

We also need the following incremental change to prevent
panel-dsi-cm trying to use of_find_backlight_by_node().
We have ledtrig-backlight use FB_EVENT_BLANK, and I
guess more events can be added there as needed.

There should be no dependency to the driver changes with
this patch, so it's probably best that I queue this dts
patch separately. I'll fold in the following change too
assuming no more comments.

Regards,

Tony

8< -----------------
diff --git a/arch/arm/boot/dts/omap4-droid4-xt894.dts b/arch/arm/boot/dts/omap4-droid4-xt894.dts
--- a/arch/arm/boot/dts/omap4-droid4-xt894.dts
+++ b/arch/arm/boot/dts/omap4-droid4-xt894.dts
@@ -214,7 +214,6 @@
 
 		width-mm = <50>;
 		height-mm = <89>;
-		backlight = <&lcd_backlight>;
 
 		panel-timing {
 			clock-frequency = <0>;		/* Calculated by dsi */
