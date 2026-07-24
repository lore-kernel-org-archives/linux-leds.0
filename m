Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazolkn19013084.outbound.protection.outlook.com [52.103.33.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3492631619B;
	Fri, 24 Jul 2026 11:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.33.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784893973; cv=fail; b=lLrNKUDkEQu+js7pbAmIBfBsFCiWFgLqRXsynRAM53fkzyIWszV+4KWToQLlUdmX0/HpIXaxPFOqpcvbugYtXvDP5Te540hsh25lN6hN3ISF7cSJFYjDx1AwDLrtZHw+7FZYwjIWOmZhnctYkuyK16JTZ1gAdMjUESBjfrr76wU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784893973; c=relaxed/simple;
	bh=VMslr3q6AXUAASpi6Ijcj27C1NB5HbGQ6za223cJaI0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mYWhedfv3wkQ1JmZM8iC2iT+etHwZcESI+bOE7fG5iBPaaF+BUBWqdaRkS+oJyxZdYuYikqeBFtAWH0OImyocsp0Ez/XTofzNT78xEjDAqBXs2Ptf4BH72vO8tpIvOAgToyibI/TYiUD7S5q2jJetb8J82R61ZERzKprytIyVuQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=OPojNqP0; arc=fail smtp.client-ip=52.103.33.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="OPojNqP0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wlWaTtiPB+QhOG/RbVABPG5MijHhyHSyc+7JNDYI75tpsD8NeIgrw0GAAB2MiVikXoLMPrrJAUHdN4cm7G8x0VoB45VRnPZWAEIAmZbLG+1506RoaP9TpPnzHYxYKuL1/lHRWY6tSuMmiPmR2AwUaJJXBMh3jC8Du56izmYiy1hH9um/BZvjhqryauxxikPV1nHoHTwU3V8OH7g2/S7xb44kQKbi4rVNhb1CNbABETWjec2ybck+LdfQfCnJrLQnYexjqzv8RY91KOkFwbYWevP2uXMbeEf/kPwGlL/lxpBrAuTis2cONmyCSn2rCGxE1i9WbwngbsBiOFzhZ+QJpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KIcri5FDRKQDitQL36OaQCH6ht8tp0lJxBI3FwGaKFY=;
 b=QaUxfoKel+Xa4ZOZxnDcP4JbwfKAF9FQKmxAo9JageBoyOmbtIpJr33Xvj8YxrgmkpcP1g8vpp1qgw9e1t0Rd0R9O2WmLQ+vdHx3hkoTn9fvhneqpt4KAzceR+MeLYY+1AIB+o+jnr2aHMHxJinkLpa8ADFRXs5zb7XnpzJ2yjX9Y0gShfAHKYxW2klWnm8xbea8YbNNuW2ZgkQuXWhEKpoZdI5qzKP+rYZoPVlj82slmXmw32plHkuvvwsuCdtDrLeonl2ylZURzex8+sdBe+R5CIz4E7Ka8RfPfIZjFAF/wvVj3SR1hvvki0LjLKktUKEngNpUR5eZ+YPCktZG7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KIcri5FDRKQDitQL36OaQCH6ht8tp0lJxBI3FwGaKFY=;
 b=OPojNqP0psNuAF5M3dj9GaAqvLo+AP+HGjkAEp2wbYoIjBlY7vUzKN6XMSOxg+k+pd6+ILH9RAIufj3bgwwf+/dRM5D9UEvYB6yVql9Z/CFjVY8kIzwYHhba1HihKcv6RcNiugmzfKcy/t+n7N2+fFhmB9ewl2cdtKlWl1TJnv40C6HMTEnbYvrrq7obpHCFqkNh/iF1zy21W2PwF2DQEaj1J9jnFuAQTeJqN+VS3ZOkiGto1D1xAvHVN8n7lJjhcfWBJbhdyi7ykNy/RzxjgAyVvjih5kPKUhgkdBa+PfpewvIgdsKHQSFPKnAgTdj1QN/fq0KxH8PmsK0rv0W3Fg==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by GVXPR08MB11373.eurprd08.prod.outlook.com (2603:10a6:150:2e5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Fri, 24 Jul
 2026 11:52:47 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0245.010; Fri, 24 Jul 2026
 11:52:47 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/1] leds: st1202: Add hardware-accelerated blink support
Date: Fri, 24 Jul 2026 12:52:35 +0100
Message-ID:
 <GV1PR08MB8497508C31C9EFF23E85073CC5CF2@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <GV1PR08MB84979E014A407174EBAE9875C5CF2@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB84979E014A407174EBAE9875C5CF2@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0169.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::12) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <20260724115235.1213966-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|GVXPR08MB11373:EE_
