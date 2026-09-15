Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazolkn19012014.outbound.protection.outlook.com [52.103.32.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471E1480979;
	Tue, 15 Sep 2026 12:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.32.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789476382; cv=fail; b=WqbR+0KW8A648AR81BB/yg5o1s/FlRaeMd+5O9q0qdbEfRxgnjV+aUo5bNoiAQNEo0ed3PODAOAKR4SnJRHQDPKUNimGY1JRFl0Eo8lOUqEtUmhvOP5+2GTLbIUou0frPA0tKKvpkTpsLZs3lGXyPPytI1rodVCxwOkoY/M26OE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789476382; c=relaxed/simple;
	bh=ifezDF7I16bfDJNOI9jPCW5Bv2PkFzf6yRcMhn1GdcU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hSbLRUJoqDLVGMiNjtKCdpt0tpZHZGXw45hEBMER8fZRq3lZbDBf2OO9tqoHDaqOqjKAsC1mYAAoVUIZXgeSXeo6xRFu7AJiFZ1NkEC+ztVQoAyYSSBwbGqWKyx489Bt56hxcNT2MJVjTGMddAQ25iWCKNb6d68I4NnPh2/fx2I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=NpAMbinK; arc=fail smtp.client-ip=52.103.32.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="NpAMbinK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UgHAzfOqZVQpqGLkva1il+5O9V2VUMEqL/xwBkZI/T2h5Zxor/mYh4zytg/xPhQJ5yinZI4mlJ5HuRYkkMTuD2gIDVppeIYaAVc7Jnxg5T5u3XwVrhV655cnb7PEBPrKeTGwmYaOishhWiKMBqX/44Q+4kUQbAiiNy2mPvQSMeONBvosJnt7HxBgkShBN1I7sFGgvdkwY+nSil+EZH20FTwimJ/8zTw1UpWEXQioazI6v/2Rmar+knZgbp7r4ZOab1xmM5LXKHzKpRrDt+xISlkqpSY3bw4nGtdnq0eL+x7CmvOUODsM3vy80D5uaZKLlqHYFwj7vUzUpaErNhp53w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tbz9K4YFtnm18UumhXA79e6o9bXJjq/ME6X5j0dUt0A=;
 b=PD+wqSOoyt6zlNy2E+lmie3Q25wICUbae1jG6YA15oyp6xLWke8bbA6eMDi/pP/dnCkHNsErbPCLtUIKFKP8zb+Ba7fzzOEa3r988WM9zIinofi3SWyrR0K1NpnS7EJcmFe5Oi3tXoYmLUn1XiR5ScuYdXTVeGGXEZHgIOvAqL6aYSkPEuT4/Ih0DXODvGc3aSSHjdk8+3eI7keODSW857FbHAfOEJV/frorFj37t6VdhnaKfi0xhhgRcGf+ApIv8YwhgBFvu2YY1krXaxg55P8cBWa8ycz+jlY6CAZFx4ilikZINKjScQuCNHGEifIrakJeHgwvQtC3bv//QIbwNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tbz9K4YFtnm18UumhXA79e6o9bXJjq/ME6X5j0dUt0A=;
 b=NpAMbinKANjAQGt0ayXkm7l7b6PzB6m23cnCKv+WmMIXTAyGMkUgF4hyZPJNfYxDrMnMlqeRdrr53ku434gvI+AgVhCZsAYMyYV52fmJW6kQ8DHIeP15GptXozzC+Ez+zea4ErOycB1OUdle/N9iL1Wv47xjLuldOnEaBWhUwEHIqiKbu+v9JQKnW6+OvAZusPUNksqD8hYmaAi9H8u/r21dRX3QIrRAkBHQLI45CM+6q0ujQ+kFbK3lNKMEl9ZfBpq11EIWvRMzX//MEiMz9Kjwu0XTTYaFP7ky0KGfAJy+NTQXmPNTxu4Mq6+qEgcID8FyoEzfgnlPHFKgD2g7jg==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by DU2PR08MB10106.eurprd08.prod.outlook.com (2603:10a6:10:46d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.8; Tue, 15 Sep
 2026 12:46:17 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0428.004; Tue, 15 Sep 2026
 12:46:17 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 08/13] leds: st1202: Take a reference on the LED firmware node
Date: Tue, 15 Sep 2026 13:46:05 +0100
Message-ID:
 <GV1PR08MB849710C564F23C21BDA3EA41C5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <GV1PR08MB8497668D389D43F680D2CE3CC5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497668D389D43F680D2CE3CC5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
