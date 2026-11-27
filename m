Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.2
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795787091;
	b=h8Gc9K2CUHqEc9mRv1TmGoau6SIB7O/gSSiwZvRvmlEaBccD6gFWJicktbL+uRl3OSXb
	 tstOadzENKhqgXf+83GWFe+9PjPrqamUByIxuyNH61l1r6WyCXInwcLaAXrmqCufNpQxl
	 ntVCmTj01FraBxAHORqpWN4/m9rfHSQIxJIJHQcgRLxcDaNR1KpcTKGwNYb4o776fz68C
	 LKpOKMiTMklcQLERgo+TK6CGGOG4kA0dD8+baNPNxsUYktk7Y+beMVMt4sd0tfWVsUBbp
	 1wQvcvmWXH0+G/hkRJ9nPnm54TbdgxZ7eUi0eei1HMheyjwzNsL25cWqKoSupWQdbgQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795787091;
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
	bh=Shu/b6pKPIqtxbyW/84hiaCw8uL/rqrfcggvN4lPkK4=;
	b=Jh2h/0QYlAyh3oDtliaqTp9DtqWSZVaONUSFHdtU9brF8xNAkTJjyHYoGGHzBCkDGTnt
	 NLYytdI7SWTLpW7veX+Ddlp4WroHFXKP2TwUcu3NyRF1haT6XppY1nbRm6mcA0M69RkhG
	 zDiJT5RgX/T48iXO+rQFTeda6CF/dTfmsho+okXgc/uY2DWeWASYqGwUgu+RBBuyqhpt+
	 Nux2fP2fyoikdAOFQcuKVSlwia5SCSqlA6zEjpXL8Y2LbskC2CAMczL8HeGawJnqmB2ib
	 bSt25I52aoMFH+Ty8jQuYQU5ypVa5VYCaXLJR5us5DwGLUPyak8gcVUSZEiKHIyGssw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=axis.com;
	spf=pass smtp.mailfrom=axis.com;
	dkim=pass header.d=axis.com header.i=@axis.com header.a=rsa-sha256 header.s=selector1 header.b=I54eUZDj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.2
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010002.outbound.protection.outlook.com [52.101.84.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12EE606A33B;
	Fri, 27 Nov 2026 13:44:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E12EE606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=axis.com header.i=@axis.com header.a=rsa-sha256 header.s=selector1 header.b=I54eUZDj
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vG4M//GdXGJPKXIfz6LBeCA0VD4mZMy6JTF0mN85YLt0yxtu/jMHAOoh1+jwiQ/5WI7OSAYBaYUqGFFLRWoIhXxzMetoNWsgeK2pEzAgCzZ9w/X8trIjLZwy/Cv5KeOqaTpL/MWMqioP1aQAnHVYwrSsGwWMX4as4RztXFPhoHMdj9pC4vApc0GcWZTp1yMxsRDVdRy8/gLgObpOH4G3mtA66T3ZWyg5mJ0G3y9qudrUPcB1Jm5Ev0Rr1VA8YY6AKhCTVlDK5ekBkgIwznvsuqMHMENno//w22vagLi69OwINACPUZw0uz2SvLqD2cNqPWAp7u22PMGY02CLqbjviw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Shu/b6pKPIqtxbyW/84hiaCw8uL/rqrfcggvN4lPkK4=;
 b=kOhnQXZ55lxOPwu1P0Ubr+WZIknXBHAGugiFdSZupsT1x05Q5OSb3XV9RMDlRI7qZci21jxhZ+6q9zDJyGkiRBbFfb+eqfYIR7kFi74X/Cz3MPraF0DhltMZFsdjRuDrcu/Fp19jUm+q/9H+VaQgFZFSO10BBVwaF3awvCZayJ29YFVRYDhRkrIUIUJciTZcWV6OloAm8z3HP9+FPKGxkU65GHo3I8eBa9JHz3pG1sYJUZrd0P52rADVvQ3oxjSjea1pfW3QGMEiNAEm9J99HudHGot618UQjfxuSIhncaGk7KAlzyblc97nFU1fz4vDcyRn9GOsnVbm+e+9QBUELA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=gmail.com smtp.mailfrom=axis.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=axis.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Shu/b6pKPIqtxbyW/84hiaCw8uL/rqrfcggvN4lPkK4=;
 b=I54eUZDjDJT73gpoXWBAUzbQ7WRYbxhGDUyhxISYnZvkqWNyh24XBWtqoTIspZg6QE002tNUk0pwDJNWuDGLJd2xdTy2OCa56LS8nE/nGeE7mWcLulvwM864IdHNHXJIOn9vze+0O7OBEos7eCmoiSHgYbQEoBbFMr/1zX4vjbc=
Received: from AM0PR10CA0026.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::36)
 by GV2PR02MB11970.eurprd02.prod.outlook.com (2603:10a6:150:350::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Fri, 27 Nov
 2026 13:44:44 +0000
Received: from AM2PEPF00070CF6.eurprd02.prod.outlook.com
 (2603:10a6:208:17c:cafe::8c) by AM0PR10CA0026.outlook.office365.com
 (2603:10a6:208:17c::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.9 via Frontend Transport; Fri, 27
 Nov 2026 13:44:44 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM2PEPF00070CF6.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.688.5 via Frontend Transport; Fri, 27 Nov 2026 13:44:44 +0000
Received: from se-mail10w.axis.com (10.20.40.10) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Fri, 27 Nov
 2026 14:44:34 +0100
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Fri, 27 Nov 2026 14:44:34 +0100
Received: from pc63130-2524.se.axis.com (pc63130-2524.se.axis.com [10.92.173.61])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 8F27E41E2;
	Fri, 27 Nov 2026 14:44:34 +0100 (CET)
Received: by pc63130-2524.se.axis.com (Postfix, from userid 18369)
	id 8BE8D608BB23; Fri, 27 Nov 2026 14:44:34 +0100 (CET)
From: Tobias Johansson <tobias.johansson@axis.com>
Date: Fri, 27 Nov 2026 14:43:48 +0100
Subject: [PATCH 2/2] leds: lp50xx: Reject excessive component counts
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
Message-ID: <20261127-leds-lp50xx-bounds-fixes-v1-2-b9f0399d747e@axis.com>
References: <20261127-leds-lp50xx-bounds-fixes-v1-0-b9f0399d747e@axis.com>
In-Reply-To: <20261127-leds-lp50xx-bounds-fixes-v1-0-b9f0399d747e@axis.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, "Jacek
 Anaszewski" <jacek.anaszewski@gmail.com>, Johan Adolfsson
	<johan.adolfsson@axis.com>, Dan Murphy <dmurphy@ti.com>
CC: <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Pavel Machek
	<pavel@ucw.cz>, <kernel@axis.com>, Sashiko <sashiko-bot@kernel.org>, "Tobias
 Johansson" <tobias.johansson@axis.com>
X-Mailer: b4 0.14.3
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF00070CF6:EE_|GV2PR02MB11970:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e7c68bb-eb7a-4a2d-6b31-08df4c8c9852
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|36860700016|376014|82310400026|261022105027099003|10067099003|11063799006|56012099006|261022075727099003|261102123227099003|261021121427099003|261009223027099003|261026140227099003|261028144727099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	uAdOG6Gc5rNo4K6bpX3DeKwt9soveRyXq8iXbMZVM5Cl9qPgfM1lXcB9kyTJ9NI3tFscp8/1mKB3D6+L8NdSzeiamLFcrqbX02hDyJKhGkY2iDGkkHFn2iRYg/tQBgk3DHzz2Afq3bYoDY3UGk13isfEK5laRLBtevFDutcnCj1ZG/pzPtSQ80w3X+buIMBWdM7vzowD5zstkexswBAFkxCDIRFaMpciFOExjK9zhPsdLbb/6dHGYu3IS9CRbva6GV/BEX8IKAp9lGKmwt/ElL3Tdw2wWYjgW3ay3/mnFvnJoQU8MGPWZEVWgATjOrjKxGEy/xLZRJLk0Jv29xYvjBs/0p6GioV7MiHiD60SP0Paz13+Ztif+X5YMsQEL6sILjNWDzgEp5QBtHI+X45iA7OtVbHNUnnLtI/sy5qHMpSG6jOAXq8yXo3kQgxd3MGtyRBu9ZhvduYXnXmRSlkbfVEh37gOUJqqSNKx8I4qWE4xDScT3XYLERyvgjW6OV4NrkRXC7Pppx1xWteXBLhj5B/mHLpiXxUXA9IPbVh3sla5xiUm2V/6lW2QU9jvs1+ZlFoybZllpsjYiPhlALcnbiX1TL10vfBA56Y3BL+QGC4qLxQNjo7v9SR+VQGrMG96R8fDsoPOOkchJVV3ZG+S+w==
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(36860700016)(376014)(82310400026)(261022105027099003)(10067099003)(11063799006)(56012099006)(261022075727099003)(261102123227099003)(261021121427099003)(261009223027099003)(261026140227099003)(261028144727099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2v1zeJXYVXBdP0nSxNP9pButL9HvWYKnM0h5TXEJqwo0OORwjVN/KA9uGY/UUpKqH997+iighEbIPVAZa40FWZP18I3PWVipGXE3kBv3LTLVp9rmEzFIm5nuPO3RBpMulbHF5lm4rrOrzSliUTGizWRcJ+xN1aykTLBh6RDGqk1UeB+jjDv2GUCFSzfz3Jwijw3D6e6PCW+7BnqMA13JjBSHTDEHIECwLSneY/pvxLwMQoIoLIA2ipivzJPQWFd4njw70V5Xt35Q62LzjvDEd+olNq7H90a658saBRpVCRhce7AygGLW8e/zWR7rOo/57oeIr4xzoMEi+pGUgTBp6LKdSF0R7XlautBadQzv0/vfo0C7rQmmZVVVuVC1CJIU4LRzEpVovu1RM7zFzBr6Gb8wftBn2j6Wl3yTYhLzhdXPc2McrKNv2qChSipLVngA
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 13:44:44.4159
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e7c68bb-eb7a-4a2d-6b31-08df4c8c9852
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF00070CF6.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR02MB11970

Each multicolor LED has storage for LP50XX_LEDS_PER_MODULE components,
but num_colors is incremented for every component child node. More than
three children with repeated valid reg values therefore produce a count
larger than the subled_info allocation.

The brightness and multicolor sysfs paths trust this count, resulting in
out-of-bounds reads and writes.

Reject firmware nodes containing more components than the allocation can
hold before parsing them. This bounds num_colors without changing the
handling of configurations with up to three components.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/all/sashiko-outbox-204991@kernel.org/
Fixes: 242b81170fb8 ("leds: lp50xx: Add the LP50XX family of the RGB LED driver")
Signed-off-by: Tobias Johansson <tobias.johansson@axis.com>
---
 drivers/leds/leds-lp50xx.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/leds/leds-lp50xx.c b/drivers/leds/leds-lp50xx.c
index 4d4ad0db96af..4da78e6ad0aa 100644
--- a/drivers/leds/leds-lp50xx.c
+++ b/drivers/leds/leds-lp50xx.c
@@ -496,6 +496,11 @@ static int lp50xx_probe_dt(struct lp50xx *priv)
 		init_data.fwnode = child;
 		num_colors = 0;
 
+		if (fwnode_get_child_node_count(child) > LP50XX_LEDS_PER_MODULE) {
+			dev_err(priv->dev, "Too many sub-LEDs\n");
+			return -EINVAL;
+		}
+
 		/*
 		 * There are only 3 LEDs per module otherwise they should be
 		 * banked which also is presented as 3 LEDs.

-- 
2.43.0

