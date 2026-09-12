Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazolkn19010000.outbound.protection.outlook.com [52.103.32.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F0925B083;
	Sat, 12 Sep 2026 22:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.32.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789252318; cv=fail; b=XmC30cFxIpibR7ICQn8SRNLmBbRnJq9bZExU8gY+DwRGanjQRSMzUXiMEGePUdCohJwbB+eTf0Q1g+OgUeEGQTK2cqiSfJwEcik4Xx2MGQ19FvCj5SdW4zhf0Tp5muLdkxlLvgYUK3YAsZ8wOHWuj0bESsSU2movlg+s9+9BoMw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789252318; c=relaxed/simple;
	bh=SIMA+G0UQqh5NFvAySQUjHqZzf2XW6JXXeyYW/G1klY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cL+eXyHUq0KSMgOTIwxPIbrl5KHK/JNad1btFPfaE9/NX3KOEjURfRAeJF5y2haRqaFEqYOPgTr4sYtt39L180baZwyRgZuhh4eDsK+LsxJOyQMlIsnY0YKVmWs+FWnoAK2lTMcZq7W8BnzSLAizlpK+Rk+jhy5wqoUYpYPPICs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=nIls3tU6; arc=fail smtp.client-ip=52.103.32.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="nIls3tU6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k396fLr8E9eMzlQ0Ruo3ZuyEQLg1eVUSG7CUj4KwpjYjus/xj41+IRRCnLl2QRaOKekO+0EJX1YZBjcAic76FVMJ7YPNtD4l/8ca4MFLGEo9qFy9l3OMMcqqAg3Qk4w4rABLS2phrUwNPxqcO140P8bulru3xCwRmrQNUyTgP285zqQBQna5nCP0oy8eJFnAzW9I5z+G8p8+cBZZnl1/tcbn4vCH2cNQ5XRLyw4aAevNq0p829yux7LJXBP9sbL907JgthuDsrQMqFkIGQjGUZoV73ebs2N3IK3NhZLuBmKJy4U6WFRJEpYpfDPs08h4BEUwaxK/mtMr3u2JtAVB/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wNAU0lYSHB6LE3hpe+5XPKEGInnA+AAXw40pCT7eXLU=;
 b=VX7XCNb1jY9Foa61EUq8E5g/q3CVOBSVFaRBswo0z1LtV5CmZzPsIMuVo7R0yTF7hqyGQpjlAHefftiYwYQSB6oG3xbQyi1eW4oHhWLGfzgr4ocU7Ebk191fuIALPppZfDk66kGaj7icak6Du1BngG0xRbsrKFaYJXzM1As2m+f+AyNxOEgwy1KXgV2LiDKWtPYYYi2WTZNFkrPjc1uMa03eiT+BQseh5kf2VAvLBlzE5zi8SlgrSW1wNrC3jDdN9kNi2K2A5F80zhMINOhhh1o9C9HMRG1V+ZDE/BAvpckICWwfFGe7zmG3fIvx+ZlGKWFFPgEKDHU1S4033EVp3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wNAU0lYSHB6LE3hpe+5XPKEGInnA+AAXw40pCT7eXLU=;
 b=nIls3tU67FGUkE3xlwjqki5A/G26EAdhNfDqp56JRkkc+fcSDpuws0RX7LGIUWSXaiI5HyUPR4KRkEUd8KucOPIJgZ9jVK6WpbqC0g9oc675Pd4J3LNB8znkXavqLoR85JDzryZSqnH8jikgs7eGzcC3CVrhQ3DWov5zmw5o9fqiUpO6uigzyvhel/qgS+pIu8sU60sOmkfEF07xwBivfhbAw5Ag4FrWfSYg7DlK8HhzybGGsK9f3Odfx3q6cXXNm/DoeHNIEbHGNlA8nEY2Au4Ur/6jd6tu1g14K7vRJHv5rBr69d1E62gTd7TFTWPlqf4/Pdot5optD3pEaf6wAA==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by GVXPR08MB11096.eurprd08.prod.outlook.com (2603:10a6:150:1ff::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Sat, 12 Sep
 2026 22:31:53 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0428.004; Sat, 12 Sep 2026
 22:31:53 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 03/11] leds: st1202: Name pattern index variables consistently
Date: Sat, 12 Sep 2026 23:31:41 +0100
Message-ID:
 <GV1PR08MB8497495AB757A3CFF797654EC5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <GV1PR08MB8497422B7A44424C4968AEC1C5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497422B7A44424C4968AEC1C5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com>
Reply-To: fombuena@outlook.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0083.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::16) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <20260912223141.3067194-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|GVXPR08MB11096:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c247901-d5be-449a-92e1-08df111da51e
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|41001999006|15080799012|5072599009|23021999003|25010399006|51005399006|8060799015|19110799012|24021099003|37011999003|440099028|3412199025|40105399003|2607281247196008;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yCKzyzuEpFyggiL1JS2ySiJFRrPaSy7L4d0m/wsa7kjWrVTF1f9s2If09YS6?=
 =?us-ascii?Q?2fjQilrdcwARzlMhNygKwyHR28tehMLwEGnoI6O51ymdb7oVw+o99KM3+u9N?=
 =?us-ascii?Q?5HRJmkFBTwHbmnkpbwgi5NXx6QqDsg8ul3/Q5sQvkrr+Fptv24gobTEguZTJ?=
 =?us-ascii?Q?tR6o6hA0ylV2J8AiVe9/Wfs3t8ky4EsXyLX4ANK7kslo5ytLeZpoLbcqqNj4?=
 =?us-ascii?Q?EdwOnw7l4Yc5zo7fZ8mZIa3lyLU5qQli5CVtYaA0Xk4WSFwsuDC5x9rRbX1n?=
 =?us-ascii?Q?76czOGTFZKcjHdScYs3+wGX02LSmY3NUFX7b+3g+p9hnnN8Di9PrUA5l3d1U?=
 =?us-ascii?Q?jCn3i2HG3AaWB1H4+19lOxrpXh19DrjZxvqeSqfrPG6Y9pII+CV1qW8xBj4Y?=
 =?us-ascii?Q?oFMdY00qszmN+Cw2n/hNwYCYth8kiuYsam5HjxCEGhSEyWJJ82Y7j4fw6/kg?=
 =?us-ascii?Q?g6sx/foSnZfsZNxbIeWRPxVEJoos5eSJKQnzLX/dcrEPEKyVWIbr93pl7QHf?=
 =?us-ascii?Q?pmeGvQIzaWGws+Y67fQ7VxNXrNEWpDYXeqTsUCd/4Ph4mTJzpe8VN092L8w+?=
 =?us-ascii?Q?bamlJjpq20cdlEdFCU1lfpwc6d+0vn0QZ8zrLieVsMFY/AcseDISHmQMPtKP?=
 =?us-ascii?Q?vIVhPZ3V+XF0npKVbQfgPorAB9UVuklVq2BtAhRCVsqCtcSVKYt38D9q1t4l?=
 =?us-ascii?Q?PxgE4vf3gTvSihsUUJmv2zQvDiSVF0Mqdxbxc2Ri4sKXF1y0LGk362HY/nH9?=
 =?us-ascii?Q?WdkcMqXSQvI2347mA/RmtrrQIYDUlvfhfr2gscp84ptqgv1J/x6XLoTSbIyP?=
 =?us-ascii?Q?ZWe+baNNF/I1jZYHGvcMj5IPmVtkMfXil8ByJ2btn6eezgGMWcnE773R7jhS?=
 =?us-ascii?Q?OUcq/YXOAM9qVzh4ZL1V1ghdUiBwvnaIHJtwWSncH+JDR7YP/Mx2mJ39NKuS?=
 =?us-ascii?Q?JlEWIXjqSQEGEpClzWgqeKLxX6UnkGulvbV/kwnJoPH4iztEtMHT87Qa6E89?=
 =?us-ascii?Q?U7d5?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Db3a5i28VQCrYWmUbs2jf3/1XWyvOvs3IDuBS0gZQ2OhW6WfEclWCiS/3tKQ?=
 =?us-ascii?Q?RW6daVvh1Qr5EHaqH9Ib9EzJefgGGoUr4xIicekjnWqMsI10xiEpIU1kjeE9?=
 =?us-ascii?Q?nPWLepTEYZLKotXvGd7iyfQQQHPartAYtkj/LfLLZm/OscrbC/U0jryyoHu7?=
 =?us-ascii?Q?YrcasueamwBtOL7YOMDBoXUMoTnX+mSdlC1QiTskMsotukTQ428WOlaJjUMx?=
 =?us-ascii?Q?d+y0dHUPCjtTFfF9q3C4TyU6Zl6ovmvJE25/2E5akvgVo3hOvwe7CilerTFo?=
 =?us-ascii?Q?yIO/i2fbsRw/L4onz2zZUR52PNKEAf1U06eo82WYrla0Pm5pjO6nxO9cm9g7?=
 =?us-ascii?Q?P7HnXbW5amaDFKsKQRxaXhL1YcQHb3fNaSQT7uYraraZ7cQ2Wps8KMvDco2f?=
 =?us-ascii?Q?nG6IRnZy1rHyXJTJZq+H/7LWtXLLZCpxzLOFOhQbgZcov3+yVs/iPbd/4PjF?=
 =?us-ascii?Q?r5PN0IS6/WdK2prlhhyqFg9dps2Jm9S800Vn6GM7iJS0nlVONuwXh5NkYND6?=
 =?us-ascii?Q?p0roR2vzXCRRTxnxOxPySLgnWxE83MH8y/8iEXNHP04/svqbywbFLxog/bjQ?=
 =?us-ascii?Q?bqLv4dTbmlIbTUSAxghzYPWolsyX2YlCvDqVkgpP8kW7TDiDlx7vKdbc3Lg8?=
 =?us-ascii?Q?uQJ4bUhBnkm+VIdR+AprsXzx4wCZ6CWT1kiBT+0i2TA/t6KS9NA/34LIY9R4?=
 =?us-ascii?Q?P1Sunlu8aTJnmSKf0/5HcjkbupRz7+oNCI1kgXi8Q24jIqSwlH39XX0KCmgA?=
 =?us-ascii?Q?grrkJLDW/btmW1xY9WcYPCj0N1KxcsNW2mwK5PwHpA2U0i4enfaWUj2srCg5?=
 =?us-ascii?Q?nUob35CyYJsiJxERtdkawXpTSwlA4zHIYW2qsm+1YTJ6R1B22sXc4VOhPmAs?=
 =?us-ascii?Q?5DBSAyaHlGNkL1tSrolmAgWfofNifRg3QJV+kB32CP2i94DyUmaZvkg9ZLXX?=
 =?us-ascii?Q?SK7obmMcBPpu6k3li0qDqIZKhYOdOpqos6lLKY//NX87cfck1EunnjCIRibG?=
 =?us-ascii?Q?DeaRB03aDqhzBXvvi0vV6Goc1p5nRHcK2ELOACZvEB9kKQz2/08PgSgcpHj8?=
 =?us-ascii?Q?73u7u2vUYzYmkf5y32h6OCKb+C+2F6KpIIrHuw0a287H/t/j5kMmjR3xUbrk?=
 =?us-ascii?Q?4hDqQsctqq1HPBUqW6KxQFXJ4sFf7/9cr9X/wMtZnmACIbqCQQBnCxXkVmL0?=
 =?us-ascii?Q?9TRVxjJusa5UgJbDyO2KkRgNmpqTDRS7rK7/fTHxmtxXFd/y3SBR67eI5Zac?=
 =?us-ascii?Q?2ZkyCkhkyVLOsUHJWvCZhSTcdao/2Cg9qHLCCXOgXFFpiHCTApzDVHsiw0W7?=
 =?us-ascii?Q?Q5DwhxYb+RmxKxh7N6OtszxXhPM+MUlDQ8qZbyFpxc/Xs020HL1r9cflPsam?=
 =?us-ascii?Q?TUguNUgud1j7rBYdxmysHANw1Qir/bjOsgYcNuS7SM+UZTjXgIfkCB8Obcvk?=
 =?us-ascii?Q?e3b6OoioHLt9YVdrtQdA1sSL5wDtK7/x?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c247901-d5be-449a-92e1-08df111da51e
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2026 22:31:53.5201
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB11096

