From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH 4/4] leds: lm3532: Introduce the lm3532 LED driver
Date: Mon, 25 Mar 2019 11:01:18 -0500
Message-ID: <044f67e7-e196-a5b9-728b-a7c5f283f56f@ti.com>
References: <20190321142838.22985-1-dmurphy@ti.com>
 <20190321142838.22985-4-dmurphy@ti.com> <20190322221654.GG19425@atomide.com>
 <dc24b66c-658e-41aa-c869-42c4a7e812a8@ti.com>
 <20190325145444.GK19425@atomide.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190325145444.GK19425@atomide.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Tony Lindgren <tony@atomide.com>
Cc: robh+dt@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz, lee.jones@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Sebastian Reichel <sre@kernel.org>
List-Id: linux-leds@vger.kernel.org

On 3/25/19 9:54 AM, Tony Lindgren wrote:
> * Dan Murphy <dmurphy@ti.com> [190325 12:36]:
>> On 3/22/19 5:16 PM, Tony Lindgren wrote:
>>> I can control the backlight brightness just fine via /sys, and
>>> backlight shows up as the trigger in /sys/class/leds/lm3532:backlight,
>>> but /sys/class/backlight is empty and looks like drm can't find it.
>>>
>>> Do I need to enable some additional driver(s) to get this to work
>>> with the drm driver?
>>>
>>
>> Can you dump or point to the defconfig?
> 
> This is just with the omap2plus_defconfig as in the droid4-pending-v5.0
> test branch below [0]. That branch has Sebastian's drm patches. The
> branch also has the older ti-lmu patches that I reverted for testing
> before applying your new series and enabling it in .config.
> 
> The drm driver (drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c) just
> does:
> 
> backlight = of_parse_phandle(node, "backlight", 0);
> ...
> 
> That should still work the same, right?

Yes it should still work the same.
I did not change the node name.
So the DRM driver should find the node.

Dan

> 
> Regards,
> 
> Tony
> 
> 
> [0] https://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap.git/log/?h=droid4-pending-v5.0
> 


-- 
------------------
Dan Murphy
