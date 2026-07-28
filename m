Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazolkn19011034.outbound.protection.outlook.com [52.103.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807EE3AFCE3;
	Tue, 28 Jul 2026 11:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.39.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785236549; cv=fail; b=Vc2MNe5xVkumKdea8KqZ5MpMT0F2DSuIux57f53CccvSUoynuHNiSocMHo83ReedR87vfdvvxlySZNYVaz3wipi1HAlmHiCykAztSfSo74j76Gwc/A0Rscn9B6G12bsO5BdORFYQ/e75Do9igluYhYQ2EChYYFe9rnhsj33t2HY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785236549; c=relaxed/simple;
	bh=LVmm10c6IWTk0Ymevm+7kHF0VIrw6/KCHMY6H9VFw4I=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ljd+baU5VhaOfvIAFM247aygUkw3g1ZlDIcT971ORgpsXqU9XhXl58yQgyh1Q7bIANDAMFXksLKuXU8wDIM1FsVtG+u1ou5xR6QppvBxKjLeBOQM9lkZm7kIt4Mq7MSIYbPBC3c6Ni0c07Z1lQpBejrdZp8sf+xshSnEKHH0tSM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=OFi1Oss+; arc=fail smtp.client-ip=52.103.39.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="OFi1Oss+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z7TZYuby3LW2uYoggiqISilRtOrTnjIIkVgWO6vDNt8DwFAbuK6+E+ragqUauALdcTN43KuPjmEBOUKVHUcxXabX3TGz7SKeMJtSdPT6D1vX/Y5c8Aq2exRXkG6w90HlCqSq//JDcY1RKZwPR4SrQc85u6KWaJOSy7jwR+G+zw6gyvBs8mlJ62iuMWniM/Aw3KwhVUi/C5/g7ynCIe7X0hWc7bxw8kZ5fCmpoORZZ+Fx6Cn+Vg5AChcQky6Q71IohhkHcY+WSOOdHRz5a8MdHxOLaoqcz15xuzE6z/mySnL+c00kNzDoFUpQS0s/LMXeqjEiUVHJlvGTfwzeE885Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kb+h/3urLyzbYF8I+0qz1rNxRovNotKrF0dnf1fAEPk=;
 b=eecVQYAMMw116wIGw8Tp1YvUOnVUUc/pxgbngLqWVd3tqQnrpWeLfQRw6xA6af79hHIicyFPw3f+miTUgWORinpOIAcgCRsFhH/Y9DUQzlnifcpsRVLq6b+BspiVdJQ9+ahHKXZPHmdE2kja2pFOylNpyDRDTHu09xkAUl4GRLqgFBlFe1+3tGer2X3nBNr1ihCeIMQRRsGkaVtV98gcW/XCqv4YkDmgq86EhTCWwtL74JAMxFRDsXJ/qvm92xwa+o015vDw67h+zbwxt7F+TLwIZh2o19bcQtAK2DPdpw9e3WcLu6w2yK6RzL6dO3daWHPPfwtZllXYstp9a10I6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kb+h/3urLyzbYF8I+0qz1rNxRovNotKrF0dnf1fAEPk=;
 b=OFi1Oss+8rXEIInpTs8uLRF7WralMisp5gWh0LxfQe8iB5Dy96V9ak2VplokrkXgNDEVMkklOGPOQvg9EJpQ+ekIrX03NfvX43HXmW8qY/P4TEhMlwaJSuIDmfqqGnCvMn7lKk7DK9a+xS62KWJpT93OUAqgaNlDAFC0dL0PjmhgWqqdcXGmNNM5kFMb0j3hjp0PjUzDRE1hL4D3EZRLyXfWwX0WDAPsULxrPxDJpzBauGpZJYgsUKY8Bogrn/6br/++moGY78vi71kyeR1rxuPrnEohVmjjZ9KxC5Lclqc2658s5AnNZIKF8RorNkGppti3Y4ww58OJFoN9TTMWqg==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by DB9PR08MB8506.eurprd08.prod.outlook.com (2603:10a6:10:3d5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Tue, 28 Jul
 2026 11:02:20 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0245.012; Tue, 28 Jul 2026
 11:02:20 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/1] leds: st1202: Add hardware-accelerated blink support
Date: Tue, 28 Jul 2026 12:02:05 +0100
Message-ID:
 <GV1PR08MB84978D8B519C60DA18A6E3B4C5CB2@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <GV1PR08MB8497E3103AD32162BD05D907C5CB2@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497E3103AD32162BD05D907C5CB2@GV1PR08MB8497.eurprd08.prod.outlook.com>
Reply-To: fombuena@outlook.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0088.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::21) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <20260728110205.392510-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|DB9PR08MB8506:EE_
X-MS-Office365-Filtering-Correlation-Id: 197b1379-f3b4-49e1-e7f3-08deec97b046
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799012|24021099003|25010399006|5072599009|51005399006|8060799015|19110799012|23021999003|37011999003|41001999006|440099028|3412199025|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wzCxS6XpOrMK+F3/EXlNxBAMrySrxmSuKrG8ZVM2AXjrnguaNRjv0rBFXMHs?=
 =?us-ascii?Q?eDT+wuy4mkOh8PofxPKzRTo5VpPyitoQY6pVjQldnOkl5HSM7ycSiX5WA27m?=
 =?us-ascii?Q?he64UsnhPtydeV7uLNcv/KMfW270H1Oj1OCHGXiDOSSd7sS8BiGd15C8GyMQ?=
 =?us-ascii?Q?qqB/9I+Yeu6tsu5D/heqCUYS2vcijr4iyfZNCJ+eAg5YjLGSixC8CrJ5PtZF?=
 =?us-ascii?Q?rzPnE0qFZ+ZYFlkW2bsVwPmdr4YijmX1qAkzGogOLI/KHFCGFYWhGnb1Ac9y?=
 =?us-ascii?Q?inP1demLwz/+v9h616jEXMt6ZrfB7uHQf4NW3TKOHmlo6pBEqpj/2+l+1mfS?=
 =?us-ascii?Q?8FaqR8OdZfZCASz9QL6WQPBsHaJN2PP+AcLKZ8T6OcHZJ5WtMWcSYX7ewtlH?=
 =?us-ascii?Q?WBHxB5AIPTdWPCMMWj0nr/C1YXIrmarXr+EQ5ZgGGo05qO00rXehHExRCLor?=
 =?us-ascii?Q?CNoMPsyPr+rMEJkDdcv3JcxTlYI5IFDPxieu1WoT79R11U6mkm7DkIhaKT7E?=
 =?us-ascii?Q?oVCGp/TuOfN2Y/vqzuay4wG0mDRb93VkkK8ojlHw3Lh1XgYuRyanqEhqrmum?=
 =?us-ascii?Q?SBTv70gtr36JJMmOTDHFiBxgm3NfRYAEZFJDOtQWfjfrBJd95eZCYV+ok9ku?=
 =?us-ascii?Q?QxoeAbCX9vo7oTP1l0riLlyFpmAXG7joW30Dz4wK/wS3hX9HfpVCJU1oEkB3?=
 =?us-ascii?Q?zhuUQ3JduOA7h8xnJLVf1+oojuBtj9MGLosVIwWD2UDUdiCoQOaD0qtIslAt?=
 =?us-ascii?Q?WRJimyT3DHTLYEjaIH6/sEon4avWCY75fUgtcbF3+aSe6EuycPF7vrbgiqX7?=
 =?us-ascii?Q?czetn661GDKx1K5fbT1G4ebpZKAPyer8w+0pehgL5GFhVujvbXKWLqv1ZC6E?=
 =?us-ascii?Q?8mtBx+jIaTANHwrE2MQihWOJ07wfLBuQCwnfF1q51VJ4a255tjyXC1bID3ep?=
 =?us-ascii?Q?AeejhUPBBokyNUC3YO7pMQPnERmlVFsoZeYB1cVcCdKZTbclJIcBsM8LQlYu?=
 =?us-ascii?Q?Wgg6?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xxMhvIejvcgWbaxc5AVoPz3Km26yU7t14cj5lMT2prJOMRqHT5JHvMDRBRbQ?=
 =?us-ascii?Q?phoXvZ6iAXZG+yaFPmZRKHw//iaRH7X5YORsgjB32dJYBYojvPe7Bd+kHIph?=
 =?us-ascii?Q?Ofpquc9lTJ/aYanHCscCxbcJrudPG9VWS29pt7ImeOJe/T5LJnEKVxfKQwZl?=
 =?us-ascii?Q?95GOBgWayXD1yve3KPVoBNdD9MX9Bhev3+QdEiTIbrkIGSgd5Vn3Q5fB9eQJ?=
 =?us-ascii?Q?di4V4Z698hPGXzf+skU/IxKp2VYy0MSUmKvr8Nnc3Sa1P4hoQI3JHk3NsBU4?=
 =?us-ascii?Q?YZ8Dg01BrglhtMf7xTQl2USguuboVRtIpiCpIdSLAm2sqvKkkL6ZUV2QDVFo?=
 =?us-ascii?Q?x7KMCbjGbkSc4P/QTDDXsKvCJ//pyg6fCUqb3I0QnlhbjBVafBy2ZL3+yC4M?=
 =?us-ascii?Q?PYtlMaGym7Y1tBUYZMpQs1fBXPGriuNpc7v033Al9M5yjI+7dbTIai7xwXas?=
 =?us-ascii?Q?BBVgOugy1LXz+hrE/k8PshDfDeLyKKv1+GVrukp8l7H7Em7OIDagVfvDfxn7?=
 =?us-ascii?Q?y0QvMVsa2DN721tJ59bk/pkIBRnOMn7Q5/sQ1oJyBlQPkVsfZuBRKuCL7Nys?=
 =?us-ascii?Q?DMvjMm9MuPaSHys3Rgd6bociPzCGTOysVVnbIfYoD8uza8ee6vgCvX6iGuM5?=
 =?us-ascii?Q?Xi2+dkrlZIwzMRipYDvT/hr6ACi2jBqgiQO+2BMB+Q1jDbwzquZC0YsRmvME?=
 =?us-ascii?Q?98hgVoemmhlYtg6b3b8PwmWOaQMqR9rDkaXChwHkV0p3kG1p4OEqMTXU3m+B?=
 =?us-ascii?Q?oEToK7xpJPYwlGIHCrAAdRY1oRHzxPZ0au9ZqZZaBxOMELOyz3kdFDvg9N6A?=
 =?us-ascii?Q?jmizcig6DZThswSamt7JOsQR9ES9Nw5pLjLzrrjyyZ9MpvgGr57tm4vXW9es?=
 =?us-ascii?Q?qLrtZiwaG/be+Q56/mdLl8kIee0OTZi+BfRbIQKMHEY6z7XZ8KKfYn7gWuXv?=
 =?us-ascii?Q?/ltX8N2+WjGDyHGOmWJBhXZi6MmrHSwv/NeMA8+RoLdPW/aCE8U+OkXr5XAc?=
 =?us-ascii?Q?Fahp5EBK5GyBDMpI5Xe/3EeVujCO1TsU8iYme6AgsUuLD+1ODKw6g2M65s+a?=
 =?us-ascii?Q?Y20sHhgjKp8dWnnb5XfLq0KOg4K6xl1ALYxi6cC7GgZI1CS9dXi2P8paMPDD?=
 =?us-ascii?Q?tZ+bAvI1Hby2qAgWIgEBDPymaMt6llB00OcnhKgrmdJ9ZG81clma1sJLZAkE?=
 =?us-ascii?Q?lOZw9w189JwVieSSU7EWkM1ewPDxoGifwJDj0lbhxUn9RCgS/D57hLYTfF/l?=
 =?us-ascii?Q?RH+qxooPIG/3PTt0HiEWkAHBTI4PpEnEnDcnkvF7J3Qh9mJIvcmPKvBiwsIS?=
 =?us-ascii?Q?H5wHhc1O1ADKbEyJvOYmOK1zuKZFe5e79hUDWOjxoF/HObPvCG/8J3xPRs0t?=
 =?us-ascii?Q?zvASHs+l1afFXxBd+9NOr7+PYFfatcd8vebTqHCKY/OVAmomSepj3QRINbkN?=
 =?us-ascii?Q?8wA856tOvlChIqJkUpP02txqYGrkRoJf?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 197b1379-f3b4-49e1-e7f3-08deec97b046
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 11:02:19.8050
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8506

