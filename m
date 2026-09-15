Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazolkn19010019.outbound.protection.outlook.com [52.103.32.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52020344DBB;
	Tue, 15 Sep 2026 12:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.32.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789476318; cv=fail; b=SZVNSe9AVNpT52S5dOCFW/CE7AArQhIdPbibuEMk2Ko3JPIntiqE+VDOj2W/p7987xDVo8++MKpK4a/oCwEcXAnFV7OHQQeabpsnVnop71hlbq/Zy1lw9ISftRPpek1f8YL1g1c4bxZ4yLnPrEDndvsgM/pOhUQ9NT49ih4Xq38=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789476318; c=relaxed/simple;
	bh=J93TMSvtKGDLie9tLNR2jmECJ3OuLbw0l9mKap3Bof8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZPvCsraqoO2sU/MhBoLu6jhYI7/lHlIVVpJ2Z5WZ7LFFsIOyA8gGeJry/WZlqNUM0HbSzFUok4HvNihbBVIdqg4lRBXIrG9+ndaNTnjX1hRSjb4WuO5US/w+gG/N7tyLQw5BkvG/y14XCHcOOA2FsQ+LpOBBHJWgGPfJ8v9cUxM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=ICbPtpsf; arc=fail smtp.client-ip=52.103.32.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="ICbPtpsf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gAHo9pj0mrF2wDXaPdTlpf92r9eNyhirI15mdxX/zMHzdgDC6AOolIRtrqnyZxB2bZLjK7DjUmOFdUAY+L7TrWdevLj6aeouIZ9PMlqD/WCOxc7aiXQ32nJgzkFDTid8ZlqG5weuCr1DlpgH+5Qnx6BwRq6kbLH3GiVvspvyv+Z23RFy+EvKlO8LNZQ2MwK+fpHOFRYXDL30tC6qRcx6T0sKTN7pYVaR5289AFUsnsnGUxzY+djS3C8Wh2zBa6nPK+Y+22nHDMWMG+X07ZSdQqj85r1ms96SZxY/mvZzhuknM2O7YnyzFj1QnheLBNznmeTX7E0CWtY1rfeeJvwXJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ERdKQbspRW7GladHgGU5Fz/Ln06Zxaf+BCD0cDwOmTk=;
 b=GmZGS4oE3kZd0dP5wV5vvNz9MZ9CBYOPPsV4whVEc2DUkEo9Uwio0SCV7+27d3HiuUQjhlqEE7z4dl1Hffw/B9wEkyPwSfn+JK48ZZjtFbn5cnVpb4//FJSBzsx9VOYk2uXzxOnLxG7yu7XzH4X+iy8FYdN0MJfcB0jv+5+eqLEs68ELI+tnSBn8/USUPiPEZ7g9hy5/tYF2O7klhEMK6DYlR5/mnT+/LTyuSgWbe7hoSI4ZtDQlf6l/QqWLoT5sKnWeR+bZQmyT5AN4qHMNbxTsiylcme9LnzDp2lHu83piDkVsYaz6+Q/Tu0Nfrh7dHFbuuuFdAdkWof5ludtBQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ERdKQbspRW7GladHgGU5Fz/Ln06Zxaf+BCD0cDwOmTk=;
 b=ICbPtpsfnCimUj9r7uythClnJ3qlpsgS6j37Hkpy8quWjMxljh7PxuwTfvPN7h0wh4kKxZajgLSLm6KIZULwZbywerJjtHBbQ8HA5MNgHdcROoWXNqdazCyVRvBisGmosKkADRAq1uCQkDTv9rplXNNgmVJeuOs5QgWLzExkNq/C9yjpQG+qIUPlaFqoMLPU19AlXCyP+AAKnMwY8/Y/egAXS8K00wstWITY559iT00AN8Mxqb27wrP4npByJZcPiHl8ka0L0Nfs4H6RjMgqmSW6IRAgLReGMmAj+Hiu8e/PPS2eNASoxesIEq1TK9ORKrVsZzQbGL76zHj1kLv7rA==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by DU2PR08MB10106.eurprd08.prod.outlook.com (2603:10a6:10:46d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.8; Tue, 15 Sep
 2026 12:45:13 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0428.004; Tue, 15 Sep 2026
 12:45:13 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 06/13] leds: st1202: Scale pattern brightness to the 12-bit PWM range
Date: Tue, 15 Sep 2026 13:45:01 +0100
Message-ID:
 <GV1PR08MB8497B938D3592582E17CB757C5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <GV1PR08MB8497668D389D43F680D2CE3CC5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497668D389D43F680D2CE3CC5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
Reply-To: fombuena@outlook.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0286.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::21) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <20260915124501.3381075-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|DU2PR08MB10106:EE_
X-MS-Office365-Filtering-Correlation-Id: fc421d5b-303b-402a-a98b-08df13272f70
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|24021099003|16051099003|41001999006|15080799012|25010399006|23021999003|37011999003|19110799012|51005399006|8060799015|440099028|3412199025|40105399003|2607281247196008;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vsnD1mwFB5FvVoZrQx7ollUSg14fz9QLZqgwxH7SQdxOcuaZkReUcGLH0hH3?=
 =?us-ascii?Q?OXTw3ZlxAbRb64av85lP41PIDficz02h6tH8WKCjPO7gBAxUAPbPcuxKYrTP?=
 =?us-ascii?Q?SetSrjL+ZjHrqUdqC2oFsKs+OQ0zUYTDktWc7kabdRK5cGgmQLUpyOkLVmt2?=
 =?us-ascii?Q?fY0+P0/zXrZ9zm4eCOcLN2zL7N9g9ZssFcMJZqQsbZpNtg95fqevrkI241mG?=
 =?us-ascii?Q?I/ykVwbGsUoCTN+/Qkw3C8KLzMLsSqFtgSCBkZSfjhUZ8aOoqsr8pBdzx3X4?=
 =?us-ascii?Q?VV3RIm3RuXbuOK169ENOcst4g0cIzUHU6hDcrKGYcPUDDW817Nft637uCZ7y?=
 =?us-ascii?Q?WFU+z7Du1uXccGPM+GcCWhTtDitG2sTTVH50LmekqEIlB8GfrVJOgkD4FjAE?=
 =?us-ascii?Q?Ip45e2BggmPsosCGvltIQzsS3JyqWktnzlMFvt5wod79q4TJiywlFjbmSnBP?=
 =?us-ascii?Q?YmbLlH4q7YCo8FIawwHsYWqkYVhwQC3mWbsRM2CrZOsO9i4+9dxKPJVPhjgW?=
 =?us-ascii?Q?8PkuC16XooQBGCoq45bvExcoNUW5jkjE7fD94FTy4ybjK9N/07DviRBP/Yj0?=
 =?us-ascii?Q?aX4CNaMRdrFi3eX9WDo9h5n9ts752OhPhXZpjdZubxRJVl3AIv1cB4xWpKir?=
 =?us-ascii?Q?NI9tWgXg+ojmPr8rcQMxuOHgjOgiOWaYzgSX+qfp1LI20vDly37h+DmRmpmR?=
 =?us-ascii?Q?BTC6eXN/iUrWOgTl7LMz/ANXgISs0LK4qPPAudMt4fepag0eq+3ZFwO4NqUN?=
 =?us-ascii?Q?jUssn1CCYrf4me59jon2DQVyBnJUXQhRHCOfxsWkwQeqemYDZKv3NP5v62bR?=
 =?us-ascii?Q?YKVyEk+/FsE4S63xW36YKSEF6/nKEsbPPIiea5koWsCNF/HNTSfKEEj/vZqc?=
 =?us-ascii?Q?gIYwNlLdaIKHyl+wsFfCL1C588hwEHDSVqR007krOY0stKEHNqFtigCupNyg?=
 =?us-ascii?Q?9AA5QaolC+k0Wkc4Ez0p62iJMtSGF3QbbamOBszCbmFH0ewYsHgxYShGyNoJ?=
 =?us-ascii?Q?pyqsB3/ngbdAAEVCjg37PqvDKt8cPFKdh3U6PERXktZtHL0=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1nCW/xmZR7PUnxyo6KLpForWkRwlWmQwCxZ9e5SRzdvoUafDmdswGNCE154D?=
 =?us-ascii?Q?NNQvyAjmFq0sVzj9X2k01xieE7ArLztBHZQ7NaSn/fEgpvRo5Tfjq0XmMVPU?=
 =?us-ascii?Q?ApnyNz39L9CVC079Z7LK5tX/4+al0MP7Lmk/yjxMG1dYmdCylz1p8ROA7xG1?=
 =?us-ascii?Q?ZjFORjYoaGayVcs7jwFZa//j2LBeosbfPmKwK3QGQJtSN5kABmXaur2H7TMj?=
 =?us-ascii?Q?bThdgh0Gl4E4PzTJJVA3Z4gYrnLGecXLFXvreCnI76miKFTm4Q3haVS5DGWu?=
 =?us-ascii?Q?Hbg2vE/gdg35Cd8kHlDSjv9gfh8jYXfS8Bx82ZGAvO6IxcBkxRlaxZg0zeAu?=
 =?us-ascii?Q?0XsHNFuErX+WHFQ6UiqsYP5sOT7vo+rSn0aVCkujKA69r7KUctyOdTGnkZuN?=
 =?us-ascii?Q?Eg8fOtbc6Oup4OcmKHA+C83TcDFuMg2YtBIJADNSB8nKI8ZV/7GZx49narTj?=
 =?us-ascii?Q?ZchOUafSDY/ej6SBj4bKH3FKdhx8LVslrfMjQTm+WcZAUVQflvTBMJa6BMDs?=
 =?us-ascii?Q?N2hznrHJf4WbpThbNZzljHs06yH6qn+NJR6jWDs/4RIoS6Reo/u5SBkaeYgP?=
 =?us-ascii?Q?mayhJQNRczJ1Snvnn3T89kgBN3hqk5bc9MRmnjqpeyr3tVpsONetwLYd0Q4K?=
 =?us-ascii?Q?y26OYvpsnuMS6A3CmXuajGO0R/W+UoFAE65IUXFfua+PKDSoAWetNrBeTVly?=
 =?us-ascii?Q?1mSV/gVSSyYQp0QSOZwiFM/4smpnAFXd5/AdSqdPTBAmPSUeeDCH8ExGV3Ch?=
 =?us-ascii?Q?F8LXjIsWJUyRykNcGzGF6c3o4DWFH2ZqgaEOIR5BsVBTHVdbeseec2+EOQJq?=
 =?us-ascii?Q?MQ7cDb6lsR0kQtNGxyfa8roFeaFK0xhw9fjpktG1aUe9BKlUzKInvu46lDMT?=
 =?us-ascii?Q?4I8cveLgTIMJWVrWU2UB07LP4EU431LmlrEhvJ4MX+u3xyCCb6kLOFVDlo7c?=
 =?us-ascii?Q?00Wg6i9JCBnrXvrT8k4XO2NUlgAAsEqFKaBbB01jRxjHL1YWWMJxos5r5Ohw?=
 =?us-ascii?Q?Qjmy2dGwM0N2DR8WbByeESaNTdbl5jRIoQq9sQVCyqSTZ1/2XqjDpleYCVKT?=
 =?us-ascii?Q?R92E8l+4UBPvlxHhFBWqMbduMdK92pdE6in4D5OV0ATIAUjf0cV8+DJVIIom?=
 =?us-ascii?Q?L+tmIBwkBTBtAc0LAyjLN/VDwa1/9lw+92sUMbcYcO85T0dCXEjrXvDR6vgS?=
 =?us-ascii?Q?mM0k04YWPBuW3p8oVLCe4nl3gInulMcZFfJjpPq0aG2Y3qzt9BVVkn2bl1mu?=
 =?us-ascii?Q?QGdfz6mqAZlxDThsgtUSQDiaXC5iFeR2ymZqT/s5DfFFM0wImQrwXP3o0I7+?=
 =?us-ascii?Q?GOP1NY+f3spxG+QeHHhSTHLRlxiWn2c8M/I/dJyBu/+zG9HyiW0xHIOm+Ci1?=
 =?us-ascii?Q?gcoRc1zD6uioel1qkrzk/mKwFhyWcWdOCdaABFn6V72lbr7M02A3VjuaTN5S?=
 =?us-ascii?Q?Avw/tkeQU6E8jcN2D9chsLlHHJBuHDhh?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc421d5b-303b-402a-a98b-08df13272f70
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 12:45:13.3598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10106

