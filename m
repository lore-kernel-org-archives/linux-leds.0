Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazolkn19010017.outbound.protection.outlook.com [52.103.32.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE932346E70;
	Sat, 12 Sep 2026 22:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.32.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789252652; cv=fail; b=FeMR5bVhzA7419QB7ecePROxWAgUTJ0IY5lvDUnNNUCvKfcVRTdydR63XgW3DyFSsPq0sknO2s1sZAQF6voYnbiMlvq+gA9n/5UjdqrENEmMAwWtVHgGSqzFcms8m4294BMZM7+Buid+KLuQXWCxZ5zvhX9f1Ly1ty+X6Th0Fo4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789252652; c=relaxed/simple;
	bh=dyaqtXPTBKGhUx6ufctq9Nw9RZk33SL6Gaua1ki2kFQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IV6OcX5Iw6aeJ8P4cIUX2Ruel7pU/Hn+UEvoxEpocpq22ZbxGEaT2AReC2gp6/UzHJKEtYLzjTyA1vlJ5urpL/9pki/xii97amg2Lxu/p0hNsmj2O1ftlysKF4dM84cIPGyXjM4pZgFRggUW2N+mAQZZEA9FbuH5hEXYMlD0VRM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=nKC7I57y; arc=fail smtp.client-ip=52.103.32.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="nKC7I57y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OI9BnQoxhwEKRIyN2CeFLtz2B2BhSOtOqEGL2BpHk7lczAgqXvjVzHwiVlDT14EX26w70ara8osS9Pxs8S4Ym9GXDfQkOvvgI9ZwTDhAmTSYUcZ9dKQidnYAna+BhNVt0ehDZ/KIcolWfugJB+CMPuA9iFeNY/clrdgkOnTthkud2WUREogH6PCDQcyREl2RcXx9YK2LBeG/aafP4QdmbkMUKM0mKFGWEh4rnaINA/vQYcJiX1oLX5oBLgvCJlUPPKfX6lot/7xnrcWRvVEC5QHzrTMqVx/Qk/z7uwMl/IbNkGdTs4SReFTfCCcsMKtaKLtGSlmYEFKqZIPGUcVtWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nOdDjA1neYHsK9FECVaGmFhXRF16qES/INin7C/Fd38=;
 b=gGbKUUEA/OKCywBvwT0n1AWRsu43Waw1QsJgs9ltXICnY+tslmwxzu9mLuYzW2GJzhnGdZvs9xyO2nz3YpKZqm/LXfyrDmOzho+JE0WB8EhVUWTgJfDBLcqIfYaRd4acnUfjpW8YXFrsZUIVam0PkBRpFkAqBoy+MLLq3+dJC2Zwy662eCpHK+mYRtLR85Fk4OI9HNmslN5W4vq0offx13bXAvIanuzh0grmiMxi8amlHR7JyhLJE1ighM7c4rTGE0Kzi38PJt2go3/dj3ymG18m9j3NH0z0Hy50Z4Z5C1GD9A4tPWgGuL+WPGmI3VejZcM9i0X/XPATvgxr2P4/5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nOdDjA1neYHsK9FECVaGmFhXRF16qES/INin7C/Fd38=;
 b=nKC7I57ysla+y2+I9vZuoIYdwRQvE2gbSUDrRMNTIoaUB4txtnrqgB/GZme0z+1ctwdu54e2/Zfbto+qsQRE5gV5d/Uqlsct6lMRUDN/cRsqiHJ/kpyT34AlMzQsv1lqGyJqVFThjfq22gZmxPD+QXPmgUmPzfdbLlbXg9HmYmN8/ZNXN8xPKPxhHHanEEqL++gbcaju3H0qYuJ1GR3SlhxIgAPithiht90/G0uwRvSLzKnpIyyKk0NLcKE8RdfD4M8c8EX3GIFyF1DjNHgGU4quNA9x9XjGyqd7OlpJZo46nevg5g1bUaplpXNbjGXMB3BEg62ldNFYDZwD0IHeJA==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by GVXPR08MB11096.eurprd08.prod.outlook.com (2603:10a6:150:1ff::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Sat, 12 Sep
 2026 22:37:28 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0428.004; Sat, 12 Sep 2026
 22:37:28 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 08/11] leds: st1202: Take a reference on the LED firmware node
Date: Sat, 12 Sep 2026 23:37:16 +0100
Message-ID:
 <GV1PR08MB8497816399DB42627D7F9D61C5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <GV1PR08MB8497422B7A44424C4968AEC1C5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497422B7A44424C4968AEC1C5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com>
Reply-To: fombuena@outlook.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO0P123CA0003.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:354::11) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <20260912223716.3098875-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|GVXPR08MB11096:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fab7caf-2d27-4767-da24-08df111e6cbf
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|41001999006|15080799012|5072599009|23021999003|25010399006|51005399006|8060799015|19110799012|24021099003|37011999003|12091999003|440099028|3412199025|40105399003|2607281247196008;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mnKamVqj5xcweZCiL0n0m04cDJIXNH2COUR0DdD/feXOnfPgLW+dzpGAzrPt?=
 =?us-ascii?Q?k2FsoBKsJwc2RXVddJzQRGyfP0TS1GLH921HExlY72XL/yBJwe0+UZrb9vEA?=
 =?us-ascii?Q?/N0A13m7uP2Lv/KZAvaq4YyS9x8B+FMFCd4Gv/h8rRknFlee7/RCPDRUmfS3?=
 =?us-ascii?Q?bndBawf9ZbyWJO2p5lR64b8Pvs2vgwZK6iiICc5Q31k7nF/B8FOGcTzbH0jq?=
 =?us-ascii?Q?MaWR4Pjw85Mzfzd6rI6wbIsoVRG756Itjvgx1SOlfSx61wlDgQ5ReXwzqbGR?=
 =?us-ascii?Q?vXsHMH/1mfOcKB+NfI7xlQHZD4ak1ukgHI+LQ6HphSoN4qT/Mvw2+YfE+DZF?=
 =?us-ascii?Q?54Iv54Z2UErXZ5kukOCnaodQDBmCXSe9We+VZErqFhRspWqph6vB5NPlrlKj?=
 =?us-ascii?Q?wuEo8BvzYoERaamT8BKKBoRDeNQd0RG+cZaSKhqScRx/cOX6CdBj3YRyb8VS?=
 =?us-ascii?Q?A6SmQRt76SPUoT30sAZmMh6Dz1L4UDNoBPU7i71hqz/KvPiQpw93xvxnD3pt?=
 =?us-ascii?Q?94Z0Eq5qVx/cw/Dbfv9gahTlLBbOvOz6YEY4qVBLAoZOr1RbAZK/bOH1cG/3?=
 =?us-ascii?Q?vMiJjerQCa57p1Z2QB0kv6mbHUjxq5hgzTSV0K62BivMDdwYO3kDAuDijMdU?=
 =?us-ascii?Q?ryKTEyj/m/B8h8jL9MEq1kiB8qb6ZYQwtVOKBF+9sDRVEpGpYDfblKNwe8nL?=
 =?us-ascii?Q?glyDU93DG55PWsULspYTVUALG4C1tKm6rJQyX93LsVuKCPdg78zGKlSGfnyF?=
 =?us-ascii?Q?OaPLaD8GariXC9C5Vvrx4NygAtuglSwDdER2NqfbE4/reV16+h6TmWDZS4Eq?=
 =?us-ascii?Q?QNIWsf+wuL8UPEZONFNY/C55+dizg7mRByrYCtVxHv0iSRAh4ED9f4gPyfFZ?=
 =?us-ascii?Q?+h0N9AoE60UlACaim0l1wotLveoFGJX+r9ZZdcPU2cjs1s4qD88PEnt/dV58?=
 =?us-ascii?Q?YSi36FWCz4aSNVHIDtYXdzZmU2mwhxAo/GaKuvWzW3M9mgdmEBhLXjqutVxb?=
 =?us-ascii?Q?b3U3qpXCvoDNoUzTY6o7WIbrSfW0UjLRLA/NRVmPUmsywoM=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5qQbaeDEGRZLZVTAaKWAPnwl4ChsFaPunQG+G9fBURLgV3NqNYH0KtDzb+TU?=
 =?us-ascii?Q?VSWXL7THRkIxsNP7+LsVobpp/KUnwR/KzDo4YtLMFBwL6G2WjvvTxBjI/poM?=
 =?us-ascii?Q?szs7hsgpwcKZKKfky1I3OEbcyLaz8bz+9MkKnG8s8MAzmZWY95kQ+bML9I00?=
 =?us-ascii?Q?Mxi7Vj9uYuHA1H5vAMrPqAu+SFBN/9Psr0u314EhvPQ1egh3b3jSfwZl2L65?=
 =?us-ascii?Q?neB7vSuzjTRtpbSK8SmOdLXUqcDLXWHuV8lu7ywv+Ur1lzWkGF9S67qMFfzK?=
 =?us-ascii?Q?tKYn1Lak00QiJuLhj7Vyy1r5rbxYkyZPAzqI2Va/wY2fUzWv03w1x1RcCxF9?=
 =?us-ascii?Q?ZMfXl4E7+ArVZrmjU3RFRpAPmUmwGF04dFo9WWTC4HKeX/cNc6eETKNK4bRM?=
 =?us-ascii?Q?Q5rckqVfkjOMTNf4i4wSNywKydMsLqMBJP6LbLlE1FPaoi9r3c4Rske+u/Ac?=
 =?us-ascii?Q?O2rNZ4yQRDVwTnxf+sEhmgmZnH/YkpxOZlaFATJx1Aw7DbJa68qjLnZVcjlt?=
 =?us-ascii?Q?C9RVdspaFobt9e+Dblbve11XEYy4gDGn58n36baFKIZuGqWSyjDVy5Vu4wgh?=
 =?us-ascii?Q?09kgS7a0Hj6tXEwDJhMsqYrA6oHDeL0M2dvFikpw+H47/gNAXJJhlLAcx+oX?=
 =?us-ascii?Q?IZzt6M4UbxYTCiKBocsbYsJx5DjtKXf868eUpHDLplY0M2DB5ZfPLJXoggPb?=
 =?us-ascii?Q?YNxH8NfXeDJny8uBONBj8wSdeC2X/ebgoPSVDjH8UGqyL2uUUKIvfYv5Iz4v?=
 =?us-ascii?Q?fVXYGB1aMCvqkTATmdXPk83A2ZhEhs4wW4N7P8ZkiyYA+snz/Whx2/0ywe9r?=
 =?us-ascii?Q?kteR039fbmHim79VGZKTw/icUrak0uL8wRBFN2FTu/QHdAkI3TXz7eFyEen6?=
 =?us-ascii?Q?9ytxoAbjtnKSMMasvuicfoM/cwg7I5a5TI6SqA620eTzbNhmRwHOSgIXGeo3?=
 =?us-ascii?Q?ZqE9Gl+wj8MUXoL/HA6+MdRX/KTd3scXzxuekIUZ24tTuuEfVi5GXsiNuAFk?=
 =?us-ascii?Q?KaCyeWcqgUaFkTwlbMPos5P4wujTzqTxhHUul+Wa/IsCQhe7LeFJ598KMgFD?=
 =?us-ascii?Q?P+lTkaR7Ye/xLMbVarPaT2lgE/zxho+If/Xje20ND1UuwDCyd2hx6+6RG+RJ?=
 =?us-ascii?Q?wHI3je6nqZdMTFUl2CBgcnzdkcdgv/x505Y7vIX26FTqITZTa5vvdsaaVvDn?=
 =?us-ascii?Q?Uga96TNff+JFhQCj2CL9fdbL70axVfRWqcsy0XVPA2dzaOu0mzl5zsOXAXtq?=
 =?us-ascii?Q?koaoEPcj86UriYg2Ceb+OX2AROh5z7sTgoAHjXWzD58z1qIsTU7yodmweDY3?=
 =?us-ascii?Q?kW3c9NziYoacZSzsZWOQpdZcyYgp3ZxG1vKKrODrXqA22b5Bti6CploFCZyM?=
 =?us-ascii?Q?O6i6dO/69rojtoMcllpmqorLFuTKFmu5A4n33ZJzCAdjE0SOQYRUdhB4CQAS?=
 =?us-ascii?Q?RN/F9FxuceU6rZOvC8NISB4SGHC9sZTR?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fab7caf-2d27-4767-da24-08df111e6cbf
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2026 22:37:28.3935
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB11096

