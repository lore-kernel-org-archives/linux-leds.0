Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazolkn19011035.outbound.protection.outlook.com [52.103.39.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F30828B4FA;
	Sat, 12 Sep 2026 22:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.39.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789252469; cv=fail; b=G6Ec8YpblvDW+HMOhw+F/TxzHIY/g2tj3DOAbVAI9nwmVjT33PhSpdnMmGXuhxojhobNeMp2uE74uc671AKR0BNhzqwZobgZHY5g4s2IOcbfOEE+ExCsLCpxnv3K8giXEa3zMf6B/UVPfgqB/elJZwT+qnQe42p9efQq4WZPEXE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789252469; c=relaxed/simple;
	bh=v4ClrePgnyHRKcPuNTIvfwzj/Vh4CZ95YHrwEdXDUN4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uPMvoDxOLsgGKvPLe50ZKeBSTvkHyB1TSR8mccQg6eqP7vbr5Sab/2nm38wJ5xHh6OrGlJwBIFY+bKWXzEkgBUzbFnkMqc3CuTdpYRGet8SNkc8GYSrDWRYweTu8N4pNetn1q4Fc+unNs3tyRdYmuk0IU2jb4VCenBU/5ODem+o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=Zzs2jNHy; arc=fail smtp.client-ip=52.103.39.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="Zzs2jNHy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=svHfFgrJPoR+RxBVFeb8PXPsyzB0jn2WIIhIk5j8n54fThhSvupcMdHCQURQjmdkIey3cBJfR2PFPFrDiP2A+KanI9M6/H1tJwu5G2OOjiJBsQhhr1YlkmuKXPyLq63BAgktFrFe1iPqIs84FymRJz/RqJ/70Q25Qxn2QD1YtS8G8jcI9/ey2cwyF1qaZNpILbCvyBqS8guzVauy8Ci4SU/BzdxsiQLtcn2/zXJxI610cXf7Z1ZoC4/l8WvMNwXXszmWbe3gQpCUIKmZZTLRv7U8cmbXhYdsSt8K6056oeEZ5wOzuQURodPdibHOKd+PS/4UR+ujkFUq2DJeCSkMGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IHGIiTpWVgiuUzFiPyhzVBKPJ8by3MOquVEM/ciSIr8=;
 b=o5iq05ce060qbi7g+rv/EYiya9Gqguqs8JdVbwYPPE/TfqnaczjdXnWAVT8b9is3aSoza98ODLSxy4SkGtBVGhy2JH0D7fu35mwg9VzlTDIRksctoXhRboae53NiYlVM/y1elCDzi2f7E0KjTbq9ZijE5ZPaOwcrnGWPiUpeDAZRRxCgFTxuRcNvwaHFl4TjxX39hPIeUZxhsD4dhsXNY77w8wCmESI6vEELx5uJszZP4sGwQoBUOYXQCUHyn6CKFEHCpa8GBXMAzo/1Kjw+vBeYdLcBS31sMp1nZUcve/JZlmg6hrHjQJ/+VE6aNX6vrJOxbE6F8nuKrf17+rbjlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IHGIiTpWVgiuUzFiPyhzVBKPJ8by3MOquVEM/ciSIr8=;
 b=Zzs2jNHyXgHI+4yid4yCudcftJ8yOGFZItLIsd9jsM98dvn8PUljncKwy55C3UcP+W8gjq9KpNU2VtTXW+6ZPA9bTYt/HO3uJOrLyiNly6OlkegyMmAU6fDXsUsapGI2999f8O+xFaAu+fzms8biButHM3gpYCzkV1rf2SmnZqRjx4EpKZUcSRWIzV3nutoh6D+lSmg2Ps7tdu5mp0c7IlT0aOVK+KhLEhRqelKT2h0+CuqHiRMx65Tm5Ur42NGFa4wipm7PaHI7kl0H0a/TnmjbYaBvgbyyQf96kWfBvs+a+kvzAFg+AnPBTXo+f+JfQG9fH7qlN66adL27g6pjEg==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by GVXPR08MB11096.eurprd08.prod.outlook.com (2603:10a6:150:1ff::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Sat, 12 Sep
 2026 22:34:24 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0428.004; Sat, 12 Sep 2026
 22:34:24 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 05/11] leds: st1202: Clear unused pattern slots in pattern_set()
Date: Sat, 12 Sep 2026 23:34:12 +0100
Message-ID:
 <GV1PR08MB84973A1571DF402225FB78AFC5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <GV1PR08MB8497422B7A44424C4968AEC1C5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497422B7A44424C4968AEC1C5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com>
Reply-To: fombuena@outlook.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0247.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:350::6) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <20260912223412.3081440-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|GVXPR08MB11096:EE_
X-MS-Office365-Filtering-Correlation-Id: d9628930-852b-43a9-ad2e-08df111dff22
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|41001999006|15080799012|5072599009|23021999003|25010399006|51005399006|8060799015|19110799012|24021099003|37011999003|440099028|3412199025|40105399003|2607281247196008;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?83GXDreuQHlqwx3z6AXZiREooavt9gHouJdl1Fw3TEEWaIqUhinSwqgoTA6M?=
 =?us-ascii?Q?8BrHp/LYBpNaTIQWz1XYjhuaFqqE2TARsHrg8XOwXxsftk9V9hw0fwRFIUVj?=
 =?us-ascii?Q?fpcGgsCrcaO8wNOyq0S3UvJ5Hrnt2hXF0o9mQS5d4VfIq6HWzKXsUIAiMX1E?=
 =?us-ascii?Q?IWju+NfZ25XTDtLrT6Z5on03ZbDHBQG7igA8df+CNrxxibCPEYfyqp5Vbsnl?=
 =?us-ascii?Q?WK1Lm3AbV1SxE+pyO8XNzJmTwfPXEeAazEStesuKjN8rjika3NhIb9q/RNPA?=
 =?us-ascii?Q?LAT3OH3hPSLVw1HAgfaPjy6VzVyU63ILjmvTUguxXXYCKz6+9/nVGLae+Y4J?=
 =?us-ascii?Q?o8nW7eTQaFXaLwrD59LAJtb1TVpHGRPPhl5dqD5BVM5kfuG8NxDi4lCBHYaj?=
 =?us-ascii?Q?Cv2ZweQtUxSSM1VYXoaZytvoFeN1BdKZGKMw/BXeEz8a0J5Aie3CyVGrfr7P?=
 =?us-ascii?Q?IIcSVrhDnGijBWe3xCAzFIL7tVOVSQAgOHSTMPtnJfk7XgtW9WqLDXHuzVk2?=
 =?us-ascii?Q?9WMYF7UL9CYPiN4CzZSTDgouE6S45lcFi476YRcSUcPkFEy7zlxRNgEybhn7?=
 =?us-ascii?Q?TS6GlwyoumfsRUz8j6OmP99SpAuA36Z0I9gdo5h0YOIyrsq1nfqice7vk8Pp?=
 =?us-ascii?Q?JynRFTSVe/XrtC0tOPVVeDV5ZTHhcrR6NvNqT9pkx9UwJH/IhExUHdOyqogX?=
 =?us-ascii?Q?7eN/dGIKfn9pxp8mO9JPj1rb4L2/DsDxGXOSSSFm1fEv1HXriM5lwzV0oPIy?=
 =?us-ascii?Q?1qvYX8v1qC3u9zIDZ/UPRvObqim3KF4e9vXOBAc5aSf/C121ibrZ9vYoWacy?=
 =?us-ascii?Q?JQuLD2I6dSdS9iGthl7aGkbNy92DHHerry7wfCoWdoHfePugpmWNKcQsbQR0?=
 =?us-ascii?Q?+t4CF++88W2gn6qzi+TOP7FSymXp84vfEy5VAA7s8DTkptKRO/MCuZOHj0Al?=
 =?us-ascii?Q?EkSHrygzz//EGD7FJBY1GNuqKx9EeOy/9DNU84VauC7IThMna3VciKPz3xrP?=
 =?us-ascii?Q?uE7o?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nvvf+CnzKD23DOwFbza9UTJedvGEpQCv5sPDq1F1+0MxjKO+c/oDreVsaQIu?=
 =?us-ascii?Q?GN5xYwdM7IOG9tc86GCV02QFSFNmLc3WripEaaS41ydj/qnrsz7AU/eFuJrl?=
 =?us-ascii?Q?HitN8QzspgFAlulfEmOiarZZwKx5Mjs4Pi8Ty3p492t7ct45OatNN8GO2Wge?=
 =?us-ascii?Q?j3VJwDbpaGwYu/xeiQzPus6lLGGpQ+hhdBk9FnvgSzAsyEQpLj0i65IS+ZP2?=
 =?us-ascii?Q?pxCx5HhW2Pq8wBDlgt636eNm1KW1btcMTHDsJkYQyMRSc3mPA7wOK4YIuw+y?=
 =?us-ascii?Q?ALqDUrxf0lhOxjOj4SrUwL6z0tPCNeHWTLyW4SSTQM+C7MZoS3HAX+6emD08?=
 =?us-ascii?Q?kTgxyTbM1ELOebBb6mmrQYUX8kuo9E8M/Of+ogPiI1Q66GmovilO/GxN06bL?=
 =?us-ascii?Q?s0QDv/Uha0wMv0KHIYACpqLq9jQ1z7aEp9NsTurv74Un/UBpbzZoYlZ9uN7K?=
 =?us-ascii?Q?PYBBNqqUuLa5I2y7/W876HT7/441NHsBGsLdnQEWJRxpy4ZlOe8q1VOytZ/b?=
 =?us-ascii?Q?YOIG3pUNS8KHIFb69ba9D9F82p3PzSO8kZLRQOZOzXvz8tKk+K7jKk88jKzs?=
 =?us-ascii?Q?UveRFgY18cokuj4gJCT6NUkgs+JGHnWNY9enASbyJq/95TYap6HVE0igWTEp?=
 =?us-ascii?Q?pZ4fbBacK0RFLCxnkaLh9drXi3WmWyTulXuF66yHJdr91f6pb6w6hiZLmYGx?=
 =?us-ascii?Q?Ba1Jo2TzbFrf34RVUxD0yY88G2TSmHzj5gzgeDHR0mtekaGTWHFNnFp7fCF6?=
 =?us-ascii?Q?SaRCc79/bnGqTYiKrXAs0B9g89tNWtacIzVNteStXBy0ia3KMuc0WjuJsKqp?=
 =?us-ascii?Q?S5GYbfJhM1HoPMqR6FB3rxokwnnqHewUaER4Ux5wgDAxDddg37Qw0AsnL6m5?=
 =?us-ascii?Q?8eHZ7xJXIegv6dlSIM47o+s+eq+hMNmlrAqD9Jm72j+SgSPZlSWCeqElowNU?=
 =?us-ascii?Q?nhIGHvB04cjoSlfDGn0jO/A+kQN0ZyPpGUCrtpVZvVhc7YfMrz3jcJI8O0Mi?=
 =?us-ascii?Q?tVGQR/Sw7OvXLbOLQAqTysyG4/8U/UKjPLng0ZIooaGuDMr2phafHOAOck46?=
 =?us-ascii?Q?MaVsSHOhRAbtjDvFK/MvWWK1crUB4u7P+t0ykXQM7T6feuCxm1Arls8F5H8u?=
 =?us-ascii?Q?L1van12x6kTGLx1n5DKW62+oYsQhG9DcpIVohOdE6TRjxs5zDuPqZIr3C3Ak?=
 =?us-ascii?Q?pW5nDtLYVFXTbb+TD7QA973Y6epTfvbIqv1zJbj4cAzAgk0jz47YGRLqQ5pv?=
 =?us-ascii?Q?PsXc77P7+lKSFMpJZQQxVIbPQ4+V5vpwBWCcIBcyCe2R040S9VuV/Wc6Qb51?=
 =?us-ascii?Q?uDYnCfQjj6sXB8IO0B6jVWp7OoWHxk+aHMykYci8Xmi/pu3CLNXk3+3p9Q/K?=
 =?us-ascii?Q?5lx4hM1hcZYbw9iK0/U+xp5gQ0mZ5sVJjLWlSZthXWvQvdGDJSD+djMC2vlS?=
 =?us-ascii?Q?uPsq5G6RHmZqlLdQZmpM8HaVY4rOkdIN?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9628930-852b-43a9-ad2e-08df111dff22
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2026 22:34:24.5127
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB11096

