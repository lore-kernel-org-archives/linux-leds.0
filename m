Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.37
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795787081;
	b=r/bU0SoVe2WFi/r1PRJg/tIF60A8fF5DxkmGTv5DH7Gc6I/S6esTr0aFjB0D6BYICT2P
	 9y0+VedkCuWeGwjz2phzslfrnCFy6dBMa4IOdIhwENcBZUnoEcVggAFwYzdBtUzGzhwK9
	 ZjylO47ejLCHXXSfh9ZQPEP6CT9FnzNNlM5y2B9AYAO51qE4HIa6J430d1s1IqCEHmnh3
	 Avf0ca/KhzAORjPB2dFp4XplKBCwIWu9MjO3l3N3itufhJi9KaclOE8fpDYMMNrgVAWVY
	 BQ0+A1p8GLQFTS/zDnIw9pGaJDQQmTGB7CNa+F4a3gFCaXNBMQAkilNBV8Ric3npSJw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795787081;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:Received:Received:From:Subject:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:CC:X-Mailer:X-EOPAttributedMessage:
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
	bh=GQXcevuEfvlZoLKswfROK+N4STGges+D3lSc3tb5m4Y=;
	b=cDzUdgL1w0+s4khmXnGy/5Tlk3ciuQxvg7vvE4/PRrLHb99WmtgNpuNATHJZf3kCDYKF
	 XxL/FHn8i7GKkzfBcJ63oj9tmEem4z6L4F+TA9XK5qkiEmMV4FMxkV/vZt257StPn1jkt
	 fsqYk8qb/ptFqiFmqiK5qYQhekIckHkbcxB2lx+0Imjt7ZqeLB3XtxTCBsshQ2i0x8UD5
	 BhyL4wEkorx6NMNjfVAplYmJENCZvWnGZPv/qs0vRlvmgAsIZqx2S332iwY9WmOLiJ5hL
	 xxv0I4SqWedtPWHCm24AqYgN46rXCXKb+PDbFdhbLOi9vgw8EispieXbkVHvU04Uefg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=axis.com;
	spf=pass smtp.mailfrom=axis.com;
	dkim=pass header.d=axis.com header.i=@axis.com header.a=rsa-sha256 header.s=selector1 header.b=gruaTY7v;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.37
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011037.outbound.protection.outlook.com [52.101.65.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2725606A31C;
	Fri, 27 Nov 2026 13:44:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2725606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=axis.com header.i=@axis.com header.a=rsa-sha256 header.s=selector1 header.b=gruaTY7v
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vqZELRXNhYIaY34LDkrFwKspDhi3RTJS2An5KOc8SGpgAtwvngVrJhDjtgnmT60TUM2b4EJTZ+/xgGLVVb+X63JxbC6E7tkacFnGZxy3wW3vx/Vxe2siXxM7d1dgCsKwzaUF3ES+LDtJrW11LTdBD5XUyQ2ti8XRanVa90piFFPpPdP+t+3GgOaUwzvrDEZ7jxq23+EfI6VypV3lVRvEbwYbtRmPMYmbCdS0tUHCWh/OVJBupyrzWNaDhHv/62UuuPNwCoJRBf+mpqUSzKUjjfKRnRKzvubzcTCxPtEc1dCh9AQO8kt6mjeAn0X70WJerbovUnzPR/bqFODVuWyTBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GQXcevuEfvlZoLKswfROK+N4STGges+D3lSc3tb5m4Y=;
 b=HLzgHQv9x9sYgIxRt5EP/5L0YinGfalKMSpQjAo3RQ9O0PUY7C3QkwevgsIzggIrV+nQpV20kk5rTQVShtDJLiQv8vdwLAxz5Tse5RxP+Sh4Z262lWSN2CZEYs/EXU67JCD65saXML0PBTKShujFmeAuCJvfq6tPINLJ6H1jTM/OBg1w3IuYwxXWHBB8XjVEslKFXJyX5qcqV/nLRbbYzpjiloSv1yBPjjUvxJUP6clQEDFk6FtHe3IqqaGWgSrRYYDkirI2ONHHO7q7+EP6cIcVf2fvF26k+o4QzPQ4oWvoWKKVkzJE75v2DJfMfh59K6HgNdWBjYkwYvdwEIFcAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=gmail.com smtp.mailfrom=axis.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=axis.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GQXcevuEfvlZoLKswfROK+N4STGges+D3lSc3tb5m4Y=;
 b=gruaTY7vPlbvl2nJK/ShQBSx7QJtI7nBilviHsPnRxxSgA0OtDGgGNf4cmWHRmGllnymEh4ubMTh1zxBxgxYz/pVtIvRFhS1wsWMxhBCFcMwyfsSh9frNINopuSn6purMO0w+oFNGSZvKQ7LpFufJTRqLB9l3s7DmKY34mASN/8=
Received: from DUZPR01CA0196.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::23) by PA4PR02MB7055.eurprd02.prod.outlook.com
 (2603:10a6:102:107::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Fri, 27 Nov
 2026 13:44:36 +0000
Received: from MA3PEPF00000407.eurprd04.prod.outlook.com
 (2603:10a6:10:4b6:cafe::26) by DUZPR01CA0196.outlook.office365.com
 (2603:10a6:10:4b6::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.9 via Frontend Transport; Fri, 27
 Nov 2026 13:44:36 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 MA3PEPF00000407.mail.protection.outlook.com (10.167.241.152) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Fri, 27 Nov 2026 13:44:36 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.39; Fri, 27 Nov
 2026 14:44:34 +0100
Received: from se-mail10w.axis.com (10.20.40.10) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Fri, 27 Nov
 2026 14:44:34 +0100
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Fri, 27 Nov 2026 14:44:34 +0100
Received: from pc63130-2524.se.axis.com (pc63130-2524.se.axis.com [10.92.173.61])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 8DA94167;
	Fri, 27 Nov 2026 14:44:34 +0100 (CET)
Received: by pc63130-2524.se.axis.com (Postfix, from userid 18369)
	id 88BDC608F502; Fri, 27 Nov 2026 14:44:34 +0100 (CET)
From: Tobias Johansson <tobias.johansson@axis.com>
Subject: [PATCH 0/2] leds: lp50xx: Fix component index and count validation
Date: Fri, 27 Nov 2026 14:43:46 +0100
Message-ID: <20261127-leds-lp50xx-bounds-fixes-v1-0-b9f0399d747e@axis.com>
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
X-B4-Tracking: v=1; b=H4sIABOJCWsC/yXMQQrCMBCF4auUWTuQRA3qVcRF0kxsoCRlpkqg9
 O6Ouvx4vH8DIS4kcBs2YHoXKa0q7GGAcQr1SViSGpxx3lp7xZmS4LycTe8Y26uqcukkGE/Ge5+
 OF5c96H1h+g36vj/UMQhh5FDH6RvMjf+tSn2Fff8AnNNEN4oAAAA=
X-Change-ID: 20261119-leds-lp50xx-bounds-fixes-b40666d382f6
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, "Jacek
 Anaszewski" <jacek.anaszewski@gmail.com>, Johan Adolfsson
	<johan.adolfsson@axis.com>, Dan Murphy <dmurphy@ti.com>
CC: <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Pavel Machek
	<pavel@ucw.cz>, <kernel@axis.com>, Tobias Johansson
	<tobias.johansson@axis.com>, Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.3
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA3PEPF00000407:EE_|PA4PR02MB7055:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b32dd0c-4b3f-46e1-6cec-08df4c8c937d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|23010399003|261102123227099003|261026121527099003|10067099003|11063799006|56012099006|261022075727099003|261021123027099003|261021121427099003|261009223027099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	oNYsaoD8NzPL72G/WaDjlnY28GTcG76dV/gK3gRlU7YuesOeL+/k0/eNBQ1tIUhnnrgkhwz8fS7mwH8mtFicOemYn5DPqX0tTFqqw6fkvXn9KgbwioT8tHVhr1/ujKrUyPwFPcFnUM1d03H2IfcsDuX0qd2JmVMBIP61bavK+vpsWGAVQv65XFDAF/2ygNp85/Rx0hsmUIvt2/ZoiPFZ9A+UTFwOLWTLSzeDFOzJG0EK9AOjkfEk8WiO/BrPaxoI++88as4Z1w1rN664IvlJPF2dfIGsO7k55+n13iMvppMYjkYQjLODL5xtQrrq91nmnzxvNkAFRfd/pJDzC6hdn8LM8l15c7Z0N18jF47skcRMqn2OXZfX0+a2DChobR9+vfA9BS2R8rbNWRu8tZTCNRBDTQP0x2yUygoaJSWV5Vuwk7ZCB/B7PD93WfLyclrfBFSHcMW9bTesV0l/eI38kRv6IDChKCt+rXtOcvyHLG55op8SLIcZl7syp5YZGbUjTAqJmYiZkUqMg98ohtyC4PRqM7u0r/VljoxK1tyyiVHXGGKdM5FcLyPMVmYORNf+cQ9wDqWmnir6pym0+fQ417IoXQZVD4svmA68sDjSLLX+w+6nxEl6jQt2hIC/AuQ4QIl+ZgNmIWkGumYcI6ju6w==
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(23010399003)(261102123227099003)(261026121527099003)(10067099003)(11063799006)(56012099006)(261022075727099003)(261021123027099003)(261021121427099003)(261009223027099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Epjw4F7P4O6Z7iD36qhKS+britLub58huDDYqkoHjhnGlGgKgB8Z3t+CPtqT+MR9k/xMax3JGiKV3S22ISkfEmTH0G40wmtb368b1QsELbhZbH8YbMF6RCMxJJLVaab84Koil8IymgSF6JiwyBMkUZxOKC85oqXhQrlxwV3vUuAZm6t7VxiCKV8o4RfT+DGurRIRWAhPHMW2WYZwFENnAyB7cX2QgQyOBonGH3k4mSMtRhG7LDpMUcP+LB81vRnNhpIhvtQn1XSbx77cwa2j3xIRBUK2jEK0mXWYRFeD7k87Fu5lOqXBh/bEAkwLHE08AVDm+mX8xC/ZcgPrE7BKr1PoCYwJSnnvUUOf/mm1sQ/S3h7pibe/7iqmfJaeYYe5KOrEy8QNUBWVdv5VxUIHIxQbb9Cvi9m5eC8y94aitezQ5E6bgb7UG5/yI8WyW/mN
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 13:44:36.2498
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b32dd0c-4b3f-46e1-6cec-08df4c8c937d
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MA3PEPF00000407.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR02MB7055

This series fixes two pre-existing bounds-check issues identified during
review of the default-intensity patch:
https://lore.kernel.org/r/20261109-b4-leds-lp50xx-default-intensity-v1-1-0a04a3533df6@axis.com

The first patch makes the component index unsigned so that firmware reg
values with the high bit set cannot bypass the upper-bound check.

The second patch rejects more than three component child nodes, preventing
num_colors from exceeding the allocation used by the brightness and
multicolor sysfs paths even when component reg values are repeated.

Both issues require malformed firmware descriptions. The fixes are kept
separate from the default-intensity feature and do not depend on it.
Each patch includes a Fixes tag for independent backporting.

---
Tobias Johansson (2):
      leds: lp50xx: Use an unsigned component index
      leds: lp50xx: Reject excessive component counts

 drivers/leds/leds-lp50xx.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)
---
base-commit: 05b4738b0078f7d6f154f68068a11c8a0635e9df
change-id: 20261119-leds-lp50xx-bounds-fixes-b40666d382f6

Best regards,
-- 
Tobias Johansson <tobias.johansson@axis.com>

