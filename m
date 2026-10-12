Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011007.outbound.protection.outlook.com [40.107.208.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D044C10E7;
	Mon, 12 Oct 2026 17:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791826639; cv=fail; b=e6sw1lQqINoukpGJALAeXj/vPoBlwu8f76O5dfwYjIttcbnTwAZh31szGRGvyWHac8DMRxD4P1Odu0yMOPd2kCX9ZKs5c61H6+M+cSFHAefHR9FjfMlyYCjhH3pBWIIEgSOOo/RVhO2oh7P3GEropEPJR/9PSrMQ6lK9+qqwd4c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791826639; c=relaxed/simple;
	bh=QZ5Hjy3+bZlS9ZukKGu7Hv4VhUAGyuKQwLyeKqbhAHA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bJif6pDvbkShP1WP+mS+1C1MBYdxe6am+3/JUwPZlH7WtkYNSYbNIgwj4eiPggSKetph4aB+KZ0IE76Sn6huGyKj8zCE9lwCz7uwwFuiQ4Nw01xjNA1WWXMXyiyfC8yzvu0oFZxRaU8ev6MiT6fOTE+z6AggI+pUS/tcDxpCdZc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=AQxHxlWv; arc=fail smtp.client-ip=40.107.208.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="AQxHxlWv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CXmPjV5vxU1LckNgbpICWAgwXC7Ur7hgzVASq8l//Xd/Ses7RxPRBR/whny4oUWTidLh0AZj52e5VzscflmHbTT4cdkqWhMoqjAgAphr7z6feRP8Xi6b9oQ15Z6Ax82nAvyFPFcyh0U239rl0y6JO2MF+8FAAbHGThA/n8ulvhaV5qSCe7rPlKEb8JK/Tbvznbc2Ka50bhS1tWwMY8NOi8d4k84o5Hhcd+gW1u2yJ0scrabn9yltEGfVn433nZNElbxh89Uu892TAwDt0p2MoOkPYf9dVfdzulGl7Bv8psUiuK9x8uVCWR/yZFiLqsGC3Crs3h9Ig47nWfn/4Ee7mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8LblvXgcBHcGCXfIxftXguxuojiuNYjmGqDbTMxFDSU=;
 b=b9P3j6jSNaq8cSct8nJtP3TMw7n8oDyT91pWuKsLn71vpFierl+OXhCXhA1e+K7jVCGz8U44tGZOkmT9oj3smoLasqr8UHOqpQ4mUEd1aL/tBkKTsNx9KwSVmjGL+b0cinv4TE+lsotv0XQbUzxg78+1bREt163A5RioPqAviBYSqo5VAfOkxr/Fz41TgnCxA0v5ebFF/djlZv+xot2DbMig2bvXQVpxfp9ODQPJZIwQp4mzhzEl8kbonRrthhsro8sQIFtJSO91ZUG0av42LtYLqrorqvLP0opYWh4Zee14GLXVUT3O/gANXDaWgww1qL2+8SdgtCbqIGfTbg5gRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8LblvXgcBHcGCXfIxftXguxuojiuNYjmGqDbTMxFDSU=;
 b=AQxHxlWv22p+NazsnSU1yCUpcuZtYuDHj6EOC+l/KqeaNM9kZYo+RHgf/jNjZtNDqSJyXOQYa2eafvsqMFObAddHkwbOdN5YBuVXV6K9N7Plqiwy06JXsGTqjCNCepEHgBH3XeblpP5b0ZDGCMmlFIcHRphYC7i9n6pfajc0/611SWPOrw8Kpz3UqXg/7a7Z3Tto9DTSuvGNrUGnXT3o6hxeuKWpvTU7Hf/kctWSzkpajAu4eecb6xPvcb+EOx1fssdjKbfwByd8kqYFlghd03IeupxGEWE+93j2ZmGVuNqm/8p5wjna8/Fqkcq90S0d5ddHuu2a22aNk0zSbGoKyA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5974.namprd12.prod.outlook.com (2603:10b6:510:1d9::19)
 by PH0PR12MB7012.namprd12.prod.outlook.com (2603:10b6:510:21c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Mon, 12 Oct
 2026 17:37:04 +0000
Received: from PH7PR12MB5974.namprd12.prod.outlook.com
 ([fe80::f5a5:bbc3:e9da:f8a0]) by PH7PR12MB5974.namprd12.prod.outlook.com
 ([fe80::f5a5:bbc3:e9da:f8a0%3]) with mapi id 15.21.0496.010; Mon, 12 Oct 2026
 17:37:04 +0000
From: Adrian Ambrozewicz <aambrozewicz@nvidia.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: Donald Shannon <donalds@nvidia.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 07/11] leds: Add NVIDIA LSTP LED driver
Date: Mon, 12 Oct 2026 20:36:05 +0300
Message-ID: <20261012-lstp-usb-adapter-v1-7-aambrozewicz@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012-lstp-usb-adapter-v1-0-aambrozewicz@nvidia.com>
References: <20261012-lstp-usb-adapter-v1-0-aambrozewicz@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN0PR01CA0002.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4f::7) To PH7PR12MB5974.namprd12.prod.outlook.com
 (2603:10b6:510:1d9::19)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5974:EE_|PH0PR12MB7012:EE_