The LED1202 PWM registers are 12 bits wide, but st1202_led_pattern_set()
writes the 8-bit brightness value carried by struct led_pattern into
them unscaled. A pattern step asking for full brightness therefore
drives the channel at 255 out of 4095, about 6% duty cycle, so a pattern
is dimmer than the same brightness set directly.

Scale the value to the full PWM range before programming it.

Scale against max_brightness rather than the register maximum. The LED
core takes max_brightness from the DT max-brightness property, so a
board can declare a ceiling below full scale, and the pattern trigger
already rejects steps above it. Scaling against a hardcoded 255 would
leave such a board unable to reach its own declared maximum from the
pattern path while the brightness path reaches it.

Scaling divides by max_brightness. The LED core replaces a zero
max-brightness from the device tree with LED_FULL, so the divisor should
never be zero, but the helper returns zero rather than rely on that.
max_brightness is capped at U8_MAX, the driver's own maximum, so a
device tree declaring more than the part supports is treated as full
scale. struct led_pattern brightness is signed, so clamp both ends and
floor a negative value to LED_OFF rather than let it wrap.

Document that a step is relative to max_brightness, since the range
given in the documentation no longer holds when the device tree sets
max-brightness.

Fixes: 259230378c65 ("leds: Add LED1202 I2C driver")
Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
Assisted-by: LLM
---
 Documentation/leds/leds-st1202.rst |  5 +++++
 drivers/leds/leds-st1202.c         | 16 +++++++++++++++-
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/Documentation/leds/leds-st1202.rst b/Documentation/leds/leds-st1202.rst
index ed32eb3a27d4..28479a112389 100644
--- a/Documentation/leds/leds-st1202.rst
+++ b/Documentation/leds/leds-st1202.rst
@@ -20,6 +20,11 @@ brightness (PWM) and duration must be written to hw_pattern.
 - Min pattern duration: 22 ms
 - Max pattern duration: 5610 ms
 
