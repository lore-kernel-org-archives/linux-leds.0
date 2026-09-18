Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011054.outbound.protection.outlook.com [40.107.130.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333753AF662;
	Fri, 18 Sep 2026 14:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789741199; cv=fail; b=BsqqmzAhj+frvuFTHusbzhGC1dWXQ1A1cTKT/DGJEykq1kkulJlnVmuA2iWfI/f5SA83F0UtgcXOPmPv+qMQ67szAXNCJgV9NgIo1xmYzx+CKc6x2BPNoxg8R4hkA1/u2ZLhBmvi6ZzrHuT6/JTAid4QAu3fg7zX7Dee1hq+TVQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789741199; c=relaxed/simple;
	bh=xVQZIdXn36ASKdIyFruo4UVh70773mx+cdNeZv2vscE=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=sfhcAI6NreUOh9o+o/ZeLKdiQtF2yrj315wJeaQeGRRWDFBVBHQD1iTzu6ILKu4PPQb7Lrs1iKDP28nhG9objY3Po2gxi+Ubq2RNEmTYua/xoPFZcKCnXtW605dZ9Kbfe95RMt2ZuAFpXG0PWYVgn2qppHKYCMrpuYBmHg/LbFk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=mVdj/Xtm; arc=fail smtp.client-ip=40.107.130.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="mVdj/Xtm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sYbltFIW7v53Pf9IFEivywiVPh738anRRi0SZ2Gn/gQMZB4+Z1M74oAjATQJnuSHTPzcD2tzCSCjJCBwtRSBr/to8UREBrGBQTmnNyktJKOhZnrVubRj8lUmSD9QcAuKMTVQGPKUYZY1uTkfHKy5PmdFKOcmFZSteW6LjNU1p/zrzbv/NnQW9Clcpv3usYQNQskI+oBPDCWFPOjBpzzn540ZywMkONjidhd9um3uJyWtDKVrn8DLKLkP7Hn4CQpx1UhClPad8I6PMrrHAhvIIr7p5KsfAm/llqEbmpjD+5pAWtPdbj9hR5gaMu4RUUFyHTbaKUKARhK758MONPFC6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bROyvhQ8YX+GvRfEk0L0CB8FxMHSb9WOWqSHr+EeuGk=;
 b=VpZGTMCPwsAKGGYC7yNiVsUozxUKsKd93jpehWEYrISubLmemasVR6jJPnSNbG9u7yw05dU46/DnNWAf6ufJuPuoaFIpb+yuA9BA1/W8T08sE1lqkWJlDf5aTD07ylTn4kDFBRAvOqsVt0CC41DIwoOFgm/KeazLPQ3DscUHxAI73w9wbOeZIb3pBNhPectjSs37s7TIdh5xwMIGrXvaE9v906KlZYqQDSJvE4qmw9c9RUbQYdMB1IThVEkpmlwxvUKDMadLtS83DRV3Wm9sgae9uxpqWEc3/q2eiqnROjxVUejuTsrzbh6C/74SIFBKuGEfPml8fDnKJg58KzKqmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bROyvhQ8YX+GvRfEk0L0CB8FxMHSb9WOWqSHr+EeuGk=;
 b=mVdj/XtmugWh6itKTHh3ij1/6qf3XJA8HrMHrircaM7uF59wJHWmWJ7g1oyEiNUHq8rw8EvccRSjHaVkTjB4AzH5df/Ri88WaAjVVimZL9voE20vGHKefLb/UK50CqSvgDhqfT5BrteOYSWBg7n3lcANfAXY4xeYn7XCRqz6lzfoNTlERVJJHRgoAKEdYxCtTjz0pmU6i6ZIPXD/xrq+XOWbqA4Z7nDGRAnMFFEEgIgowaqHGaYat9su2jd1n7/MoU0oA+UCnFkLBk2AArjTacUHybmsZn6+TiQcU2ZpE+YM/Ix9lJZIfJzFOg3NI/B+fUcZ8hLJwnJ4+nFzvy/Ihw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by ZR6PR04MB296659.eurprd04.prod.outlook.com (2603:10a6:910:e1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 14:19:55 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 14:19:55 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Peng Fan <peng.fan@nxp.com>,
	"Mike Marciniszyn (Meta)" <mike.marciniszyn@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Kees Cook <kees@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: [PATCH] leds: use assign_bit() where applicable
Date: Fri, 18 Sep 2026 22:17:23 +0800
Message-ID: <20260918141728.3022983-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0012.apcprd02.prod.outlook.com
 (2603:1096:4:194::7) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|ZR6PR04MB296659:EE_
X-MS-Office365-Filtering-Correlation-Id: 0665131d-e56e-4b29-7a65-08df158fe9b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|19092799006|1800799024|56012099006|10067099003|11063799006|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	5ymWq+v43WKhrEubglv1+RyDWo3cXTxXxp+Kwd44Y60XrBzv/FHq/HyekCTTxPUu0VUkYJtu/ac2VG1rBvBqpBmvLddBYXmcL5qE14MKSZeiS87/ogneM5vTheJuCgIHvnWZgxLJLBL7y5dnPdNfp7CVk8mvJIDX+3sprh6uTKb11XCrrEW/V6hkQuQk7wnftCK9TGUODNzgP+u7ptq1lbCoYo9i0S04Yj8wDfx0Jfd0PMT2/e0JnWE+5JP3bDJTeZ7VMXVu1QOVutezxOwyNy8uE2tmFGQJZktblNFbeortIxVZpv/vx++HNXU+J2uwBSGkw9rSPrrAR9OlpVa+4pNU0it0c0V461hhNZniuSwCGjRsrSug22VGvcfmkE+D3nP1Ik0JYkwgc3IY0YOWmKruiAozGLgR2jZ0ANI/mmMO1N2Ar0Qeqj/3ozDuoWHiVShF9chDI47/Z1+75B9iuvFnL6FO8LgWGyQvL2QM4FHqH8FHkq8PdyOdxBSpraybkHlw9UGK3pV9rM1YIfDyD82iOu041gWbqSkitVK1c5EGs3nDAGt+dxlZbwuVJtgy4yBSLKuGm4pJU8JRkhcNYlv5NomOYS8NkbOj387Ha0f8R/0OWUXi54xg3EYgd7VSoYdkISGec7O+rC4/1DnKsNMs3EjBVs6onlZh2atbbhw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(19092799006)(1800799024)(56012099006)(10067099003)(11063799006)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Sx7uPZ7VcxGKVVNPjBQq+T7tnSGvkkxDYGxyb7OijUHi9Odm5RA6tDnNLN4k?=
 =?us-ascii?Q?1J7W2vN86OHFuPFHDMw+1STqufcq233p4UBpR1WhMmuVrsmAeLOct14hQdK2?=
 =?us-ascii?Q?wyx3erjFzR32nMhna7btBERrVPl5Ml1SIbftPO20w7b/r0tIHIw1XSp5H2oz?=
 =?us-ascii?Q?v4mWKjc+eLJtE1gty22gl6o4kCieGi3GbvFG99DZDs+AGX9JHs37Rl/ckQa/?=
 =?us-ascii?Q?wLL+xanT5h0Xj4ed2SoggKwx6r0lmo2Sx/XLsiQMrvBE6XV335x0DIwnYqeU?=
 =?us-ascii?Q?91PWBHiBNRb6FTAJst4ORWoBZo4J2EuMAEthJ7lAItbudVO3YX6IKYWIpow2?=
 =?us-ascii?Q?fBWE8xI1m/LQP3RK2r0hF+clxmWkHh+60jkfAByPkAUPTZqS2cNQM64EQTQd?=
 =?us-ascii?Q?xky3U4d1Ic7uoj/Kh85AWk1p1zNDngZpr8VWiW8AmdaSMqKRBLg2d2CLpz1R?=
 =?us-ascii?Q?/TMXHFTkXluYCHn7tMx8Sj3F2kId9VG0QU2YWaunk7g+cFSMDa8M+tR0OBeu?=
 =?us-ascii?Q?UD39MxgvYdW3BwlLagij/404xxhiEU6NWYe4vCfqii9xoqR2E7Rg9dwLJUAe?=
 =?us-ascii?Q?T63REXxBUxFJywWyCqYrTllwkWaysmnVfLqf3SEH1UcJbRQDon6+YfI5uuVm?=
 =?us-ascii?Q?UAdIctoM5glcnmUiTSmgcyDjmTqzPG0qRJax5XeZH2dcy9I62vyKHi9Jc5DD?=
 =?us-ascii?Q?GZm+LbzZsNCVmpO8WbqIjiCIUzbC7/hsWnHgXLDqGbwGj9YHeRY9U7XFCufr?=
 =?us-ascii?Q?XVKp8lz6F91jH1AfXwzsALvVUIulOfpcVCCzJT+YfNOoMtrbeq8nJqViC4EH?=
 =?us-ascii?Q?WyUPPSqfZfFG6+WvtPqdwgNXVXDPlkGe7f7HTqgPzWwzyB8jeaEdABRYcGso?=
 =?us-ascii?Q?LNX+wbpGphmUQV0JC/yhKqkw7XD9v+Yl6Z69e0lt/ebzgbbmX8kpYgzvy5EU?=
 =?us-ascii?Q?OZd26XC8I9AqbBm94tQXmUFu4k2005s0I4eGSjrThzN2pdEG8XM6SfoL6GMC?=
 =?us-ascii?Q?DtNzIK5G4R0KCC440d62asmtzU6o1/+ILYWL686AVeREZ4ju6iWFL5g4OTRE?=
 =?us-ascii?Q?h4KPSXYE1d+ZrVTvAT7fv8BeGYJoRE/frBRDkxtpKvOXWTa9P/v0xVYzxyIA?=
 =?us-ascii?Q?X+lk/zo1FEMvXJ7xooMVVI1NujbB9MmNL8a/1bJnGzYDysfvqtC5/6YZN0s1?=
 =?us-ascii?Q?NGeQGJyTQYQMuyjdP+Q7pHyN6vVP5QOwJnIjxTlCfx3fPBPG2gJTtMB2F8xI?=
 =?us-ascii?Q?AN5QxHw/zp3AMhHiTfbRwdn95g8ONnees3CyN6UFksxe9n33+8JO6ThM5ZXh?=
 =?us-ascii?Q?+U6KvgndU/708XpyYFkiga3J8VLbB1Ays5ajz4UWGYrxPtST+mCX6Qb0HWjb?=
 =?us-ascii?Q?36r/iP7UGSyPgCWU6Fj0tCopjmTYa6R1Nt4EEd6Z3hFdEOdDdm6yMv82jqlM?=
 =?us-ascii?Q?RzvyyFuhUxA8XmyMcnODqef6gOXB4BAUiLQHnP+/vGh/iHLn7CAKoHc7EYkG?=
 =?us-ascii?Q?kL8f35EODND9VXdRhtHhUOpsA1N9oeCTH8OqaCukQmU0fnNX/fIoFVJoGeAY?=
 =?us-ascii?Q?OWfExIIT7nNZGAZjTo46ONxaAn678nuLJcSOhBWng00OhqGRbSya34MmCox1?=
 =?us-ascii?Q?NL06MNMt3ZNBg/yZSoQG3RzldE1MJ2aalN1+Uoq+eB1E0DFuA2I0P4KdIYtN?=
 =?us-ascii?Q?Em3HAMRbBKaYIqL0hqIL9nILaRsNMSKOwMRqlyVrY1ieZh5sIm0r+0gPZ6gZ?=
 =?us-ascii?Q?S1rsO9xV7Ssx0V9Swx+OB5W5nFH7TxvcBytqfYqLlCpBo0cq57ya?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0665131d-e56e-4b29-7a65-08df158fe9b1
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 14:19:55.6761
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OGz+BFTmqGec1JD0STkYuoePyCXqn9kUmvHCWb54+x1vOHOdqimXnf9o92rI0Q36hR4RdbVTgdIbaW5aQFUTt50FdZyD5KvZ0BQ7gE1ScrwUO/2blvDYKWufj4K6Hz50
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR6PR04MB296659

From: Peng Fan <peng.fan@nxp.com>

Convert open-coded if/else with set_bit/clear_bit and their
non-atomic __set_bit/__clear_bit variants to the assign_bit/__assign_bit
API.

Done with Coccinelle semantic patch and manual fixups.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/leds/led-core.c               | 5 +----
 drivers/leds/leds-pca963x.c           | 5 +----
 drivers/leds/trigger/ledtrig-netdev.c | 5 +----
 3 files changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index 073c547068cc..80e281dce195 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -267,10 +267,7 @@ void led_blink_set_oneshot(struct led_classdev *led_cdev,
 	set_bit(LED_BLINK_ONESHOT, &led_cdev->work_flags);
 	clear_bit(LED_BLINK_ONESHOT_STOP, &led_cdev->work_flags);
 
-	if (invert)
-		set_bit(LED_BLINK_INVERT, &led_cdev->work_flags);
-	else
-		clear_bit(LED_BLINK_INVERT, &led_cdev->work_flags);
+	assign_bit(LED_BLINK_INVERT, &led_cdev->work_flags, invert);
 
 	led_blink_setup(led_cdev, delay_on, delay_off);
 }
diff --git a/drivers/leds/leds-pca963x.c b/drivers/leds/leds-pca963x.c
index 605cf7497e4c..5363afbe93ea 100644
--- a/drivers/leds/leds-pca963x.c
+++ b/drivers/leds/leds-pca963x.c
@@ -208,10 +208,7 @@ static void pca963x_track_power_state(struct pca963x_led *led, unsigned int led_
 {
 	unsigned long *leds_on = &led->chip->leds_on;
 
-	if (brightness)
-		set_bit(led_num, leds_on);
-	else
-		clear_bit(led_num, leds_on);
+	assign_bit(led_num, leds_on, brightness);
 }
 
 static int pca963x_sync_power_state(struct pca963x_led *led, unsigned long cached_leds)
diff --git a/drivers/leds/trigger/ledtrig-netdev.c b/drivers/leds/trigger/ledtrig-netdev.c
index 5b4e92c14dbb..7e43fa30130c 100644
--- a/drivers/leds/trigger/ledtrig-netdev.c
+++ b/drivers/leds/trigger/ledtrig-netdev.c
@@ -414,10 +414,7 @@ static ssize_t netdev_led_attr_store(struct device *dev, const char *buf,
 		return -EINVAL;
 	}
 
-	if (state)
-		set_bit(bit, &mode);
-	else
-		clear_bit(bit, &mode);
+	assign_bit(bit, &mode, state);
 
 	if (test_bit(TRIGGER_NETDEV_LINK, &mode) &&
 	    (test_bit(TRIGGER_NETDEV_LINK_10, &mode) ||
-- 
2.51.0