Implement blink_set() to enable hardware-accelerated blinking via the
timer trigger. The LED1202 pattern engine is used to produce a two-step
sequence: full brightness for delay_on, off for delay_off, repeating
indefinitely.

Requested delays are clamped to the hardware range [22ms, 5610ms] then
rounded up to the nearest 22ms step. Clamping before rounding prevents
integer overflow in roundup() for extreme input values. ST1202_MILLIS_
PATTERN_DUR_MAX is an exact multiple of ST1202_MILLIS_PATTERN_DUR_MIN,
so rounding cannot push the result beyond the maximum. A zero delay is
replaced with the default of 500ms independently for each of delay_on
and delay_off.

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
 drivers/leds/leds-st1202.c | 82 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
index 168df5ecf27b..4e0128c7c94d 100644
--- a/drivers/leds/leds-st1202.c
+++ b/drivers/leds/leds-st1202.c
@@ -15,6 +15,7 @@
 #include <linux/slab.h>
 #include <linux/string.h>
 
+#define ST1202_BLINK_DEFAULT_DELAY         500
 #define ST1202_CHAN_DISABLE_ALL            0x00
 #define ST1202_CHAN_ENABLE_HIGH            0x03
 #define ST1202_CHAN_ENABLE_LOW             0x02
@@ -275,6 +276,86 @@ static int st1202_led_pattern_set(struct led_classdev *ldev,
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
+	ret = st1202_write_reg(chip, ST1202_PATTERN_DUR,
+				st1202_prescalar_to_miliseconds(on));
+	if (ret)
+		return ret;
+	ret = st1202_write_reg(chip, ST1202_PATTERN_DUR + 1,
+				st1202_prescalar_to_miliseconds(off));
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
@@ -301,6 +382,7 @@ static int st1202_dt_init(struct st1202_chip *chip)
 		led->led_cdev.pattern_set = st1202_led_pattern_set;
 		led->led_cdev.pattern_clear = st1202_led_pattern_clear;
 		led->led_cdev.default_trigger = "pattern";
+		led->led_cdev.blink_set = st1202_blink_set;
 		led->led_cdev.brightness_set = st1202_brightness_set;
 		led->led_cdev.brightness_get = st1202_brightness_get;
 	}
-- 
2.55.0