+If the device tree sets max-brightness, that value replaces 255 as the
+upper limit, and a step equal to it drives the channel at full scale.
+The hardware cannot go above 255, so with a larger max-brightness every
+step from 255 upwards is full scale.
+
 The format of the hardware pattern values should be:
 "brightness duration brightness duration ..."
 
diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
index 9985b4b60989..5558ac9612a1 100644
--- a/drivers/leds/leds-st1202.c
+++ b/drivers/leds/leds-st1202.c
@@ -91,6 +91,16 @@ static u8 st1202_milliseconds_to_prescaler(unsigned int value)
 	return value / ST1202_MILLIS_PATTERN_DUR_MIN;
 }
 
+static u16 st1202_brightness_to_pwm(int brightness, unsigned int max_brightness)
+{
+	if (!max_brightness)
+		return 0;
+
+	brightness = clamp_t(int, brightness, LED_OFF, max_brightness);
+
+	return brightness * ST1202_PATTERN_PWM_FULL / max_brightness;
+}
+
 static int st1202_pwm_pattern_write(struct st1202_chip *chip, int led_num,
 				int pattern, unsigned int value)
 {
@@ -235,8 +245,11 @@ static int st1202_led_pattern_set(struct led_classdev *ldev,
 {
 	struct st1202_led *led = cdev_to_st1202_led(ldev);
 	struct st1202_chip *chip = led->chip;
+	unsigned int max_brightness;
 	int ret;
 
+	max_brightness = min_t(unsigned int, ldev->max_brightness, U8_MAX);
+
 	if (len > ST1202_MAX_PATTERNS)
 		return -EINVAL;
 
@@ -254,7 +267,8 @@ static int st1202_led_pattern_set(struct led_classdev *ldev,
 
 	for (int pattern = 0; pattern < len; pattern++) {
 		ret = st1202_pwm_pattern_write(chip, led->led_num, pattern,
-						patterns[pattern].brightness);
+					st1202_brightness_to_pwm(patterns[pattern].brightness,
+								max_brightness));
 		if (ret != 0)
 			return ret;
 
-- 
2.55.0

