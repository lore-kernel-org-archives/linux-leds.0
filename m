From: Phil Reid <preid-qgqNFa1JUf/o2iN0hyhwsIdd74u8MsAO@public.gmane.org>
Subject: [PATCH v4 0/1] leds: pca9532: Add device tree binding
Date: Fri, 10 Jun 2016 17:01:09 +0800
Message-ID: <1465549270-41601-1-git-send-email-preid@electromag.com.au>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, riku.voipio-X3B1VOXEql0@public.gmane.org, rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org, j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Phil Reid <preid-qgqNFa1JUf/o2iN0hyhwsIdd74u8MsAO@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

This patch adds very basic device tree binding support to the
pca9532 driver. Sufficent to load driver and enable LEDs.

Changes for v4:
- Reference leds/common.txt in documentation.
- Check return value of of_match_device()

Changes for v3:
- Remove state from device tree binding.
  This needs more thought on how to configure which PWM is used.
  And is not essential for a first pass.

Changes for v2:
- Fixup device tree documentation
- Use label propert and fall back to node name,
- Call of_node_put when breaking loop iterating leds.
- Increment the loop counter.
- Add initial state and default-trigger.

Phil Reid (1):
  leds: pca9532: Add device tree binding

 .../devicetree/bindings/leds/leds-pca9532.txt      | 39 +++++++++++
 drivers/leds/leds-pca9532.c                        | 75 ++++++++++++++++++++--
 include/dt-bindings/leds/leds-pca9532.h            | 18 ++++++
 include/linux/leds-pca9532.h                       |  9 ++-
 4 files changed, 132 insertions(+), 9 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-pca9532.txt
 create mode 100644 include/dt-bindings/leds/leds-pca9532.h

-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
