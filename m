From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
Subject: [PATCH 2/2] ohci-platform: register HCD provider
Date: Tue, 12 Jul 2016 14:35:20 +0200
Message-ID: <1468326921-26485-3-git-send-email-zajec5@gmail.com>
References: <1468326921-26485-1-git-send-email-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1468326921-26485-1-git-send-email-zajec5@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>, Alan Stern <stern@rowland.harvard.edu>, open list <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

This allows platforms using e.g. "generic-ohci" to reference HCD using
recently introduced providers mechanism

Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
---
 drivers/usb/host/ohci-platform.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/usb/host/ohci-platform.c b/drivers/usb/host/ohci-p=
latform.c
index 898b740..57be81c 100644
--- a/drivers/usb/host/ohci-platform.c
+++ b/drivers/usb/host/ohci-platform.c
@@ -28,6 +28,7 @@
 #include <linux/usb/ohci_pdriver.h>
 #include <linux/usb.h>
 #include <linux/usb/hcd.h>
+#include <linux/usb/provider.h>
=20
 #include "ohci.h"
=20
@@ -40,6 +41,7 @@ struct ohci_platform_priv {
 	struct clk *clks[OHCI_MAX_CLKS];
 	struct reset_control *resets[OHCI_MAX_RESETS];
 	struct phy **phys;
+	struct hcd_provider *hcd_provider;
 	int num_phys;
 };
=20
@@ -258,6 +260,11 @@ static int ohci_platform_probe(struct platform_dev=
ice *dev)
 	if (err)
 		goto err_power;
=20
+	if (dev->dev.of_node)
+		priv->hcd_provider =3D of_hcd_provider_register(dev->dev.of_node,
+							      of_hcd_xlate_simple,
+							      hcd);
+
 	device_wakeup_enable(hcd->self.controller);
=20
 	platform_set_drvdata(dev, hcd);
@@ -289,6 +296,8 @@ static int ohci_platform_remove(struct platform_dev=
ice *dev)
 	struct ohci_platform_priv *priv =3D hcd_to_ohci_priv(hcd);
 	int clk, rst;
=20
+	of_hcd_provider_unregister(priv->hcd_provider);
+
 	usb_remove_hcd(hcd);
=20
 	if (pdata->power_off)
--=20
1.8.4.5