st1202_dt_init() stores each LED's firmware node while walking the
device tree with for_each_available_child_of_node_scoped(), which drops
its reference to the node at the end of every iteration. The stored
pointer is not used until st1202_probe() registers the LED class devices
in a separate loop, by which point the driver holds no reference to the
node at all.

With CONFIG_OF_DYNAMIC the node can be freed in between, leaving
led->fwnode dangling and causing a use-after-free when it is handed to
devm_led_classdev_register_ext(). The LED class stores the pointer with
device_set_node() and does not take a reference of its own, so the node
has to stay alive for as long as the LED device does.

Take a reference when the node is stored and release it through a devm
action. The action is registered before the LED class devices are, so it
runs after they have been unregistered.

Fixes: c72e455b89f2 ("leds: leds-st1202: Fix NULL pointer access on race condition")
Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
Assisted-by: LLM
---
 drivers/leds/leds-st1202.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
index 5042fe88fbff..600e004944a6 100644
--- a/drivers/leds/leds-st1202.c
+++ b/drivers/leds/leds-st1202.c
@@ -12,6 +12,7 @@
 #include <linux/i2c.h>
 #include <linux/leds.h>
 #include <linux/module.h>
+#include <linux/property.h>
 #include <linux/slab.h>
 #include <linux/string.h>
 
@@ -395,6 +396,11 @@ static int st1202_blink_set(struct led_classdev *led_cdev,
 	return 0;
 }
 
+static void st1202_fwnode_put(void *data)
+{
+	fwnode_handle_put(data);
+}
+
 static int st1202_dt_init(struct st1202_chip *chip)
 {
 	struct device *dev = &chip->client->dev;
@@ -414,7 +420,11 @@ static int st1202_dt_init(struct st1202_chip *chip)
 
 		led = &chip->leds[reg];
 		led->is_active = true;
-		led->fwnode = of_fwnode_handle(child);
+		led->fwnode = fwnode_handle_get(of_fwnode_handle(child));
+
+		err = devm_add_action_or_reset(dev, st1202_fwnode_put, led->fwnode);
+		if (err)
+			return err;
 
 		led->led_cdev.max_brightness = U8_MAX;
 		led->led_cdev.brightness_set_blocking = st1202_led_set;
-- 
2.55.0

