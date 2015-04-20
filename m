From: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
Subject: [PATCH v3 2/3] powerpc/powernv: Create LED platform device
Date: Mon, 20 Apr 2015 13:31:18 +0530
Message-ID: <20150420075945.12371.26173.stgit@localhost.localdomain>
References: <20150420075558.12371.6697.stgit@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from e28smtp02.in.ibm.com ([122.248.162.2]:35331 "EHLO
	e28smtp02.in.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752637AbbDTIBg (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 20 Apr 2015 04:01:36 -0400
Received: from /spool/local
	by e28smtp02.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-leds@vger.kernel.org> from <hegdevasant@linux.vnet.ibm.com>;
	Mon, 20 Apr 2015 13:31:34 +0530
Received: from d28relay03.in.ibm.com (d28relay03.in.ibm.com [9.184.220.60])
	by d28dlp03.in.ibm.com (Postfix) with ESMTP id 19EF41258059
	for <linux-leds@vger.kernel.org>; Mon, 20 Apr 2015 13:33:26 +0530 (IST)
Received: from d28av02.in.ibm.com (d28av02.in.ibm.com [9.184.220.64])
	by d28relay03.in.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id t3K81TSU1442090
	for <linux-leds@vger.kernel.org>; Mon, 20 Apr 2015 13:31:29 +0530
Received: from d28av02.in.ibm.com (localhost [127.0.0.1])
	by d28av02.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id t3K7bc2G023944
	for <linux-leds@vger.kernel.org>; Mon, 20 Apr 2015 13:07:39 +0530
In-Reply-To: <20150420075558.12371.6697.stgit@localhost.localdomain>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linuxppc-dev@lists.ozlabs.org, linux-leds@vger.kernel.org
Cc: stewart@linux.vnet.ibm.com, mpe@ellerman.id.au, cooloney@gmail.com, rpurdie@rpsys.net, Benjamin Herrenschmidt <benh@kernel.crashing.org>, j.anaszewski@samsung.com, khandual@linux.vnet.ibm.com

This patch adds paltform devices for leds. Also export LED related
OPAL API's so that led driver can use these APIs.

Signed-off-by: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
Signed-off-by: Anshuman Khandual <khandual@linux.vnet.ibm.com>
Acked-by: Stewart Smith <stewart@linux.vnet.ibm.com>
Tested-by: Stewart Smith <stewart@linux.vnet.ibm.com>
---
Since this is the split of origianal LED patch, I have retained Tested-by/Ack
from Stewart's Ack here.

-Vasant

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