X-MS-Office365-Filtering-Correlation-Id: 833fb199-663f-4506-a956-08df28876dd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|5023799004|11063799006|56012099006|22082099003|18002099003|6133799003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	NWFJibRCatoSNJSMYdBFU/pp1eWg4YN5A7RsLe5wkAWr22XlrIh3ZdIDoTZFpk+JJ+GOc3a3bVYNq4NE3vsRGAeIfg2MwBZoWhjye/JQPQJ36DUPgmuutSwv/mFFeGiSjiZ6yDvSZ+KTVQ1f1/WcqKHEzhsunU99TUubdNLZgxURV54pmVrkVAOeR6ZG4LoDz62tSYXLfpFZwk7quz4KX/q3MLTl2SACYCYezwh7WZfweBm4yAEVAhNplM/F+zH3oayV1L1VWF7VYMVR+ZyGp9A9Gu801mgpDt2r/dHAHK17sU8X+lKlEoLZdpSRVy/C6qBZNFP8eQzAruo21/8+uZy72D1wYweRh5YoNQRAPAFHgzKBH81JN3DC/j6bwhmYSQO+/8hmKCZKWQmfg8IGlYUnvWMeMY3/K57wflOBvxKrJbKfcT5vd35/wsT35nDHJv4/Sc15XNjGsL0PxvXv1I8GW+GWOoxcW8xZH/oWxmULHfpN/ILfE69VDtLI5Ubu25W5Nd1W95bMaC1QgZQYOssMUtzoP+DmALqIw5gvVROex1aQ57YAIlkqIPtDsbksxz7vA7y5O2tWU6ePLUj2cRHbon/aXUjY8oDpk66bv8mIZjdz4ddZKEx+fMNMGQGxXYb479aQ4e/qwG1dXhZF6YQGgGVuN5VO/wmRSxyPvLY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5974.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(5023799004)(11063799006)(56012099006)(22082099003)(18002099003)(6133799003)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Jexf9yS8WPkmzcCeTlsC7Z+Y+dA4cEML94EuX0Xbw4C/Geb/hhzW+8mPqCnW?=
 =?us-ascii?Q?9rqaE/KF1fxbrgueGyoWSixprabbqnH0FReMLMt81NKd/HG/q+p1vsR5mdHy?=
 =?us-ascii?Q?6Y14JZ6ksWNATxEzWXprcI8swxBgezJqrVMbT0ypZc8OiZNcgbW3l18sttWQ?=
 =?us-ascii?Q?XIkxUjW/wbrI1DBEWRELvIQXZqIS2ubqcXyzdBvPP890G2d1kRTmCZQ2xA/a?=
 =?us-ascii?Q?3vBielOvHIpsiybryx2ENyOxclbSMQaIY6+yYmI2dcg9Wqbmzdz2dB8FCeSo?=
 =?us-ascii?Q?k4x+tINdffXGuRDZnq/pLQ5M/TCl1eD3zm9NS9JTY8HinMfKSW+8E1OS+jYT?=
 =?us-ascii?Q?dx4H1Plc3WizSYK9RViAl7Fx7XnjUDeZcGE2E2uDN43c/SEmgJ0mkQrVVv9o?=
 =?us-ascii?Q?4Z3vJlfd5ilJv7Anas4FMnz05QAlUvU/qLMSXYaD27vThQvBaF6yPi1/PRGD?=
 =?us-ascii?Q?NgeckXnxDFU8of3yCM+8ROv9oOkFMboGOLQ3qi3Mav2GCFe81dc6GoKdMTLY?=
 =?us-ascii?Q?hOfbMsY/cBpxFhbvfHTCEsiQmfb5MSCuoBkQ8pQQKg+p7rafuedugObh//j1?=
 =?us-ascii?Q?ZvNjfv85FLEnJV8k95b3UPG3kQo3tz1bNvgWxFS+qg6LhyiIaTpBvk9IM287?=
 =?us-ascii?Q?eeU5Br7oxe1JMesTWNa5NJUPtTkqQNdRJyoefpQhQwW5F/YlOGAZbwwEQsU2?=
 =?us-ascii?Q?Pf9gV6NpMtBW9H3kqgR2sOAB5Zn5QcocA12mmjlVIThtnVJ+CqpKlCXb5Ru9?=
 =?us-ascii?Q?yhGJ1nWbgX7GMifVxWn1sZV2NzqXf3Jszj0jBID/Eh2dKU5ONRyvfLfKPfiO?=
 =?us-ascii?Q?SKn0od3Ka7TKtkVx7nLLjixluCPvLha5CqBz3ArRp69ta6KAfxlT/Pu3os3O?=
 =?us-ascii?Q?qcpaKGgpk2AX3Kb/088DMcAbj3ONXfWMdf/fWIDBBCZ9j09SWjFzajFfDw2n?=
 =?us-ascii?Q?0wqC1TDXiEgy4YuY0F/9PtBnS2PJ9DBLbvR7f6Yr0IHolgEMSItlbc+8AJ4s?=
 =?us-ascii?Q?OU3ETAPxIAQ7y/v4xjrU4MXbJdZISzpnowacDnyTI3j9l6nmydx/gjYDo9Ry?=
 =?us-ascii?Q?KmriqGsZo7YOgB37jDvJS2DYeU00KVl3scntLwUVIkkEY/94VYzCv30Gs62i?=
 =?us-ascii?Q?PQbkTIppc0T/N0s7x00MosAtIBhI8D64pLWdBFewOOZgK3OammFDPT117E4C?=
 =?us-ascii?Q?12XN5Nsoz3AYPeKTi7SUOlZSH5n2zgx8xDanRWiuYNer4hzTo8KNhnlFcuP1?=
 =?us-ascii?Q?cmzrd65xlaoBdyFK2ON8AE4eFh+Se46pFhJ14/eTlKz93NBHAgwBX7zlYo+a?=
 =?us-ascii?Q?P4Y4xeDwQVs/hMdgqIUCaVu082M5m4y4oHQ8fyr9SnSQSqc80Nf2a5RGWhit?=
 =?us-ascii?Q?0sjDEUrRK8cNbYdUsS2i5Y3H4odLfJAUWxBJuZevEDzyRn93e1dTfNZSAcbq?=
 =?us-ascii?Q?49wdiKkQyaqYz2ktqEwX5AIPBOcMA7bjYehEV9BUx0dPpvZV05itenI3XUwl?=
 =?us-ascii?Q?QC/0UtpUJmLvOznHwY6prSh5WFDkDTei1xTVtbvUjCBcP1J0AMSsAL44w6d2?=
 =?us-ascii?Q?MJM4TmFYKlkGfihAuz5AK8AUYQSEA77Ns+INwgJ++pNd776/0VdT2kF0jJse?=
 =?us-ascii?Q?W+n/+luo/ls/CLRBhhSbjsMCeqg8LvGchJB/SOtQqDoJ1IisEb5Z4v+p31Tl?=
 =?us-ascii?Q?wDAehF95x5NSmnd8BlRGPU30FG7S+QttrL6pvNTFy9T3Fm4fBQnSOjnUFZ90?=
 =?us-ascii?Q?T55Ekf4YcA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 833fb199-663f-4506-a956-08df28876dd6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5974.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 17:37:04.0870
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FEZ+e+GXSCMX8veBReeAcoE4mJ1qav6UdzZzTJyCX0O0r034azhCjdtir2DoKibQlm2qWuiD0OJT5dN2QKleew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7012

