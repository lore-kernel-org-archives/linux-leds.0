Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazolkn19011026.outbound.protection.outlook.com [52.103.33.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2355D3EEAC2;
	Sat, 12 Sep 2026 22:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.33.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789252717; cv=fail; b=Kz9McZdUtOpLuabiK+Jt7vYDwxzEPNhSKNWICUjxTVOd1hd3kzGHsqaZFdC8lLyzAg83hW4b+1K4i3KA475DvG8k34hatBvBv5v0uCLW+KUp55f+mlYI/pWDNDuas6aGz2vWDSp4sk3PSgsuLy+p5C8xh+9zq4rrk3AY029Jnco=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789252717; c=relaxed/simple;
	bh=+nhGkcdkrOZAyQePVpq37f7E1JY1gve4hIjNa8DWuiA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PuI+gJGIZD5jrOQ4k5rxxwKkMbnjIS3Kju9K0m820drRZw8j62jXvHzO0ZXxHBJQWYzj+IBUrk7w54jx7SwzAA0XOinYfPz20LJ4ifltu2CsBAeTeYtPTERVmYLneDpWdjudujvseFH3ygJSfSXPBmywNiNOrbovYwojkV7BxfQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=JtQQ0MTz; arc=fail smtp.client-ip=52.103.33.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="JtQQ0MTz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VvSV+A9voaAcxOTGNn/vJXHaXwVwoLT26JxjUEm43wZ0HFOBF3jo5j4aiNkp3LMGM13he5vNNbBUZG9UWRvx0xlMc49cQoh0H6y+3KSPu9CEhnRJs0qaL3KNXdsNQnd6utn6oKND/l0x3DUjJBsMhJThh52LCp9LrObPmaFo6gIGkLyky+PlbY9CO5nqXsMBVa3sVBMOlMNV8KRQRABM0l/NRIfNwvU2cpDdvoSc+cWKr/chOMHGlkMzMi1XOScifeQEWYaTk/SyZPCnijO0cmd/YStrTM5oUINEqhkBUZNwVW+oNZNPqQo4ZsELul+fc6RXExdab7hwnFUIIOLxbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KKbMRAeF7YbRmzJNBlt862XXqwGxRw71srYhL1mYXeI=;
 b=DRwQnJrhtHYxvy8MFijqCA/8aFoWX9fQuebtamXxfttNScNTlq0ciSkbA4qXtBQT1L910f377gxkw2WLas07aQJWCe5itFs/Y8xA1Z80yVxS1fza3U3EsrfcbmkDR2f6NTICMOMx8HcltCShNkGh3wpIKZH7W/1lV7Ct0RlFyx3jXCc7yoNQELEn9M7wLP22r+q2/UigOboehdECc6dPCpF/yZaidvibyRZF6bt29AVUTJ3Xr/2EcuCewiqBIMffCj4QkK7htyHCZof23MtDBHHtpGWM81n27bJtvjkNYXcSaqRvOg9ciLDygIYWSu0bXSyncGIkNSdFJiR8iyBMwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KKbMRAeF7YbRmzJNBlt862XXqwGxRw71srYhL1mYXeI=;
 b=JtQQ0MTzFTsUuPATSCVpB5AfLuI9Ajz/kaP+ozgevNV14p7ZefZU9wsIO4hdcNZ4gZHF14elhPLiDGDmGOJxAoR4ShztUgFIqQmi7FNG3p8yKKMgb5gWajL2cdC9Jw8DhS5dtxut95PMkJjhy+AIB4xIjv6WWs7EGbj7AOhortfLPUaIIOsw+6BySubdWZROjTDMs7t1u7D6Tz+I7MI+0PADjbYBcnIsa1+DjPHYWown+lFGHEEL4zgTLCbI9ob1CbEf/5wmuC3EeSp3BoksywYgtX8L+tzS4bOiaPRU8OPA5+usGVTsxMU0eCLnf8obDJpaCOf9wtdW2rcs43kReQ==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by GVXPR08MB11096.eurprd08.prod.outlook.com (2603:10a6:150:1ff::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Sat, 12 Sep
 2026 22:38:32 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0428.004; Sat, 12 Sep 2026
 22:38:32 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 09/11] leds: st1202: Do not set brightness from atomic context
Date: Sat, 12 Sep 2026 23:38:20 +0100
Message-ID:
 <GV1PR08MB84976AB392C375533BE4B583C5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <GV1PR08MB8497422B7A44424C4968AEC1C5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497422B7A44424C4968AEC1C5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com>
Reply-To: fombuena@outlook.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0167.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:312::12) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <20260912223820.3104846-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|GVXPR08MB11096:EE_
X-MS-Office365-Filtering-Correlation-Id: dd61da47-7586-4f01-1424-08df111e92c8
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|41001999006|15080799012|5072599009|23021999003|25010399006|51005399006|8060799015|19110799012|24021099003|37011999003|440099028|3412199025|40105399003|2607281247196008;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Hw6/nd2vf4G3q4IzmuDaekaWT1Oma2/iy1LjsXuqDlGhseoF5RGptm55+cJm?=
 =?us-ascii?Q?qFekULYKvqvnIEJ1mU8Tz9NUtWj8Qq4o15LhY8PoSUF3aHUPhJATUd5A57sk?=
 =?us-ascii?Q?t6Ofqw1GyrgejbPjYl33voee3bLstJ3I/InKS17c00JhkXo8wOCmR7TqZX0f?=
 =?us-ascii?Q?JHLv8Kq9X0AymGGr2pyEXkvyEnzDh0d33I/NDllauflJpcwc/RPOIel+rk6D?=
 =?us-ascii?Q?klFT4Aa2CRGv4J7YRcDomgA0q9m4ORxUfY6boqk/zBK0KRtQrw/H8VeKxtyc?=
 =?us-ascii?Q?42uM5Sk9surxVXcu1MPj4I7NPBodv6/xfXHONtbuR4mmeAbdX8ES/gFS/Wqs?=
 =?us-ascii?Q?zL8zUxmnxFKQEI4J7kGUUvJIJyhYDEdbS18SOvwj9Jd5b82DKIOuzDFpjo/B?=
 =?us-ascii?Q?SNsZo7NIk9ougx3Xikfzvffi7dbmoe98im7U/XIbEGk2zr54eYYu/t//fiX8?=
 =?us-ascii?Q?ReEQ3feKSAgvkab57WkSZPA4z2p0sJQ/s3xdyXrSOCjF8MsaBT7odP6hcnII?=
 =?us-ascii?Q?zvJZtxaUAeQxEiQLeS+bM9Js8QWnnfQ3vL1dvRgocPnBwKmSZqXTE2OB03uH?=
 =?us-ascii?Q?1VIt7DNc3CzH217rTC9G3fF9ggLryHDcaZeBTz6IoxATMT/iEMwwufGVI9uC?=
 =?us-ascii?Q?XlR9A1PEFBVuBKyJHnXjr53lBWTVZmowbIXPhj4GaiUFiCyW9PSGsbjD2DU7?=
 =?us-ascii?Q?5mR7iW0IRyKxekr72iruE8xxwGyQRkLnbiMuEXgbJHbD79SoylhqiQ1tnz/6?=
 =?us-ascii?Q?oUxFNK1NmlYZd46rPf3/NYfhz+6N8jUEdxZppTVek3DGLHnJ4fa2tfNaawXT?=
 =?us-ascii?Q?pqIQR0DG77crrHG1msv4z8nAaZA0mizYVhLJ079l+B/uxrzIE786pTygkv+J?=
 =?us-ascii?Q?BjjqG6J3eX0iiSLcI2UtE+273OjiKkWbhM9003SpCPK7VSvjRQJ6I5jZnat0?=
 =?us-ascii?Q?z0dKhHRL1/v60yp9PCiN/0KdtIdkCo2YiyJ7eHnUOxD6fmcjZok67P+JcR1N?=
 =?us-ascii?Q?Kssz?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CtvxNcZdFByGxy/fCPAB4jLPHYCSjgYEbMZx/E4aHGdLf06V0+OBIBPEbkQh?=
 =?us-ascii?Q?qjFp4Naoa9vyKBC+e7XjFbUY93jLC2b61SfbpcZcEkFm5MP/vHuIz1b5AtfG?=
 =?us-ascii?Q?N0RKOKPEALNZKFFfvSCMARj9aNNtptkm6QC/Pk2mYKrVnWZl+CICb309t5Vt?=
 =?us-ascii?Q?RRzidKhKb7AggqewFC31PjqvKYqgMELebrEriGFi5mfZfyHZwFru+gn/+GXw?=
 =?us-ascii?Q?IT+JK73DHt35i1xkMLL5oSDu9rIC1EoHFo0+whCT5ziLEOnFA+QrT2/0YvyV?=
 =?us-ascii?Q?5Z2bZeAKVHWkXBevsb0M4zuQm4/B3eQcm17luq2G3kfCaWwUa2sCws42SX1j?=
 =?us-ascii?Q?ixyOiU6zcTCAwQjVM/TT+6c7R+WV/5J+48uF12M72u7h/yWiQ+rliZQ5ZLnh?=
 =?us-ascii?Q?+jQUkyj/uFOJ+kbKV0wYPsi+jbA7549PAah6uOejcaghXYXKUyCflaxe7Qfb?=
 =?us-ascii?Q?E6QFyDvJtkIRZU/BZz2vczmB20RcAe/Gkeome/zoUmmVfRR8hjOV6Xuw2i0N?=
 =?us-ascii?Q?d03K1cOtAAAIKJdwuJA2ixJtyQOyR4hI4ShJLnqm6N56yUY7SPKYA82L9LSe?=
 =?us-ascii?Q?yVzLbHnQ0j7VU8OElBaA3FD+0V641lXpxRXyGmesxf8hqeZGY65rBbbh6gT6?=
 =?us-ascii?Q?EELSBYTdWaF18rNyWB/oPtL34ckFuM37bs2uuyhXEQb/vt7fITuG1SprSQGw?=
 =?us-ascii?Q?6Z46GViDAgQtW27pcEbxMsHP4XV5fEhVqNrbrvTG32gDlkLZNVboMYQhSLWQ?=
 =?us-ascii?Q?cm8UGB6Wuk9UaBj3cb+XuSm3kG1zaqvpawaZEORKmuJ2GEyi6/CU0LQS+yXZ?=
 =?us-ascii?Q?Nu89RWfr3YIJCT2IujgDWqkX2Ro6jTdIvsZuNIriNaA8k8nMqIkCvUwBWIP6?=
 =?us-ascii?Q?2CJSIrofSqTTJG0eCPGAgyADbPEaNjjb8wKdWWV73h7CVfW/LtkV+iQP2CJR?=
 =?us-ascii?Q?iGxUcJ9DHdZH03oBJegralCH4WNYEjbNaG98ZMCPbrSrgHI5LX8QjVYRlKR6?=
 =?us-ascii?Q?hYNLbcWaJOAEqGPodoUtH8ck9g5zfNeQLWl1pJIiH2tGtuh/xRfqVnnuwd4V?=
 =?us-ascii?Q?iW9CVVCoYYYqHUq9fv/qzprC2X7SwXZMX1eO5t2Sn9KoBSNnI32Rvz9J/W4Y?=
 =?us-ascii?Q?jxulpGOWaAQFHdow8AjbWcx0f0W+wuc+J1G6RsTipFYN8PWDbGuhEnOgqDtM?=
 =?us-ascii?Q?tTwlvszsEtn0qG7jvqvZc4OTLUTMVno7bCt1/dE7M4vwCaPC7HerUGJ1Fwf+?=
 =?us-ascii?Q?llXC9eCkqgz8OcFwBkiG+0tkw+TH9zjrsq+gxE1yh06UaYbcVDOoxMWnfJP0?=
 =?us-ascii?Q?eX8uN31Ajyyfb6vzrTaEa7ULqRXlOxwqY/+yCYfQJTcp14MPpv00u5/SABsG?=
 =?us-ascii?Q?Q4xdfr+6VqRZTkj09uCrfv6yWxqyV/fb2qfGxsy9ScPqaqbLZdDmZ2rXJuzb?=
 =?us-ascii?Q?4kBe4kgODf+SV5GoVE7zAykSRVU8f1yK?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd61da47-7586-4f01-1424-08df111e92c8
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2026 22:38:32.2118
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB11096

