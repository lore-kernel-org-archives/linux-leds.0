Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazolkn19012040.outbound.protection.outlook.com [52.103.32.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D937E3BFAF2;
	Tue, 15 Sep 2026 12:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.32.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789476547; cv=fail; b=GaVJ5aG1qKiqML+mRrpYlXN8Psw5VvbA9ZYsorAmz+bXJlmFTIdQZhympXyijmfam1+edY1gS9iTWFfNcpglKyWTUbHWM265m13u80ynb2ho1uCRKY8ygDCInTZn6EAcYND5mZwLkkg+OI1qbKEGTDXt5L0bVR904VKcQCtXcqs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789476547; c=relaxed/simple;
	bh=GmgxA4MhEvaUQ41pmbPZdrHBFlFCc7j4wT4Xaj5HfCQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EvoKPOcmqFN1meHFS08GYrlcOksIw2s1UprAdD7FhrRxakBNLk8i8PzDFrmQS9N20mzV0xpelngCxnklBMhVhFD+Vji2HVzGIxzoY4EGlOfjmq1L/UThKgHb4ACkEYCEkLP2CeECcwXz57fXam0IqqtCdrAc88F38+E7EED3m+0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=THtANb1a; arc=fail smtp.client-ip=52.103.32.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="THtANb1a"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YsLwXUCnvzD0cPbo6LV4gwBRchXApNpinPRRSvMZCJPFOqy2sDytsd/Ck1jcrZL2mhTNOyFrjR4MCrhhh566pHPUmCObsIG+rHP96QM84wgQy2S1Yn6o/mShG/iO+ef57h+uK1EYkQrKu0aOknbbyS6JZJQr3jrisPVLnHG3F4KKj+IJTPcsVtxBEeVVZlS3gLt1VU+L6K8/tW97TIOihl+Is1k79CgxJiH0r1S4deCfDfC93OzOrfWrp16kdhzDq15lUQEUe2oQQzCEgvGAscbd8p+zpTJddehli4LnP0C0bvXqkvvvBVaopLw5yKgvgNlYScQwVPC4z1dzdXDp+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kM2jl6QOyR3KQBDeMoVLqVP9h0AOAoWAzVIWbR20BFU=;
 b=VG7S4Q4X9DGGAz9X2cA/UHr73cKeRsfIg/VBQZisjxdv+jgxdmKS/SgURnWN0Qzm4wnYHdSa7G1S47zpbrjXl1JVuKf/oqL+N1+mF+IIopRhzIJ58b50eMcsR1TvthPmAdF8aPU/7Lo0wgpbk5pQaOCDRxgK+WXEb+US6BDBQmqk3REX3CZkTwDWaiOEwwGIL5xRtBQqPX6ZwnQK01bgzaF53PFucRiaGdXACFaRtluNWz51VNWq9DHtw53b44G/ly13RIT0PAfQOTzzOpeeu8nC1HSaQIv4DLPZGxJvpkThBdBY3Y5cHjtcGHrTAogNK8C68QaJmaL9i1BbToku9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kM2jl6QOyR3KQBDeMoVLqVP9h0AOAoWAzVIWbR20BFU=;
 b=THtANb1amWbC9+2P8J3XlHYGYOvallHVhYkr8ctcBl9sE5o2MhylsbfmtU7jsG2JBw+mQo7+cTvhkTq2oVpMuNTlU/CY1/zac8N5bvl5cjLduZrLXEuqwGiETIBlS2aeRvuaglPG5JKz3X9M5VKjR45XtjMY12cVDB/4RWtN0nYUR8uK6d88n7V01mQlbwrqWRmJwvPEhGb4UWzosUaflD1AxhNGUka0fiRjfYy0joyoFzEgzTk90+NtYSiNRT9x0d9VeGXL30XvttvYe/awlUrqfchQj11Xy5U8+vBQCXNnidIdjAwc99ZnCJvNQqT7uNTETJUYQTXzTzk9JCtrag==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by AS8PR08MB6263.eurprd08.prod.outlook.com (2603:10a6:20b:290::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Tue, 15 Sep
 2026 12:49:03 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0428.004; Tue, 15 Sep 2026
 12:49:03 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 13/13] leds: st1202: Give the channel current ceiling a single helper
Date: Tue, 15 Sep 2026 13:48:51 +0100
Message-ID:
 <GV1PR08MB8497935DA426302FB808A81EC5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <GV1PR08MB8497668D389D43F680D2CE3CC5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497668D389D43F680D2CE3CC5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
Reply-To: fombuena@outlook.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR1P264CA0189.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:34d::20) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <20260915124851.3402610-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|AS8PR08MB6263:EE_
X-MS-Office365-Filtering-Correlation-Id: 504b61d1-cf2a-4014-253d-08df1327b883
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|24021099003|41001999006|8060799015|19110799012|5072599009|51005399006|15080799012|23021999003|25010399006|37011999003|16051099003|3412199025|440099028|40105399003|2607281247196008;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?e6qiGmAATjFPZXDHfBx1Kap9TuZOwSObx5w72I9qyl06C9E98KtW0M61/LK4?=
 =?us-ascii?Q?sMymYCN5rrTSnndGJKVRiQQlWnqhCDtSZEaUlQ1i/L3Zpg7Z51M8rFu9bSly?=
 =?us-ascii?Q?e01oQ/l9ViTOZGAVtsKmxjuN3zRoFuYRB2aRDiiq25yehVWMseHBvogEH/wL?=
 =?us-ascii?Q?3sBPgZnrfhfT6+26am59tj9RXx5FcUAE2tZOwZK/0QVefByDGb8OMoXiCNxL?=
 =?us-ascii?Q?+7rMxiatOh0ScAKXYHukYJ+P0SX9K5auvfDXdpTqvfbw5xcmU/b6SQJwMSHo?=
 =?us-ascii?Q?2fk1sSLYZoPTZGFJ+hx8+Bo5py+Vd1snfBPrEOrcm3aQywJALpPn37HDkgBp?=
 =?us-ascii?Q?nDq/nN/jH+uOWI9v0sPty7mGfLCBkM/mia4Fe8DERHKWZVKDABWXbRkym0I/?=
 =?us-ascii?Q?ftsRUthcdbd/tigyPmngR/Yt5GGCyHdoA4qCbWU/6ZsaSgg4yUxjiIpi2Laf?=
 =?us-ascii?Q?uocoCJcBvN8WfqbKSg2TZAZ8gb7N2eIENGuCdkyKw6fP1SM7UQExQuyOuZhe?=
 =?us-ascii?Q?nVuEW4dfyNtT7vqjVnca3pMdnY3P64Z8kbUlTZQhQmc4nfOI0W7GfFH3Z+TC?=
 =?us-ascii?Q?Igqksnz0AFn+dTEqh/NezrcqHSs51yklZd2sj+2TQZr38fpvoGTen3xe3i78?=
 =?us-ascii?Q?8OVES38Siif71kzetGw/RK1vm+Jlb9xQmJ3V4WkGMSDedfaoIk8awJZr4XD+?=
 =?us-ascii?Q?mqsTB/0ryIBa2ElPoNekkWBIuwYsqeDjsdqxhlgzFjEP45wO8a411lERTtDT?=
 =?us-ascii?Q?YwCv1nps2kF5w4z6vjumm5yMuqlKSqNbQDvquXCk6QFy7ztsRzKtwuEUbvDT?=
 =?us-ascii?Q?830u1X0EpY1PH7hPz+preYg1XnFLCqs+Z/cj+hMmmkIJBly7jKP3CY3MOeSp?=
 =?us-ascii?Q?yhUQcX7PQaT2hri7H6jd/njL97cyEgEPS2y+BYgWqm+zY9YxtOYe6q7UEb0F?=
 =?us-ascii?Q?J08X52nr3omNtlix8pdTSxc3KI9Vk3BWJxyyyjoQ6tR064X5Lhek3LyvLKkk?=
 =?us-ascii?Q?fEZvMgalbvV9LXGkIwVJ3pDixKU3oFSRHU0KyW01W6NkRRI=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rmhI2M/uYcHiqZauQSk/4RSFWNOs7u9UndJkVvNI3JCFIpXlmO413hFuo3oS?=
 =?us-ascii?Q?pxsQCBkbrsjLYwFIOIe7OKXaAxMVAoyyr7oZ8YttIGZdac03Q+6grv3kH99Y?=
 =?us-ascii?Q?c/1JJfKa9Yh3mVRh5ebtbz2eLJznQCEWYHXJ4o1MqGFi0jD6rAhVgRz8QAMm?=
 =?us-ascii?Q?Ybq88YdCW+3M9Wwz51fT5CHRCyBX70AY6LxxeJvD3yLvLsjbyNzJ4D3UZn5B?=
 =?us-ascii?Q?74yDdf2zp3H3SgLXivspuPJ/CRxLEpk9CtHdQnGUngvbNZu9G0YwTWIiIrXr?=
 =?us-ascii?Q?c1bwotMsn/miMkxOUyIzFgsGaYh4pCNR5IrEA+I32CXwfHSnGzGY1KcecFKt?=
 =?us-ascii?Q?bpgWJN0R4PLUJdiAtV2ASO/FEcoG4sRJWNXXh8Tgiz+EZm3Bdu9DHhTKhBPq?=
 =?us-ascii?Q?JCYD942nMmPwmKTNIoGj01f6H8WL6DOPRb1WcqzhDiegj5J2gyeiHFpd7zb4?=
 =?us-ascii?Q?trTZ+lcHg7YB5qvesU+oWP6/jksb/PJW8RYH4YDbSZNs8AiUT7GapQoW3CR1?=
 =?us-ascii?Q?DefIuHjkEp0S5WPp1oOPCV85LJwWqffsiZJ4N2qsE++QB8DZRxnVeWJdgHxQ?=
 =?us-ascii?Q?S8xWbXGx/l/6AJa334mcwmUki5Ng51iGIMT2Xzu9L5ge8KP9zm5hDHHCcTnB?=
 =?us-ascii?Q?EVFicabPF1KOPtc4OP5q6qLgCz8pv39p3BwcrFCHk7FuNcpRZWh5QIB3bhq3?=
 =?us-ascii?Q?K8qAce2DBNORCiw6rU38YG7c31AECBjK1kZKHhdsJZlKY6r+J7KRCcYRunpl?=
 =?us-ascii?Q?1lgf1wjW8LBV6+B/X1UoxEnLQpkdp0BIxBPX4tI5OwRIG5wP5Pvc5vdQo8NI?=
 =?us-ascii?Q?k+4ZEwfCWYIzbf5oaqM1WGiQGUoUM4MjrrJfO1HxB9FihrxWnqDfSTqKd+5W?=
 =?us-ascii?Q?AyxwNiSEJjiyPwgvVto2j9/fnO3X8ecMUtkP6L1iey6Cgu6QJGaRVO779FC4?=
 =?us-ascii?Q?lsPxjVMVyg9YBTA5MWiPA6e1Pwtaz+skVsyIvoOxR0HcsVVjOU9f6/q8uCy8?=
 =?us-ascii?Q?9iJ+x83trXl0kf7B4aIK0Uk1GYg2DJpIHNMM7c81hSL1qAE5SVqJFovUhIDx?=
 =?us-ascii?Q?QEyZbeVKqSMr256n5vzErMvohO+bdLImIV/YXIY380tg0CkN3T3QccOAeUCi?=
 =?us-ascii?Q?8koZWy7UxIewCN2plRcnpYjycY+GbVeHOygtszQOGG349pGUebhUBCVIg9BY?=
 =?us-ascii?Q?wyt36i7kEtd/2jvdW9K3JbvXh/nPvIazv58qDOEEdIfCcZe2SK6QK+0MViYa?=
 =?us-ascii?Q?lGmBMA2/2AHfQXCxjuBf7HeB6AR81pVaWrC6o6c0ryD63T2T0DeagYNrb0u0?=
 =?us-ascii?Q?WlwLqWMwj7UGBTsd7RdBRfvkvYMw1O7LwVAVxApAwVwbNIl0Q5gGtN1HWm6N?=
 =?us-ascii?Q?6iWQeu5y39BJHVKHsyeAnquRLM20BZj17vf5RRaptF3MeeEtP3eH3NOpc1qx?=
 =?us-ascii?Q?IBBNKX8BTfpq+9keZFSpA0/PwBo/3vd+?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 504b61d1-cf2a-4014-253d-08df1327b883
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 12:49:03.4552
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6263

