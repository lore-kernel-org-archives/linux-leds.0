From: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
Subject: [PATCH v4 2/3] powerpc/powernv: Create LED platform device
Date: Tue, 28 Apr 2015 15:40:02 +0530
Message-ID: <20150428100958.26912.78396.stgit@localhost.localdomain>
References: <20150428100535.26912.29607.stgit@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from e28smtp01.in.ibm.com ([122.248.162.1]:38787 "EHLO
	e28smtp01.in.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933028AbbD1KLS (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 28 Apr 2015 06:11:18 -0400
Received: from /spool/local
	by e28smtp01.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-leds@vger.kernel.org> from <hegdevasant@linux.vnet.ibm.com>;
	Tue, 28 Apr 2015 15:41:16 +0530
Received: from d28relay03.in.ibm.com (d28relay03.in.ibm.com [9.184.220.60])
	by d28dlp03.in.ibm.com (Postfix) with ESMTP id 6818B1258056
	for <linux-leds@vger.kernel.org>; Tue, 28 Apr 2015 15:43:14 +0530 (IST)
Received: from d28av03.in.ibm.com (d28av03.in.ibm.com [9.184.220.65])
	by d28relay03.in.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id t3SAAdbm60030986
	for <linux-leds@vger.kernel.org>; Tue, 28 Apr 2015 15:41:13 +0530
Received: from d28av03.in.ibm.com (localhost [127.0.0.1])
	by d28av03.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id t3S9gJHw018788
	for <linux-leds@vger.kernel.org>; Tue, 28 Apr 2015 15:12:21 +0530
In-Reply-To: <20150428100535.26912.29607.stgit@localhost.localdomain>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linuxppc-dev@lists.ozlabs.org, linux-leds@vger.kernel.org
Cc: stewart@linux.vnet.ibm.com, j.anaszewski81@gmail.com, benh@kernel.crashing.org, cooloney@gmail.com, rpurdie@rpsys.net, mpe@ellerman.id.au, khandual@linux.vnet.ibm.com

This patch adds paltform devices for leds. Also export LED related
OPAL API's so that led driver can use these APIs.

Signed-off-by: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
---
 arch/powerpc/platforms/powernv/opal.c |   12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/powernv/opal.c b/arch/powerpc/platforms/powernv/opal.c
index 2241565..b1951aa 100644
--- a/arch/powerpc/platforms/powernv/opal.c
+++ b/arch/powerpc/platforms/powernv/opal.c
@@ -784,7 +784,7 @@ static void opal_init_heartbeat(void)
 
 static int __init opal_init(void)
 {
-	struct device_node *np, *consoles;
+	struct device_node *np, *consoles, *led;
 	int rc;
 
 	opal_node = of_find_node_by_path("/ibm,opal");
@@ -813,6 +813,13 @@ static int __init opal_init(void)
 	/* Setup a heatbeat thread if requested by OPAL */
 	opal_init_heartbeat();
 
+	/* Create led platform devices */
+	led = of_find_node_by_path("/ibm,opal/led");
+	if (led) {
+		of_platform_device_create(led, "opal_led", NULL);
+		of_node_put(led);
+	}
+
 	/* Find all OPAL interrupts and request them */
 	opal_irq_init(opal_node);
 
@@ -970,3 +977,6 @@ EXPORT_SYMBOL_GPL(opal_rtc_write);
 EXPORT_SYMBOL_GPL(opal_tpo_read);
 EXPORT_SYMBOL_GPL(opal_tpo_write);
 EXPORT_SYMBOL_GPL(opal_i2c_request);
+/* Export these symbols for PowerNV LED class driver */
+EXPORT_SYMBOL_GPL(opal_leds_get_ind);
+EXPORT_SYMBOL_GPL(opal_leds_set_ind);
