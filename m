Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.3
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795161587;
	b=JezqtKABfUe9zwQ6feaxcoGpTt6DIfs2lfnaLHAMjbY7RrMtpbgSwNfQpB1s+JjKaAZV
	 YnrOHpUy177zwCeSQNlSND8IT2zhyW1fNJulxMSYwbQWUmXu/OgolID5tvGBaeR3jzZnC
	 bNVKGv4kREKvcJnTTpWWheqsJCe+dqpyEeKwJbyAtoa81CZPdU+Y9Pe2htsE3TbiE9CZo
	 0p3svaPdF1scQwdlv5TUrW3JKhJVFkenM+JMYK960xjmideZ1i+Zul2Q+CD6e4Zj6dICN
	 v6WpAuxDkk5ZbCfK0X/XWfFvDZlFo49WGEhpUNGI/snagb/9wXRSrqTnrJmAH4I2IPQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795161587;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-OriginalArrivalTime:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:Content-Type:
	 X-MS-Office365-Filtering-Correlation-Id:X-SET-LOWER-SCL-SCANNER:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=wfTwRgCI3ln1VubWkXY6DffclJa28UC+BzfAEXKcohQ=;
	b=CYUuy7PGHGhRqpNjVUyOQlsJm9Q1a4iBoGvU9VkFAwYcpI9LwXAteQdWiJ5NOx9QxJej
	 MLHVy00/a5utnTj0HKOKvrdlfRKJTjz/Eo/0mF4EagsI69YYkMbwU4uQGPfbwF7HvmHrl
	 LOLIsC1oLFPx7eI6Idxgc484P5BRHcqkzUM9sUzhs07RQYndKX8vqL/HT06dvq5t0aals
	 yRqyRasg4mvRzh0sq4YXqWRGw86IRqBZ0S4PZdC/nXw8CkjEft7ZMcy7oZyAx6DkdBr3X
	 40mCCTuWxd4PokOJTNLgpKdnM2uyU6E3RQaf12/hbOPjfn+dWp+eF14/jZf3pV4WXjw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=leica-geosystems.com;
	spf=fail smtp.mailfrom=leica-geosystems.com;
	dkim=pass header.d=leica-geosystems.com header.i=@leica-geosystems.com header.a=rsa-sha256 header.s=selector1 header.b="c/3qOvTj";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.3
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010003.outbound.protection.outlook.com [52.101.69.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8043606A325;
	Fri, 20 Nov 2026 07:59:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8043606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.a=rsa-sha256 header.s=selector1 header.b=c/3qOvTj
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V4cAeeJKh41RZX6cHB19XVrCps5mjjgB83XPsHhDBFvIkxX92rQU7OujkxgliAVI7Sb4vxqA2nrS+cx41b0RidYgjeZNhPycJbRgBjrwO3OzVYbilyjReklgbojSp5/o5ZKBuYvN5GHuxvHCW6+pu/t1vd4R3e5Jkr8xp0VjYPqnbGAFhBJGx80d1foCbtxFbojDvK4NKnAkbiaHXzxU5G0FbGkABaSJqaUhDYtG/66SeL5vDdFNIunayJt8aYazwhtoxQlXZHtGkYef8vA0Mdl6AnLoz6k4MG6e2Cd4GCs34KKrBCuXm3UPMt9IEat3qDdEGHJp9EQH2BEBlX6ncA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wfTwRgCI3ln1VubWkXY6DffclJa28UC+BzfAEXKcohQ=;
 b=nc/KH2o1u2/aH7/Uhduxw7yLrEjOEEgAhz9ZaWYgP9/FvS6CTuU9k9MWrn1NWFy7utIgw9Ip+qILpXifNBS1g1XSx42uxDhsbShkiHzf852trzsO5Mz5/A/CYWsqsRjjyngZg7Tca11UZAy4hrkF3FPwb1SgiPeb6jqCvB3mHS/R38ZgIPCpWkUT8nxsK3JjII60SZYWs1SMnUgclz98WCeSdlvAMJi4LNmon5QN1UEOAjqUI7GdSMkclGpq9WjDEqDpyiDeWQiyOMXoienxmcAcWvxJe4SHxFay5KSDkWiAWOxMPsJ64uHIZorRUJpsgvGj4w4Ul2yktRagqOeYhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.99) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wfTwRgCI3ln1VubWkXY6DffclJa28UC+BzfAEXKcohQ=;
 b=c/3qOvTjCze0mxkCnDVkly7jYZHwpy0FA12d62aXa0d2eHmlxK7CHV8WiB3rNwPgXOe39r76fxOPuPpDO3UtoSFsKdlX+fCmwv89/yXzHyKvqJmSF6dM8N8p2xsBISonVpHExNp0crKSHZM4jiqW1Uc3uA/FXgqTgfW8u2ai7oA=
Received: from AM9P193CA0029.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:21e::34)
 by AS8PR06MB7367.eurprd06.prod.outlook.com (2603:10a6:20b:31d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 07:59:42 +0000
Received: from ZR1PEPF0000E45D.eurprd04.prod.outlook.com
 (2603:10a6:20b:21e:cafe::2d) by AM9P193CA0029.outlook.office365.com
 (2603:10a6:20b:21e::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.12 via Frontend Transport; Fri,
 20 Nov 2026 07:59:42 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 193.8.40.99) smtp.mailfrom=leica-geosystems.com; dkim=none (message not
 signed) header.d=none;dmarc=pass action=none
 header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.99 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.99; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.99) by
 ZR1PEPF0000E45D.mail.protection.outlook.com (10.167.241.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Fri, 20 Nov 2026 07:59:41 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.61.228.61]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Fri, 20 Nov 2026 08:59:41 +0100