Add a driver for the LEDs of NVIDIA LSTP USB adapters: the pins of a
GPIO channel that the firmware reports as LEDs, which the GPIO driver
offers as an auxiliary device. Each is registered with the LED class;
blink and pattern requests are handed to the adapter, which plays them
on its own. A leds child node of the channel can name the LEDs and set
their default state, trigger and pattern.

Signed-off-by: Adrian Ambrozewicz <aambrozewicz@nvidia.com>
---
 MAINTAINERS              |   1 +
 drivers/leds/Kconfig     |  14 ++
 drivers/leds/Makefile    |   1 +
 drivers/leds/leds-lstp.c | 404 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 420 insertions(+)
 create mode 100644 drivers/leds/leds-lstp.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 639cd7b6b146..c8ed59cd4b11 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19578,6 +19578,7 @@ F:	Documentation/devicetree/bindings/usb/nvidia,lstp.yaml
 F:	Documentation/driver-api/usb/lstp.rst
 F:	Documentation/firmware-guide/acpi/lstp.rst
 F:	drivers/gpio/gpio-lstp.c
+F:	drivers/leds/leds-lstp.c
 F:	drivers/usb/misc/lstp.c
 F:	include/linux/usb/lstp.h
 
diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index d0d3182236be..aa843e72a28d 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -1050,6 +1050,20 @@ source "drivers/leds/flash/Kconfig"
 comment "RGB LED drivers"
 source "drivers/leds/rgb/Kconfig"
 
