From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH V4 0/2] usb: introduce "trigger-sources" DT property for usbport trigger
Date: Tue, 30 May 2017 11:27:03 +0200
Message-ID: <20170530092706.927-1-zajec5@gmail.com>
References: <20170529140142.13496-2-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170529140142.13496-2-zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

From: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>

This patchset (V4) differs by only a tiny fix in 1/2 changing property used
in the DT example.

I'd epxect both patches to go through Greg's usb.git if accepted.

For a reference (and before someome comes with already rejected solution) see
below history of this work:

1) [PATCH V2] leds: trigger: Introduce an USB port trigger
My initial try of adding "usb-ports" property. Rob said it should be more
generic.

2) [PATCH 1/2] dt-bindings: leds: document new usb-ports property
Rob still didn't like it due to being USB specific.

3) [PATCH V2 1/2] dt-bindings: leds: document new led-triggers property
Jacek didn't like it's more generic than what Linux can already support. Later
we agreed (?) that Linux limitations shouldn't influence DT structure.
Jacek still wanted a specific trigger but Rob said he won't accept something
specific to the USB.
Jacek suggested "trigger-sources" and Rob agreed on the name.
Jacek suggested trying triggers as separated nodes.

4) [PATCH 1/4] dt-bindings: leds: document property for LED triggers
This patch was trying to use separated nodes for triggers, e.g.:
foo-trigger { trigger-type = "foo"; };
Rob didn't like this extra level of indirection. He said Linux drivers shouldn't
define/influence the binding.

So finally I came with this patchset. It doesn't try to use separated nodes for
triggers anymore and it uses the name that was mostly accepted I think. It
should be generic and not influenced by Linux design.

Rafał Miłecki (3):
  dt-bindings: leds: document new trigger-sources property
  usb: core: read USB ports from DT in the usbport LED trigger driver
  ARM: BCM53573: Specify ports for USB LED for Tenda AC9

 Documentation/devicetree/bindings/leds/common.txt | 18 ++++++++
 arch/arm/boot/dts/bcm47189-tenda-ac9.dts          |  1 +
 arch/arm/boot/dts/bcm53573.dtsi                   |  4 ++
 drivers/usb/core/ledtrig-usbport.c                | 55 +++++++++++++++++++++++
 4 files changed, 78 insertions(+)

-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
