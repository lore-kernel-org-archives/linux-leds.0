From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH 4/4] leds: lm3532: Introduce the lm3532 LED driver
Date: Wed, 3 Apr 2019 17:09:09 -0700
Message-ID: <20190404000909.GY49658@atomide.com>
References: <20190321142838.22985-1-dmurphy@ti.com>
 <20190321142838.22985-4-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190321142838.22985-4-dmurphy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>
Cc: robh+dt@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz, lee.jones@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Sebastian Reichel <sre@kernel.org>
List-Id: linux-leds@vger.kernel.org

* Dan Murphy <dmurphy@ti.com> [190321 14:29]:
> Introduce the Texas Instruments LM3532 White LED driver.
> The driver supports ALS configurability or manual brightness
> control.
> 
> The driver also supports associating LED strings with specific
> control banks in a group or as individually controlled strings.

I'm seeing slightly different naming under /sys/class/leds:

lm3532:backlight
lm3532:platform::kbd_backlight

Not sure if this is correct with the the "platform" and
"::" there for the kbd_backlight?

With the dts change I posted, I've tested this with
linux-next and Sebastian's DSI command mode patches
"[PATCHv6 0/4] omapdrm: DSI command mode panel support".

So feel free to add:

Tested-by: Tony Lindgren <tony@atomide.com>