st1202_brightness_set() takes the chip mutex and performs I2C transfers,
both of which can sleep, but it is installed as the brightness_set
callback. led_set_brightness_nopm() calls that op directly on the
assumption that it never sleeps, including from softirq context, so the
driver can sleep in atomic context.

The driver also installs brightness_set_blocking, but the core only
falls back to it when brightness_set is absent, so st1202_led_set() was
never reached. It merely turned the channel on or off and ignored the
requested brightness, so dropping brightness_set on its own would have
lost brightness control entirely.

Move the register programming into st1202_led_set() so the blocking
callback honours the brightness value, and drop brightness_set. The core
now defers the update to a work queue, where sleeping is allowed. Errors
from the register writes are propagated rather than discarded.

Programming every PWM slot to full scale is kept: it is what makes the
brightness visible while the global sequencer is running, without having
to stop the sequencer and disturb the other channels.

Fixes: 259230378c65 ("leds: Add LED1202 I2C driver")
Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
Assisted-by: LLM
---
 drivers/leds/leds-st1202.c | 38 ++++++++++++++++++++++----------------
 1 file changed, 22 insertions(+), 16 deletions(-)

diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
index 600e004944a6..1267671557f0 100644
--- a/drivers/leds/leds-st1202.c
+++ b/drivers/leds/leds-st1202.c
@@ -180,20 +180,6 @@ static int st1202_channel_set(struct st1202_chip *chip, int led_num, bool active
 	return __st1202_channel_set(chip, led_num, active);
 }
 
