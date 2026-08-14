Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazolkn19012013.outbound.protection.outlook.com [52.103.32.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C763F3446AD;
	Fri, 14 Aug 2026 09:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.32.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786699040; cv=fail; b=FMSJ86tDMqwfPNwLmvi+ZDeQj5+wJ0owfKLwAtGInQ6NuCBeLNFEZRPjktegNrsA7sFv6aZ6xMM5o5C5vxMtFluY2SxmN96z8j01GZR+a2o+/lBZpP+7CnjPDbG05/6AgmzFixurKfsc3zN/WXRi9hGQuKeAbdkimnbt5Lmffxw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786699040; c=relaxed/simple;
	bh=IPx1U3S8xEBP+7XZYE6OzgitLVmi2F1iSCKp4h24FzY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IlqrdHJ6A318m5nfNt9JhOcBcLGH9Ko0Bir+DDPKg229L1id0rN9h7tSMr2auIpqS9MOBlMViS2zJ1RAFC051VoE+1vVRXgev2PIfvjkYsgus0NPC8LNuTB4Hi7SXnvolMnmP6NE+sCqQLlbWopcp3qSBFCT8nZdMHwh94fRh34=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=p7nD6Hvo; arc=fail smtp.client-ip=52.103.32.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="p7nD6Hvo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qszvE5p+q9QdhpcOg1HnM45L/qmz92x8aN3/EkK53d/KQ4ScH8xptAofZ21U5W+yGQ9BSf3jaeQQDcH0DoVgFBY8+OZMqHXxzA0zf+vWKpqBx6QnG/bXKLXvRQjGvjbjKKFeI+gnNfjNhmQdh/C+7f2m5jEdYRHgncgeZvoLdUvN0aHWUk/NHgCKOpe8hce6swI+gFneDY4wymJlKjnsOeMuTzj/EJSc5kFKS2pE8voybr5lM4yohJ0Nq+wMjYr+xO2pJzgkhWscVutIiYvPePArYsLEp0/C2dGrDwxZTJXr4uSi9ljPle2BUYHWl/kml2Xc9mgRWBQLtMP5A/E05Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tbh8jkXZiFerbdrvUzNNDlCwjNAebMUxKTY8wsMYSqA=;
 b=quBzGwbWKj9CA0MKntcXzckSrZ5vCECr7CB4fOTpNSwOL48rVpR2FIf+TfKdUqfQhKPCKi30CGiEEcvjfiX7lnQvOIgfATN0L6RJFebaMVM91n+IGQK9SYaxyFfSsvI0mzeZTQ6yn9RarxJGufAWzdJW+9s7PjL0aM+f3cW5J0gYTl4CJ00eE/+F11uFVdXAUSKl/O6thEQ18tBmLS6it7a0AjOUTy4mhpyS8ids0FOJ8tB2QFUaV4xfbgE8x+ItP2GSugZPkKei2quF1KRHJJepbL8sMgnR+arr9Ozb9Pkkvnr51/gUZXTvsTgwvfR+u3ltxtUuIw1+M35UQbXUnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tbh8jkXZiFerbdrvUzNNDlCwjNAebMUxKTY8wsMYSqA=;
 b=p7nD6Hvo92XaGQnMgbw89AziGJM7RO7ZKcWgScT9vdz1/WlJo/YgPi0xXd122yPxBUALzCrrgeDNNh6llDzLPquPpF9YiPH3KnnRVMCPsswY9YiVVBVQDN1PDB24pHGjcyLWWG+ZWkfzK+Zmy6vATogn27TBZgyx3RnhQ7y9Pj5zioEZdZRNj7yhJpFoJuI5/VXySwwhExjkD77OkpmAMfig4ZeuSidqmHYmswz3hB7mCXsvxpyVB6Z30x/CSbyuY6hHKgwtVWsofTZyjcJm5SHrNpveQaWTqHPT1VfnJqcd13UMaVpoCha1Q0wQZjVoIqYN9cgZ9QZK36e/i4tRWA==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by AMDPR08MB999870.eurprd08.prod.outlook.com (2603:10a6:20b:751::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Fri, 14 Aug
 2026 09:17:15 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 09:17:15 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 1/1] leds: st1202: Add hardware-accelerated blink support
Date: Fri, 14 Aug 2026 10:16:54 +0100
Message-ID:
 <GV1PR08MB84973F79E871176EB387C377C5DA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <GV1PR08MB84974C7ACD911E66864C5008C5DA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB84974C7ACD911E66864C5008C5DA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
Reply-To: fombuena@outlook.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0304.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:391::12) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <20260814091654.453150-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|AMDPR08MB999870:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b1a1812-3b9a-4129-fdc3-08def9e4d4be
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799012|37011999003|23021999003|24021099003|19110799012|41001999006|8060799015|51005399006|5072599009|25010399006|40105399003|2607281247196008|440099028|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MZ7musUuCjjaEUSk6trVxg+9LX5oCG0ZubudtE2BwkGKcguhcEp5SkhO31YR?=
 =?us-ascii?Q?fA+vbTLPrwVIFpdYZ2SbvTpo53GR474Gf1rHjgDNWkV0NqAp+G7EJwQZbcqb?=
 =?us-ascii?Q?Pi6SCCvuY44E6rbY4CMwSyepe61bJHUUQi0unnY+1xsNptp6CsJpkVTsGDDM?=
 =?us-ascii?Q?tEmSTKN1xsLvd6Gx+UGBcoMPAxkDLwjjJNaUeKxj9Ac6JNkKPk8HvdJj35+O?=
 =?us-ascii?Q?kSDFwAzYZbog9PKNbbEUVd9sHyLghweNSYp7NOR5vg2I31av0I9ZCSMr2Adf?=
 =?us-ascii?Q?m/t+Q+kssRNcE76qP3Vt9YxHwG8hZmABMJzfAClI9L6dr6n7UVmNWJGwvfcj?=
 =?us-ascii?Q?gG8zrMVwm/t44zRsaH/f7V89x2sKJHqtOJsv5Ti4XD2Tue2BLmSlT+jJAzIz?=
 =?us-ascii?Q?vR6l8lMKQoVHBU9BR9cQVKE7AOAA3xw5humen613hCJerlYRi0Ds+8qERIKn?=
 =?us-ascii?Q?JQjEvul23rg1wiuNrrwNnlHRui5jHsAASPFMhzgb8AKu1HkVgOfpj4Dnnfyb?=
 =?us-ascii?Q?BXYxfq1I1GeJph517qOHPGnQu0c9StD8iVbaxOI9TGxuCabEUlk6ayfm4D2t?=
 =?us-ascii?Q?PJDuX5q8yPFdMS808ZD9+cnCEfXNWdg5Yas3A87+K66TyCF2+nRbYqVYG8Pf?=
 =?us-ascii?Q?zq8MMxQ14giuTw3lTZ8bRV4t5nVSGxoiFMuxCeaxepKfaLHbKD+PJo4M1mjf?=
 =?us-ascii?Q?ZunUCN9x4G6whmu4Ynkh3R6N7NYL2UCB51Eor16MMNmdqa/wDbSn/UCHMH1Y?=
 =?us-ascii?Q?UD+VaSmvQ3obPdmQ5619mfycGmsNJjcs5rkAJC30zM02mSoUYON5ozmSxYw+?=
 =?us-ascii?Q?RvxCcWJR4nQVHFZ/GMOskxscc0e3A9u9IOlxxR0cX2iLD3Xcaa6T+OhhTV62?=
 =?us-ascii?Q?+VDj5VnD5IlNKNkGWXv9rC3CNdTe6C3ByQRAt6gGEkY9Lv1/mEjECNAYS7Nz?=
 =?us-ascii?Q?sG4atKInAauOK7Vd35sqWksuuldgacUayT0nAAKdtc4hje0Tzmp55Z1zQKlM?=
 =?us-ascii?Q?46Xl?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Iofg3njc1EcCCmfk92esQitc5pOw/ThqO+3nAYVnNSbR/HM801OADS9kOoS7?=
 =?us-ascii?Q?TDuFQe5VNKy2if+K6VfUSxY7Nx0lkwBQI3yOtGfi1GBNBVrlGI8hdbu36PLQ?=
 =?us-ascii?Q?rj9VEYce4pVpuu62ipTjIh6aj6bIyJSLO/cRZbnkOpZN5zeHf6pnRr5YfHbb?=
 =?us-ascii?Q?q9RRxFpdoe8fza7ozGRGKsxwmBOQR1Y7VjY4kfjyoTodgPvUJuztYekxrXKT?=
 =?us-ascii?Q?ZjLDqvOaiKue6hfWgoZOqSnpNsaqmA5BlNizYYhBio0eMe61raD/gihNtqtd?=
 =?us-ascii?Q?XQ+xW12YjYMU++9oCM4A7/LMaanW6YsklLO3mkweTmMD+piHylIHK+YGDAL8?=
 =?us-ascii?Q?bk8pGhu8sy86RrGipv7cnZiRCfkHZYQsFmxO4QGKsNf5OE0gZoUDluuidTdM?=
 =?us-ascii?Q?id8HdP71xaqCB1yoiC/xPnt/vnKeUWag1ZpTWdZ4mJdeFDYfj+CSrL3YCxFV?=
 =?us-ascii?Q?xMLpqZ8fu7eR4Hor7l7gvupsPD8z+7JceR5nytpOrYOebXb7+Z4gJK4t5TQG?=
 =?us-ascii?Q?AFkvsnCkKZGeeqz+nBj0BapovlYqcOOAxq34Yt0G/ypP6DPUUwgqn4UxmQqX?=
 =?us-ascii?Q?oI1CTy4Hjd2LKE4QA0jq3rrthnVH8269ojyM2416t1IP398QNdtp3d4D4eHc?=
 =?us-ascii?Q?pAxLPgCn0xQBHHRI3l7aMchh0Hx9AwZnvaLrGbrz4Lmk43VsP9jfnV7kXONp?=
 =?us-ascii?Q?sY1M6wLWwF9X2zF67TNUwp+OjmP1lcPdhMRUqPR7G09wIb0zsIx6lW+VAcnZ?=
 =?us-ascii?Q?XfwY0zlTNycm+Qdtut1geC9io7fF6JZUSBwcbeCHKbdszUblU2ZzhMvv3U5Z?=
 =?us-ascii?Q?Yo8CZ83QFi/Mvtx8Zsa82gz/34ufoBMlXoTmzSjPxtDEK7SAKWkXSUtDJEXI?=
 =?us-ascii?Q?lrXsXAvKjGXrS2NlfainU3DbBTkVbV72JiTpmLtaAloN9pNhU0u/GPqj5ZtG?=
 =?us-ascii?Q?Xt25AlVvB5VzIjb9IeL+XCSgAcghdhWW+LMlMUWKAylS8OuWKJRKALdrCcO1?=
 =?us-ascii?Q?Bd+v9CaZf01qGJY6XONxcgdVHtLjACEGIm9I2X56ZesvxpL09r/IZ72U0qn1?=
 =?us-ascii?Q?pJ4BA1IL03cJOuUnvM/13OfwjRDOmMh4kmKaTmEQwjIsJb3R9KL5PY28kHUe?=
 =?us-ascii?Q?TfYUl9SjApXJgjktIYAmPgTs25+WECnfiByEcfqlf2l+sFVE+kKd1IBIqls/?=
 =?us-ascii?Q?PZxYqYrsJ9iR2TTybg0Lk3h9IXQVSHbE8Zc5IaT9ejvSVVBHKmfN3vg7yOoK?=
 =?us-ascii?Q?jQjAW5nwwOXHThM09YoDTTOd9hOHn2doxz53mMna7gVZOBIeb6wtaQx7tbW5?=
 =?us-ascii?Q?AEHZ0gOE6yQ31x8HUNdT6mOvke7Bvntsl0TrHgMHirKLEIx5wPcqskFL4Qlh?=
 =?us-ascii?Q?QnV5lc22GDIMtVA0cNTrdkcuLAXSrOUawdFuJZBRHhWfp+UeL9aV8YV2zOqq?=
 =?us-ascii?Q?vFIaMW8lqLXcaZmSJ4AWzUx1CsD40gqX?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b1a1812-3b9a-4129-fdc3-08def9e4d4be
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 09:17:15.5690
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR08MB999870

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
 drivers/leds/leds-st1202.c | 89 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
