Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazolkn19013084.outbound.protection.outlook.com [52.103.46.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB9F3E92AC;
	Sat, 12 Sep 2026 22:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.46.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789252519; cv=fail; b=nH0FxQqwzeyg6QJWtnmMfznySuXYxXqs6wyFc0OYhsc2nMLMS+x7yoVpuBNYdjYA01miEg7JF8G5Das8kfz1/UvkUuMpSGk+L5Tlk6IefAhOzLmtYwJa1g49NSVEEAskep6/uQr6CRrbHwcH9D9Ja54vBGprYitQA+PXuRorIz4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789252519; c=relaxed/simple;
	bh=6B+wa3MlWs0ZMMS7MLVGkd0t1Vfxw27Qn2J8GLGvaOc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HEzjzD/EcYchn2iaxUrJPCBh0GKPZAMaCU03v+sEMdSHjAA0bXyuOjjlZaHKOwZkbWzNlaOXdzvMyLfG26FFPq3PQqMPAtvrkyS+xVsw7GwiLxs832Bkdj2+AQJo3CdmOlNaIZiAXXtgu1IwFPMs+H4S/FXHqhEsBD1TABCuWZA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=XZhgYSAd; arc=fail smtp.client-ip=52.103.46.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="XZhgYSAd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GtUPcOb6fV8AUISUmJntXYQ78I83UXTyhr4STwinze+7YZpvhIyxmt35AAIPBuMkz7x9mWHPewib8sCrELFj/cHND7+w/v0HP1Fv4WDvFtKyEXHNGl0f+supahLaodrWVEA0NlACPTu/B6lasJcV89tvlfuaEfPEh7N6baYFsEDpW63E+UAKHt8fivKNU/lZ560wY14T1bYL4LoPWsS8leMArgF004YBfr4yU9J/n0dym1zG+eS46hV9zIT1m3HxeK7HiAZy8hnYjSKNyIAjWMboKjjaovwgejFooyAdhY/942drTxM5h+mh+OkKfHKKcjFGjpL56MfdBwzgIZiupA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e4tAeNTVJY/ZVkTk6Zol2uhQslwF4VotVXWp7Ospsjo=;
 b=OVfz0LqlG+ow1us0n8/3Y8rj+GRnZV9DZt5WSu+6JN+ITLud2tEyQid6grO0gK0K2AIIcGtCSqePD1V2YtvvqFLxRhIKuIYA39qGV+EKT1VAGxSoGoyuc6T1nZjAdrP9jSCizZ9tgG9YaGzRXbJKedVq0IMuvgsjkukU7DsqDHYardbMDbQNb5IvrzAhsTqNS5ajf+ALozR9Py6nJAUxVS3+QsxCz+SPk7ZVphWBV4juyFCvWsc0dndQQ/leIEGCGjUq5D2rdl3/fO+HFFdUbDj3dNyxS+w4ge5tg0+j9Lo3+4I5EP06wC1/QQSZ9ZdMqfm3VZdlO8HZdK7R1IHrPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e4tAeNTVJY/ZVkTk6Zol2uhQslwF4VotVXWp7Ospsjo=;
 b=XZhgYSAdXI2lLZeDqu5wnePfasfEZrQDf+OMsc88LnLvGt17KjAuNDfJ/UidfcxW71S4oKhx6qxesblCoQjT/QI7Hscyy4n1TH+VouKnUxcUyJY6HwlmTvkDwNRlP4rNjQFn5rZKME06N+CTelKA4JTceGr4YXDBIHRupkiTFiBaxhbcVkK1xcdFZd5XINujVfftIPAPsaVUClrH6jlZfcJpSY/YEw4DqaoG222QESgEq8ZiUeELJxN1GVHdyn9MnLG5NcwpAMejW4c+KFgeuqGzs8qkjhiyteHsASDTDaCY377WZy0L2RpUkKOIl/G9+KSGWXRAtEDOmyuu0xT7sg==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by GVXPR08MB11096.eurprd08.prod.outlook.com (2603:10a6:150:1ff::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Sat, 12 Sep
 2026 22:35:14 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0428.004; Sat, 12 Sep 2026
 22:35:14 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 06/11] leds: st1202: Scale pattern brightness to the 12-bit PWM range
Date: Sat, 12 Sep 2026 23:35:02 +0100
Message-ID:
 <GV1PR08MB8497EBB43F4FFDECC7C8854CC5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <GV1PR08MB8497422B7A44424C4968AEC1C5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497422B7A44424C4968AEC1C5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com>
Reply-To: fombuena@outlook.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0127.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c6::18) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <20260912223502.3086232-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|GVXPR08MB11096:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b3f33b8-b3db-4a8f-ebae-08df111e1cfa
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|41001999006|15080799012|5072599009|23021999003|25010399006|51005399006|8060799015|19110799012|24021099003|37011999003|440099028|3412199025|40105399003|2607281247196008;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rjs5iNEU/luBmLPR8No6rIQ2XrCmNo170yvAJmlH9poeCGeEfs1bF2kJ7PNP?=
 =?us-ascii?Q?sSK++IbF3/tjJXYJ3qUyZ74EAtf9a6fOkGHUjk7Lcx2U3LtkYoRZEr+McNc6?=
 =?us-ascii?Q?ALzRV5X88eIEi7NLjJY16Q2UT+HGCcOenFe+KvzvCIILFGtfZyzKukaNPsBd?=
 =?us-ascii?Q?PzgJU6NCeFVjAGAM4Yq06QNTSwoE85FEhXcZ/q43T3mAedDounnatHf8Um6u?=
 =?us-ascii?Q?A6YfCRTOXvTS3bqTcbsuBfsqfe3fysyk2q6lgtM1frwgGN6ctVMlkHeLdnRD?=
 =?us-ascii?Q?uEgPm+7X2g6fHy07dkfSzyAyenzbUNufxA+ySF/rhQIdlmY3j5p6pwnMj6zl?=
 =?us-ascii?Q?CzIIS1MCOApXPQKYaYpzIMKhilroLDRko4fu7xe8cibYxsMhy8zFu0mrjdvo?=
 =?us-ascii?Q?1608B3VRQgCcInTg7JdzzV5wZ+ZI7l3+giAA2bddJa9ILKe9YzrfcEC/Yqdc?=
 =?us-ascii?Q?qFQvDuSXI7KgMxzyDA0MyNRthbN0b0DwxK0FfH70eLKGGXQIoDJsqtj1u4Tk?=
 =?us-ascii?Q?86YcHhvhLvlt8qpx0oG1yJdqAZuw5dJtvyv9Woty98/3qXkxZX5RpGaP+hxV?=
 =?us-ascii?Q?bOreFYDgQ++++fmwzqqnv5juOrqJUhYLRZ9WWqZLuZ9dQtOwxvlXGl50/Gl6?=
 =?us-ascii?Q?jdR7mo407Mgw8Bu3T1IhN9fK3AbeQ4aYmCbJieJIyxslbYjdaPWRgTr4k/a0?=
 =?us-ascii?Q?vbYqODd54P2WLGs6z9PKWuxnJMJrkYl1r4Ya2OrYE+XYHDBH400SIQ73CPno?=
 =?us-ascii?Q?/Xt3yGAZ8HzNSBRoeatBYK1N833KI93okdM0UidZp4RJUu0WxMsZ7YEk72Q1?=
 =?us-ascii?Q?vPZvPN076p3qmy3QkiV0ncopEMLifj+OGBTZjcrfPmNp2rTgM4vSf8V5yjWi?=
 =?us-ascii?Q?QbPdZ+20glZ9slTDTgOBL8kxRHSdL1qCdsIqYvVxdb/gSnQkGqJUmBlLZv4m?=
 =?us-ascii?Q?C42D0l1Knv5Je1CF3iU3T2EDi5v1ieZj6v4jIs/xqhpQsgngBALPzf61ZhuL?=
 =?us-ascii?Q?6ZbZ?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ylS2rKn/J9qJ90G8OIJgoNBRA5aajgHWNQCxCS6wCR2/MPhDrH8I6WIVl40G?=
 =?us-ascii?Q?UY9y4YNIbUvDHmD3Yoc6qRtZiytDy912twSutcyc5JABX2iSdDyCJ3OFVHG4?=
 =?us-ascii?Q?BJ+hF/JbF6SeI7V0z0MH4PAkqpguwduw3KFgi0MS1K8q2rSJ+jId2eeE8Xf7?=
 =?us-ascii?Q?nZ2VuiSyna0jEPAF/I9Y46YlKhxIXk+RvbDtdR6RGP54QaiNyxP2dyEyaXx3?=
 =?us-ascii?Q?9ljrpfF+/5+4s22gXmeTGA+2zxwiZjnB79CQzsATL5J3EVpAnOK1bi7cPUxL?=
 =?us-ascii?Q?SsSgHJBVnU1OZlNLOckmxJGFZbwh0syG4KWpDFMNWwQNL4cUTs1LsL9h1Fi6?=
 =?us-ascii?Q?hcMR1jA5fd2n+ezmmkDcoKTtbOBnVFQxg7hcbB/Vzmr1Zu4uWprvAHRIep+x?=
 =?us-ascii?Q?M9YvhddhAPEbck4U4euNVbTIWXHHLdJiVdzks3FEoUisN8Fw1ndVlT8+L4up?=
 =?us-ascii?Q?V1HciZ+q1wobsilyLVMOpypeAgncwswj98Ql/Tui6SeVHnuvBjt78+++PJii?=
 =?us-ascii?Q?yajFajAw8yL3xmWawkaKPRvL0Wney+EU6hVe35vq1F45GXF1J4Lir5i3vZ00?=
 =?us-ascii?Q?f394L38FqgW7aj+9xDI0I463Je+zqnBEkKTkT7ujYyh0J708x4K4xEfpyCfy?=
 =?us-ascii?Q?PJpMz02MciYYi0P4dD8ql+7FwnXNPm3ZZV0MfgaotxboCIOjXGP9tcIB9q6k?=
 =?us-ascii?Q?NL+dudgvnLsH1pLfKujyYYbwRO+EJwROKIiRT6hIu6GNw34h8bxHr5OsVmcA?=
 =?us-ascii?Q?0azA8wTLfrR8SFo2b6/SOwCncLfyPx9f0EmF8zUWpvoIPTAGQxNMCx71yXdv?=
 =?us-ascii?Q?T32vZ5aetXeZUcHIKCjZJpFxj7raqxsqFMO4bnxfCgrBiVZaguT+F40jacar?=
 =?us-ascii?Q?kygIRSmy2rp6FX7+e1Q+5p4lBloRSTxD3aIuPcsAqMmJmXNNPH3iiFMWEsTE?=
 =?us-ascii?Q?hZi3H9Q8ttdlyCPn93XkgwmvPrTUQlYLlflb84hK80CexKd+agP01qlOumzt?=
 =?us-ascii?Q?KM2rwD2WkK0IjUuhFhIcuDVczAHdgLFyX9vmpVlnmSg1kZ4GaQ9wAL7VQ5Am?=
 =?us-ascii?Q?jz0IDIptItAKriAiYqu2ZRGVrUkI7KvIm/Jt5ProC98hxOV6sr7qpooZ5/a2?=
 =?us-ascii?Q?njMqeQ28fPhqtH0ZR1GXrP5kNNV5lMYhzbKPwTe8dU/Fk7dA8sUAraajy2it?=
 =?us-ascii?Q?EV9ZkEUCe6+N5DrYsi8Td0ZT7OkV67Nx2706BwxX2BR0NbSAWS8hX5YKMUnW?=
 =?us-ascii?Q?3HgMbzWvZBUQr1MqggWWp5YNRKSQEU4sxyBwLvIell+hBrJ4+psPFSJvdApM?=
 =?us-ascii?Q?MFZJ7jgqcmI3eCVlp60vG4N9Uuc0evZaoX3ZAHiQ6OJrZ8T+zDQOJitPrCTE?=
 =?us-ascii?Q?TGUAz4FZ1LbW1E4V0EHT9NycN4uuwz9+ntiBi6HeRXU/Rzq44kpfQWX+YhN2?=
 =?us-ascii?Q?MhD2LojSdWJTBHpV6C4dIr03f7XRsgdw?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b3f33b8-b3db-4a8f-ebae-08df111e1cfa
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2026 22:35:14.5623
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB11096

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
 Documentation/leds/leds-st1202.rst |  3 +++
 drivers/leds/leds-st1202.c         | 16 +++++++++++++++-
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/Documentation/leds/leds-st1202.rst b/Documentation/leds/leds-st1202.rst
index ed32eb3a27d4..27f35cfbe534 100644
--- a/Documentation/leds/leds-st1202.rst
+++ b/Documentation/leds/leds-st1202.rst
@@ -20,6 +20,9 @@ brightness (PWM) and duration must be written to hw_pattern.
 - Min pattern duration: 22 ms
 - Max pattern duration: 5610 ms
 
+If the device tree sets max-brightness, that value replaces 255 as the
+upper limit, and a step equal to it drives the channel at full scale.
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

