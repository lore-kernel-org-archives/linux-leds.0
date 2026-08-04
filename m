Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazolkn19011030.outbound.protection.outlook.com [52.103.32.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA52D339360;
	Tue,  4 Aug 2026 10:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.32.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785840068; cv=fail; b=TN+uwkyKH9Nnwp11lsGV2hveq8vWRMMx6uelO7+sKKWGKPTIlZ1vhHKKOcgkWirXVtsQeATvArlrmIVZmEFNuDhgso6MgdSFb0rgzEGkMMgfrnLSVgCfcbTdMf72T3o0+CbtFzzb0b7zB5ySct2eWR4lqnXmireA8EOs5O2ON38=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785840068; c=relaxed/simple;
	bh=8LlpEMOI96PDaMRqU1NvMp8jCrQz/xQ2lROEH5pGj14=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BbWI040rk4D4KGEOdFtnD+vcW5BMMHuXVSyUKkpFNQtVozsECXBnHR5qi5AEOZ5TPytiI8bY41XlxobOT1FSnjd4xOkPlxQz6N1PhT78lUR6viCMmLaDB0qN6RvdEZA0Vuscj8pfVRwhYwOZFXEV0VAOdhXL7GaCwmhVXj3KxSs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=ZVri4KbE; arc=fail smtp.client-ip=52.103.32.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="ZVri4KbE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=viI+GTVJUtDnj5dJRU8HfPOa9omxZq4iOCC0m54evCFjUo2cJox8SgfMWdXVC2jiusW6GYnRDOSb0F6ownDK3XHaM/q61fNnlsFJ4w1sGLNqPzpEywh3BMzsTV7EyCdcNGPCEeTKhWETNzZVNMnffM59QO86/njOS+5S0HpgV98V7ntk1rkFnJMwF92KPgMj3Tc8SsJoxnZSDHu4yktakDhpRCHL/uMp2XgO/utJgGQBV5hOwPDcjrSWBySbsEYA+Id4vDC86ea2SDTCFWPoPSU4uG0FMr/DLsCGpWR881P9mjBqEBMKmoJILFLm7TSw1+aVTHIL4cawsmvYJdjqhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EePqtEEB2xHwXfCFlI3FLm8VpvzH0x6S5aWYRAK8FGk=;
 b=WLmt5B0ppPABni7v5BH6sRtjXPYyhwsQFojqtksZc1xx2jDEBZwUcHk14I18vSvU5OlbPQc70JUtFhTGWHWwE70W6lSrCcCgSiXKIqFyZUyUAt8jK4MGJFvp4tZutRNVxev7g6dMXtysW6U/MnkEgToqGoC4WkskAv2t4otI1dCu07+Ap9ImPjk1Sw7DKxxBY05sBwfJm0Oo19Bou6OwwGo5uhdXHLpNu5ckGiOaRZAJfRvpZtwkyvfka0O5H9TOwzZUV0LVJTG9Yhs/ZcZbZaj6+wwRn6CTA1MrKhPlHQ8zaIyv9nXuf2d8gf4/t3F3kvEAXhO0RzzElMTkMBY3vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EePqtEEB2xHwXfCFlI3FLm8VpvzH0x6S5aWYRAK8FGk=;
 b=ZVri4KbECF2rHFAmV7KXzmaQ/4I/4LnuRcltWNPmDpvsxlrHUMr9h8uTG99qU+W2z1ejOi5zKQaUYfbNy1HlDWt22lOGJGMOa4WH/UZm/ew11Hok6T+6lA0W1IdzMvbt0MuIc2+9JLJsXdHi+cqB8p/c9qCDU6I+8dCMwe4h6pi606wGCukC9fixWpD0yqlAEcsArBoilQufZeKbFqmbiEIUUvhVSJIflfBm6RYkW7YD8IXW4ivGvccwOoNPFWpTBiPuw/BiQWm49n8xu4w4erudVS06JXWHVTZmOofj6ZAmOeOHtg8Ro2fncToP4XFYyN940w7H5nDtHzxCW6TGnA==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by AS8PR08MB5959.eurprd08.prod.outlook.com (2603:10a6:20b:298::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 10:41:02 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 10:41:02 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/1] leds: st1202: Add hardware-accelerated blink support
Date: Tue,  4 Aug 2026 11:40:50 +0100
Message-ID:
 <GV1PR08MB849709A3BE3D1CBB9E28ABD2C5D42@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <GV1PR08MB8497E2498ED9D66AF60A3ACFC5D42@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497E2498ED9D66AF60A3ACFC5D42@GV1PR08MB8497.eurprd08.prod.outlook.com>
Reply-To: fombuena@outlook.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO0P123CA0005.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:354::17) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <20260804104050.606287-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|AS8PR08MB5959:EE_
X-MS-Office365-Filtering-Correlation-Id: 3339afdd-769b-460b-3310-08def214e0f5
X-MS-Exchange-SLBlob-MailProps:
	ScCmN3RHayHq8QFbWW6Ra03gxaeZK6u4ur1ln/2MOW+H3tT6ivC6Kq7SPIM8gZc+hEsH2yrNxvpqHGW4zsYRBP0LyYIzpJIapv/V6NGXtG2IrWH1BW9INgszQp4EOu57PdkDgLM0QKIgdS8ka64hjSNOElxu9OI73N7gW5zOipn7IeXwdOeEeQ1gdhMO4qI3LEbVV0+RfoyNyJClbrIq1zPnhcDHPa5SYRxl8bXaDNxUsMMsc1DGkXCzVq0jHXgkXFd0nrbe9TWRvsyqKjTulFdUXAMdRW6WmBJYyKFErXHmYzVIJ+HKyno9e4pbuO3xA8C6Fz/oa2H6ZWP3B+ndJTZxxvaPhJBOP/UBOjBcoZsTQhJDmRcFLDVHLIJTzsRESajY0wsutCuxFmwnJH8iospqinWvGG+5RS/Ih2LcELWBCtmyv0TZwfNGVa84iCkusALiiIjcq2U2AwnjOWQX3OYofkT6Q98jcXTfP/jq7WoOlhPG0DsstmBNI/5+zlIcV2YTYN0mUd8z0hs9ErQLSCXMy2pKQRWzpcB1JweFu9Tr/z/OtX+XHL7+BFodVvAyWRmQVw3OAFkHUW/OxFxf1NuGuEBcfVGDmyiQU7e1HhdRCbNVTl0VG08v43Wy0+s/l3PLNx+k4GVRAoCd9TPfGed8QHVIU9tU97SKUrAoIzZ2QkcgoZPdl+vMjLomfygG+LCXpgumWB1gchr5gSYfJdYN/1YZDM+h4jk4M1BwxyY=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|51005399006|19110799012|8060799015|23021999003|15080799012|24021099003|37011999003|25010399006|5072599009|41001999006|40105399003|2607281247196008|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?W7+sPLSdPum4SjaQNgdiej5xFvrK56bfLCg5eqoVojZDmX9lSMx51T9aqAnz?=
 =?us-ascii?Q?ZGX7t0lGeGq+WwFH6d9AYpZ40PZFSszzihP/0szum9YcNSST7R+mtz2Uzzn7?=
 =?us-ascii?Q?BP1y/GNO6WaCvCq9A4rob6H50821Vo6vGRNa/1SA7owSL2UDiyIqgaMmgDdy?=
 =?us-ascii?Q?pq0xDshqAbY9sXSAcN253grmpng1e1JdqxZxb57qYjug/m7dYN0mSSfE5YHR?=
 =?us-ascii?Q?5td9v0ndY6tPYUE/ni+bdVLW2mgGMjHD0xosq1BeLpwq5ll1qspt8uDnYivy?=
 =?us-ascii?Q?2dkLFxrF15us6Qc9ys5V9NQDWYMl0czyYhZ0Imlcj8Q/cY4RYcbXHIl3hVRu?=
 =?us-ascii?Q?+59wh8gW75MBosxzuxV0Hugf97lul/hbeVgAI0A7G5tp7fmDIN/g5wV1nKCV?=
 =?us-ascii?Q?Ei5reyeu/Pfo3mBmV0OGMMp6eL0OfX9KYwyi535V94L51YrDQy2XdHF5Zgej?=
 =?us-ascii?Q?GUveVYC0vmVjeJ+vpcm31GrNcgza41nlfHs6uV4X2IJmyV1KEvV/LUu3reNp?=
 =?us-ascii?Q?gpBtlxULckq0NcW1rsEnpp03qE/Fzy7J8NHYdDINPTerTFtvt4ri95LxQ4BD?=
 =?us-ascii?Q?FR79C1ttO9MW56kGV3viy9wYt2xeQSq8PHY10DpieomuQRqO4CDoOOQfcnWc?=
 =?us-ascii?Q?StnMNZjAIK1J87IhzQqy9sN/dusXMZJvx8+tkCJB/btbpUBl1jD7JAdnP9d/?=
 =?us-ascii?Q?0pB4KDWb3j8cuDygHutV2ZgaPwSXL5eYiusy1JAupTqnxcdgLFTZCL/z5olK?=
 =?us-ascii?Q?aoRSe2iDl12Y+6yQfta7opanTX0E/vv5mD0rdd565fXWub04pxm3PHOYsCe6?=
 =?us-ascii?Q?rYpjv3MWYgbGhuyQ2fSPWOONGpoaxjdwHXiqY+Y8u0FgxGtahX3fcI7aox5f?=
 =?us-ascii?Q?Y9TrcPPMju396oa4r4Fz+ZKmXjqrfRNZD5SMQoGvL3A4V6lvaZ5axbPuIV6B?=
 =?us-ascii?Q?4T7WN/hs+JwT6nRH8Ohq1ScoBk5PJ52aoBjLCFJhBEH9QI5aVKMJeZLqELc9?=
 =?us-ascii?Q?QzBR?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8vj1gXrshLI+dnm2G3ZsgSADcgK50CRAubMPT2307CF1Spc6Ool/nUevXVzp?=
 =?us-ascii?Q?OUMMYStmQQQmAoeM8KfYoznOqs0WssKtXkR289jSNOwbnHTb+TRKYRMpb5ww?=
 =?us-ascii?Q?k81OCiTNFJRoTh9anUfRTQahvd6HZhAbs33gZPdO9fT/lrFffBO8wf1UFQag?=
 =?us-ascii?Q?RWWJ7StTJkxZ3fT959sdJBYWiAVtvij0n2IPLg6s4c3pJH2z2TzeF8EsP8Bl?=
 =?us-ascii?Q?TUNCUqKbP7jLxf3c6UTQgrivMxJ8zSpNhllcbARZ4w8KuOpFOSbYx+/pouQp?=
 =?us-ascii?Q?bmCCZJ1QdIa2XgV6gW45KipbynU5riMkqi8W9Tg6LbFiIwSqdmiSBtOCZzZr?=
 =?us-ascii?Q?Z4EEx96yIGhT1abEuQkWVKJneiLKEF5HY/QAfCAjDLSU+zwPlvV/0qmssKmc?=
 =?us-ascii?Q?5Mj0Kec3Ed7r9BolJOz8YZfIOSzIBsqNudLCp1aHcsa3xbbUg9BQ5IeRNCaA?=
 =?us-ascii?Q?maYY5L+x/uIyS/o4gY447HuCaVKOj2vhVGYhWBDAI1xq3ipUH+O7k68ttyqe?=
 =?us-ascii?Q?LHAUI28E7dLW+dvTIUeulBL2r4qT9be9iyKwIWlcP9vGg3ho9Tm9yx6sa9W9?=
 =?us-ascii?Q?89v99UQ744EJYSBfFk0kJ155fc8CMBlervERiy4gayhLnW59fTDBcoQMKz4R?=
 =?us-ascii?Q?aDyZfdjGK5K8NFSBDLaoPfZ6CFbAPK3qLCsqXJmrpvxGf0vVKRrg2oCC89gt?=
 =?us-ascii?Q?tsviLV0S4g0VUlnOJQvU7p5GDvzSg9n7qbP4wOlllpSKDjaHDoeflpxjrA64?=
 =?us-ascii?Q?hMByEkj0zKN/DaCmW4uIkRgUDPf2vGB2h7tNOjgblkgymJc+pRZ7UUldegKF?=
 =?us-ascii?Q?hXhXU8g0jy/y8tOFATyn7OzFi5gUddrDY6hhskVJSLryq2alxO9/QYpgA3Ja?=
 =?us-ascii?Q?EQahteMJ0zfhqO8BftAZzPJHqYnPxWbV8vkmEP03mQbsROYauGCweC8xbAo/?=
 =?us-ascii?Q?+2T7+IS2G1bDNe5ZHGtIDYzHLWHqKh9OPjyYAk61D3qQrvGZlFkrfaEsNQOJ?=
 =?us-ascii?Q?oEjCdspRI4y+vqcqYtNL0qT0EwZ10UyBwi/HOVERcDjXvXllpZQWU2gpEU8C?=
 =?us-ascii?Q?MjGs7VHcqy16FNWA9TfuLC6gszrymjwXJHIUbrIBDlW1QU+eeqIm8SiEnliW?=
 =?us-ascii?Q?dSpuY8tV/gorL8jASsgNtVgwpx2jf+XO9pNRhr8yJlFbmTjUnSiDj1NkZa7b?=
 =?us-ascii?Q?pIKzoSuuyCuNHaxioVdMQGWkk2gxXrNHAI2XAJiwMs3BTONJGThwCCM6CnzC?=
 =?us-ascii?Q?NY0gQox91nQIv2pQGOwVlOZZcfSTxdAo5SzzLLMyuaD0Ogo8Pu3lsaV8I6py?=
 =?us-ascii?Q?fJsKtJV5POHazOAib9KEEGYbRF/bfDfqY+kMksj3NRntUZlYXU/kmwsbROwd?=
 =?us-ascii?Q?/lL4ArXo2867dt94Ar54wLbUYZZ3t2Sog23LLGqQTRD1mcraad6agPnaCF9i?=
 =?us-ascii?Q?gvrEIySv/lei50HNN23ZEFb7YMO5G2wM?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3339afdd-769b-460b-3310-08def214e0f5
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 10:41:02.4778
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5959

