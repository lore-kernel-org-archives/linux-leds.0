From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH V3 1/2] dt-bindings: leds: document new trigger-sources property
Date: Mon, 29 May 2017 16:01:40 +0200
Message-ID: <20170529140142.13496-2-zajec5@gmail.com>
References: <20170529140142.13496-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170529140142.13496-1-zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

From: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>

Some LEDs can be related to a specific device(s) described in the DT.
This property allows specifying such relations. E.g. USB LED should
usually be used to indicate some USB port(s) state.

Please note this binding is designed to be generic and not influenced by
any operating system design. Linux developers may find "trigger" part a
bit confusing since in Linux triggers are separated drivers. It
shouldn't define the binding though (we shouldn't add an extra level of
indirection).

Signed-off-by: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
---
V2: Replace "usb-ports" with "led-triggers" property which is more generic and
    allows specifying other devices as well.
V3: Use "trigger-sources" which is even more accurate as devices aren't
    precisely triggers.
---
 Documentation/devicetree/bindings/leds/common.txt | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/common.txt b/Documentation/devicetree/bindings/leds/common.txt
index 24b656014089..e6e300975a4c 100644
--- a/Documentation/devicetree/bindings/leds/common.txt
+++ b/Documentation/devicetree/bindings/leds/common.txt
@@ -49,6 +49,19 @@ Optional properties for child nodes:
 - panic-indicator : This property specifies that the LED should be used,
 		    if at all possible, as a panic indicator.
 
+- trigger-sources : List of devices which should be used as a source triggering
+		    this LED activity. Some LEDs can be related to a specific
+		    device and should somehow indicate its state. E.g. USB 2.0
+		    LED may react to device(s) in a USB 2.0 port(s).
+		    Another common example is switch or router with multiple
+		    Ethernet ports each of them having its own LED assigned
+		    (assuming they are not hardwired). In such cases this
+		    property should contain phandle(s) of related source
+		    device(s).
+		    In many cases LED can be related to more than one device
+		    (e.g. one USB LED vs. multiple USB ports) so a list of
+		    sources can be specified.
+
 Required properties for flash LED child nodes:
 - flash-max-microamp : Maximum flash LED supply current in microamperes.
 - flash-max-timeout-us : Maximum timeout in microseconds after which the flash
@@ -69,6 +82,11 @@ gpio-leds {
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
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
