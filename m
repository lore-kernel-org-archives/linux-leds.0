Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazolkn19013083.outbound.protection.outlook.com [52.103.46.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6ED436D9F5;
	Sat, 12 Sep 2026 22:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.46.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789252794; cv=fail; b=hbbcrBXdJfcAB2XBJIIQ/rV4AmvW1+ExeBcRu4IZ4GcvDDRgM9qObleSChmtGYQMRfdl70HjJ/sH/vwWY+U558QKtOKtJAmkKRfhw1zBOIzTiQlzYervz6GQo+iNbB5tigJCk3EitZWo0g7m/O2xDPZ9PkfU8LDHtZKxa6aIm/c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789252794; c=relaxed/simple;
	bh=XpUoG+RNOk4g1wElPidv6aK5T5DSyiHiWnWcaH5bZGE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JIAcIFUTICBNnA63FHpBGZlGERLVGTTWdxEivL/hSw6h8UbV9cbC0gzbzL50J55pn1dQc4KM/YaHhFEghQwzsEwkFthR+pBRvj+S29Peo9XdzwQgn9umjR8Rd8HafY9/nvL6GzvhW6GdfN7RqrWmx9ic3gU6URyZA98t/lDoDa0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=hYC3Fwfx; arc=fail smtp.client-ip=52.103.46.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="hYC3Fwfx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tlcuPXZ04jjMXvPhFC1EnZAysz46lCtZ+b9rwY/eKVenLx/Jf/hS/J5X2kkyD7AxUmWqc3N6J1Vda9xSgXN91H1Yg6c4/uEpk4KR8Y9V6j4h0LNjVu5G3TbpwZwPkicJ33kqZEX0e+4oIcYklGmpSLqOGinJ4l3ZAx9vKFcSFtcZ7Ij/55/QPqwMPX2UpFsrQBUljcUxvHUAgiuUIJl9Lr2znml0u4hvE7tuvP1r6A9QzjnHmr8idDSWgBMTsRovfQTycTG2uO9cHtwe0Sb/EVSp6Dv6B1njOrz4O/RUhcuBJpKMSzHsgnokvdESFn/pocbfp1SOaIAfpwLC2RhZLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wwL3NiMcDXFRT87ki3nMU0BtgmrUN+pShYZd0gaXwsQ=;
 b=Rq0E0dP046p/4cSX1mVrj1rvzFobD3BF8pcudiYsm4Y298KlqsblO8Nv9vWDBhL6JRo9yF1qiZlj4Io1GZxajQmHmzL7r8HqciLG9JsUNvH/5/mJvJjHfNXyiKGVD967ppTV96FgtQQHyDMWVr7wNb5IUpXjwdrq8QYSn74aCIhaTpjMdJ4e/vycY1OdXyQz8yDFs1bR4Y8kx3iJOBJbUhhnq8KFhaPwgo2i9+uJog2CX9Pd4nSfOCc3Arh20hN9XvsSF7Dejeq/kCPtRmVHrbP1rnjOUGVb6uPiRj8lKyGdwOPnWPXk97y8KJEjd0Y8RleP63t7IcUTDtwu5FpNZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wwL3NiMcDXFRT87ki3nMU0BtgmrUN+pShYZd0gaXwsQ=;
 b=hYC3FwfxMjxpnM1S3JYrLSobUb/sg3NB4yy/Tq75LMIrqkpuZqmRRvnh8Cetvx61uI8OBEm7yF7g5Q4U+0fB9m6Iw4xmhguJQyeC/HwCl2WtOMZrlU7WOa/B92ZAULCqUUYtc6ykeJhF5Mdp9y5gECQunNnTZIgHAG4k2bpIoQ28rh6XFmL37p84cYeB1aVfhiMgBCUCcZw06R7a14za3eyqyjsK7J1i6WAT6txss/iWwvvqbwv+wz2l11ialwcxjXUvmTz3IzV2gsnzZv4NRPPuEnkYTt2x/uPZupLzclgXKsb2fuWuJ9GpLyHwaWjIIvjzuFlW661U0A7s60pDhw==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by GVXPR08MB11096.eurprd08.prod.outlook.com (2603:10a6:150:1ff::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Sat, 12 Sep
 2026 22:39:50 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0428.004; Sat, 12 Sep 2026
 22:39:50 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 10/11] leds: st1202: Clear unused pattern slots in blink_set()
Date: Sat, 12 Sep 2026 23:39:37 +0100
Message-ID:
 <GV1PR08MB8497E28C8864E97AF8C6F08DC5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <GV1PR08MB8497422B7A44424C4968AEC1C5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497422B7A44424C4968AEC1C5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com>
Reply-To: fombuena@outlook.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0219.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:33a::17) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <20260912223937.3112143-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|GVXPR08MB11096:EE_
X-MS-Office365-Filtering-Correlation-Id: 330a6677-9852-45ba-2988-08df111ec10e
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|41001999006|15080799012|5072599009|23021999003|25010399006|51005399006|8060799015|19110799012|16051099003|24021099003|37011999003|440099028|3412199025|40105399003|2607281247196008;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Gq0O4rUfYEYQYxZfOB0AR+wE55SrXfZfqRry5Kou9jJR+qVBCnUOf7oo4xfa?=
 =?us-ascii?Q?yjke9ohtB9tdxDPk8v3UnyqcLoq+A8Onuj5NLpOrJThZcTzzJUB1Ug3EAtQQ?=
 =?us-ascii?Q?lJ/XifQivS+7etkUJZMfs4DGxrX02m6xUy+m9IiVzxW4geAbXdCCTm5VlHPM?=
 =?us-ascii?Q?k6TUWPb7BWeOiJ1a2gi27QbwEQJzIFffukSQ9L/vO0NMbJyxByd2ccbr8h98?=
 =?us-ascii?Q?0V5lmOGPJyp3V8NqXX6IMFhHnFcyXT9znzMkr34CYACQw0uaVBnyDlhz48Wl?=
 =?us-ascii?Q?7ghemOLGH6i2Xu6HkAYWQXSeVq4Wd7VXU4L28xOG9nH4jJRqnZ1A3WqseZGM?=
 =?us-ascii?Q?e1YmPV8Ju+QIb3z9Z2jthqrY0pv7E1ZS+U9pDpaBWeZXxCi6K0g9ehRXjE1/?=
 =?us-ascii?Q?MSabK/R+KmED1jDkXoulerqMx/YRVbkwf3AksML5kOaYyafQEiIJUvY1ABvF?=
 =?us-ascii?Q?T629MwjssVt8kPEp5EcOKsriKqC5i6Cl7hOSbrUEDpUf91BYuzdOGuONU7rl?=
 =?us-ascii?Q?ajDpPCO5im+lCLrau3ncDXK/SazsGRry9cHlVCsQiee0LGl+5gRSocoBwbr9?=
 =?us-ascii?Q?1zF0Jce4e4k/BpaRFsTKj86s2oY6MbnTEtoA10eAyoQLNf5H3CFfbRm8Ql6O?=
 =?us-ascii?Q?W1RWus3lizcxcAohay66deUjpH9tEi1rxSf+ueMke+2ictz4Pi0gCSbvgS+w?=
 =?us-ascii?Q?Nd1iHoxUEgiZPEogbKb4zGWRWFgEsZRLm7o9hViiN0wvfcN8Uq1cLjc192Lw?=
 =?us-ascii?Q?QFo6pRp/QMFQH0Uom44uKiL/xcWIHpr28iQAF7o6kc5krBzNsXxuhs8esLuk?=
 =?us-ascii?Q?VqLRYHJyYzu1QQrKGX4QtKgphDUjlj8QMpS2QcFFjIA2m4JlPtYMx/BJX/KI?=
 =?us-ascii?Q?HJ0LE5vWgQZhu+Zdcfwu0t0FtyRQYo4m6nDGvlLhEYcfc5T2bmlclnyYQKuR?=
 =?us-ascii?Q?gBu8SdwVLsV9ZmQpa8jTdTsX05EP2WmlELMVbrsHW0npd0IQ/rIXPmuMfkBD?=
 =?us-ascii?Q?8EsP9J2sFcWu6i9J7CZAa5RYZaTT73yiVXkqGBS6uH9R0+8=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wyKNLHtoiYS6uko2F+KIqo2W4hhTirFwlvi85bprOHOPk6Jh677hgxI6D0Ac?=
 =?us-ascii?Q?U1zQ39ym4R7WoSKUOV/Nak5SN36dRU0RT5pYnfyILL+yXrVULvn022SGPsI2?=
 =?us-ascii?Q?gTMwWwc2FSKkH1CIwzEGg3fHmJG4TYXvUZNfC4tpnj1Iptp6S3QC2AshuIf2?=
 =?us-ascii?Q?2LGFi6j+dHJFtKNtlrlfOJ9pkG/JkZCgRSE4kFs9FhOrlkYJ6z3lG24HVJwM?=
 =?us-ascii?Q?5Skz2NEDUgSvNaZkFC3h1BLbeiqMYyi6Qs6koqsiAkYyIEyfw8VP9XK2vzBd?=
 =?us-ascii?Q?K0HOlXIitEziFY+3lDP9EqHJ8qKBvqMW8imlutnedPDAqp+XOCSmch3YZQbN?=
 =?us-ascii?Q?nUXoOkymXsSOmWiuGWb8Jd1ltLox4Xb4UlT8iFrtFxuLWhr9pyuz+sG1uyck?=
 =?us-ascii?Q?pYswUkDOUf/d6F4AkEyyBp2VhBnVBGgXx/5m3SoFeHX1l052q0Cx1ODYdupA?=
 =?us-ascii?Q?0t5o4iPcNtPGrClkkFtveBjmGM7TF8Skv04gd+o7KSHdtMpb30oiTSPO7kBX?=
 =?us-ascii?Q?aynx66dZapkkNbW1DigBmnAP7SKHfvm0KQQHJ3M0lzYo6wdpI3wCQVeGzxOt?=
 =?us-ascii?Q?3fetnDooUDBUwchU6s4XiI/WL9FGV7JgCjh0BAQ+xwq+n50KBzxLMsMH8UxH?=
 =?us-ascii?Q?L2oI3GnywZ21yqB3L/DkGjxQO9sKn1nypURbL07ZSuCytYp1mKJEMZkoSJz7?=
 =?us-ascii?Q?daYxRYToSaqK9pveFFEpgGBIe54tgAPpNudj/f8Eq6XywABytrtD5wo+X5Gp?=
 =?us-ascii?Q?QasBmLvZjFsNPgRUUbcLWU/8QpfQtVYTP5Mruwyag8uhwdqsKjUV1+JZEtSB?=
 =?us-ascii?Q?hMoxCrIgMHyCVcTTvN/o7WblP0t9BlXNPAPRy8vOvzEXL7cNVA1z/fyx1wZ9?=
 =?us-ascii?Q?gsqsPlCfwf+k1AjP3BIB1JkDn0RA2VEjZv/mlQDK3nSMtbSugAJposri2bhS?=
 =?us-ascii?Q?Pa15X94zSHNnqGtt+0xDv60ll8TYmzYn/Wxu/wXJMrlEWR1eOeen6aUOPkXU?=
 =?us-ascii?Q?7ug8w7xfV+rDO5R8khMedd21om96dcsjIRNlRWj3RVukKJTgMG0u1gIMy3wu?=
 =?us-ascii?Q?YV3cvUoEDz7v+yeBOIsduGw1CV+8KTSeE/5+RmJSD74d0YY52yjwBErO9jyF?=
 =?us-ascii?Q?ETbhbXYGwQcY4PXRy0BBwI3TY7t6LN0Cq62BsL3/JsaWC9CoJ2R3huw1/Tyh?=
 =?us-ascii?Q?zxGLgn2goCj1XSOvXX5rB8txnhbheKnqcxlgQy3DRXxa3nN6L9pmoXi5yXRO?=
 =?us-ascii?Q?ZnkAuGOfTidaDrJ2SwLd6+2EcphWGqQsbmgRQCgqnCuP0lWDhbLMPO/xRFIk?=
 =?us-ascii?Q?hipVqE/9tx7fjYA8Y1VK0j4r6wxm59+01EgzuiqJcJClR/ssGh0ywh3Vf/P/?=
 =?us-ascii?Q?2/Hv/nROmU4xkbjsbufjSXtkc199eZPiSi4/0L1XT4cOK6SolVMG977RIM01?=
 =?us-ascii?Q?ilsO/KZ0NnjU+GylyCHU6Rc/Q2CKAP53?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 330a6677-9852-45ba-2988-08df111ec10e
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2026 22:39:49.8860
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB11096

