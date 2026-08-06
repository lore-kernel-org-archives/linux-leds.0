Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazolkn19010003.outbound.protection.outlook.com [52.103.32.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B254E48BD5B;
	Thu,  6 Aug 2026 17:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.32.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786037144; cv=fail; b=cnAdeKmZwXTQRfn3o6X6WVIgCDyTevIIKcF+amCsRsjo0N7wPW4k01JmtAYDSspDZZYhCwpzxS0M4yQDHon2sgOcyGE+cxuJ/vL3QlBmZ7+zt8ptOOLDhTjoJLDlVCNmzMiPz7Nik8R6heYyzZdoSNxzPxB1gpNeLihHvFLwOoU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786037144; c=relaxed/simple;
	bh=3kXAXDP8x53G7A1dw0ZPufoHs5jyiRw0To7WMqSi8tg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=louiftu7N7+QKIimgEwK4LJ3LgJWK3bvEIYyueIOwxXYQGCxIPsgP9myBELnDzcIGfm1LZ6nRz594HVeC5eNDo/HsPu8i/YriE9yxrXbcoM49+8IaAOby5w2WqPpeq+IRF3iHg9kyPkskgz86FwzyfkpiSg+cr+P8P5BkT2v/zY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=KizD5JJi; arc=fail smtp.client-ip=52.103.32.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="KizD5JJi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ja5e44f1YMvOlQuG/ucpPqZkytfsTQ5yGkLbbE8fEt7SsC9mNbdfF+Vew+Od63q91ROEJ8r+3VCVZ4l2mE1G90fc+Mr3LpvdpNRdiUrESntfo+twg2V9N993Z+8o2ihTpYkgZoFswyK09uv1fOF7GEr4kdFIisgsKOQnptJZ9OCjWKaGa8PFc+J3Qsia7P3IaRDVwuhn3sgqRVlUlhtL7GTtSEDi4q2hHzkK49nY5h1SQnCfGzS7M6ycoTUjj8rAjAVgTlD6o7e5PG2en8bGzHsmk5Vco8+DzB5BkP+vhH1wC3tak6WwJzZUdDHeib2OKdVBQ6DfUJ6aHNvpQ2LXMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HiLesJvYAmbaEnOx3g3Gz+uc50h40ejTiNzCeGe9tOc=;
 b=b/wN3CpjgAvCXus/w5cIURiBoa6aJVKdfsqgHTdoVWufa7W56mHgKL+og5TQ+8Rrn2QKScUfGg5ZdRiHqmO/Mk/c4yXxok59iN1mkUrJivaMeakf4ywM1JcnQpxVYZMt9CD+6o1OMKprDcHsW7OlJqaOI0zZDOyz6QVn3tQUyI2SyxPyDsERAR9EfACMJpJQ8yrK56caDzZN1GSktb0XGbW3lVtdboSpzOVQz4nfsLqM9asj62et164rEvnjrgBO5TT8qV7fSTtAUlrG3k8I2AlE6Oi6D3NBtCDSsIhEx6L4jJYGlRK4JeJ5pDTqCbmPkTUZwyFXYUa058ygtL+olg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HiLesJvYAmbaEnOx3g3Gz+uc50h40ejTiNzCeGe9tOc=;
 b=KizD5JJiIM4XyoLzL6k1307Yh0xQtc3rePu1t4yr1n5hCSZ/pmW/K7EtKp49c0A0nP7G0kCC4QJUJ54+oDYNY44ovK8W0WKvyg5AR6JOski/JCkXPzv2U9pMDuE2OihGXQIueD9dl8ObuYhRtdt2tSy8AJ+ISJvGtV+wjmjSpyAyCCxzKEQv5YFgdt6HCE41lEwSH5nsPuBNocX/yRO87+fo+8fVn+OzU6hBEzj0Ctg0gebUmjWMy5QjSiiBgteysU1jEgbBWz9IdVzAB2rC0fuKnzUhjWMbZ3/VOWq7eNZkk2GJKasrMKmTZWkeJpVzbWnNydkBVZChBcUj9prrmg==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by PAXPR08MB7573.eurprd08.prod.outlook.com (2603:10a6:102:24f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Thu, 6 Aug
 2026 17:25:39 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0292.019; Thu, 6 Aug 2026
 17:25:39 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 1/1] leds: st1202: Add hardware-accelerated blink support
Date: Thu,  6 Aug 2026 18:25:26 +0100
Message-ID:
 <GV1PR08MB8497362791595D5C0197701DC5D22@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <GV1PR08MB84977DA9A154D7186B6EA2CBC5D22@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB84977DA9A154D7186B6EA2CBC5D22@GV1PR08MB8497.eurprd08.prod.outlook.com>
Reply-To: fombuena@outlook.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0245.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::16) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <20260806172526.603020-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|PAXPR08MB7573:EE_
X-MS-Office365-Filtering-Correlation-Id: 01872619-b03e-4047-904f-08def3dfbbe1
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|23021999003|5072599009|37011999003|15080799012|25010399006|51005399006|24021099003|41001999006|8060799015|19110799012|3412199025|440099028|40105399003|2607281247196008;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?609oXeym/XyuvVTN9V8cNKS5qd0p8vGZJHgcJ8FgJatyi1J9jIfvMsTOw/ja?=
 =?us-ascii?Q?U4MjQ0dIp0Ffn22RG8DEtcgFQ+FkdBa854sOvJd1Wjxiun8hwXIMy/N6UvTr?=
 =?us-ascii?Q?hhW8BjcbVpYxIJ+l2gSdRz6895eLRGzBwwv7X1BpiYeUcXJSFvppD4lLqgKV?=
 =?us-ascii?Q?nFxNB0cPsx1obYt8UqAJMBiwKv0fxpNeuk9HVM/AZeQoxoS40rlBYDAibL+t?=
 =?us-ascii?Q?zeSFAucFSDQ5iLezugQzTV2GcPJjV+e02bsHBV+x6taHXGNKhIkv9/Ar53ox?=
 =?us-ascii?Q?EIiycQg4wLfjifkMJH6Di3ydBZVfgfxZi6vJsDljw6EVKVl0i1S9a2isiiZt?=
 =?us-ascii?Q?jwzgYXL5TCGaLO15jDhvvmyRBfoHeMsRwY9WKAFU+/qSOzt1oIhuvFNXqaaF?=
 =?us-ascii?Q?wAGQq8J7qgC5gUzNAdKr4KQdrWIKZ6zKlu+RC8NJbNkBmZVSOCkduzdTwuI7?=
 =?us-ascii?Q?1IpqDWLDeG8BmQa8y1tV8TReLSwSxVUAEyeX/f91d8NPfT3rGewUWJkURX50?=
 =?us-ascii?Q?o2aaQ/D/tX7d984TAZSiytmnskcwSZZ5wy2qInKGzZM+TCt/ejoofMncGxLB?=
 =?us-ascii?Q?55o8QKCHEARlF8wKdPlc3ay3ucCH96Um2uzRRbY/t4z+/VxeQLDdHSaFhHKf?=
 =?us-ascii?Q?npNgMu9cEZHKEkvMBjck8tFPnyCIpOMc2meXyrnQIApLNs2X9N27OtkWdfeI?=
 =?us-ascii?Q?9Wi/cNG9jfFSG/lINmB4WDgSD0mMEFwqTRZhaHYdjmPDD7ckBRN6E9o4gBVD?=
 =?us-ascii?Q?C+bHRAIq7noVnQfMPhBQnpTqO4uiS05YhjJBMMEboesp5GK8cKrN5HzJ5EsX?=
 =?us-ascii?Q?kYmOFP+PcIiMFojmScXgyeqTYYsYWxeYSIGvidDqGDAPZMjZKKJS3fV0tISc?=
 =?us-ascii?Q?f8OGxFIIeAVLzioas6DevOwomjS6u8p++BE1bNx0XBxP5Zqtd7go1In7ORnG?=
 =?us-ascii?Q?CKM3AVO8KL95YzEVsAv1b6Ye+ZVJcMfqzTP7PQbIQRR21Sa7HJTgQ9VZ1SGW?=
 =?us-ascii?Q?OrGk?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cYbpVyKYp34P0v89VbKo4yHTwYcBOrZlrHo8MqnMUVNaeVDU1gykn5o+4AXn?=
 =?us-ascii?Q?xoaqz0RtnrwdybV4owdu4nY33mBoxoZF7vSefD1ciRX1Y7X9GrK1qDVnepqJ?=
 =?us-ascii?Q?WSPrCm9/M/I2kh6IeaYo8PfYiIZaShbwoAxHY6/ajWXU7jGkUpw9UT3GRIzH?=
 =?us-ascii?Q?MezRi7AcA0bM6WwbbCYPMqnF3bTnGtC+krA9sFcyiQeTwwsjI1DLnfstpQO6?=
 =?us-ascii?Q?lkgdwSGNOOG1uPwTZX+UJ2jwUUNsgfQua5V/B7JVNa2BujGHGj1oRS8Pz7uY?=
 =?us-ascii?Q?eQcpkmj08TNxgEHa5Oe7/BCZj6/lr+A+xtUfGf5PVPjURKvoPV5mgBu//S2U?=
 =?us-ascii?Q?cbhrmJ4RI4v8f7QCAQ1j1hs5L4EfCzJn9FiqkWQUyiOPpnUkSa07dF8xSoPG?=
 =?us-ascii?Q?FCWFRODtUdG0WTdnExv1qfON/VMcvf0G4gCFX2tQf6VycC5doEyUC7JxPyve?=
 =?us-ascii?Q?GNSOANQ0dGPJehygxbhK7wy2IGgVZ19uKMnNubM88g7ol5Z4Wfa3dOExczRs?=
 =?us-ascii?Q?Snfo8PV+B8m/4Sna0JgR8PQaimoA+srFty1gsY6C4JmebjzUUrkVPzcWE1aU?=
 =?us-ascii?Q?hcMbMALYrui8+OdMISJ2v8W3vn4XwYe+mAIEAFwqbnvKhPOyrrVhHAFS4plp?=
 =?us-ascii?Q?gdVP4IXfezY2WTNvhkfYh5fRVDUWn6c7SHiunysnQhpF7Gek0OeSvXc4oMF7?=
 =?us-ascii?Q?p7lYeOnCIP2h8zXq34xOYPqdog9FdZcd94bQEZ5Kn4hnxSJ6Ce6WzQpSGkNr?=
 =?us-ascii?Q?5bMdEDBuOVsEoa83f9oePTvRtOgGb8GD627HFa0PS7GNvXDmBNpuulMucTBN?=
 =?us-ascii?Q?qi+UqQaxeiaoPon2W8UdtwNB3GhJKXdMEapOZXsals/7kdDjdrNMZAJmzLV9?=
 =?us-ascii?Q?2Ki9JL0x2lZO7k0nUcNeLVaitpwCsMlZ1VSrYqhhiGsI/YU6S6FeE2Kxl/23?=
 =?us-ascii?Q?NWdkbzjxRcyrBitZLLv2tO11eHepBspEgOHKnAKrdnm9u7wEDpuk1lrjJi7p?=
 =?us-ascii?Q?66ei8znBqWFjpkwoJsIO45sP9qiE8GW6cKUhcQn+uQLxBKSEA51mxpccZGbI?=
 =?us-ascii?Q?ZW91dckAT3N/jO0jBdIXjNkxwjC8Xws1vQUFt/kl4qYYQ1Yp6qPXm98WykzY?=
 =?us-ascii?Q?YNKyg7G7MCpaPwcRPYFquE0v2G93kASfbLATGHKbi2wxd5wNt0uIZoNehLaD?=
 =?us-ascii?Q?DF4vMvj/KD5tqyQzZrRESNLf9ONB083JGNVUrcpMgTGhGk4aN++B/nbWL5+H?=
 =?us-ascii?Q?p5ooJBVX5ZaqWeRFBDqu8Y7rKRMURIx8l6WNKP/YkCDL1mKB4hDcIHsKoITi?=
 =?us-ascii?Q?UZ9Z7o8IjTYDLEO+wWZLg9YJO3G/ef+DQ+N/A4tq7LSJ95RO2lbedLnnKUCL?=
 =?us-ascii?Q?1FdN4Ja7lEylnKrOcMeXuhidE7fRDktRJsTaOmM6SDut2AdXBjkAM93KNE18?=
 =?us-ascii?Q?Z+fMMtxOa2B0jepjI5NflPDTupJq1T/n?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01872619-b03e-4047-904f-08def3dfbbe1
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 17:25:39.2675
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7573

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
 drivers/leds/leds-st1202.c | 85 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
index 168df5ecf27b..ea019d03ad90 100644
--- a/drivers/leds/leds-st1202.c
+++ b/drivers/leds/leds-st1202.c
@@ -15,6 +15,7 @@
 #include <linux/slab.h>
 #include <linux/string.h>
 
+#define ST1202_BLINK_DEFAULT_DELAY         500
 #define ST1202_CHAN_DISABLE_ALL            0x00
 #define ST1202_CHAN_ENABLE_HIGH            0x03
 #define ST1202_CHAN_ENABLE_LOW             0x02
@@ -275,6 +276,89 @@ static int st1202_led_pattern_set(struct led_classdev *ldev,
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
@@ -301,6 +385,7 @@ static int st1202_dt_init(struct st1202_chip *chip)
 		led->led_cdev.pattern_set = st1202_led_pattern_set;
 		led->led_cdev.pattern_clear = st1202_led_pattern_clear;
 		led->led_cdev.default_trigger = "pattern";
+		led->led_cdev.blink_set = st1202_blink_set;
 		led->led_cdev.brightness_set = st1202_brightness_set;
 		led->led_cdev.brightness_get = st1202_brightness_get;
 	}
-- 
2.55.0