The pattern duration registers are chip-wide while the PWM registers are
per-channel, so a channel can end up driven by a sequencer timeline it
never programmed.

st1202_led_pattern_set() programs only the first len slots. The pattern
trigger calls pattern_clear() before pattern_set() only once a channel is
already in PATTERN_TYPE_HW mode, so the first hardware pattern written to
a given channel skips it. If another channel has already programmed a
longer pattern, durations [len, 8) are still set, and this channel's PWM
for those slots is whatever st1202_led_pattern_clear() left at probe.

That used to be LED_OFF, so a channel stayed dark for the slots it had
not programmed itself. Since commit d2ca0e2b6d64 ("leds: st1202: Set all
pattern PWM slots to full after clearing pattern") it is
ST1202_PATTERN_PWM_FULL, so the channel now plays its own steps and then
sits at full brightness for the rest of the sequence.

Zero this channel's PWM for the unused slots so it stays dark for the
remainder of the timeline, as st1202_blink_set() already does for the
channels it is not driving.

The duration registers are deliberately left alone. All twelve channels
share them, so clearing them would truncate a longer pattern still
running elsewhere on the same device. A channel whose pattern is shorter
than the active timeline therefore keeps the longer period; that follows
from having a single hardware sequencer and is not something this can
correct.

Fixes: d2ca0e2b6d64 ("leds: st1202: Set all pattern PWM slots to full after clearing pattern")
Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
Assisted-by: LLM
---
 drivers/leds/leds-st1202.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
index 90f69ac16714..9985b4b60989 100644
--- a/drivers/leds/leds-st1202.c
+++ b/drivers/leds/leds-st1202.c
@@ -263,6 +263,12 @@ static int st1202_led_pattern_set(struct led_classdev *ldev,
 			return ret;
 	}
 
+	for (int pattern = len; pattern < ST1202_MAX_PATTERNS; pattern++) {
+		ret = st1202_pwm_pattern_write(chip, led->led_num, pattern, LED_OFF);
+		if (ret != 0)
+			return ret;
+	}
+
 	ret = st1202_write_reg(chip, ST1202_PATTERN_REP, repeat);
 	if (ret != 0)
 		return ret;
-- 
2.55.0

