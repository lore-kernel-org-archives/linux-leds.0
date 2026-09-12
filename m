Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazolkn19011026.outbound.protection.outlook.com [52.103.39.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B149233ADB9;
	Sat, 12 Sep 2026 22:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.39.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789252388; cv=fail; b=q2P2TRu43+mv/kZko9mkEE6yoru9ZXTaGwCRS8imNiC67ZiPq/w7xtdv/LKqnT0AVO1SVZ/8WmcjhYQTiJ6hE7/A3R+2bu/wU1hZGxEaUpkTJyuiMqCuc8SZHE6F/ZS6GScG2DjiA20ono1qXJy6QEy6MDElB3bZxwEC8La3wwI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789252388; c=relaxed/simple;
	bh=yl9jpMtflPWbE6EywVZeL0I/mWtV0iHpsb87atVQs5Q=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aAjE5HtvpEcluSIWz6iXHhj+g5YQbcsoSef/2nuwK9PxlzvjGsvd6UJW9wTX1j+yxqsRpJH7DmP/azlPE9uBOTZKlNbF2AJJ+GefvLFjmh2Dx6Dkoz6lcKLYRQzwlke8MnVQmcZMCeIgM9pBoaj+kVwO4L58nj3LikU0elytvD4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=NAH9Pe60; arc=fail smtp.client-ip=52.103.39.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="NAH9Pe60"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pCDl0v/1gmMiV/Buu0rHbOW04+B4HiiOQwnAAye1HqX8ZVaGvyyW1NExGTHebf29Afb7/hiP0FHq7tzbPjS4wQXxhLA9hmdd5xYFxACk/GjmOxtgCHjbRl5dAh25dDYr4g+ZIK2KmmnsH+H7DMVP7j6uwMMMA4R+6hg+A8HHTYzsNT/+hBvuITl0i8wRMdVFqahWoJo4Ln2PDYHuxh6w6Rn8Jt4p4X4HXFluoOk/tq92AvjHeQedZAYO/4bFIKX4eMPZrE/RbdY5Xx1dnTYHVPXsHAl0gPQDn/iBgOBf+r4ArcBImIGi4fy/2RZI20jxKRk/a55oeWTsdGr6Ii50zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ITHLtabHshxbNyzkWb6lZkx9oPqEr3SYHDJB53rdpc4=;
 b=qhx4jsvLAgdzqMNPeW02NT9KwfMO1LiGQ/LwsYICLYT3edUHMWyj2H8dcf9UEpd/7I3FkEH4Vv/Oc0DjWFqSS7eK/iEi1HHYME2JhuzJsIpd7FopII0DU7yi16E40DKKNDIHKNRzvwePfUvL9AgRGOye40vS8oqOrfcjvS1u0Hb0FSHUF2eeuz3ptAqvSOC9tC8mV59qQl10y8Lr77yD2RKD2Rf4jrEyONRhAcQ7i+YiCMPmDGZxyKg0/1dL1ScTxTNZEjGZbFlf5gScSymfwisaGr8tC8yiZp5b/WBxbEeT7mewtntWGH1/ekYIxgn2mXpDs9r2B/74odcn36p/Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ITHLtabHshxbNyzkWb6lZkx9oPqEr3SYHDJB53rdpc4=;
 b=NAH9Pe60Lv49gOUojE4Vnyr4WGM1IB2SoiVfMJv/pvJU3a1yDgrmW6pu1wG+TkKhO8mnv62VWjJnyKkc+pB86c9pFO54UZyftoltSc4H63fiDs6ktTHadlFXa9iCwyAjot+3vzW2m80yRhdLA6ZSIKwWQDDRpE3ED2K7L1cRLCa9wzdhkFC3Q1/f5nFPfobHdpJHBChVE/v7kOZbeqoMcV3Ibwxu84nSRNyeTPMt3WSRWGAGopzo6asEX9Tt1g9cCN/zJi0AraHuV5jiCMWtzKXMl5BTSYlMaGZ0Z/fuYSdi1Am5rtBStAvf2A3w51ONNtsF8bAnUS5UK906WTf3Dw==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by GVXPR08MB11096.eurprd08.prod.outlook.com (2603:10a6:150:1ff::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Sat, 12 Sep
 2026 22:33:03 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0428.004; Sat, 12 Sep 2026
 22:33:03 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 04/11] leds: st1202: Use u8 consistently for 8-bit values
Date: Sat, 12 Sep 2026 23:32:51 +0100
Message-ID:
 <GV1PR08MB849700619434BC1FA0CCD8EFC5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <GV1PR08MB8497422B7A44424C4968AEC1C5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497422B7A44424C4968AEC1C5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com>
Reply-To: fombuena@outlook.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO6P265CA0019.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ff::10) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <20260912223251.3073928-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|GVXPR08MB11096:EE_
X-MS-Office365-Filtering-Correlation-Id: 6814fa55-08aa-4853-011b-08df111dcefe
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|41001999006|15080799012|5072599009|23021999003|25010399006|51005399006|8060799015|19110799012|24021099003|37011999003|440099028|3412199025|40105399003|2607281247196008;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZidEzlh2v0frUTk6D9bj0+thZCmd9fXcUotHCl1XH15byPhzpJHXz2PzjrK+?=
 =?us-ascii?Q?gPRZU/oe8sLAv3M/dDAROhF9U2S/BvieDyJ9U4+yYFPeUaY2Iek86B5SVWZD?=
 =?us-ascii?Q?vrg2cpO2TNFmULdyZRQyO/kNwQG+lyQgBjBnR7FfP63xqpseiFd02dQMgFY1?=
 =?us-ascii?Q?6IlU6uUZzbRgcU7LhJMOBXLBZcRH0GBQrnchFJx420Mwk/ZMC2sVWt3K6F0X?=
 =?us-ascii?Q?BLGsWCzigoOCvQQuBCdR8t2ZMjfYdpPPGwtJXURQ1QZRSMyPXh/VeeTQkjQq?=
 =?us-ascii?Q?ijG8wCIEnPUBnC6TiI8HctqybYhZM5BXHs3YsbZEf7yk2qhMeh1H/0bRBO/j?=
 =?us-ascii?Q?O493GLJzjYOK1Sl4mxDbXyOUXUTp7FvAYJSarVhYZpOqi/czAYobP8iQdahF?=
 =?us-ascii?Q?tgSCxT6Zxotx0vRKn7f50jdSh0SxhRA7Gmc9CJRoIHl/kM2iXRzHfj0nTB4d?=
 =?us-ascii?Q?Wv2YyQHXLYz3amamV2YINg5A5BgoH78sL6VPpi8BBtkSYdyuWsORF+D5BHiR?=
 =?us-ascii?Q?kULdYGF5dzF15XhWWjQ5RAMlniIq4/Cqlmxrwos4PvEs35jZGrd81f465TUI?=
 =?us-ascii?Q?hdvmDFk9QR0KOFWpLYcN+C/CoXJeH0uPkz7R5z4eXDiqkcxMjjHuHVbWPgds?=
 =?us-ascii?Q?cutVhIZZn94OyppH4FvRFPKPJHun4sxOzpYJ/qS32zqfjV9xNoq5IvB/lB7d?=
 =?us-ascii?Q?aJOM76+9QrUjOMUNGvyDTTqpAmK0cgc1jGbxuVsGFGyibI9pGsKq2tJVSth6?=
 =?us-ascii?Q?vSk7HxBN63Df4u0ngaJdGsPaDIYn69RjUWy02W6sas5nA0tVPKo4041794r6?=
 =?us-ascii?Q?iDUTYhjLchHlAY/sJseHlTP4wpCK/FW4fS21FIPHDjm+xcTU2RsBB5ubTeCY?=
 =?us-ascii?Q?CQV91ov4z2hetmdLDFd+w/+Y3nvzyIO4ogFicJU7oDlbB36rAAaELUd2oRhR?=
 =?us-ascii?Q?4+Zzu3rUqTAHuKVLsY2OYcR5cmcFyXdlMu1eRVUGuGzmU0cGFqUh4Esfl4lA?=
 =?us-ascii?Q?eig3?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZmpmMOC7JCSVKju39dT7HfRR7Mp+BawI6FmETR/JiDNp/f/fwg6W4FESAVZq?=
 =?us-ascii?Q?Mj6yyU3DRQ+eeiw1IWhpD/WYYRBpYPAejf+lVMdscvjJiAXKyiLu0k6H1FxU?=
 =?us-ascii?Q?zwnfC5vyO3j/ny4aubPnVRkJiVQ5B6Pl0IAjK8UATnpYPQk1NC8cPxYhVEb7?=
 =?us-ascii?Q?oKiJfcew+SWyhuW8T9IbgLlJm7W51ACjnn9zG24TsdSI7CMhi7vt8Dd6J7xJ?=
 =?us-ascii?Q?EYMNneYeZ5rFNp7bOKCzxffH05Y7tzC0MXMa0+KLoQ+p7mUfzyiMsgfNJwDf?=
 =?us-ascii?Q?A6Nhbx2KKt2kMtj8OcoBqHLUoch6o3zGZQlIxuTmvIcY3bOxg3wunkOojOvL?=
 =?us-ascii?Q?BwChoaEkL9QX/TPDJFnoU62rsYGOV0npy/0mfaY0twi1hNOSwcSilwLvKNYW?=
 =?us-ascii?Q?fPyenmrBX1VPVC6RTqoJQOyRNYZNApk1QNG9An/h5qffofktYKYPOOhvqBUY?=
 =?us-ascii?Q?RQzVAB2iQPWKG9EznLmBx0DJhN+9Kk3BXdrdt8ygQbVHEE5v0xJjj7fm042G?=
 =?us-ascii?Q?7BHnG3F1Xy6A5PzJL6RHBtNu+8i0IR9F/GS+HHRETNI1jNVDmE7E8mtwte6O?=
 =?us-ascii?Q?wA8qTm87Wc2T6ujloS5mb6aKRBc42u2Rkzh/rJ1Lc9oxOHu4y4/zg3FzgyOw?=
 =?us-ascii?Q?CaSU8oKQYmJWQPq5lGcJtL4G6qO+WC1c0XwGA2tF+dixc73spdG26/7Y8uRO?=
 =?us-ascii?Q?0ifIQVT+jZXzJr5fIRAw3nkGGpqTwOhTnEMHIuInydtTrud21g9ulEJ3hHdn?=
 =?us-ascii?Q?hvRDHIK4UhvSL6DZOYcxrSqGiXEBcsvA1y74bPusA4TbZSJiRUUChVsxWT2c?=
 =?us-ascii?Q?gcwKIiEvpPi0CC5+9qAW1jzvyXMg36FmAlypXzBJkGAVHf+xyOCHtoImYGO9?=
 =?us-ascii?Q?4KHOdxSF4dF9K8TDh+z8XJ4Xf58GgXglNXq7EkxtGiLX7clDg/XG/ePJYQd3?=
 =?us-ascii?Q?7RngJWSeijeYHu3SQHFDETc7J9LJwfXaoThjc1sZFGkBjBg2qvnbm5hMNIWp?=
 =?us-ascii?Q?A5wir6ebJPbmJR/+Oc9KkxKgbtPU/pHchK2kdhTsIhW98eSj6a3r7N0BJ6ey?=
 =?us-ascii?Q?zbP5IIqVTe4DkL2kXSfO6wxxtOxWL8kSH+pR4UGFQZ5XHfwAijlk8EAnPqAp?=
 =?us-ascii?Q?PVJYzMKC3yRY6jB8wRrroM+35GSRl8Zl4sodaXNFSYcjqz3ioGy7jBQZjUQ1?=
 =?us-ascii?Q?7+dfBl5h6efmvTrU4gnohFL9z9RkhvEdvzgcIov1KCVjpXIf51fe4K7eSTVY?=
 =?us-ascii?Q?wZNZ/K1aV+q8CDYkB00ufQW0R0QtmGEioqrRfvMt+xN19ev29Rq3WZ3l8BVH?=
 =?us-ascii?Q?rqVWxwVMTT9yOieJMqjgEzJkEP8lPCgokw/znDKiamQcr2rcpqDqAIAJz8dH?=
 =?us-ascii?Q?F9aXlsEdyCivn6Bg5s+ln765IuH11XaJtWWq9XTueYflzPW1pBQv2GaDg3ha?=
 =?us-ascii?Q?oV6Nl97ZSoCKmZM7v5qO0UIJOSjEXEP6?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6814fa55-08aa-4853-011b-08df111dcefe
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2026 22:33:03.6965
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB11096