st1202_blink_set() programs slots 0 and 1 of its own channel and leaves
slots 2 to 7 at ST1202_PATTERN_PWM_FULL, the value both st1202_led_set()
and st1202_led_pattern_clear() leave behind. Nothing keeps those slots
out of the output except the duration registers being zero, and those
are shared by all twelve channels.

Another channel programming a hardware pattern longer than two steps
writes those durations again and re-arms the sequencer, so the blinking
channel drives full scale for the extra steps. With two LEDs on one
device, blinking one and giving the other a four step pattern, the
blinking channel lights during the two steps it never programmed.

Zero the channel's own unused slots, the same invariant
st1202_led_pattern_set() applies to the slots beyond its pattern length.
blink_set() already zeroes durations 2 to 7 when it runs; the slots are
exposed only when another channel sets those shared durations again.

A channel whose blink is shorter than the active timeline still loses
its own timing, because the sequencer has one set of duration registers.
This only stops it emitting output it never asked for.

Fixes: 35cbd34a6a05 ("leds: st1202: Add hardware-accelerated blink support")
Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
Assisted-by: LLM
---
 drivers/leds/leds-st1202.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
index 1267671557f0..b93828fbbe26 100644
--- a/drivers/leds/leds-st1202.c
+++ b/drivers/leds/leds-st1202.c
@@ -361,9 +361,11 @@ static int st1202_blink_set(struct led_classdev *led_cdev,
 	if (ret)
 		return ret;
 
-	ret = st1202_pwm_pattern_write(chip, led->led_num, 1, LED_OFF);
-	if (ret)
-		return ret;
+	for (int pattern = 1; pattern < ST1202_MAX_PATTERNS; pattern++) {
+		ret = st1202_pwm_pattern_write(chip, led->led_num, pattern, LED_OFF);
+		if (ret)
+			return ret;
+	}
 
 	ret = st1202_duration_pattern_write(chip, 0, on);
 	if (ret)
-- 
2.55.0