Implement blink_set() to enable hardware-accelerated blinking via the
timer trigger. The LED1202 pattern engine is used to produce a two-step
sequence: full brightness for delay_on, off for delay_off, repeating
indefinitely.

Requested delays are clamped to the hardware range [22ms, 5610ms] then
rounded up to the nearest 22ms step. Clamping before rounding prevents
integer overflow in roundup() for extreme input values; since
ST1202_MILLIS_PATTERN_DUR_MAX is an exact multiple of
ST1202_MILLIS_PATTERN_DUR_MIN, rounding a clamped value cannot exceed
the maximum. A zero delay is replaced with the default of 500ms
independently for each of delay_on and delay_off.

The LED1202 pattern sequencer is global and its timing registers are
shared across all channels, so only one blink configuration can be
active at a time. Other active channels have their PWM slots zeroed for
both pattern steps so they remain dark rather than outputting unintended
values when the sequencer runs. The target channel's ILED register is
set to full brightness and the channel is enabled, since the timer
trigger deactivates the current trigger before calling blink_set which
would otherwise leave the channel disabled.

Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
---
 drivers/leds/leds-st1202.c | 80 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
index 168df5ecf27b..334e4733387f 100644
--- a/drivers/leds/leds-st1202.c
+++ b/drivers/leds/leds-st1202.c
@@ -15,6 +15,7 @@
 #include <linux/slab.h>
 #include <linux/string.h>
 
