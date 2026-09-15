Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazolkn19013079.outbound.protection.outlook.com [52.103.51.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549153939CE;
	Tue, 15 Sep 2026 12:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.51.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789476519; cv=fail; b=a4YbUL+tUTnVX7iybMDBb+fONd5FiUMlVYFBJ3VqZkMZueoC3O5zgY9hjXhbfybMO5/Ka44B4TzeN2RLNoYxmajaZhOCH1b5wiWg8XdbC+dCXI3X4L3kt4DKuX4iXWCIhRhi+jqW4jf/lwf3k4QZ28DdgRtGihcSMBzno3umAmk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789476519; c=relaxed/simple;
	bh=bBQ6B31Mo3iOh7l5n1b/8jEVx3wqfV4nSeAWG8rBxaE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ib0auiH+emjOGYiK4gFq6nPFF9Y3Agx5IUNsI5jpFKVzVE/Ne2OlxxHBKvjcheQkUWWZ3OsUuWsnVJ4/x3umL0wjmI/ftVu23vZZPDM5k5HYRlStd7tqx04ZrAKjMDX3QPEQE7bIfV7ZnIsYGyBqsrYQYLkAbyel21x3emVvL0c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=HiMuy6xw; arc=fail smtp.client-ip=52.103.51.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="HiMuy6xw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rJAmKgCwTjIrbbGnlsHtyuYC1MuGwo9Ku3jNkPIVefpDGagdwJMpDVKEkuDZuAd9y7sDFpaMBNVxovZIQnFLUcPD1yyL7bO3GQm74r78I97OnJkld0ESNT7I2hi0PpZHX6Xvuh1sn2FrZ3jE5JCQUgT86usYiDACQ4EENAQr6js+I33EsyLInHlOqRPwCOj6/yv8TLcXTpxtPmNEzuzArmY3HBr02G5ctrTBVGtha9Wiu06lPmY41qhulrnrBQuGhirmCoh7jbvnRbHZUUFOLQeLr341X7laHwoyLEyRWeCZaLot9vqc5A0Pk876Cb6IwdUgKnRvI5J3xn176tozXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q1QFc7hN+tRLQIHWxcAa5FIcntZX0vBPQ7VcxpkD3JM=;
 b=nzDMqGwCjwT32rGhl6peUD49adBNycZDTGn68JmBZJJmGjlKIqKqVoHmYWme0giTxUplQ/AQw8pH6fk0+rwWxcHRuYkIK+J8PU94x5G90U1VCdh3WEctZauS+KvZmsInRUkCEukJ+sP2PAWRWq5WT+bEOWXxwNBE4al3CAtEchF6hRY1JOJol2EGYprD2Pgvh2M2uBTV5jgBJWf6PtoFdvqrt/5XXOIQ6SvzOD+Sp8p3oSwgcUN4lzgdkm7k/jOvOhoTVAQJkjhZXlK2BxAekqufFQ4NStom10S+vR/1ONzZE53Bs5qOLkqWkqiofsd+a5fDBj/OqPDLUfGH5gRPiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q1QFc7hN+tRLQIHWxcAa5FIcntZX0vBPQ7VcxpkD3JM=;
 b=HiMuy6xw4D0xSx3Sr7OUe9pnWBxaF2Ec5GBZXNwJFPX+m1bCoPZfLbGBLeg+sN5+ZERcZDA344mz0gPMYPdXkA/gVQ5ppTSqd+Ha0xCj2AvQ1F+6mzEEft9agecJwK25uDUFlGHoYksVpvpF6bkkDUUQ/55TJwwibjof2e8keMsJZZxXlDE2lg+eGZ9wNEU3q3vfMeMvAcQerkC/fyzaK9bG18OP7mbhXr7Q2wD0Sb7pj3Sz3TWO70rXUdFV380BNuuJUPAUAgY2DYpHFJOZpYaXmMLOxF32R2F5b/zAraTmOzzpOiOYm22VH/38Zth/W5XF96sgy/uMHQO9IaroAA==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by DU2PR08MB10106.eurprd08.prod.outlook.com (2603:10a6:10:46d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.8; Tue, 15 Sep
 2026 12:48:35 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0428.004; Tue, 15 Sep 2026
 12:48:35 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 12/13] leds: st1202: Cap the channel current in st1202_led_set()
Date: Tue, 15 Sep 2026 13:48:22 +0100
Message-ID:
 <GV1PR08MB8497C60D1D2921DD0384926FC5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <GV1PR08MB8497668D389D43F680D2CE3CC5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497668D389D43F680D2CE3CC5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
Reply-To: fombuena@outlook.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0003.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::8) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <20260915124822.3399868-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|DU2PR08MB10106:EE_
X-MS-Office365-Filtering-Correlation-Id: dbab6833-de3f-48e3-537d-08df1327a78d
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|24021099003|16051099003|41001999006|15080799012|25010399006|23021999003|37011999003|19110799012|51005399006|8060799015|440099028|3412199025|40105399003|2607281247196008;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XNxL8Dvus9OfMs4sIa5I2nsv0x7i0Tqj0rKfP+0vruXpG6/LFTnCFK8CjXEl?=
 =?us-ascii?Q?6rqR7yBstUwxedr+kAjlzEXiWk8a9RnYvS+LsMVGVErXEMclF3ALP5qdDctv?=
 =?us-ascii?Q?UvmiKXT3f4HOqJOpPpeqPNvOA/RXws/GqdDGK02XEzen/q5xd2hX+Q8sAiHS?=
 =?us-ascii?Q?ZZP560xH8qPMpXgOE9EWcgu8RV9vg8QPg9F8GWa0TvPwnudG7zP/l5GcvUeh?=
 =?us-ascii?Q?k7bALpVIKckilD2+GAZczBdIFlRu0f72Zy/EOPbG8Za0CTd/TNfncCwDOcJD?=
 =?us-ascii?Q?uub+v6aG5xwkW10JW7Vvc8xDCR9Zu8Ym+O/VTIpNW7p5YzONM21A9FNh091b?=
 =?us-ascii?Q?/INqLmaBUfSE572PvOeCWsg8DpmjIL2oEw/z9jaF7TMFCEmTXSXxSicprWbk?=
 =?us-ascii?Q?JGxdvCW+E0HAbvmVbk/sLTa62FogpdwZv9eM08em3hyzFBUyH6zWtjMEiiAj?=
 =?us-ascii?Q?IMC45GABcUUKygHwNCREmEJ8oXYplSVVgUCZrBcbt4gqYLFV6naHbc98oNjq?=
 =?us-ascii?Q?jZAijzVhrR5PXYVgeojR42Pyw4uMoxZgv0GamNNfYMGISvGdsL8ZnQ56X5mC?=
 =?us-ascii?Q?aEtYNjRA0FTn26kkO3QqTxxNuOv9Vw2kBFpsoKsZklm/alDEFtjHhRbINd+T?=
 =?us-ascii?Q?XXc01YCBBMQnGN6+X5zJYpUAFGlXzjQbrlEuvdiBOCOTBBq5CZkMHZE9DjRy?=
 =?us-ascii?Q?fj23QuD7KqIRHidQ3LlYUkehcfpoqiL7TMmFJYzDBu6C8uvPkLL3nYmnSN9D?=
 =?us-ascii?Q?aaL3N+STevd8rf0OFNxgk4xO+N4VOPSExhG+SOzGhPBZ6G5I3M0RlO0vMb64?=
 =?us-ascii?Q?9yQS8H4ZvSbNXRs9KXbB5etBIA9efrLT0Ba8BQEpk+IZijV8tVubPeyJk5Y0?=
 =?us-ascii?Q?RMBO8cuWNMOlACdDzK6OOTbPy4rwh8cuzd7IIcLvcOh4rlTU+NUHRP857HH+?=
 =?us-ascii?Q?NM4yCoZnQ2RszP83gROq72swdNGu+0JWN2W1fbFRggs52l5Wuq9qZitLrdGw?=
 =?us-ascii?Q?N7MDrJYNDsroEDklKzMcdt0VEA3MqhN3MDc2mB9CAByWHjw=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WWgwRb2jIYUyJTwujbwY6j4MNpxDqZ42Qsd4IqLtXWz0xzGR7gHFs/ybYL6p?=
 =?us-ascii?Q?Rmt9a1YbEP2WbPMwq18CTITIeHkq+URoXHKoxeclDS8GEB+0LZ5fBhrxHYBU?=
 =?us-ascii?Q?rT2p1f2v0gBuE9orDoLTmk4uHoTr0pp2f75xPssRj8sLnJUB/lO4iljgkKyk?=
 =?us-ascii?Q?pDNYRacCgkJvElS4kPRsPfkccM9eVwPFCj7Td+K61cDt6BxxFiWeMCf4sOgD?=
 =?us-ascii?Q?tsP69CH77sfv1wehaNvHf5fOlSeSNgPNb1v4ubIOOxNrJTHNp1QSapSqR8bI?=
 =?us-ascii?Q?L5aljknKUvDLk2ZvwjvIuFA9xxCjONX525Fekp521zVL7ZnYuiOZnCEdae6w?=
 =?us-ascii?Q?YYf7wSZRw3AroudAp5yG1698RNwLGCwLLf8DU0fb6dVjvx3ktY8wSXE6YUlL?=
 =?us-ascii?Q?d6hS0iu+csLhh5NoPAa0A7OVN7ZE1RDyTdjUevipF14FhRx3UTBzJAoyS0Gp?=
 =?us-ascii?Q?gXxid2+/YK3b52m4TFpJ77pbzlXYRJkgl6WVUo4oGD1S7QzAJBH7SE4EzCst?=
 =?us-ascii?Q?cl0aVQnqWUO8o/jyqHaBtN7fwPnD67TfMqpqqkIuMM+5+rRfh1+rssQ74/Nh?=
 =?us-ascii?Q?Zm3x4fxaAOxxQANxvL65VxTDYPwWV7odqh6w/g9IvOP1Vd+mDFPJcT1wUmgG?=
 =?us-ascii?Q?N1dpNAEDSIxS2YwJFRcyWcMbw2mCEwvQMh4fBK68MLU3T0J9BFND4Np7o+2j?=
 =?us-ascii?Q?rNVMDTT4RYsjiNP/8dvJtvsJqvQgVjdjeR5PTwfVzyCtvWeqBzpyDzZbQRNf?=
 =?us-ascii?Q?OiVDZC00Xlktv6YgZ9cZJoKAjVLm0rnXgnp7HEk01a9s4lWcwQaOyQ5FFqst?=
 =?us-ascii?Q?TWNKEO2NOg9ZQpbH3vbqCS7IKhfIcRbMziZcXsxBRhdsrqQUQgnXtD17QhsI?=
 =?us-ascii?Q?nmd+5cvcPqr/OtQnAmt2bGz3WulOwMpaEzio4AnjHMqAb2U1YkFFgouPhhGv?=
 =?us-ascii?Q?H8SHSMEjimbvmAaTsqGLiQtOA16Xd5Zdnbh3AAKnm8FBHC28quZb39xIsyur?=
 =?us-ascii?Q?bsCBfS2er8le/yFaCenrUquuazjX73DW81N80hCjsF4UcgNwbNhiv4MWd4AK?=
 =?us-ascii?Q?SySEXeBcWSqf+1gbhI6vNAQm/28jP9JPnfAdnq81sTY4lYM/YuteBgChXxFc?=
 =?us-ascii?Q?MszGJ94Hbk841ABTxvn/jGZBUjifMDzCZV7LvELa0Bw7k1MVkoF/6eRw/X2O?=
 =?us-ascii?Q?ik9pcMadN3CBUvyg6R3PrOxT/P2SwBHvkLQlPAJSzy2gzMj6rAWlPuN7XRIr?=
 =?us-ascii?Q?lX1gAb4SCvijwxxS2fKnFr4g5OpioYYrmYNQh/C0mcfWm9msRVJK3VAiYGDn?=
 =?us-ascii?Q?0JJJpXXIHAluumX2/DsDNK45uN5CsURMPJJ4VIropzSewgxly/ml89e6egu9?=
 =?us-ascii?Q?QTM6oAf9o2D0nxJGqA7p9L9TPG8fKuMDYslqEXaGva181eBofWyP97OXT0y5?=
 =?us-ascii?Q?xcvek5V8eotnwc3cI/M0FnkAaTBQHnzb?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbab6833-de3f-48e3-537d-08df1327a78d
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 12:48:35.0031
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10106

st1202_led_set() writes the requested brightness straight into the 8-bit
channel current register. The LED core limits brightness to
max_brightness, which comes from the device tree max-brightness property
and has no upper bound, so on a board declaring more than 255 a
brightness of 256 reaches the register as 0 and turns the LED off, and
larger values wrap around.

Cap the value at U8_MAX, the width of the register, so anything above it
drives the channel at full current. The pattern and blink paths already
cap the current they program the same way.

Fixes: 259230378c65 ("leds: Add LED1202 I2C driver")
Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
Assisted-by: LLM
---
 drivers/leds/leds-st1202.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
index 39129206b78d..5e4a8b80cfe4 100644
--- a/drivers/leds/leds-st1202.c
+++ b/drivers/leds/leds-st1202.c
@@ -207,7 +207,8 @@ static int st1202_led_set(struct led_classdev *ldev, enum led_brightness value)
 			return ret;
 	}
 
-	ret = st1202_write_reg(chip, ST1202_ILED_REG0 + led->led_num, value);
+	ret = st1202_write_reg(chip, ST1202_ILED_REG0 + led->led_num,
+				min_t(unsigned int, value, U8_MAX));
 	if (ret)
 		return ret;
 
-- 
2.55.0