The driver already names pattern indices "pattern" in the signatures of
st1202_pwm_pattern_write() and st1202_duration_pattern_write(), and
st1202_blink_set() follows the same convention. The remaining loops
abbreviate it to "patt", which matches nothing else in the file.

Rename those loop variables to "pattern". In st1202_led_pattern_set()
that name is taken by the array of pattern steps, so rename the
parameter to "patterns", which also reflects better that it is an array.

Two st1202_pwm_pattern_write() calls exceed 100 columns with the longer
name and are wrapped accordingly.

No functional change.

Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
Assisted-by: LLM
---
 drivers/leds/leds-st1202.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
index d8a04e96fb46..ddb8c6027706 100644
--- a/drivers/leds/leds-st1202.c
+++ b/drivers/leds/leds-st1202.c
@@ -177,8 +177,8 @@ static void st1202_brightness_set(struct led_classdev *led_cdev,
 
 	guard(mutex)(&chip->lock);
 
-	for (int patt = 0; patt < ST1202_MAX_PATTERNS; patt++)
-		st1202_pwm_pattern_write(chip, led->led_num, patt, ST1202_PATTERN_PWM_FULL);
+	for (int pattern = 0; pattern < ST1202_MAX_PATTERNS; pattern++)
+		st1202_pwm_pattern_write(chip, led->led_num, pattern, ST1202_PATTERN_PWM_FULL);
 	st1202_write_reg(chip, ST1202_ILED_REG0 + led->led_num, value);
 	__st1202_channel_set(chip, led->led_num, !!value);
 }
