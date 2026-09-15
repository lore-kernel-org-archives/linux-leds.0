Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazolkn19011032.outbound.protection.outlook.com [52.103.33.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277804825D7;
	Tue, 15 Sep 2026 12:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.33.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789476216; cv=fail; b=nURLgToFgXbewM5MaOV/+9dDMcjh4LEBI7nShttVQhQ/TpwlINuhgufgxdcdByDrcEjIYsdfpy76VYQVYS3SfXbAZBLsBnASN0MzfZeY8E1hvwJO1LMplZd4gRigTLDTe2c+4ik7TI4tglxqE+3vmSetx2aQgJZEys1kwgiGHio=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789476216; c=relaxed/simple;
	bh=SIMA+G0UQqh5NFvAySQUjHqZzf2XW6JXXeyYW/G1klY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bee202DSbTj6/Kcqs/4QCBS1jX+/skdCI4n6sGdPOxNjXXAzlkX4kbZPA/2arQp44wCTaKJaenHAnwdZoxPjdFu6i7llUxqYXUGAsmA6Nb2XRj4vjggTy2z8WRMQJHuvpULriNfU1B3YPrZK4SHxpVZ79IW3mMCY0sujj8miuLg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=N8Lf1VzD; arc=fail smtp.client-ip=52.103.33.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="N8Lf1VzD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HdZbmPAUi3Tn7zC2/V5s/wrtLnpqIeEAS+WA1eEGjWyg1VkHPE6dVHQ2svouh6sq0kVruW6tvCxSAgAOz9dJnUb4lHc83bKxGRa6qGB0q7QZczk4yEJdKL8wUajW6LKZLkLqrEaB9qwP1EdpM+sujQX6zAC9P4iibBqzsxESMTD+V6z4Z+PoxL07iz9PjkNzfuy8AaqwMq7xXdmQpv2w8VauuX6aLQjCCHch8cDp72ok2ymWqHeTNSG9u/MLPCZ7GMry2bEVlh+SsNOBi4EK3WoAzZs2hZnvorRCxEMufUw2SphyNQfeFreHlpCXvMarb9v2uch9rWOMqaJlDil5Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wNAU0lYSHB6LE3hpe+5XPKEGInnA+AAXw40pCT7eXLU=;
 b=BZmLrM/ltoNXzDwj+e9/VfjuO/Vr+IvRwe9BEIQwmElUZ6bQ+p/csHdCwmtpxraqmQ7xEsdL8yXCuCPfDKtgrCIasm0PeAuRbJC4POJK0bEOvNGlxFShpAXAd1VgXHRIvCWvGqmGsm0QLuwvtr+hx+smoHObVT2WKFNMADP+dnsCnihn0Y7zxtqqRuNHyXHtzbAHJCOQnCxPUmgyL6zMvML+FHUO2x3MtbW+B5VGGepHLgtAi+ikhyQpXSI358W5OB7oYkrFgpVHfh90E7VT3THUxhCcRxiUCqQ88ihOHl0M1eqe9Pu/MjKwosjRwg/K1akWdeBhCZj5MMCugsFSBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wNAU0lYSHB6LE3hpe+5XPKEGInnA+AAXw40pCT7eXLU=;
 b=N8Lf1VzDU1e7eMhi+HQ0mQiDyeqHHh8F9N5MHSlxEIsgVsYJ9CZo52gt2KLManbJwfuwjSwjDgnfVRN2teom0La3pbHsHbFwZimwDjzcaa12YR+dphVcSpvr/OQOdtU0n3mkAyHPnfJzE/e2mI3ScRJBOTzNFWsJHsFWr22ANfATVfQO+jWNK+A6sNXx7VijNBl4CyNan8axj45g7OdldU0X3zR6wcsA1bmsY3RPF4UnatrxY8EkLiNOT2xP+H03nmcdN4YNws5SLcbnApK5ro549ro4vy9KSxbIfjDzMk5S/oDgL9HO8sQQNs9Cji/RnMX3sYwUbMYtqc26FjQqTw==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by GVXPR08MB10666.eurprd08.prod.outlook.com (2603:10a6:150:14d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Tue, 15 Sep
 2026 12:43:30 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0428.004; Tue, 15 Sep 2026
 12:43:30 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 03/13] leds: st1202: Name pattern index variables consistently
Date: Tue, 15 Sep 2026 13:43:17 +0100
Message-ID:
 <GV1PR08MB8497AD614B8686BBDA654674C5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <GV1PR08MB8497668D389D43F680D2CE3CC5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497668D389D43F680D2CE3CC5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
Reply-To: fombuena@outlook.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0287.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:38f::15) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <20260915124317.3371431-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|GVXPR08MB10666:EE_
X-MS-Office365-Filtering-Correlation-Id: 97d89bc1-6a29-403d-f316-08df1326f1b4
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|15080799012|23021999003|37011999003|8060799015|19110799012|24021099003|41001999006|25010399006|51005399006|440099028|3412199025|2607281247196008|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vMlMAuRHRQ8zFrV73JcHPMqalrarlkqrcfh9dEBbsgJsMVd0g6K6wJ9Eqn94?=
 =?us-ascii?Q?ZMkJ2XogHidu4RGNIrh0jio5jl1SIN26bdgiyqxq9LUeMjCWb26J6cjBetU5?=
 =?us-ascii?Q?olNZkd+IebHVmGzIUcBvBPWnX8IJJX3CN8qHbFDbzt/Xi7YQijKOBSz36nGA?=
 =?us-ascii?Q?XNxUNaIWPIyeGR6td7PWSAD/WNZx91rOa6M3KfvfhXXXKFMpcGytpYeSP6F8?=
 =?us-ascii?Q?mZlhGg3h3oiEkX/ofU22ujeH1O0H8T5aJcSYFDwRiQwlx3LbKOHcW0RJmbyK?=
 =?us-ascii?Q?Wvf0HkATZgsE0oaC6dxzZdcFOOdObKfrkHjWavy8E9nhrcNTrChnS4ehuh0d?=
 =?us-ascii?Q?/Byzgtx/L5I7BzCxOp5nTORrvuFSLr5sct0SbM4YyXQzGuW0mHKdeuaV7COs?=
 =?us-ascii?Q?1qZuXHHlRGw0TM4Olg2WXSgRkdBrcntLbenO+TszfNYso97+nAmm/JWut0ID?=
 =?us-ascii?Q?6gsDC6KKwA1pxPJZZe0mtzAAn0Yb75RCoEe8BJMHKe0Bpx7D2Ic/+gl3mbXC?=
 =?us-ascii?Q?eFAA16fkAaixdi1bIv2Pn+U4eOEuJC62VjbbYteM4NZkYU3jTVBfI/U3x6xe?=
 =?us-ascii?Q?CX99Y4u+JHIQw+9wpu1ww8BJS81ot9nZ8utvtHayDl2CwvdH2676qhiN0EDZ?=
 =?us-ascii?Q?Hfv8V0RNYRNuayscmb9QA9qNmFrs1KdRWN3LzzD/Rzx6oXDw9oyWlDsySK5p?=
 =?us-ascii?Q?27DX1u95U9Ir4hwveTr8+d/RcbUCqQ/5KnMHneA5+RJPLsLQGI9OFA7j8YHK?=
 =?us-ascii?Q?etUrS+fRdi7FD6Ope9fP0VxwEFH1H075j1YvePvQK7GRjyWRiTinPvMIdTSR?=
 =?us-ascii?Q?Nx7WDzxb7b2cMqWvtZk4dQCbm2rpjlC/N/DGN/1NdxD1qu9iOmvRjpRulYVn?=
 =?us-ascii?Q?kqI9lB922Gao9wYIpAeX8ygMVBbS+MqIws5KGoh1Di0DEJq1umu200GS9QGu?=
 =?us-ascii?Q?fgrdUNtZ55VypD/gSvNSgKTfy9mKrMsC2L5SoslHpNfloTgQfF1AE2qTplk9?=
 =?us-ascii?Q?68SR?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UzJ4HIxph0I5S5FVdDznxScksUiynOej8ExKZzu49XHz/UdLdOmxbn8wqKiw?=
 =?us-ascii?Q?TASXs6/dr9+rXzn+A2EDUUy7MHsDypoz4Dn2kCb3JuW+Ot/3L5Z6GB62Ia5u?=
 =?us-ascii?Q?pUG5cguONf7WwyZ6QfwZUWlWCkjgaF45wvG5x+h09zXmTQ/CSX5K2aaWNLfd?=
 =?us-ascii?Q?xBfpzt68DgvnuOJP0egU/AQHuYZvE8LRRppA/zrOzXN4BBFc30/QvAjvd+/a?=
 =?us-ascii?Q?xxPUVDaJo0VF/x9JTmbhLmfr9ktkuFOgOyHi5MaXwrqz/8VD1UzVwKkz//vo?=
 =?us-ascii?Q?GcoVWAH66NwtEqPhzDQS+9yo2+k32J2Out5SJIvgqzv8azQafe94wVTp3qtW?=
 =?us-ascii?Q?GIyrDFTvH5unXvzce3jaFPGO+Ub+sUV9dIgM1r5HY9PiA7E37O5UHkh4Tg6X?=
 =?us-ascii?Q?WAC7eU471ZBYfOWYTxC/Cd+W6vZORc8NCqHhtOlr/PII7E5a/fZVGEeoqAJH?=
 =?us-ascii?Q?6pR1ae/kiCNQb8T/ZYnVmsXHurhIRXStoIssorOvIRFdTUwa+AQUnJqoJv1l?=
 =?us-ascii?Q?zieQS0oIx+V7i185pZyGvp4e0BQeLnwloG/T9TLMfMnaMX330ErDlkGJ9+qV?=
 =?us-ascii?Q?j1rAFAd3zCiW7gqc1xGbD5coDiogwz73/r2nFumtxhqQcRPjyNLjZABeUAwf?=
 =?us-ascii?Q?3i08cF26NbKdK5ggpKHHEcDrAg3NWiWIPj2NyYH7TMplqE2FcoB6wvumr2qf?=
 =?us-ascii?Q?EiIPOF23qDZK5NZk7QQZv3HaLb7ChTnZ5QeAXtWSNlMXj1eOki7yZ1OtRjj6?=
 =?us-ascii?Q?mL79ZO+IjZ5t2Q2YFyyZMhDbKwMFdeW6VBsxrpzcRxdXhSwn/WdKwYppFqas?=
 =?us-ascii?Q?V2gOzZV+b5gnPgWqYz1+QU8r3ykBCPyH3bjqnojSN2IpCJ63rluo+pWNMqAr?=
 =?us-ascii?Q?93aA+YBXBsASbq+RSNczKbmxzoHfhdyoBHi+STlIqwykjFrHftejzTcqEfEG?=
 =?us-ascii?Q?18mA9uH8FPx1tVFf5nVwtembtxh8bKly7+GV+4W2IyFk7KWCjYWcAjRff2JI?=
 =?us-ascii?Q?eYG+ODZmZFjDI2Xjsjl7eGc+94pSOYd9gVTqgicPLWq771vLprPboJFpDNx9?=
 =?us-ascii?Q?N7XANLwJ3ePUt3mMuSew041Ow+FHwd/WuX4Rm71FAwC2/1VqQXt+VpsHefaQ?=
 =?us-ascii?Q?x2yxqIXRnJtvY5grS4iK9AJtrA/kNsAfXLBWsjqJNRZEXh5I8+6YuaMenbdY?=
 =?us-ascii?Q?bTUQPke87MMF5sBlQE4qrYIXzHZWeEl2Nn3PdSb/PTVXJ3CH1pVW7p0wlV0L?=
 =?us-ascii?Q?j/jAxdoN2Q6TyOEVcnp0Ae/4i91EecaN8d7Vz/3BSYU/GmlUxAxQqAK8q+Pi?=
 =?us-ascii?Q?ns2649Sct6VElCP9FQ7oWBsXY+qNyKVP+LetdUyxqUmOsV8wT+/J/ItRsLXB?=
 =?us-ascii?Q?HBpkhw/WLONCJK7becam2+Lx/+2bVYv5tLMD2prkSAlVuLoK1DjB081gZ8f3?=
 =?us-ascii?Q?uA6KT9UrpMze7hnP+2ZcZqliXrMjHN41?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97d89bc1-6a29-403d-f316-08df1326f1b4
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 12:43:29.9009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10666

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

