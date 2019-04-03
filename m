From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH 4/4] leds: lm3532: Introduce the lm3532 LED driver
Date: Wed, 3 Apr 2019 13:06:00 -0700
Message-ID: <20190403200600.GT49658@atomide.com>
References: <20190321142838.22985-1-dmurphy@ti.com>
 <20190321142838.22985-4-dmurphy@ti.com>
 <20190322221654.GG19425@atomide.com>
 <dc24b66c-658e-41aa-c869-42c4a7e812a8@ti.com>
 <20190325145444.GK19425@atomide.com>
 <044f67e7-e196-a5b9-728b-a7c5f283f56f@ti.com>
 <20190328210437.tcojjqynggk72zo2@earth.universe>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190328210437.tcojjqynggk72zo2@earth.universe>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Reichel <sre@kernel.org>
Cc: Dan Murphy <dmurphy@ti.com>, robh+dt@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz, lee.jones@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

* Sebastian Reichel <sre@kernel.org> [190329 05:36]:
> Hi,
> 
> On Mon, Mar 25, 2019 at 11:01:18AM -0500, Dan Murphy wrote:
> > On 3/25/19 9:54 AM, Tony Lindgren wrote:
> > > * Dan Murphy <dmurphy@ti.com> [190325 12:36]:
> > >> On 3/22/19 5:16 PM, Tony Lindgren wrote:
> > >>> I can control the backlight brightness just fine via /sys, and
> > >>> backlight shows up as the trigger in /sys/class/leds/lm3532:backlight,
> > >>> but /sys/class/backlight is empty and looks like drm can't find it.
> > >>>
> > >>> Do I need to enable some additional driver(s) to get this to work
> > >>> with the drm driver?
> > >>>
> > >>
> > >> Can you dump or point to the defconfig?
> > > 
> > > This is just with the omap2plus_defconfig as in the droid4-pending-v5.0
> > > test branch below [0]. That branch has Sebastian's drm patches. The
> > > branch also has the older ti-lmu patches that I reverted for testing
> > > before applying your new series and enabling it in .config.
> > > 
> > > The drm driver (drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c) just
> > > does:
> > > 
> > > backlight = of_parse_phandle(node, "backlight", 0);
> > > ...
> > > 
> > > That should still work the same, right?
> > 
> > Yes it should still work the same.
> > I did not change the node name.
> > So the DRM driver should find the node.
> 
> This will not work, since the next line tries to get it as a
> backlight device, but it's an LED device instead:
> 
> of_find_backlight_by_node(backlight);
> 
> I suppose the backlight device could be instantiated on top
> of the LED device somehow.

Hmm yeah I thought setting the ledtrig-backlight for it
would do the trick. But after thinking about it there might
be some backlight lifecycle issues with that where everything
would need to be torn down for the panel to change the
backlight trigger. I think the panel driver(s) assume the
backlight to always be there at probe time. Well this is
just based on just guessing.. I might be wrong.

I have no issues using of_find_backlight_by_node() like
other panels.

> (sorry for slow responses; I'm quite busy right now)

No problem.

Regards,

Tony