X-MS-Office365-Filtering-Correlation-Id: fe3b9146-627f-4609-2ece-08dee97a1462
X-MS-Exchange-SLBlob-MailProps:
	ScCmN3RHayHq8QFbWW6Ra03gxaeZK6u4ur1ln/2MOW9pLwdy+iM+CSbaIZ8bwWAG4NjN8RrUpYEAkXlKlBl896loJO/J7IyFLc7RgePAtORs8lzd3eZLPKKGHCf+Pjb/T5pObQaQWpVpUqrs0WQBXqSAVJ5dc76o6EYNmeYRLkJt94+B4BdMusoZxagHx1MksGfBuBenSEqpbpQ8Gee8zWahnNNOTBRRJuOSfdJWQwohSnIK5zdBhj6s1FNaFMO5GC/amwHDexayZPYDBHnQ0DJw1vYQ1ocRBFpPsDGRNN8AWausQ4c1CDIubKGr6Zq/wTq3ZeZnsjPp99oqhb+p1ELOwv8JY+US6t0HGzppt6MvQPjtEA9CAOJhfDoFJeQePAd8FYtwIQgXXtro8jd1hgwQc7J33Aw37BPU/W6fBm9enl3L3t2XrmZtny6nf10RhLtQg64b8FYQx+RCfizIXIDm++at9MduPToZOlXroyTB/G/2aLI5WUe/AbgW9f0v7yfikjA3Wg91Z5GtE8ijdYHPAwARYbAbkVdm5W1jksKbCb3JGKiMASOCO7aFlnGfvQPCUMdKe0CaLaOwx7HuQUka7RT8Rp+fDSA2GhvrGgO2kdndeRFX/d+vEJQQEIzXwa79a1lMjgOWNYGE6wGo/XZpkHM8Lq8sCWODmDNymba9pk4mWOeTPAVBwwHAbYHYGQqfX8JoV8jCdD81JMg3Aw/pAFYFrr7p/oDXWW2PwJ4=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|41001999006|15080799012|8060799015|19110799012|24021099003|37011999003|25010399006|23021999003|51005399006|5072599009|40105399003|440099028|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tIe32LIvCOoBo+a5VPdTPBlgE5k94LlebSb0psxvHuoP3OdLn8fad0Kjoyf9?=
 =?us-ascii?Q?e6aGc+oqhBPM2F5em4LeIBWnwq51vcwND66N8CtvySymT5S+QP23SaYeu9L2?=
 =?us-ascii?Q?RoRMxPezaVwSyXit3niYPyyFx94a0WYypZtmqC51E6rbkNFxOc5IwNE6mPmk?=
 =?us-ascii?Q?s9k3b2dbcktUpJ7va6ekH8UN8hdalWgpi7y+IG3AuLOxN6jEWO/oS6MpX0Zb?=
 =?us-ascii?Q?CkYEbvJtLIPshVrSd8ar7KB1dZwT0dl+IirxDzYHDjtG9/WDdPLVlJCa2B3s?=
 =?us-ascii?Q?jbFV2RDEQDytmLpX2x9V1PhJhSAI69dSQ7+7UNqaUoNjKNvBZyxn9tAhToYC?=
 =?us-ascii?Q?6Y0CW7SOk+e92r5CYLNSwcFBCSwrvlMbTMaiIN79ziZWRrUmD1LG/75vpXN/?=
 =?us-ascii?Q?ySNR60Ph5zihl9/G3R7d4+11ofUwD2qaDrYfG5APJET0qvsfXAOxTJFs6U4I?=
 =?us-ascii?Q?S8IE3WlT/CY8iN+hNE4/hikT1pcc1y8JlqTo2mA7IfewWtOaSnjwI+wJlDzm?=
 =?us-ascii?Q?95nuoPuPbBGq7oErKisPIQKNzbGH9fPVrrjeyJQQV57u53kqL8BQq1dIdGmF?=
 =?us-ascii?Q?k860utJYZEKGtQUqMsIt10MpJJ10NflkrzGBc1TDJB+N/SG6g2AALnI/r+ee?=
 =?us-ascii?Q?1168q/KDM8ZwnPxBpwJzdhbROn0VQTXUalKf5yCkfcMwqLKVzPhxqghprf1f?=
 =?us-ascii?Q?mkcINPdhUEJuLDGyYlg5LnV6GNBaxkjBg+lDd65S35EqTfJ/Woovi4EfGsNQ?=
 =?us-ascii?Q?fN8XWJ+x3cen1O6Wg4FS43u1KMTfQI/RGPZGao0vay0lJL/Dy3p6PRbs7UM7?=
 =?us-ascii?Q?EvT8eQTJzfioubokaiRgL4L+M/YLdW6c6OpIaYHx/XjIUpKewBF8QsZaMyDC?=
 =?us-ascii?Q?r31sCQ5H6FUjK6BwLU0DxEOtJ6sgZ7uyB/8jI8VMzmOfva91b/YdUXFq3ky0?=
 =?us-ascii?Q?Dapeyh/2GX27Ruf28YB76yvDgkUEdYU4IoUbLQm4c76KK1MxMWnrxBoUgtLK?=
 =?us-ascii?Q?rZSI?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YXoEqrKUS2qZ6wZfvRa9hOJd7rIJZIk/L1sK0Z7LXxwALXi1Ys9ydsEYcDC8?=
 =?us-ascii?Q?l5LwODwdkKaoyQlmDzVeTq9A13QRfDAbDJ6HrGf8+mblGlhfogTKTO5S5iDO?=
 =?us-ascii?Q?+XEod+9DbZCuyTUFa6IlLe24vtFoWHY4VsNJaI5XHjRGSta6JuFMkjoL7oyw?=
 =?us-ascii?Q?iu7OsjaJP+gys+OXNwqeZYCbk10rq/j+/PCZ2kIC59tdosBDnkakkvePEHXv?=
 =?us-ascii?Q?dtUULJvhUlwSV5lUlabOZwRW+vKrogdseXDWi6qV+s44uhXSf44p/ULs+CSe?=
 =?us-ascii?Q?DXtqNzMfF3ne1SftbrdE5nXsOkzkha2h7MmhQ7nsVZ4Pv0R+i72ZlPz1mWPW?=
 =?us-ascii?Q?daleJzQn+cMyt1aNxfKKhjfHhU6QiYTbzyo3wOW3vLxvQPW1Qrhw5mtLZtDE?=
 =?us-ascii?Q?aULcmlaYRfzo8ZhUAy0B36kFgSdP7cGXX/88O0O2mVmeWekViSq8vKu3TA62?=
 =?us-ascii?Q?2rneZpZxHHgDNQDXvUTPNmCWSeD5TMl9GXKsb0b++lOCWoZyx108bOok3jtx?=
 =?us-ascii?Q?BlLcQhwVydpLa/FclFkzEgGimfnszM8JOIRpCF892heZFspFOE4Rprl+4wjH?=
 =?us-ascii?Q?a4LbJsMpczdbyjtTyAwz72N9nyW5hYyOAaEYvqsyRid3oWkip1Y/WaRHkEQC?=
 =?us-ascii?Q?ynDCg/CCBdHQF9Fi6m/snwnb7n+EOb//Mk7k4Ddn+cl0zfMqd51Pm7OwDiKc?=
 =?us-ascii?Q?IPMxOo+26gUuuT1qaN1aDCaksAO0kSk/8NvzH7b3o9tYjdVJN1w1AauR4PRM?=
 =?us-ascii?Q?bzQ5PdrqXbrTNz6G0E2Yovr5OtUzbBk0CcIZu9o+ehh9QfMnOPt6je16yAAx?=
 =?us-ascii?Q?fukLre2zQMuWu3jbvpGd4Ya+7rjeTz+cieLT7xMDRAAkhLXTzzCiYwmi1ncr?=
 =?us-ascii?Q?7cYIJOS5k4sWeFxRafh6gwCGAId64hjecECtHwpaj1jvaj2kUoWgLkwmVrtB?=
 =?us-ascii?Q?evvYjIabO6BOTwUhgzrVuCkxQ/GvJABaggNXSbnDD/xJbohvNAgH2LmyDvOA?=
 =?us-ascii?Q?K3z7A8xOnP1LLMAzgjDxUuY85VX6jM95c0h3YfuKZ/cdp3ULMwsWURIWTT07?=
 =?us-ascii?Q?IKIhOMCjLbRXMAY8JoVprV7YrKht0SyJ996ako9+NKE13Tqx9yKyUPJEjy2I?=
 =?us-ascii?Q?hp5Cc8IFdqNoInJkcMOZSJenZ6Ik3mpupyPD46maY+aDRveumT4eTFxqQc+g?=
 =?us-ascii?Q?RCGQCKBAtqYoyhX4dJLafgE/mv26Ydx+uD5sx06SfEQVKAtaNtPBssY/WnvF?=
 =?us-ascii?Q?4IeYulz8QP917kuEHbXCYBl1rrTAWLtEh0F/fqq7ULIRTn7HlwrALL+yIZfB?=
 =?us-ascii?Q?ayigpK5eHsIxrAdY0Hbqq3SV4j7ZNvSthsyUVrVHpM6kWFleh4dXCByQ8mnx?=
 =?us-ascii?Q?2Wz8taCbbKnkfGO3CWMk4TJfblwQ6e01T9ljoqKTAafW5BZlPchmO6ipdd97?=
 =?us-ascii?Q?mRwwccqe8XOcJO3Ig3yWmtAHcmgukcOP?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe3b9146-627f-4609-2ece-08dee97a1462
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 11:52:47.5175
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB11373