The driver spells 8-bit unsigned values both as uint8_t and as u8, a
mix present since the driver was added. The register helpers and the
prescaler conversion use uint8_t, while the rest of the driver uses u8,
which is also the preferred type in kernel code.

Convert the remaining uint8_t uses to u8.

No functional change.

Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
Assisted-by: LLM
---
 drivers/leds/leds-st1202.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
index ddb8c6027706..90f69ac16714 100644
--- a/drivers/leds/leds-st1202.c
+++ b/drivers/leds/leds-st1202.c
@@ -59,7 +59,7 @@ static struct st1202_led *cdev_to_st1202_led(struct led_classdev *cdev)
 	return container_of(cdev, struct st1202_led, led_cdev);
 }
 
-static int st1202_read_reg(struct st1202_chip *chip, int reg, uint8_t *val)
+static int st1202_read_reg(struct st1202_chip *chip, int reg, u8 *val)
 {
 	struct device *dev = &chip->client->dev;
 	int ret;
@@ -70,11 +70,11 @@ static int st1202_read_reg(struct st1202_chip *chip, int reg, uint8_t *val)
 		return ret;
 	}
 
-	*val = (uint8_t)ret;
+	*val = (u8)ret;
 	return 0;
 }
 
-static int st1202_write_reg(struct st1202_chip *chip, int reg, uint8_t val)
+static int st1202_write_reg(struct st1202_chip *chip, int reg, u8 val)
 {
 	struct device *dev = &chip->client->dev;
 	int ret;
@@ -86,7 +86,7 @@ static int st1202_write_reg(struct st1202_chip *chip, int reg, uint8_t val)
 	return ret;
 }
 
-static uint8_t st1202_milliseconds_to_prescaler(unsigned int value)
+static u8 st1202_milliseconds_to_prescaler(unsigned int value)
 {
 	return value / ST1202_MILLIS_PATTERN_DUR_MIN;
 }
-- 
2.55.0

