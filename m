From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH 4/4] leds: lm3532: Introduce the lm3532 LED driver
Date: Fri, 22 Mar 2019 15:16:54 -0700
Message-ID: <20190322221654.GG19425@atomide.com>
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

Hi,

* Dan Murphy <dmurphy@ti.com> [190321 14:29]:
> Introduce the Texas Instruments LM3532 White LED driver.
> The driver supports ALS configurability or manual brightness
> control.
> 
> The driver also supports associating LED strings with specific
> control banks in a group or as individually controlled strings.

Thanks for getting this driver done. I need help a bit using
this though.. What's the glue to the drm driver?

I can control the backlight brightness just fine via /sys, and
backlight shows up as the trigger in /sys/class/leds/lm3532:backlight,
but /sys/class/backlight is empty and looks like drm can't find it.

Do I need to enable some additional driver(s) to get this to work
with the drm driver?

Regards,

Tony
