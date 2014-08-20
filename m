From: Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH/RFC v5 04/10] DT: leds: Add flash led devices related properties
Date: Wed, 20 Aug 2014 15:44:13 +0200
Message-ID: <1408542259-415-5-git-send-email-j.anaszewski@samsung.com>
References: <1408542259-415-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1408542259-415-1-git-send-email-j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

Addition of a LED Flash Class extension entails the need for flash led
specific device tree properties. The properties being added are:
iout-torch, iout-flash, iout-indicator and flash-timeout.

Signed-off-by: Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Acked-by: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
---
 Documentation/devicetree/bindings/leds/common.txt |   16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/common.txt b/Documentation/devicetree/bindings/leds/common.txt
index 2d88816..40f4b9a 100644
--- a/Documentation/devicetree/bindings/leds/common.txt
+++ b/Documentation/devicetree/bindings/leds/common.txt
@@ -3,6 +3,17 @@ Common leds properties.
 Optional properties for child nodes:
 - label : The label for this LED.  If omitted, the label is
   taken from the node name (excluding the unit address).
+- iout-torch : Array of maximum intensities in microamperes of the torch
+	led currents in order from sub-led 0 to N-1, where N is the number
+	of torch sub-leds exposed by the device
+- iout-flash : Array of maximum intensities in microamperes of the flash
+	led currents in order from sub-led 0 to N-1, where N is the number
+	of flash sub-leds exposed by the device
+- iout-indicator : Array of maximum intensities in microamperes of
+	the indicator led currents in order from sub-led 0 to N-1,
+	where N is the number of indicator sub-leds exposed by the device
+- flash-timeout : timeout in microseconds after which flash led
+	is turned off
 
 - linux,default-trigger :  This parameter, if present, is a
     string defining the trigger assigned to the LED.  Current triggers are:
@@ -19,5 +30,10 @@ Examples:
 system-status {
 	label = "Status";
 	linux,default-trigger = "heartbeat";
+	iout-torch = <500 500>;
+	iout-flash = <1000 1000>;
+	iout-indicator = <100 100>;
+	flash-timeout = <1000>;
+
 	...
 };
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