-static void st1202_brightness_set(struct led_classdev *led_cdev,
-				enum led_brightness value)
-{
-	struct st1202_led *led = cdev_to_st1202_led(led_cdev);
-	struct st1202_chip *chip = led->chip;
-
-	guard(mutex)(&chip->lock);
-
-	for (int pattern = 0; pattern < ST1202_MAX_PATTERNS; pattern++)
-		st1202_pwm_pattern_write(chip, led->led_num, pattern, ST1202_PATTERN_PWM_FULL);
-	st1202_write_reg(chip, ST1202_ILED_REG0 + led->led_num, value);
-	__st1202_channel_set(chip, led->led_num, !!value);
-}
-
 static enum led_brightness st1202_brightness_get(struct led_classdev *led_cdev)
 {
 	struct st1202_led *led = cdev_to_st1202_led(led_cdev);
@@ -210,8 +196,29 @@ static enum led_brightness st1202_brightness_get(struct led_classdev *led_cdev)
 static int st1202_led_set(struct led_classdev *ldev, enum led_brightness value)
 {
 	struct st1202_led *led = cdev_to_st1202_led(ldev);
+	struct st1202_chip *chip = led->chip;
+	int ret;
+
+	guard(mutex)(&chip->lock);
+
+	/*
+	 * The output of a channel is ILED x Pattern_PWM / 4095. Setting every
+	 * PWM slot to full scale makes it equal ILED whatever the state of the
+	 * sequencer, so the brightness takes effect without stopping the
+	 * sequencer, which is global and would disturb the other channels.
+	 */
+	for (int pattern = 0; pattern < ST1202_MAX_PATTERNS; pattern++) {
+		ret = st1202_pwm_pattern_write(chip, led->led_num, pattern,
+						ST1202_PATTERN_PWM_FULL);
+		if (ret)
+			return ret;
+	}
+
+	ret = st1202_write_reg(chip, ST1202_ILED_REG0 + led->led_num, value);
+	if (ret)
+		return ret;
 
-	return st1202_channel_set(led->chip, led->led_num, !!value);
+	return __st1202_channel_set(chip, led->led_num, !!value);
 }
 
 static int st1202_led_pattern_clear(struct led_classdev *ldev)
@@ -432,7 +439,6 @@ static int st1202_dt_init(struct st1202_chip *chip)
 		led->led_cdev.pattern_clear = st1202_led_pattern_clear;
 		led->led_cdev.default_trigger = "pattern";
 		led->led_cdev.blink_set = st1202_blink_set;
-		led->led_cdev.brightness_set = st1202_brightness_set;
 		led->led_cdev.brightness_get = st1202_brightness_get;
 	}
 
-- 
2.55.0