From: Jie Gu <jie.gu@leica-geosystems.com>
To: Matthias Fend <matthias.fend@emfend.at>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jie Gu <jie.gu@leica-geosystems.com>
Subject: [PATCH v2 0/2] leds: tps6131x: Fix torch-to-flash transitions
Date: Fri, 20 Nov 2026 07:58:57 +0000
Message-ID: <20261120075859.731257-1-jie.gu@leica-geosystems.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 20 Nov 2026 07:59:41.0515 (UTC) FILETIME=[190CE9B0:01DD78C5]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZR1PEPF0000E45D:EE_|AS8PR06MB7367:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f26f25af-dc28-420f-14ee-08df46dc3b9a
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|42112799006|82310400026|36860700016|376014|23010399003|61400799027|18002099003|16102099003|13003099007|11063799006|56012099006|261102123227099003|261026140227099003|261028144727099003|261022105027099003|261021121427099003|261009223027099003|261021123027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	FyGyRAZBZj5hwLE4eOn2EE12VsyEtSd+KDC6rO42rY8+rYXBYM2egfTWfhFAmMCGLTxh3pVv7WKCcRWOhc+nAZl2ALak9YbFZ5j+BMcO2R8p0YJE1TztNOGNr+Z9kYOkzZOh5K0VSXZZNkeQa0Wl0HrpcGNNoU+hhFxZnmrkIGipPDRTqm1qdQcBh16j+aTw5DEXLsrl1G68ftSj5l6TPF0ZtF6/Je41kCo8MCjlK0Z6y8EQPqKgIwiWwGit0IUwqSK2P/sEX2eWyeHwI+GcNyyDtI0nIPiqNpF+sLmcvwAAHZczLS5aWTpuyR31HP0nGROict3cuy30xNWlOEgfta8ZZ8DohxYz4ajeQy52QNuol9dTtcci2ZGNtieuhWi0X+32HAYkdftC+yiH4JHtUhNPeYHT6HTQIeKhUwB8GE93W2defdLsTXjPV0VweRE6XjCXzvjMZw4Y1ShWDLgeGe/5qr33EGjnrBUMg8BwlYkAKbRqu07OtpiRKEkZZXa4pPRgWT1K23RbQ1uZTNheEH5AcITW6XTdiqS0VJJ07G6JaV2Sbvm6azvDWkPMSJsjJzACqDhkRaM+5nrT1+je/ET4IfctM8mqdlVu4fNPthuo8WhnR5nLaS1edAoQNO4VW3kPzJzR7NBNM1a9ov96/8XB+59TLS2G+cpCsqkaQss=
X-Forefront-Antispam-Report:
	CIP:193.8.40.99;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom51.leica-geosystems.com;CAT:NONE;SFS:(13230040)(42112799006)(82310400026)(36860700016)(376014)(23010399003)(61400799027)(18002099003)(16102099003)(13003099007)(11063799006)(56012099006)(261102123227099003)(261026140227099003)(261028144727099003)(261022105027099003)(261021121427099003)(261009223027099003)(261021123027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+ZmzbNipRbasmZ/mlAvC4qmY5AVZd9bIawjghlbx4XXUq4mbYkQ2hx3cXTGtokBiPMs07iB40S2fC8wmqcNO9dvjnz9JP79Bj4wWV7M/5LTijBYEepO233J1JmLJTlOe8u4s4U52IeMbmw+JpT6gPLqGx15fTqXY2mS0nwoGCKDIG9WXMwIaz7pPStTJY7PrtwrSdB116iRtgHcO6/Uxm7YndL2cWzBEZiupsidTWGCwc9h/PLOylWBPRqUYPvUs97ynLnLlug5MQuVYwp0MZIhCoRvl0emniwbS8ODg1vU9U9gp/iO63/tf+MIS3qWs1bEXg4Alu370Biq/RDmsTrzpQDKyFHhU6Z9P51EsRbYhKoB+1zXsCDvoe5HqMymCDNnA/nVNjEaf5mnCVnRczj3cz1xbRAw/UG3veftuEzuEILhi8fYO2hS9ggX68B4q
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 07:59:41.6043
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f26f25af-dc28-420f-14ee-08df46dc3b9a
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.99];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	ZR1PEPF0000E45D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR06MB7367

This series fixes torch-to-flash transitions in the TPS6131x driver
by cancelling pending torch refresh work and clearing the cached
torch brightness when flash control takes over.

Matthias Fend reviewed and tested v1 on an i.MX8MP-EVK with a
TPS61310EVM. Thanks to Matthias for reviewing and testing, and to Lee
Jones for the review comments.

Changes in v2:
- Use my full name in the author and Signed-off-by fields.
- Capitalize the commit subjects after the driver prefix.
- Update the cached torch brightness directly at the call sites
  instead of using a helper.
- Add Fixes tags.
- Carry forward Matthias Fend's Reviewed-by and Tested-by tags.
 
v1: https://lore.kernel.org/linux-leds/20261117064328.4096518-1-jie.gu@leica-geosystems.com/T/

Jie Gu (2):
  leds: tps6131x: Cancel torch refresh on flash mode switch
  leds: tps6131x: Clear torch brightness cache on flash takeover

 drivers/leds/flash/leds-tps6131x.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

-- 
2.43.0