Implement blink_set() to enable hardware-accelerated blinking via the
timer trigger. The LED1202 pattern engine is used to produce a two-step
sequence: full brightness for delay_on, off for delay_off, repeating
indefinitely.

Requested delays are clamped to the hardware maximum before rounding up
to the nearest 22ms step, then clamped again to the full hardware range
[22ms, 5610ms]. The pre-clamp prevents integer overflow in roundup() for
extreme input values near ULONG_MAX. A zero delay is replaced with the
default of 500ms independently for each of delay_on and delay_off.

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
 drivers/leds/leds-st1202.c | 84 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
index 168df5ecf27b..3600409d4bc2 100644
--- a/drivers/leds/leds-st1202.c
+++ b/drivers/leds/leds-st1202.c
@@ -15,6 +15,7 @@
 #include <linux/slab.h>
 #include <linux/string.h>
 
+#define ST1202_BLINK_DEFAULT_DELAY         500
 #define ST1202_CHAN_DISABLE_ALL            0x00
 #define ST1202_CHAN_ENABLE_HIGH            0x03
 #define ST1202_CHAN_ENABLE_LOW             0x02
@@ -275,6 +276,88 @@ static int st1202_led_pattern_set(struct led_classdev *ldev,
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
+	on = min_t(unsigned long, on, ST1202_MILLIS_PATTERN_DUR_MAX);
+	off = min_t(unsigned long, off, ST1202_MILLIS_PATTERN_DUR_MAX);
+	on = roundup(on, ST1202_MILLIS_PATTERN_DUR_MIN);
+	off = roundup(off, ST1202_MILLIS_PATTERN_DUR_MIN);
+	on = clamp_val(on, ST1202_MILLIS_PATTERN_DUR_MIN, ST1202_MILLIS_PATTERN_DUR_MAX);
+	off = clamp_val(off, ST1202_MILLIS_PATTERN_DUR_MIN, ST1202_MILLIS_PATTERN_DUR_MAX);
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
@@ -301,6 +384,7 @@ static int st1202_dt_init(struct st1202_chip *chip)
 		led->led_cdev.pattern_set = st1202_led_pattern_set;
 		led->led_cdev.pattern_clear = st1202_led_pattern_clear;
 		led->led_cdev.default_trigger = "pattern";
+		led->led_cdev.blink_set = st1202_blink_set;
 		led->led_cdev.brightness_set = st1202_brightness_set;
 		led->led_cdev.brightness_get = st1202_brightness_get;
 	}
-- 
2.55.0