+config LEDS_LSTP
+	tristate "LED support for NVIDIA LSTP adapters"
+	depends on LEDS_CLASS
+	depends on GPIO_LSTP
+	default GPIO_LSTP
+	help
+	  Say Y or M here to support the LEDs of NVIDIA LSTP USB adapters,
+	  the pins of the adapter's GPIO channels that the firmware reports
+	  as LEDs. They are registered with the LED class, with blink and
+	  pattern requests handed to the adapter.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called leds-lstp.
+
 comment "LED Triggers"
 source "drivers/leds/trigger/Kconfig"
 
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index a68244bd50fb..115b88c6b61a 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -60,6 +60,7 @@ obj-$(CONFIG_LEDS_LP8501)		+= leds-lp8501.o
 obj-$(CONFIG_LEDS_LP8788)		+= leds-lp8788.o
 obj-$(CONFIG_LEDS_LP8860)		+= leds-lp8860.o
 obj-$(CONFIG_LEDS_LP8864)		+= leds-lp8864.o
+obj-$(CONFIG_LEDS_LSTP)			+= leds-lstp.o
 obj-$(CONFIG_LEDS_LT3593)		+= leds-lt3593.o
 obj-$(CONFIG_LEDS_LTC3220)		+= leds-ltc3220.o
 obj-$(CONFIG_LEDS_MAX5970)		+= leds-max5970.o