+#define ST1202_BLINK_DEFAULT_DELAY         500
 #define ST1202_CHAN_DISABLE_ALL            0x00
 #define ST1202_CHAN_ENABLE_HIGH            0x03
 #define ST1202_CHAN_ENABLE_LOW             0x02
@@ -275,6 +276,84 @@ static int st1202_led_pattern_set(struct led_classdev *ldev,
 	return 0;
 }
 
+static int st1202_blink_set(struct led_classdev *led_cdev,
+			unsigned long *delay_on, unsigned long *delay_off)
+{
+	struct st1202_led *led = cdev_to_st1202_led(led_cdev);
+	struct st1202_chip *chip = led->chip;
+	unsigned long on, off;
+	int ret;
+
+	on = *delay_on ?: ST1202_BLINK_DEFAULT_DELAY;
+	off = *delay_off ?: ST1202_BLINK_DEFAULT_DELAY;
+
+	on = clamp_val(on, ST1202_MILLIS_PATTERN_DUR_MIN, ST1202_MILLIS_PATTERN_DUR_MAX);
+	off = clamp_val(off, ST1202_MILLIS_PATTERN_DUR_MIN, ST1202_MILLIS_PATTERN_DUR_MAX);
+	on = roundup(on, ST1202_MILLIS_PATTERN_DUR_MIN);
+	off = roundup(off, ST1202_MILLIS_PATTERN_DUR_MIN);
+
+	guard(mutex)(&chip->lock);
+
+	ret = st1202_write_reg(chip, ST1202_CONFIG_REG, ST1202_CONFIG_REG_SHFT);
+	if (ret)
+		return ret;
+
+	/* Zero out PWM for all other active channels to prevent them from blinking */
+	for (int i = 0; i < ST1202_MAX_LEDS; i++) {
+		if (!chip->leds[i].is_active || i == led->led_num)
+			continue;
+		ret = st1202_pwm_pattern_write(chip, i, 0, LED_OFF);
+		if (ret)
+			return ret;
+		ret = st1202_pwm_pattern_write(chip, i, 1, LED_OFF);
+		if (ret)
+			return ret;
+	}
+
+	ret = st1202_pwm_pattern_write(chip, led->led_num, 0, ST1202_PATTERN_PWM_FULL);
+	if (ret)
+		return ret;
+	ret = st1202_pwm_pattern_write(chip, led->led_num, 1, LED_OFF);
+	if (ret)
+		return ret;
+
+	ret = st1202_duration_pattern_write(chip, 0, on);
+	if (ret)
+		return ret;
+	ret = st1202_duration_pattern_write(chip, 1, off);
+	if (ret)
+		return ret;
+
+	for (int patt = 2; patt < ST1202_MAX_PATTERNS; patt++) {
+		ret = st1202_write_reg(chip, ST1202_PATTERN_DUR + patt, 0);
+		if (ret)
+			return ret;
+	}
+
+	ret = st1202_write_reg(chip, ST1202_PATTERN_REP, U8_MAX);
+	if (ret)
+		return ret;
+
+	ret = st1202_write_reg(chip, ST1202_ILED_REG0 + led->led_num, U8_MAX);
+	if (ret)
+		return ret;
+
+	ret = __st1202_channel_set(chip, led->led_num, true);
+	if (ret)
+		return ret;
+
+	ret = st1202_write_reg(chip, ST1202_CONFIG_REG,
+				ST1202_CONFIG_REG_PATSR | ST1202_CONFIG_REG_PATS |
+				ST1202_CONFIG_REG_SHFT);
+	if (ret)
+		return ret;
+
+	*delay_on = on;
+	*delay_off = off;
+
+	return 0;
+}
+
 static int st1202_dt_init(struct st1202_chip *chip)
 {
 	struct device *dev = &chip->client->dev;
@@ -301,6 +380,7 @@ static int st1202_dt_init(struct st1202_chip *chip)
 		led->led_cdev.pattern_set = st1202_led_pattern_set;
 		led->led_cdev.pattern_clear = st1202_led_pattern_clear;
 		led->led_cdev.default_trigger = "pattern";
+		led->led_cdev.blink_set = st1202_blink_set;
 		led->led_cdev.brightness_set = st1202_brightness_set;
 		led->led_cdev.brightness_get = st1202_brightness_get;
 	}
-- 
2.55.0

