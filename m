From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH V2 1/2] dt-bindings: leds: document new led-triggers property
Date: Fri, 20 Jan 2017 22:56:03 +0100
Message-ID: <20170120215605.15728-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

From: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>

Some LEDs can be related to particular devices described in DT. This
property allows specifying such relations. E.g. USB LED should usually
be used to indicate some USB port(s) state.

Signed-off-by: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
---
V2: Replace "usb-ports" with "led-triggers" property which is more generic and
    allows specifying other devices as well.

When bindings patch is related to some followup implementation, they usually go
through the same tree.

Greg: this patch is based on top of e64b8cc72bf9 ("DT: leds: Improve examples by
adding some context") from kernel/git/j.anaszewski/linux-leds.git . Is there any
way to solve this dependency issue? Or should this patch wait until 3.11 is
released?
---
 Documentation/devicetree/bindings/leds/common.txt | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/common.txt b/Documentation/devicetree/bindings/leds/common.txt
index 24b656014089..17632a041196 100644
--- a/Documentation/devicetree/bindings/leds/common.txt
+++ b/Documentation/devicetree/bindings/leds/common.txt
@@ -49,6 +49,17 @@ Optional properties for child nodes:
 - panic-indicator : This property specifies that the LED should be used,
 		    if at all possible, as a panic indicator.
 
+- led-triggers : List of devices that should trigger this LED activity. Some
+		 LEDs can be related to a specific device and should somehow
+		 indicate its state. E.g. USB 2.0 LED may react to device(s) in
+		 a USB 2.0 port(s). Another common example is switch or router
+		 with multiple Ethernet ports each of them having its own LED
+		 assigned (assuming they are not hardwired).
+		 In such cases this property should contain phandle(s) of
+		 related device(s). In many cases LED can be related to more
+		 than one device (e.g. one USB LED vs. multiple USB ports) so a
+		 list of entries can be specified.
+
 Required properties for flash LED child nodes:
 - flash-max-microamp : Maximum flash LED supply current in microamperes.
 - flash-max-timeout-us : Maximum timeout in microseconds after which the flash
@@ -69,6 +80,11 @@ gpio-leds {
 		linux,default-trigger = "heartbeat";
 		gpios = <&gpio0 0 GPIO_ACTIVE_HIGH>;
 	};
+
+	usb {
+		gpios = <&gpio0 1 GPIO_ACTIVE_HIGH>;
+		led-triggers = <&ohci_port1>, <&ehci_port1>;
+	};
 };
 
 max77693-led {
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
