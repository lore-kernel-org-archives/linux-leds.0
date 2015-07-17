From: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
Subject: [PATCH v6 2/3] powerpc/powernv: Create LED platform device
Date: Fri, 17 Jul 2015 16:11:10 +0530
Message-ID: <1437129671-14078-3-git-send-email-hegdevasant@linux.vnet.ibm.com>
References: <1437129671-14078-1-git-send-email-hegdevasant@linux.vnet.ibm.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from e28smtp02.in.ibm.com ([122.248.162.2]:60695 "EHLO
	e28smtp02.in.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964787AbbGQKmY (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 17 Jul 2015 06:42:24 -0400
Received: from /spool/local
	by e28smtp02.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-leds@vger.kernel.org> from <hegdevasant@linux.vnet.ibm.com>;
	Fri, 17 Jul 2015 16:12:21 +0530
Received: from d28relay01.in.ibm.com (d28relay01.in.ibm.com [9.184.220.58])
	by d28dlp01.in.ibm.com (Postfix) with ESMTP id 7C094E0044
	for <linux-leds@vger.kernel.org>; Fri, 17 Jul 2015 16:16:15 +0530 (IST)
Received: from d28av01.in.ibm.com (d28av01.in.ibm.com [9.184.220.63])
	by d28relay01.in.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id t6HAfT1946727206
	for <linux-leds@vger.kernel.org>; Fri, 17 Jul 2015 16:11:29 +0530
Received: from d28av01.in.ibm.com (localhost [127.0.0.1])
	by d28av01.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id t6HAfQ6N015356
	for <linux-leds@vger.kernel.org>; Fri, 17 Jul 2015 16:11:28 +0530
In-Reply-To: <1437129671-14078-1-git-send-email-hegdevasant@linux.vnet.ibm.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: j.anaszewski@samsung.com, stewart@linux.vnet.ibm.com, arnd@arndb.de, j.anaszewski81@gmail.com, cooloney@gmail.com, rpurdie@rpsys.net, khandual@linux.vnet.ibm.com, mpe@ellerman.id.au, benh@kernel.crashing.org, Vasant Hegde <hegdevasant@linux.vnet.ibm.com>

This patch adds platform devices for leds. Also export LED related
OPAL API's so that led driver can use these APIs.

Signed-off-by: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
Acked-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
---
 arch/powerpc/platforms/powernv/opal.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/powernv/opal.c b/arch/powerpc/platforms/powernv/opal.c
index f084afa..6839358 100644
--- a/arch/powerpc/platforms/powernv/opal.c
+++ b/arch/powerpc/platforms/powernv/opal.c
@@ -648,7 +648,7 @@ static void opal_init_heartbeat(void)
 
 static int __init opal_init(void)
 {
-	struct device_node *np, *consoles;
+	struct device_node *np, *consoles, *leds;
 	int rc;
 
 	opal_node = of_find_node_by_path("/ibm,opal");
@@ -689,6 +689,13 @@ static int __init opal_init(void)
 	/* Setup a heatbeat thread if requested by OPAL */
 	opal_init_heartbeat();
 
+	/* Create leds platform devices */
+	leds = of_find_node_by_path("/ibm,opal/leds");
+	if (leds) {
+		of_platform_device_create(leds, "opal_leds", NULL);
+		of_node_put(leds);
+	}
+
 	/* Create "opal" kobject under /sys/firmware */
 	rc = opal_sysfs_init();
 	if (rc == 0) {
@@ -841,3 +848,6 @@ EXPORT_SYMBOL_GPL(opal_rtc_write);
 EXPORT_SYMBOL_GPL(opal_tpo_read);
 EXPORT_SYMBOL_GPL(opal_tpo_write);
 EXPORT_SYMBOL_GPL(opal_i2c_request);
+/* Export these symbols for PowerNV LED class driver */
+EXPORT_SYMBOL_GPL(opal_leds_get_ind);
+EXPORT_SYMBOL_GPL(opal_leds_set_ind);
-- 
2.1.0
