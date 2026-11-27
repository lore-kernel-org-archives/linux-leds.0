Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.33
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795787088;
	b=z65r8HXZ2zD9dvnLZreHQFPfd0/Xgpk7wz3p02HYVvjD1qVK6AoGpO1VO0Krbo5WuXLp
	 ZIG28OqxF0/6d3P/BVLzk7HJr5PeMgzj3vfC/X7NMBA/0rjMVy9wh0SdIrNx7MLsyOz7F
	 dBhDvyOHaKWyMS9zp7iTTLoqT+Q9jduIm2Rt5HixyO+dFW5G87HEr4zBkij04I8hEJI3p
	 M+vwhw5HnHOyGoViUce+AgS6Pplms6DX7r5LeFR5kDDiAWp/GCdQPFdEyUp3MwhvR/Aoe
	 GYMs/Lj+rO+Z6KII9qN5Q5X8g6dsSmdzcr8ELCnl0YeQ7QynGJRzyy8i4YN5tKPQ+dA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795787088;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-ID:References:
	 In-Reply-To:To:CC:X-Mailer:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=Xjp7XHWNmYsxshFmf7S2ET+teBq5sMusFhExRAZT7sQ=;
	b=NWsv9aKG4q/pUnJF4j6KFgZbFofZ+Xx6CxRROKG68KjHz12GJ7FixveZHPv+KNgFT63F
	 XMJLE8TFn6Lyj3C6O+HaiQ51Mknf8WVwBgKPIej7lkO4ZMKo16VHsE++EdIhUbXLr2cYL
	 laOId3m+ADHXTIrrwixWGLD4grdejyuKUlcorvwBJZoViRXxhL09FFQJkCF0Ik/E0o1w+
	 GjfJ14LLidQMgKhNMsP+ELflWODmQSyJPOJiiQkRUJyzRWOFHbiC2hDYpw9NDf4xQvzqM
	 JZuPoZxqFyCjarx6sxm6xC8fnCM34asfKvtP1RzyDvKOyQpD0UBKl8hw1BpMsA1rc+g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=axis.com;
	spf=pass smtp.mailfrom=axis.com;
	dkim=pass header.d=axis.com header.i=@axis.com header.a=rsa-sha256 header.s=selector1 header.b=JxM8MpC5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.33
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013033.outbound.protection.outlook.com [52.101.72.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0AE606A31E;
	Fri, 27 Nov 2026 13:44:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE0AE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=axis.com header.i=@axis.com header.a=rsa-sha256 header.s=selector1 header.b=JxM8MpC5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lsp81GvmVMXfAzsHrrj0/Dli/hDXOTkk6IJqvJxuCkIf6iOCUEHQ/g/b0KaRPyGRm2um8nveu7+o9FbFuiN+9AyUsNU70or2NTQG/0aPeJbbnN33H0jGp9rLkmUkbs0k0IZ1cmeGxQIdqxrGjxdvKdJn/1LOJPgEnTl2CPacnvEuTjOgxPoSDZY5shrKsUA8iyDwyCg11IVENjvRvn4aDNkLExfK9OBHLURr4D4fcz9xRiCO5LlBaU8DWod4eM1Hg19GUPgOyaKxZKLm0kT/bzieugfVJJwTptbAxonon2wZiL13iFuIaEbisGJGu0q2FnQtau5nOITum0NfiKtcDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xjp7XHWNmYsxshFmf7S2ET+teBq5sMusFhExRAZT7sQ=;
 b=MbGvhevMiocd00XtNgewTSCH0j2KaMVUNdiGmWjhdAREeiYlAfQX2Q9HUxm987iU5ewT3tsq1b/NFs1JLcTb8n3qYCSAEe/CcV4e6/HyBUFoHYwKxgnR2uDgCx/OazNKYFwGaa8CUgoA9nGeQMaQJjbSTQe8gzMzDRamw9m38IBmKneek/dekNA/LdyPHPB7kqfF6KDUfgG/2mdOYzTxFLteHIVeQqlQtfKBzIzvYBN9yVP2Korax3tfDnXtKOOryrbPZzXArmqKmWK10ZXTeukISFFV8p/XgbzLh5EM/ipa/UsfQinbyQLSwmT3S4hvMxORLW7/jUZlTkDgopK7ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=gmail.com smtp.mailfrom=axis.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=axis.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xjp7XHWNmYsxshFmf7S2ET+teBq5sMusFhExRAZT7sQ=;
 b=JxM8MpC5Pn06JyKffy7l/kU0d3s5+QmR744tOvg2/j9Rhk3QCYdwpshemcxtYQeiV0qOyTFHD3K7bC2QHuwWotsqYe0txWP9/Usma5UL/UmzbPa/cMh9ES0gOe0dFK9oYdYdYHXwDW/eZMxjzbmtaeQ6MpN7dmJkCqP/eWC95gw=
Received: from AM0PR10CA0001.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::11)
 by AM7PR02MB6404.eurprd02.prod.outlook.com (2603:10a6:20b:1c0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Fri, 27 Nov
 2026 13:44:43 +0000
Received: from AM2PEPF00070CF6.eurprd02.prod.outlook.com
 (2603:10a6:208:17c:cafe::74) by AM0PR10CA0001.outlook.office365.com
 (2603:10a6:208:17c::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.9 via Frontend Transport; Fri, 27
 Nov 2026 13:44:43 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM2PEPF00070CF6.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.688.5 via Frontend Transport; Fri, 27 Nov 2026 13:44:43 +0000
Received: from se-mail11w.axis.com (10.20.40.11) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Fri, 27 Nov
 2026 14:44:34 +0100
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Fri, 27 Nov 2026 14:44:34 +0100
Received: from pc63130-2524.se.axis.com (pc63130-2524.se.axis.com [10.92.173.61])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 8DD5E7F1;
	Fri, 27 Nov 2026 14:44:34 +0100 (CET)
Received: by pc63130-2524.se.axis.com (Postfix, from userid 18369)
	id 8AD7B608F504; Fri, 27 Nov 2026 14:44:34 +0100 (CET)
From: Tobias Johansson <tobias.johansson@axis.com>
Date: Fri, 27 Nov 2026 14:43:47 +0100
Subject: [PATCH 1/2] leds: lp50xx: Use an unsigned component index
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261127-leds-lp50xx-bounds-fixes-v1-1-b9f0399d747e@axis.com>
References: <20261127-leds-lp50xx-bounds-fixes-v1-0-b9f0399d747e@axis.com>
In-Reply-To: <20261127-leds-lp50xx-bounds-fixes-v1-0-b9f0399d747e@axis.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, "Jacek
 Anaszewski" <jacek.anaszewski@gmail.com>, Johan Adolfsson
	<johan.adolfsson@axis.com>, Dan Murphy <dmurphy@ti.com>
CC: <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Pavel Machek
	<pavel@ucw.cz>, <kernel@axis.com>, Tobias Johansson
	<tobias.johansson@axis.com>
X-Mailer: b4 0.14.3
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF00070CF6:EE_|AM7PR02MB6404:EE_
X-MS-Office365-Filtering-Correlation-Id: d54883e6-3a37-48f7-5618-08df4c8c97e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|23010399003|82310400026|13003099007|261102123227099003|261021121427099003|10067099003|56012099006|11063799006|261028144727099003|261022075727099003|261021123027099003|261022105027099003|261026140227099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ptxtZRpD0eQAJ4AwCJbyLs5KTa01u/9Hv74Mf/7RDpQhgZXux+0Kw1Q+L6Sj+6YYVbo/brM5t1GxN5FRS7aN1goyhHAIOFr5IrTTopjZ+b/dFODBEN12qJRgdivW6FXfAm+FOAdsP2fzqvSQ67VWYq+q4xqIs1xAWPqD2SkGgm32LUsS0x0WTSR876jxaEGbczRvEZ6ViyDfMvFlgS3NTy28Zx+bqNTtumJ2Q7pSM6vnawIunltniK2YU37rTSTWrw0ygegCKoHRRND9gO4SaxzafocsUnGko7RRJL6KSeC808Jo9N5gw7wVXxpNVHJvFerAoGCqkrf+lfBbKTzARsTJopM570TGz350cK1/TuWlNpFeFjQkHx+iyq8XW6ynPu9WGUFf1IeHV0On795E3fnzRSy9suQmBuOw1WWKnf39qptK1tiGmJOdzsagnVYYTDYURO8m3IezJ9Idmhv62SCASRfQ5f4M1tNmcXvNvlhIYXvt4WjYSwOG4Io17eqaiG0uM/D2IGeSzjcxj9lee37LqYX8pOAJVeKjCuGO7EmeKxdE3ZaPB+Kp0fkdAtYAJmc7XyyHF915pEqjvX03Vhb89HYTNE4e1rEBRFVdvnD3gSL9qIB6b1Qo9y7gQ+B+RDkagJQReqKZMBZ1sV5tSiW28PwxPyqvH5l85DDfqQc=
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(23010399003)(82310400026)(13003099007)(261102123227099003)(261021121427099003)(10067099003)(56012099006)(11063799006)(261028144727099003)(261022075727099003)(261021123027099003)(261022105027099003)(261026140227099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	l/2M+r8BYZueutHOAgz6/GhyDYTRLVEHEJZFDzpFWZ5pZCXqZs9zZB0pVLRE1B6hbkYVAbPxHQayvcTE9gre4otIRaiL8kS2mzxl38OZaqZT9ekVZktvh5MYxrhx+57HHbnyqlWsbbTTWNvtfiQyPGhBvVPR876eiJ8iVNa60zyxHE/mUihWOUFXf0me8/qiieFFCFC5KL/SvKeA1MWHvb9dpzxTlFI/Bgd1CWi+cr7uplA+OdOGTQk5uyIJWdjMv0CQBLOyL5Kj7mU2Ny7pj+oc7Fe9LjgiZ24JCdDsyn9LPylT8VctUX3Ep842FvwdMZ3nn2rztLpjwQXL8HhQ0fQT10VG55IgvzghIkmaLlPbezJ+WiGM7okzpdt0LYWqZ8VESjyCZl9Ee2oIXuN/AhR9KGk/+xUfGdN+SN/jQAzRds/n2SHZiF16/jaYxrPM
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 13:44:43.6959
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d54883e6-3a37-48f7-5618-08df4c8c97e4
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF00070CF6.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR02MB6404

The component reg property is read from a firmware node as a u32, but
multi_index is an int. A malformed firmware description with the high
bit set is interpreted as negative and passes the upper-bound check
against LP50XX_LEDS_PER_MODULE. Using such an index then writes out of
bounds at a negative offset from mc_led_info during probe.

Declare multi_index as u32 to match the property reader and ensure that
the existing bounds check rejects all values outside the allocation.
Update the diagnostic format specifier accordingly.

Reported-by: Lee Jones <lee@kernel.org>
Link: https://lore.kernel.org/all/179442102947.44545.9103121805533352120@kernel.org/
Fixes: 2e84a5e53742 ("leds: leds-lp50xx: Handle reg to get correct multi_index")
Signed-off-by: Tobias Johansson <tobias.johansson@axis.com>
---
 drivers/leds/leds-lp50xx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-lp50xx.c b/drivers/leds/leds-lp50xx.c
index 20bfb315bda1..4d4ad0db96af 100644
--- a/drivers/leds/leds-lp50xx.c
+++ b/drivers/leds/leds-lp50xx.c
@@ -506,7 +506,7 @@ static int lp50xx_probe_dt(struct lp50xx *priv)
 			return -ENOMEM;
 
 		fwnode_for_each_child_node(child, led_node) {
-			int multi_index;
+			u32 multi_index;
 			ret = fwnode_property_read_u32(led_node, "color",
 						       &color_id);
 			if (ret) {
@@ -519,7 +519,7 @@ static int lp50xx_probe_dt(struct lp50xx *priv)
 				dev_err(priv->dev, "reg must be set\n");
 				return -EINVAL;
 			} else if (multi_index >= LP50XX_LEDS_PER_MODULE) {
-				dev_err(priv->dev, "reg %i out of range\n", multi_index);
+				dev_err(priv->dev, "reg %u out of range\n", multi_index);
 				return -EINVAL;
 			}
 

-- 
2.43.0

