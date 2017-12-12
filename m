From: Dan Murphy <dmurphy-l0cyMroinI0@public.gmane.org>
Subject: [PATCH v4 0/6] Updated LP8860 driver series
Date: Tue, 12 Dec 2017 16:01:37 -0600
Message-ID: <20171212220143.31210-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org, jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dan Murphy <dmurphy-l0cyMroinI0@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

All

v4 - Fix checkpatch warning for code indentation on the
leds: lp8860: Update the dt parsing for LED labeling patch.

v3 - Made changes to the patch set to address concerns on DT node naming conventions
based on discussion in the RFC patch https://patchwork.kernel.org/patch/10089047/
also made requested changes to the DT and driver based on feedback.  Patchworks
links in each patch.

v2 - Added an initial patch to bring the DT binding up to standard prior to adding
the changes for the label and triggers.

v1 Cover letter repeat below

After creating a new LED driver for the LM3692x device I went back to the
LP8860 driver that I authored and found some updates that need to be applied.

First the way the LP8860 retrieved the label from the DT was incorrect as the
label should have been from a child node as opposed to the parent.  This is now
fixed with this series.

Second, since that device can be used to as either a backlight driver or as a
string agnostic driver a trigger to the backlight needed to be added.

Finally there are changes to the driver that need to be made as either
unnoticed bugs or updates to the driver to align with the current LED
framework.  For instance moving to the devm LED class registration, destroying
the mutex upon driver removal and removing the in driver dependency on CONFIG_OF
and moving it to the Kconfig.

With these changes this should at least bring the driver into a better shape.

There are additional changes coming for this driver but I wanted to get the
driver up to snuff before adding a feature to it.

Dan

Dan Murphy (6):
  dt: bindings: lp8860: Update bindings for lp8860
  dt: bindings: lp8860: Update DT label binding
  leds: lp8860: Update the dt parsing for LED labeling
  dt: bindings: lp8860: Add trigger binding to the lp8860
  leds: lp8860: Add DT parsing to retrieve the trigger node
  leds: lp8860: Various fixes to align with LED framework

 .../devicetree/bindings/leds/leds-lp8860.txt       | 32 ++++++++++++-----
 drivers/leds/Kconfig                               |  2 +-
 drivers/leds/leds-lp8860.c                         | 40 ++++++++++++----------
 3 files changed, 46 insertions(+), 28 deletions(-)

-- 
2.15.0.124.g7668cbc60

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