Reply-To: fombuena@outlook.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0156.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::17) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <20260915124605.3387134-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|DU2PR08MB10106:EE_
X-MS-Office365-Filtering-Correlation-Id: 98ff04dd-a0b0-43b2-4925-08df132755a2
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|24021099003|16051099003|41001999006|15080799012|25010399006|23021999003|37011999003|19110799012|51005399006|8060799015|440099028|3412199025|40105399003|2607281247196008;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zOehhekHooPvWYIaDNiELTq7Vq+YobIHH9YdmjdoR315tBVI3TjHIQjqhojN?=
 =?us-ascii?Q?dABVT5pQEE85yvCbcAftk+mqttBaBVw0Pyr4EprDj5qifDtYbor0FHxvAOhF?=
 =?us-ascii?Q?a5SsmK+aaa56ltv1hPQPCrPa6U9AzoOQFFB3kkB2hqtOpUXD769DGmulkdmE?=
 =?us-ascii?Q?T7rDkVI7IDu84kK+9jPr9HS1elE0wiuKKghSSXolHY5W6YFInxv64UWXIsPq?=
 =?us-ascii?Q?b07wnzmB8BrJAbgY8ByusSkdIubzb1gwNvIMjxCLwOFVBHBW/8+SA2LqfWUr?=
 =?us-ascii?Q?VI5+1Lw+GHPZwNhiFojrFwNB+Qmc8v3qU+cHex5cr7DP86lAkx/VN9ZhH6kg?=
 =?us-ascii?Q?SUBRrbnZCDFBd/YwbNhrhfZlt7LNuFyyiqZUHCgKL6YM7xTIzU5XDW4myYeK?=
 =?us-ascii?Q?14PfrI8lIF5F4viY1e7wAxWf+Bgk/V5gqIDS8ZBwVOttCAOMp32PL26z1No2?=
 =?us-ascii?Q?IlUqwpt3+YI40dE59fo2abEiQTHau3m9JnjOd0D99pG6HiqGyqN6G6NXH8yy?=
 =?us-ascii?Q?xEpCRLhnapDdlU18z4BX59q372Vo9byr2theuYbnTtejNhCwwsiHR/kNNLuU?=
 =?us-ascii?Q?famfSPfzdb36iH4RVVyGWcO89kt2YgYwjlCVUrfFbaFWsqP8hB3XedLYRvVC?=
 =?us-ascii?Q?iVBbQWqgjL0CHcvUVqwZ+ElXTfibsD9wAL9cWKQ845W7LlyJqyMncDkIPGAn?=
 =?us-ascii?Q?k20eedq89sQaeBmcV85/Kox9sch6Bcb/o96u7d5Iyi9Uv/4dMWKPUB3nLVgc?=
 =?us-ascii?Q?3JIbT9WAf06vnU/arUjfYWxZtkfSuQoekaL0WVSZnzkaZBsrVIKXFl0JyBPO?=
 =?us-ascii?Q?AmuB5kFK532/fjdnHYtCQoxu0Ix0bXF2O4+IiO9A4xjkmeabxu3fBvTHMPzJ?=
 =?us-ascii?Q?grrLtJYvRQLKuv0CWYY7gDGelU/MDPrv1Mv7dA0SkV0m6jusNUIEzuVTk8rW?=
 =?us-ascii?Q?EjJG+jENE6d49jvxszUsoY3FENCLqnfT/0MVa8MvbhwHLgkc7CSg9a/r5oLi?=
 =?us-ascii?Q?cxH7M9B0mtCod5Z7RqTDTwUujQ=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bPqLoEpCE72eTw8fabbyshe2n/bZ7N0PFO/4JzYWJstyE/baXOzd3w8qPb6e?=
 =?us-ascii?Q?Yt/DhyreRyvdD4/muj4kKcjv4xqJLrcY9DY2OlLeead3lC3mBgGc4d//luBa?=
 =?us-ascii?Q?6wMVCN7iV0ct2fBgtg21yIfyd1HulDeFSe1wgcqg2wqV6QekxgyatAcxj51h?=
 =?us-ascii?Q?HVSbVr7iw34wTXH9Sdx77VGsjn11Dd7Ha3M8XmRRL0CRYvb3rTu5WwdQpCDP?=
 =?us-ascii?Q?y2sp4J5k7caSOZlFR2OZ8ksslB+TBofrAvCtMeQyLGoVQt6x94eOpxEfCJ0u?=
 =?us-ascii?Q?GRkR84UVnEs6xiBUMPqCMT3lP/50LAbIukR3WoRy1UM8SKSCsQTXW7nL5gp/?=
 =?us-ascii?Q?pIVr6BWJlguKedRdNFK/YrTEgNJ5azTe6/B3XnvYik52uzxuEVqocT771r9D?=
 =?us-ascii?Q?elMtg4uN1GcSXuD6F7bwJIv7ur+IYNQ1FgN0F9xNHHWhRIWrBZ55TVtPdoT+?=
 =?us-ascii?Q?27w27VOdSjzGPej7JfhDGMjjBIV+Yg6mrnTMoUTvrLw+RxPFF2SGPkM72ix3?=
 =?us-ascii?Q?86orFM1xPlkrm5p+f5aOFJFCq2ZbApA0GUWG3bGTYxIS/Eyq6ZEwFhmLQXUl?=
 =?us-ascii?Q?tyVd+kuIGSvXQNOXmMoAL7TCOvLva66hHE1/WWTWkgKb3C1XuJS2h8RLwYFd?=
 =?us-ascii?Q?xh/vDUAiKHfa0wQ/OLx28xOdaXgk1THAhcZmRWyLNFpJ4hwCA98JTlTY2toi?=
 =?us-ascii?Q?X01/0nirIJ3ycJZhxtgPYEqDeLr0kIBaK/QfDTHHBqvbQQT702y5kmgu5xBz?=
 =?us-ascii?Q?mcbUEsYNDl1v1lS58hE20LBQEWLdFHPXwBOzlkjFb5C6v+9Lc0MmC+rMM4OP?=
 =?us-ascii?Q?KXlzHisY0n1ik8Kzy2wgylKISeAIElI5ccrzxQbym0vYejAwvINUdYvBGctE?=
 =?us-ascii?Q?QqcPCNSSshNyvhFojHkmClzuT5JyXTMrmOPPEQ4pDw3xrW8zpGAfbU4t+g0J?=
 =?us-ascii?Q?6U8xuwlX+yqG0R1S/5kLg0tWBIhLr3HbM1WRlO0/XHOg5D0X/K4dHhpj1L4+?=
 =?us-ascii?Q?DAxjDVu9OULdWRp1R/JORAKrhllifuedVMheBLu3qezy3fDg6UvtW3Ru4K8J?=
 =?us-ascii?Q?EJSRfSyyAgSLtU/iCYwLOB50OcXeFv/gdfA26g4BcS4jVHFRfTo46HfK8ECs?=
 =?us-ascii?Q?xzDYVcjRpdMRfcy+a6EKcXVD5GRU4afRmbkuhrXaIQ3Cvm+Mc05Bv9MVUbsP?=
 =?us-ascii?Q?6IGlIT0+BT6W1nw7evOiWIOFzx9YeFFUhy/rsYn0u6Rt3pjbmcJnR/NcUbli?=
 =?us-ascii?Q?MqJZkvDToTMS3xVbkRW7xdT1PVnnshLGWj5uQ5OxIJ9UnUFqZRWKkCd6aeRG?=
 =?us-ascii?Q?phnySeznKhmZsO45zhbf9LMSdozGH0tUjy+4Wpc2MqjYWOAzvkTHDnRpEefn?=
 =?us-ascii?Q?XGFEbx4tHZ/lkqOMbyB/NPA2WegzOinweDj2xqIdKKMzDx/m+zksXpWNKaTG?=
 =?us-ascii?Q?dscvY+o+BAw1okpIa4d0dwX018hD4WWQ?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98ff04dd-a0b0-43b2-4925-08df132755a2
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 12:46:17.4828
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10106

