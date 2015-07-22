From: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
Subject: [PATCH v7 1/3] powerpc/powernv: Add OPAL interfaces for accessing and modifying system LED states
Date: Wed, 22 Jul 2015 20:22:45 +0530
Message-ID: <1437576767-28496-2-git-send-email-hegdevasant@linux.vnet.ibm.com>
References: <1437576767-28496-1-git-send-email-hegdevasant@linux.vnet.ibm.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from e28smtp03.in.ibm.com ([122.248.162.3]:40494 "EHLO
	e28smtp03.in.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934333AbbGVOxI (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 22 Jul 2015 10:53:08 -0400
Received: from /spool/local
	by e28smtp03.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-leds@vger.kernel.org> from <hegdevasant@linux.vnet.ibm.com>;
	Wed, 22 Jul 2015 20:23:05 +0530
Received: from d28relay05.in.ibm.com (d28relay05.in.ibm.com [9.184.220.62])
	by d28dlp02.in.ibm.com (Postfix) with ESMTP id B01633940057
	for <linux-leds@vger.kernel.org>; Wed, 22 Jul 2015 20:23:00 +0530 (IST)
Received: from d28av01.in.ibm.com (d28av01.in.ibm.com [9.184.220.63])
	by d28relay05.in.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id t6MEqtVi9437270
	for <linux-leds@vger.kernel.org>; Wed, 22 Jul 2015 20:22:56 +0530
Received: from d28av01.in.ibm.com (localhost [127.0.0.1])
	by d28av01.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id t6MEqq4D023211
	for <linux-leds@vger.kernel.org>; Wed, 22 Jul 2015 20:22:55 +0530
In-Reply-To: <1437576767-28496-1-git-send-email-hegdevasant@linux.vnet.ibm.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, j.anaszewski@samsung.com
Cc: stewart@linux.vnet.ibm.com, arnd@arndb.de, j.anaszewski81@gmail.com, cooloney@gmail.com, rpurdie@rpsys.net, khandual@linux.vnet.ibm.com, mpe@ellerman.id.au, benh@kernel.crashing.org, Vasant Hegde <hegdevasant@linux.vnet.ibm.com>

From: Anshuman Khandual <khandual@linux.vnet.ibm.com>

This patch registers the following two new OPAL interfaces calls
for the platform LED subsystem. With the help of these new OPAL calls,
the kernel will be able to get or set the state of various individual
LEDs on the system at any given location code which is passed through
the LED specific device tree nodes.

	(1) OPAL_LEDS_GET_INDICATOR     opal_leds_get_ind
	(2) OPAL_LEDS_SET_INDICATOR     opal_leds_set_ind

Signed-off-by: Anshuman Khandual <khandual@linux.vnet.ibm.com>
Signed-off-by: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
Acked-by: Stewart Smith <stewart@linux.vnet.ibm.com>
Tested-by: Stewart Smith <stewart@linux.vnet.ibm.com>
Acked-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
---
 arch/powerpc/include/asm/opal-api.h            | 25 ++++++++++++++++++++++++-
 arch/powerpc/include/asm/opal.h                |  4 ++++
 arch/powerpc/platforms/powernv/opal-wrappers.S |  2 ++
 3 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/opal-api.h b/arch/powerpc/include/asm/opal-api.h
index e9e4c52..8f8c45f 100644
--- a/arch/powerpc/include/asm/opal-api.h
+++ b/arch/powerpc/include/asm/opal-api.h
@@ -154,7 +154,9 @@
 #define OPAL_FLASH_WRITE			111
 #define OPAL_FLASH_ERASE			112
 #define OPAL_PRD_MSG				113
-#define OPAL_LAST				113
+#define OPAL_LEDS_GET_INDICATOR			114
+#define OPAL_LEDS_SET_INDICATOR			115
+#define OPAL_LAST				115
 
 /* Device tree flags */
 
@@ -756,6 +758,27 @@ struct opal_i2c_request {
 	__be64 buffer_ra;		/* Buffer real address */
 };
 
+/* LED Mode */
+#define POWERNV_LED_MODE_LIGHT_PATH	"lightpath"
+#define POWERNV_LED_MODE_GUIDING_LIGHT	"guidinglight"
+
+/* LED type */
+#define POWERNV_LED_TYPE_IDENTIFY	"identify"
+#define POWERNV_LED_TYPE_FAULT		"fault"
+#define POWERNV_LED_TYPE_ATTENTION	"attention"
+
+enum OpalSlotLedType {
+	OPAL_SLOT_LED_TYPE_ID = 0,	/* IDENTIFY LED */
+	OPAL_SLOT_LED_TYPE_FAULT = 1,	/* FAULT LED */
+	OPAL_SLOT_LED_TYPE_ATTN = 2,	/* System Attention LED */
+	OPAL_SLOT_LED_TYPE_MAX = 3
+};
+
+enum OpalSlotLedState {
+	OPAL_SLOT_LED_STATE_OFF = 0,	/* LED is OFF */
+	OPAL_SLOT_LED_STATE_ON = 1	/* LED is ON */
+};
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* __OPAL_API_H */
diff --git a/arch/powerpc/include/asm/opal.h b/arch/powerpc/include/asm/opal.h
index 958e941..3233e6d 100644
--- a/arch/powerpc/include/asm/opal.h
+++ b/arch/powerpc/include/asm/opal.h
@@ -195,6 +195,10 @@ int64_t opal_ipmi_recv(uint64_t interface, struct opal_ipmi_msg *msg,
 int64_t opal_i2c_request(uint64_t async_token, uint32_t bus_id,
 			 struct opal_i2c_request *oreq);
 int64_t opal_prd_msg(struct opal_prd_msg *msg);
+int64_t opal_leds_get_ind(char *loc_code, __be64 *led_mask,
+			  __be64 *led_value, __be64 *max_led_type);
+int64_t opal_leds_set_ind(uint64_t token, char *loc_code, const u64 led_mask,
+			  const u64 led_value, __be64 *max_led_type);
 
 int64_t opal_flash_read(uint64_t id, uint64_t offset, uint64_t buf,
 		uint64_t size, uint64_t token);
diff --git a/arch/powerpc/platforms/powernv/opal-wrappers.S b/arch/powerpc/platforms/powernv/opal-wrappers.S
index d6a7b82..34c2734 100644
--- a/arch/powerpc/platforms/powernv/opal-wrappers.S
+++ b/arch/powerpc/platforms/powernv/opal-wrappers.S
@@ -297,3 +297,5 @@ OPAL_CALL(opal_flash_read,			OPAL_FLASH_READ);
 OPAL_CALL(opal_flash_write,			OPAL_FLASH_WRITE);
 OPAL_CALL(opal_flash_erase,			OPAL_FLASH_ERASE);
 OPAL_CALL(opal_prd_msg,				OPAL_PRD_MSG);
+OPAL_CALL(opal_leds_get_ind,			OPAL_LEDS_GET_INDICATOR);
+OPAL_CALL(opal_leds_set_ind,			OPAL_LEDS_SET_INDICATOR);
-- 
2.1.0