The channel current register is 8 bits wide, while max_brightness comes
from the device tree and can be larger. The brightness, pattern and
blink paths each apply that limit on their own, open-coding the same
min_t() against U8_MAX, and the blink path previously drifted from the
others by ignoring max_brightness altogether.

Move the limit into st1202_iled_max() and use it in all three places.
Each path programs the same value as before: the LED core already limits
brightness to max_brightness, so capping it against st1202_iled_max() in
st1202_led_set() gives the same result as capping it against U8_MAX.

Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
Assisted-by: LLM
---
 drivers/leds/leds-st1202.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
index 5e4a8b80cfe4..8c2e1d58ba0c 100644
--- a/drivers/leds/leds-st1202.c
+++ b/drivers/leds/leds-st1202.c
@@ -92,6 +92,12 @@ static u8 st1202_milliseconds_to_prescaler(unsigned int value)
 	return value / ST1202_MILLIS_PATTERN_DUR_MIN;
 }
 
+/* The channel current register is 8 bits wide, whatever max-brightness says */
+static u8 st1202_iled_max(struct led_classdev *led_cdev)
+{
+	return min_t(unsigned int, led_cdev->max_brightness, U8_MAX);
+}
+
 static u16 st1202_brightness_to_pwm(int brightness, unsigned int max_brightness)
 {
 	if (!max_brightness)
@@ -208,7 +214,7 @@ static int st1202_led_set(struct led_classdev *ldev, enum led_brightness value)
 	}
 
 	ret = st1202_write_reg(chip, ST1202_ILED_REG0 + led->led_num,
-				min_t(unsigned int, value, U8_MAX));
+				min_t(unsigned int, value, st1202_iled_max(ldev)));
 	if (ret)
 		return ret;
 
@@ -258,7 +264,7 @@ static int st1202_led_pattern_set(struct led_classdev *ldev,
 	unsigned int max_brightness;
 	int ret;
 
-	max_brightness = min_t(unsigned int, ldev->max_brightness, U8_MAX);
+	max_brightness = st1202_iled_max(ldev);
 
 	if (len > ST1202_MAX_PATTERNS)
 		return -EINVAL;
@@ -383,8 +389,7 @@ static int st1202_blink_set(struct led_classdev *led_cdev,
 	if (ret)
 		return ret;
 
-	ret = st1202_write_reg(chip, ST1202_ILED_REG0 + led->led_num,
-				min_t(unsigned int, led_cdev->max_brightness, U8_MAX));
+	ret = st1202_write_reg(chip, ST1202_ILED_REG0 + led->led_num, st1202_iled_max(led_cdev));
 	if (ret)
 		return ret;
 
-- 
2.55.0

