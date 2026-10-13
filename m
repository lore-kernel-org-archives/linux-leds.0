Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A42B1509EE1;
	Tue, 13 Oct 2026 13:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791897619; cv=none; b=B5Wg6ERWbHI88Y+7vbwm9P5KSWWkMkVggcsU0yqEZWhMK53PwLYDIBEL03HaFBjP9mqtTC+fkat6WD+GagnYwjFsCJTKzjex1Y0X/2xCAI6RyyZgZKzBUfVO9uy5S9vkFE33WtABcL4ue3/1jPYv+6+zTVyTkDG/mkQowCm0Qu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791897619; c=relaxed/simple;
	bh=48d57+IQsIth6Z+Fm0GmcfiShALw7Y8TuNiZbYduTyU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HZ/A0kSK0W2kx8MvflRuYR6jMD97HULikAPAR6ty3mzBEP3jTD9h1aKIclU3DLHF2Wrfgluol2XFix19kDcWb5Rfrmu0VBm6T9EFF82neTW1mSGYX6t2RMeZ7QQyDSNjAVABz2jG3cB5cDaYoOoQD7u6/ptG9AY2GZU9pr5iLws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XVdC1XQz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XVdC1XQz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C630F1F000FF;
	Tue, 13 Oct 2026 13:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791897618;
	bh=BgMKm2Pl1C00n7ciOY2UhRXgRDc/udpc+oFvEk1tamc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=XVdC1XQzOR4t6M47zdpcXfdDuiUNHanhrGrvlUfcib6HBZ1EWLy04OuV1TLaDHdhz
	 F0Bu4AUixMV6vHdq5CVZj/EOB3/C+aRtu1zj6ni3mjSph+DOBgMO6zjZrYeIjynTAR
	 9ftehhzujl3nyJU96HDBL3Fo6vmL2fsP17uYmmhoqq3U2aeWg2DRgi8yO1CQeNFPV/
	 HOGsPi6GB80z0DS5njDqQ4H1OgN5OaaIm6qSdzqB85F67LZWeTOOW3Nc47VlGD1xxq
	 DQX43RLc1t6b1+/Bqceew90VdYvOciJIDZwec8ySZhwUjdyBnF6eb1b7A5cijiqTD4
	 W7+3wQ6zUHADQ==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	linux-leds@vger.kernel.org
Subject: [PATCH v2 52/53] MIPS: SGI-IP27: show the OS state on the Fuel and Tezro front panels
Date: Tue, 13 Oct 2026 15:17:12 +0200
Message-ID: <41d8479c20bad97828ead618348f3bb4379af8e9.1791890466.git.kaloz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1791890466.git.kaloz@kernel.org>
References: <cover.1791890466.git.kaloz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Register the front-panel LED device on a Fuel and a deskside Tezro and
blink the red LED on panic. A Tezro also shows "Linux booting", "Linux
running" or "Linux panic" on line 2 of its L1 display.

Signed-off-by: Imre Kaloz <kaloz@kernel.org>
---
 arch/mips/sgi-ip27/ip27-init.c | 52 ++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/arch/mips/sgi-ip27/ip27-init.c b/arch/mips/sgi-ip27/ip27-init.c
index e657155ef7c9..f7de09515c0c 100644
--- a/arch/mips/sgi-ip27/ip27-init.c
+++ b/arch/mips/sgi-ip27/ip27-init.c
@@ -13,6 +13,9 @@
 #include <linux/smp.h>
 #include <linux/mm.h>
 #include <linux/export.h>
+#include <linux/notifier.h>
+#include <linux/panic_notifier.h>
+#include <linux/platform_device.h>
 #include <linux/cpumask.h>
 #include <linux/ctype.h>
 #include <asm/bootinfo.h>
@@ -122,6 +125,8 @@ static const struct {
 	{ 'Q', "SGI Tezro Rackmount", NULL },
 };
 
+static int ip27_brick_type;
+
 static bool __init ip27_has_graphics(void)
 {
 	nasid_t nasid;
@@ -145,6 +150,7 @@ static void __init ip27_set_machine_name(void)
 	brick_type = l1_read_brick_type();
 	if (brick_type < 0)
 		return;
+	ip27_brick_type = brick_type;
 
 	gfx = ip27_has_graphics();
 
@@ -165,6 +171,52 @@ static void __init ip27_set_machine_name(void)
 		gfx ? "with" : "without");
 }
 
+/*
+ * A Fuel (brick type 'A') and a deskside Tezro ('9') have L1-driven
+ * front-panel LEDs, the Tezro also an L1 display. A blinking red LED,
+ * with the white one off, marks a panic.
+ */
+static int ip27_panel_panic(struct notifier_block *nb, unsigned long event,
+			    void *ptr)
+{
+	l1_set_leds(L1_LED_RED, L1_LED_BLINK);
+	if (ip27_brick_type == '9')
+		l1_set_display("Linux panic");
+
+	return NOTIFY_DONE;
+}
+
+static struct notifier_block ip27_panel_panic_nb = {
+	.notifier_call = ip27_panel_panic,
+};
+
+static int __init ip27_panel_init(void)
+{
+	struct platform_device *pdev;
+
+	if (ip27_brick_type != 'A' && ip27_brick_type != '9')
+		return 0;
+
+	atomic_notifier_chain_register(&panic_notifier_list,
+				       &ip27_panel_panic_nb);
+	if (ip27_brick_type == '9')
+		l1_set_display("Linux booting");
+
+	pdev = platform_device_register_simple("ip35-leds", PLATFORM_DEVID_NONE,
+					       NULL, 0);
+	return PTR_ERR_OR_ZERO(pdev);
+}
+arch_initcall(ip27_panel_init);
+
+static int __init ip27_panel_running(void)
+{
+	if (ip27_brick_type == '9')
+		l1_set_display("Linux running");
+
+	return 0;
+}
+late_initcall_sync(ip27_panel_running);
+
 /*
  * Prefer ttyS0 at the baud rate the IP35 PROM recorded for its console
  * UART in the KLCONFIG header.
-- 
2.47.3