@@ -215,12 +215,13 @@ static int st1202_led_pattern_clear(struct led_classdev *ldev)
 	if (ret != 0)
 		return ret;
 
-	for (int patt = 0; patt < ST1202_MAX_PATTERNS; patt++) {
-		ret = st1202_pwm_pattern_write(chip, led->led_num, patt, ST1202_PATTERN_PWM_FULL);
+	for (int pattern = 0; pattern < ST1202_MAX_PATTERNS; pattern++) {
+		ret = st1202_pwm_pattern_write(chip, led->led_num, pattern,
+						ST1202_PATTERN_PWM_FULL);
 		if (ret != 0)
 			return ret;
 
-		ret = st1202_write_reg(chip, ST1202_PATTERN_DUR + patt, 0);
+		ret = st1202_write_reg(chip, ST1202_PATTERN_DUR + pattern, 0);
 		if (ret != 0)
 			return ret;
 	}
@@ -229,7 +230,7 @@ static int st1202_led_pattern_clear(struct led_classdev *ldev)
 }
 
 static int st1202_led_pattern_set(struct led_classdev *ldev,
-				struct led_pattern *pattern,
+				struct led_pattern *patterns,
 				u32 len, int repeat)
 {
 	struct st1202_led *led = cdev_to_st1202_led(ldev);
@@ -239,9 +240,9 @@ static int st1202_led_pattern_set(struct led_classdev *ldev,
 	if (len > ST1202_MAX_PATTERNS)
 		return -EINVAL;
 
-	for (int patt = 0; patt < len; patt++) {
-		if (pattern[patt].delta_t < ST1202_MILLIS_PATTERN_DUR_MIN ||
-				pattern[patt].delta_t > ST1202_MILLIS_PATTERN_DUR_MAX)
+	for (int pattern = 0; pattern < len; pattern++) {
+		if (patterns[pattern].delta_t < ST1202_MILLIS_PATTERN_DUR_MIN ||
+				patterns[pattern].delta_t > ST1202_MILLIS_PATTERN_DUR_MAX)
 			return -EINVAL;
 	}
 
@@ -251,12 +252,13 @@ static int st1202_led_pattern_set(struct led_classdev *ldev,
 	if (ret != 0)
 		return ret;
 
-	for (int patt = 0; patt < len; patt++) {
-		ret = st1202_pwm_pattern_write(chip, led->led_num, patt, pattern[patt].brightness);
+	for (int pattern = 0; pattern < len; pattern++) {
+		ret = st1202_pwm_pattern_write(chip, led->led_num, pattern,
+						patterns[pattern].brightness);
 		if (ret != 0)
 			return ret;
 
-		ret = st1202_duration_pattern_write(chip, patt, pattern[patt].delta_t);
+		ret = st1202_duration_pattern_write(chip, pattern, patterns[pattern].delta_t);
 		if (ret != 0)
 			return ret;
 	}
-- 
2.55.0