st1202_dt_init() stores each LED's firmware node while walking the
device tree with for_each_available_child_of_node_scoped(), which drops
its reference to the node at the end of every iteration. The LED class
stores the pointer with device_set_node() and does not take a reference
of its own, so nothing keeps the node alive for as long as the LED
device uses it. That has been the case since the driver was added, when
the LED class devices were registered inside that same loop.

Commit c72e455b89f2 ("leds: leds-st1202: Fix NULL pointer access on race
condition") moved the registration into a separate loop in
st1202_probe(), which also leaves the stored pointer unreferenced
between the two loops.

With CONFIG_OF_DYNAMIC the node can be freed while it is still in use,
leaving led->fwnode and the LED device's firmware node dangling.

Take a reference when the node is stored and release it through a devm
action. The action is registered before the LED class devices are, so it
runs after they have been unregistered.

Fixes: 259230378c65 ("leds: Add LED1202 I2C driver")
Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
Assisted-by: LLM
---
 drivers/leds/leds-st1202.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
index 41eac6195659..ead7a3669312 100644
--- a/drivers/leds/leds-st1202.c
+++ b/drivers/leds/leds-st1202.c
@@ -12,6 +12,7 @@
 #include <linux/i2c.h>
 #include <linux/leds.h>
 #include <linux/module.h>
+#include <linux/property.h>
 #include <linux/slab.h>
 #include <linux/string.h>
 
@@ -399,6 +400,11 @@ static int st1202_blink_set(struct led_classdev *led_cdev,
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
@@ -418,7 +424,11 @@ static int st1202_dt_init(struct st1202_chip *chip)
 
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