diff --git a/drivers/leds/leds-lstp.c b/drivers/leds/leds-lstp.c
new file mode 100644
index 000000000000..352e484eb919
--- /dev/null
+++ b/drivers/leds/leds-lstp.c
@@ -0,0 +1,404 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * LED driver for LSTP USB interface.
+ *
+ * Copyright (c) 2026, NVIDIA CORPORATION & AFFILIATES.  All rights reserved.
+ */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/build_bug.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/kernel.h>
+#include <linux/leds.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/property.h>
+#include <linux/slab.h>
+
+#include <linux/usb/lstp.h>
+
+#define LSTP_LED_REPEAT_FOREVER 0 /* wire: repeats == 0 plays forever */
+#define LSTP_LED_LINUX_REPEAT_FOREVER (-1) /* LED-class pattern_set: repeat == -1 plays forever */
+#define LSTP_LED_DEFAULT_HOLD_TIME_MS 1 /* delta_t for single-step holds */
+#define LSTP_LED_DEFAULT_BLINK_MS 500 /* LED-class default when delay_on/off are both 0 */
+
+/* A GPIO channel command; the others are in gpio-lstp.c. */
+#define LSTP_GPIO_CMD_SET_LED_PATTERN 0x05
+
+struct lstp_led_pattern {
+	u8 brightness;
+	__le32 time_ms;
+} __packed;
+
+struct lstp_gpio_set_led_pattern_req {
+	__le16 pin;
+	__le32 repeats;
+	u8 num_steps;
+	struct lstp_led_pattern pattern[];
+} __packed;
+
+struct lstp_led {
+	struct led_classdev cdev;
+	struct lstp_channel *ch;
+	u16 pin;
+};
+
+/* Send SET_LED_PATTERN. @num_steps 0 clears the pattern, 1 holds forever. */
+static int lstp_led_set_pattern(struct lstp_led *led, u32 repeats,
+				const struct led_pattern *pattern, u8 num_steps)
+{
+	struct lstp_channel *ch = led->ch;
+	struct lstp_gpio_set_led_pattern_req *req;
+	size_t req_len = struct_size(req, pattern, num_steps);
+	/* The LED core applies a firmware-node max-brightness; the wire is 8-bit */
+	unsigned int max_brightness = min_t(unsigned int, led->cdev.max_brightness, U8_MAX);
+
+	/* Probe enforces bulk_tx_size >= LSTP_USB_EP_MIN_SIZE; anchor base here. */
+	BUILD_BUG_ON(sizeof(struct lstp_header) + sizeof(*req) > LSTP_USB_EP_MIN_SIZE);
+
+	for (u8 i = 0; i < num_steps; i++) {
+		if (pattern[i].brightness > max_brightness)
+			return -EINVAL;
+	}
+
+	if (req_len > ch->max_tx_payload) {
+		dev_err_ratelimited(ch->dev,
+				    "%s: ch_%d: SET_LED_PATTERN too long for led '%s' (%zu bytes, max %zu)\n",
+				    __func__, ch->ch_id, led->cdev.name, req_len,
+				    ch->max_tx_payload);
+		return -EMSGSIZE;
+	}
+
+	req = kmalloc(req_len, GFP_KERNEL);
+	if (!req)
+		return -ENOMEM;
+
+	req->pin = cpu_to_le16(led->pin);
+	req->repeats = cpu_to_le32(repeats);
+	req->num_steps = num_steps;
+	for (u8 i = 0; i < num_steps; i++) {
+		req->pattern[i].brightness = (u8)pattern[i].brightness;
+		req->pattern[i].time_ms = cpu_to_le32(pattern[i].delta_t);
+	}
+
+	int ret =
+		lstp_request(ch, LSTP_GPIO_CMD_SET_LED_PATTERN, req, req_len, NULL, 0, NULL, NULL);
+	if (ret && ret != -ENODEV)
+		dev_err_ratelimited(ch->dev,
+				    "%s: ch_%d: SET_LED_PATTERN failed for led '%s' (repeats=%u, num_steps=%u) (%pe)\n",
+				    __func__, ch->ch_id, led->cdev.name, repeats, num_steps,
+				    ERR_PTR(ret));
+
+	kfree(req);
+	return ret;
+}
+
+/*
+ * blink_set: @delay_on 0 holds OFF, @delay_off 0 holds ON, both 0 selects the
+ * LED-class 500 ms default. On-brightness is cdev->brightness, falling back to
+ * max_brightness when the LED is currently off.
+ */
+static int lstp_led_blink_set(struct led_classdev *cdev, unsigned long *delay_on,
+			      unsigned long *delay_off)
+{
+	struct lstp_led *led = container_of(cdev, struct lstp_led, cdev);
+	u8 on_value = cdev->brightness ? (u8)cdev->brightness : (u8)cdev->max_brightness;
+	struct led_pattern steps[2];
+	u8 len;
+
+	if (*delay_on == 0 && *delay_off == 0) {
+		*delay_on = LSTP_LED_DEFAULT_BLINK_MS;
+		*delay_off = LSTP_LED_DEFAULT_BLINK_MS;
+	}
+
+	if (*delay_on == 0) {
+		steps[0].delta_t = LSTP_LED_DEFAULT_HOLD_TIME_MS;
+		steps[0].brightness = LED_OFF;
+		len = 1;
+	} else if (*delay_off == 0) {
+		steps[0].delta_t = LSTP_LED_DEFAULT_HOLD_TIME_MS;
+		steps[0].brightness = on_value;
+		len = 1;
+	} else {
+		steps[0].delta_t = *delay_on;
+		steps[0].brightness = on_value;
+		steps[1].delta_t = *delay_off;
+		steps[1].brightness = LED_OFF;
+		len = 2;
+	}
+	return lstp_led_set_pattern(led, LSTP_LED_REPEAT_FOREVER, steps, len);
+}
+
+/*
+ * pattern_set: LED-class repeat -1 maps to the wire's repeats == 0 ("forever").
+ * repeat == 0 and anything below -1 are invalid.
+ */
+static int lstp_led_pattern_set(struct led_classdev *cdev, struct led_pattern *pattern, u32 len,
+				int repeat)
+{
+	struct lstp_led *led = container_of(cdev, struct lstp_led, cdev);
+
+	if (len > U8_MAX)
+		return -EMSGSIZE;
+	if (repeat == 0 || repeat < LSTP_LED_LINUX_REPEAT_FOREVER)
+		return -EINVAL;
+
+	u32 mapped_repeat = (repeat == LSTP_LED_LINUX_REPEAT_FOREVER) ? LSTP_LED_REPEAT_FOREVER :
+									(u32)repeat;
+	return lstp_led_set_pattern(led, mapped_repeat, pattern, (u8)len);
+}
+
+static int lstp_led_pattern_clear(struct led_classdev *cdev)
+{
+	struct lstp_led *led = container_of(cdev, struct lstp_led, cdev);
+
+	return lstp_led_set_pattern(led, LSTP_LED_REPEAT_FOREVER, NULL, 0);
+}
+
+/* brightness_set_blocking: a one-step pattern; @brightness is core-clamped. */
+static int lstp_led_brightness_set_blocking(struct led_classdev *cdev,
+					    enum led_brightness brightness)
+{
+	struct lstp_led *led = container_of(cdev, struct lstp_led, cdev);
+	struct led_pattern step = { .delta_t = LSTP_LED_DEFAULT_HOLD_TIME_MS,
+				    .brightness = brightness };
+
+	return lstp_led_set_pattern(led, LSTP_LED_REPEAT_FOREVER, &step, 1);
+}
+
+/*
+ * Send @fwnode's led-pattern once, repeating forever; the device then plays it
+ * without host involvement. A pattern that does not fit in one request is not
+ * sent at all.
+ */
+static void lstp_led_send_fwnode_pattern(struct lstp_led *led, struct fwnode_handle *fwnode)
+{
+	struct lstp_channel *ch = led->ch;
+	struct lstp_gpio_set_led_pattern_req *req;
+	size_t max_steps = min_t(size_t, U8_MAX,
+				 (ch->max_tx_payload - sizeof(*req)) / sizeof(req->pattern[0]));
+	int count = fwnode_property_count_u32(fwnode, "led-pattern");
+	struct led_pattern *steps = NULL;
+	unsigned int num_steps;
+	u32 *raw = NULL;
+
+	if (count <= 0 || count % 2) {
+		dev_err(ch->dev,
+			"%s: ch_%d: led-pattern of LED '%s' is not a list of <brightness duration> pairs\n",
+			__func__, ch->ch_id, led->cdev.name);
+		return;
+	}
+
+	num_steps = count / 2;
+	if (num_steps > max_steps) {
+		dev_err(ch->dev,
+			"%s: ch_%d: led-pattern of LED '%s' has %u steps, the device takes at most %zu\n",
+			__func__, ch->ch_id, led->cdev.name, num_steps, max_steps);
+		return;
+	}
+
+	raw = kcalloc(count, sizeof(*raw), GFP_KERNEL);
+	steps = kzalloc_objs(*steps, num_steps);
+	if (!raw || !steps || fwnode_property_read_u32_array(fwnode, "led-pattern", raw, count))
+		goto out;
+
+	for (unsigned int i = 0; i < num_steps; i++) {
+		if (raw[2 * i] > led->cdev.max_brightness) {
+			dev_err(ch->dev,
+				"%s: ch_%d: led-pattern of LED '%s': step %u brightness %u exceeds %u\n",
+				__func__, ch->ch_id, led->cdev.name, i, raw[2 * i],
+				led->cdev.max_brightness);
+			goto out;
+		}
+		steps[i].brightness = raw[2 * i];
+		steps[i].delta_t = raw[2 * i + 1];
+	}
+
+	lstp_led_set_pattern(led, LSTP_LED_REPEAT_FOREVER, steps, num_steps);
+out:
+	kfree(steps);
+	kfree(raw);
+}
+
+/*
+ * default-state is written once, and a missing one means "off". "keep" leaves
+ * the LED as the device firmware set it: the device cannot report its current
+ * state, so there is nothing to read back.
+ */
+static void lstp_led_apply_default_state(struct lstp_led *led, struct fwnode_handle *fwnode)
+{
+	switch (led_init_default_state_get(fwnode)) {
+	case LEDS_DEFSTATE_KEEP:
+		return;
+	case LEDS_DEFSTATE_ON:
+		led->cdev.brightness = led->cdev.max_brightness;
+		break;
+	default:
+		led->cdev.brightness = LED_OFF;
+		break;
+	}
+
+	lstp_led_brightness_set_blocking(&led->cdev, led->cdev.brightness);
+}
+
+static void lstp_led_put_fwnode(void *fwnode)
+{
+	fwnode_handle_put(fwnode);
+}
+
+/*
+ * led_classdev_unregister() flushes set_brightness_work before it removes the
+ * sysfs files, and the LED core does not refuse brightness or trigger writes in
+ * between: such a write would queue work or attach a trigger that outlives
+ * @data. Disable sysfs first, under led_access, so they fail with -EBUSY.
+ */
+static void lstp_led_unregister(void *data)
+{
+	struct led_classdev *cdev = data;
+
+	mutex_lock(&cdev->led_access);
+	led_sysfs_disable(cdev);
+	mutex_unlock(&cdev->led_access);
+	led_classdev_unregister(cdev);
+}
+
+static int lstp_led_classdev_register(struct device *dev, struct led_classdev *cdev,
+				      struct led_init_data *init_data)
+{
+	int ret = led_classdev_register_ext(dev, cdev, init_data);
+
+	if (ret)
+		return ret;
+	return devm_add_action_or_reset(dev, lstp_led_unregister, cdev);
+}
+
+/* Register @led, initialised from @fwnode if any. A failure leaves the other LEDs up. */
+static int lstp_led_register(struct device *dev, struct lstp_led *led, struct fwnode_handle *fwnode)
+{
+	int ret;
+
+	if (!fwnode) {
+		ret = lstp_led_classdev_register(dev, &led->cdev, NULL);
+	} else {
+		struct led_init_data init_data = { .fwnode = fwnode };
+
+		/*
+		 * The class device keeps @fwnode as its node, and default_trigger
+		 * points into it. Queued first, the put runs after unregistration.
+		 */
+		ret = devm_add_action_or_reset(dev, lstp_led_put_fwnode, fwnode_handle_get(fwnode));
+		if (!ret) {
+			bool pattern = fwnode_property_present(fwnode, "led-pattern");
+			bool trigger = fwnode_property_present(fwnode, "linux,default-trigger");
+
+			/* A trigger takes precedence; the LED core applies it from @fwnode. */
+			if (pattern && trigger)
+				dev_err(dev,
+					"%s: ch_%d: Ignoring led-pattern of LED '%s': %pfw also sets linux,default-trigger\n",
+					__func__, led->ch->ch_id, led->cdev.name, fwnode);
+			if (pattern && !trigger)
+				lstp_led_send_fwnode_pattern(led, fwnode);
+			else
+				lstp_led_apply_default_state(led, fwnode);
+			ret = lstp_led_classdev_register(dev, &led->cdev, &init_data);
+		}
+	}
+
+	if (ret)
+		dev_warn(dev, "%s: ch_%d: Could not register LED '%s', pin %u (%pe)\n", __func__,
+			 led->ch->ch_id, led->cdev.name, led->pin, ERR_PTR(ret));
+	return ret;
+}
+
+static struct lstp_led *lstp_led_by_pin(struct lstp_led *leds, u16 nleds, u32 pin)
+{
+	for (u16 i = 0; i < nleds; i++) {
+		if (leds[i].pin == pin)
+			return &leds[i];
+	}
+	return NULL;
+}
+
+/*
+ * Register the LEDs described under the channel's "leds" node, then every other
+ * LED pin under its firmware pin name. A node that does not describe a
+ * firmware-reported LED pin, or that names no LED, is ignored.
+ */
+static int lstp_leds_probe(struct auxiliary_device *auxdev, const struct auxiliary_device_id *id)
+{
+	struct lstp_leds *pins = container_of(auxdev, struct lstp_leds, auxdev);
+	struct lstp_channel *ch = pins->ch;
+	struct device *dev = &auxdev->dev;
+	struct fwnode_handle *node;
+	struct fwnode_handle *child;
+	struct lstp_led *leds;
+
+	leds = devm_kcalloc(dev, pins->npins, sizeof(*leds), GFP_KERNEL);
+	if (!leds)
+		return -ENOMEM;
+
+	for (u16 i = 0; i < pins->npins; i++) {
+		leds[i].ch = ch;
+		leds[i].pin = pins->pins[i].pin;
+		leds[i].cdev.name = pins->pins[i].name;
+		leds[i].cdev.max_brightness = U8_MAX;
+		leds[i].cdev.flags = LED_HW_PLUGGABLE;
+		leds[i].cdev.brightness_set_blocking = lstp_led_brightness_set_blocking;
+		leds[i].cdev.blink_set = lstp_led_blink_set;
+		leds[i].cdev.pattern_set = lstp_led_pattern_set;
+		leds[i].cdev.pattern_clear = lstp_led_pattern_clear;
+	}
+
+	node = fwnode_get_named_child_node(ch->fwnode, "leds");
+	/*
+	 * Not the available-child iterator; see Documentation/driver-api/usb/lstp.rst.
+	 * On OF, fwnode_for_each_child_node() already skips disabled nodes.
+	 */
+	fwnode_for_each_child_node(node, child) {
+		struct lstp_led *led = NULL;
+		u32 pin;
+
+		if (!fwnode_property_read_u32(child, "reg", &pin))
+			led = lstp_led_by_pin(leds, pins->npins, pin);
+		if (!led) {
+			dev_warn(dev, "%s: ch_%d: Ignoring %pfw: not an LED pin\n", __func__,
+				 ch->ch_id, child);
+			continue;
+		}
+		if (led->cdev.dev) {
+			dev_warn(dev, "%s: ch_%d: Ignoring %pfw: pin %u is already described\n",
+				 __func__, ch->ch_id, child, pin);
+			continue;
+		}
+		if (!fwnode_property_present(child, "label") &&
+		    !fwnode_property_present(child, "function")) {
+			dev_warn(dev, "%s: ch_%d: Ignoring %pfw: neither label nor function\n",
+				 __func__, ch->ch_id, child);
+			continue;
+		}
+		lstp_led_register(dev, led, child);
+	}
+	fwnode_handle_put(node);
+
+	for (u16 i = 0; i < pins->npins; i++) {
+		if (!leds[i].cdev.dev)
+			lstp_led_register(dev, &leds[i], NULL);
+	}
+
+	return 0;
+}
+
+static const struct auxiliary_device_id lstp_leds_id_table[] = { { .name = "lstp.led" }, {} };
+MODULE_DEVICE_TABLE(auxiliary, lstp_leds_id_table);
+
+static struct auxiliary_driver lstp_leds_drv = {
+	.name = "led",
+	.probe = lstp_leds_probe,
+	.id_table = lstp_leds_id_table,
+};
+module_auxiliary_driver(lstp_leds_drv);
+
+MODULE_IMPORT_NS("LSTP");
+MODULE_DESCRIPTION("LSTP LED driver");
+MODULE_LICENSE("GPL");
-- 
2.43.0