index 168df5ecf27b..ead144155849 100644
--- a/drivers/leds/leds-st1202.c
+++ b/drivers/leds/leds-st1202.c
@@ -15,6 +15,7 @@
 #include <linux/slab.h>
 #include <linux/string.h>
 
+#define ST1202_BLINK_DEFAULT_DELAY         500
 #define ST1202_CHAN_DISABLE_ALL            0x00
 #define ST1202_CHAN_ENABLE_HIGH            0x03
 #define ST1202_CHAN_ENABLE_LOW             0x02
@@ -275,6 +276,93 @@ static int st1202_led_pattern_set(struct led_classdev *ldev,
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
+	if (!*delay_on)
+		*delay_on = ST1202_BLINK_DEFAULT_DELAY;
+	if (!*delay_off)
+		*delay_off = ST1202_BLINK_DEFAULT_DELAY;
+
+	on = *delay_on;
+	off = *delay_off;
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
+	for (int chan = 0; chan < ST1202_MAX_LEDS; chan++) {
+		if (!chip->leds[chan].is_active || chan == led->led_num)
+			continue;
+
+		ret = st1202_pwm_pattern_write(chip, chan, 0, LED_OFF);
+		if (ret)
+			return ret;
+
+		ret = st1202_pwm_pattern_write(chip, chan, 1, LED_OFF);
+		if (ret)
+			return ret;
+	}
+
+	ret = st1202_pwm_pattern_write(chip, led->led_num, 0, ST1202_PATTERN_PWM_FULL);
+	if (ret)
+		return ret;
+
+	ret = st1202_pwm_pattern_write(chip, led->led_num, 1, LED_OFF);
+	if (ret)
+		return ret;
+
+	ret = st1202_duration_pattern_write(chip, 0, on);
+	if (ret)
+		return ret;
+
+	ret = st1202_duration_pattern_write(chip, 1, off);
+	if (ret)
+		return ret;
+
+	for (int pattern = 2; pattern < ST1202_MAX_PATTERNS; pattern++) {
+		ret = st1202_write_reg(chip, ST1202_PATTERN_DUR + pattern, 0);
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
@@ -301,6 +389,7 @@ static int st1202_dt_init(struct st1202_chip *chip)
 		led->led_cdev.pattern_set = st1202_led_pattern_set;
 		led->led_cdev.pattern_clear = st1202_led_pattern_clear;
 		led->led_cdev.default_trigger = "pattern";
+		led->led_cdev.blink_set = st1202_blink_set;
 		led->led_cdev.brightness_set = st1202_brightness_set;
 		led->led_cdev.brightness_get = st1202_brightness_get;
 	}
-- 
2.55.0

