Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794897838;
	b=dA5tb9QBMVOMuMNyITc24rKH90oaiEY5LcvuKIs90KUiIR7E/F+L/hOE0OLm20TxxXRd
	 nYwc5ut+c+pJa1JPOKjCQ4y/QcxHi2rfTWmaMQEcHHk5K2kmHbLo0hloXSE64I31ZuGOs
	 AsEY27cP7hCjHA20dxaOyGq7/dZMrz1exJ62cAmmeOyCOUulg1BUCFMXuFszJ4khRmvYh
	 ytzs/xoNWBe/iUrOjQ1Idgnazu0LIdFCdkBovXv19RHGG1R9gJNR21a511wAZif7hejtU
	 82BRfUtUy0CaVFQxr0tOD9bUeQwRKuoF5+pKiKzYlFkxMcZJ2CAVSyv6Y15SzvmnOvA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794897838;
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
	bh=l4/dlPiTz8BLzXev5kDWrp6baoq9f7QtbpIfZP1zIbY=;
	b=egIKiodMD8JetGG/c9PNxgta7mXYtYKcA+CHEvrKHqgRCwp4FwQjKw54zdZ+6w1uete1
	 9bpycrdLGs/iEMqT7nSV9/ro9SXOUTEF9+cj0rnMaamjh+kDCET+H6jntjEmbY6Jhzd6G
	 P6SURJ5NXe6rnYECaPFYCR1qJcQ2bES4kYf4zNDan3KRd98AOsdWv0ugpQLWTeYP19Wew
	 CiJI/2L3pRlW5pj46e7Usm7CGy3leMqDeZvt8TLD+3LQYo3hAdpqgy8PkttQnbrnNB+Wo
	 Roy2Z0e6Tnxg0funisyL6PV8+fDp3YqBIxrcuB1Psy8SApFA3S+l7W5hlCYYcHJ1lXw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=leica-geosystems.com;
	spf=fail smtp.mailfrom=leica-geosystems.com;
	dkim=pass header.d=leica-geosystems.com header.i=@leica-geosystems.com header.a=rsa-sha256 header.s=selector1 header.b=boTeV999;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.30
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011030.outbound.protection.outlook.com [40.107.130.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539A1606A31C;
	Tue, 17 Nov 2026 06:43:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 539A1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.a=rsa-sha256 header.s=selector1 header.b=boTeV999
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XpCceWxHpBk/ZSBM+2KxcSz8BZJ3yWhoV22XSINOrssT1DlE9tsrxXVujwMFS7dQd7v8UDvfcfY5BDa38QzHRzopXKBxLpWmYkFvKRmgxiAbYE57gyj0qu0K/uDHP4GIzAxaNJcukyT45x2wwuhxuBb/Z/gTSpfHUW0FcGdJd4L3O9byguHGdzWomp4JWj/YWer+8G9ND1EKO0k63uOyfauCzhBP3J93EcDZwfmIe58M2pZ12nB8EWyAdfm2tE+hgzYbUlCmo9zhTk9gljSBgqlkyHqosfGyIfgxgTA3OjBJ6pWTmZ/pCPBgyzetsGVftGKdE/MBOlxEpa82XBR03g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l4/dlPiTz8BLzXev5kDWrp6baoq9f7QtbpIfZP1zIbY=;
 b=mq7/SSLdlYtwpZTF4x7bykXGFg64XIvNs0EtTykt8BR1YtjH5b0cOxzX6bFoCIX1knAhrRPW6hPxc4iTjRQJBOj5/KeBLK1Fh6c/BdxAa1y4FuNSkqnkbPW1RRFdqqscPnWi7HBkA8Egx3OBdCHPC4s7mVKAe8GH1llsJmjxE68ydEf14ASwpReqUaB3H+Xib2KwQUtXNUOAuv7CXCPTUFP0lj3aDCuCtNLnhvn223Qe/e6c9xEgZWvCSc3UA5mwfLLaHhm7nth4WePRP2QnpSdNeAgKYEeh8sQDTKNhbMKicCWB2unVtyFiVcNdnd23iNhx718miZyfMlH2Z3pr9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.99) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l4/dlPiTz8BLzXev5kDWrp6baoq9f7QtbpIfZP1zIbY=;
 b=boTeV999j86775iB051kU3FrWiFLpPVvKWX2Nn0TYPB/9+v5vEwOUaZi9hDiN9capoOsezgqn/U+M3vO7MMe3TiefWBDEOr+dWSrHlrbK5/QwIuU5t7/T20DwckHk309lNRqpW193ucd4e5IKZaEB7BYEDb6ugo57V4KgiHCnoM=
Received: from AM0PR02CA0160.eurprd02.prod.outlook.com (2603:10a6:20b:28d::27)
 by AS5PR06MB8702.eurprd06.prod.outlook.com (2603:10a6:20b:652::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 06:43:51 +0000
Received: from AMS1EPF00000091.eurprd05.prod.outlook.com
 (2603:10a6:20b:28d:cafe::7a) by AM0PR02CA0160.outlook.office365.com
 (2603:10a6:20b:28d::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Tue,
 17 Nov 2026 06:43:51 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 193.8.40.99) smtp.mailfrom=leica-geosystems.com; dkim=none (message not
 signed) header.d=none;dmarc=pass action=none
 header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.99 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.99; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.99) by
 AMS1EPF00000091.mail.protection.outlook.com (10.167.242.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 06:43:50 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.61.228.61]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Tue, 17 Nov 2026 07:43:50 +0100
From: jiegu <jie.gu@leica-geosystems.com>
To: Matthias Fend <matthias.fend@emfend.at>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jiegu <jie.gu@leica-geosystems.com>
Subject: [PATCH 0/2] leds: tps6131x: Fix torch-to-flash transitions
Date: Tue, 17 Nov 2026 06:43:26 +0000
Message-ID: <20261117064328.4096518-1-jie.gu@leica-geosystems.com>
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
X-OriginalArrivalTime: 17 Nov 2026 06:43:50.0521 (UTC) FILETIME=[01351690:01DD765F]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000091:EE_|AS5PR06MB8702:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 0ce52259-ff15-400b-0892-08df447623bf
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|82310400026|23010399003|36860700016|261102123227099003|10067099003|11063799006|56012099006|261021123027099003|261021121427099003|261026121527099003|261022075727099003|261009223027099003|18002099003|16102099003|3023799007|43062017;
X-Microsoft-Antispam-Message-Info:
	Lcdl1OduyadIkG8fR8fA7r6dCVFuhuCI1NRBJhfya7iMHgAV0Xe+cCzT9NjFMszMCisaTobiK1/7zC4y2lpMl3ZsxzbF9RKsFLif0c5otMVlI/xAAqCDfTUtQf1bdvB9ksgj9aMnh5yQRoX/zBlRmMI5DfG47mw1wz1B/1K7NZKozoyMja+cn/4bggDVyfgun0vOYk4ugQrusGxT1gXcf5fDgy6GOg7IUAkuUHdicy2L//k34AEVsvXGrqKWpVRPI23nI15lW2ejFa56R0skaiVN2y4IV20rc3eP9rkeCaS9IfPS63nq7S6oGzclj+v1kc0v3A8AQT+J4Xu1FdtXj1M/Vkyk4ULyw+1uvKykoV52TtfOuYrbWBKXUQdxQ1m3HxZi7eBn1R3uGP60+EsW4vbkm3Q6SwWKzddGWiyGAk/+GkwGPEScORRk+erCcPyRTpgTdnyrkC8cGxEMomuoJGhsjOSxy3UNigEnB7MrUUtZcwNu5iu2h4V4104Dr1bYEHgiSAwbv99odSk6vfpyLp9zw7FJkugedL0qanVy4J4+PAWVGWYG/ZXAp8vM3iKcGHgdQZHC6XnJH6wfIvaQNVTL4xHVW1LxHlRDO71GglLDuoRstbROgxjLNgdRdz6e9qMBx/sFk3Pb1akSLv6xJ6DuoJMYWPm7ur7u+mBwry9GeAO2mV/LZg0UbwEYxS03zdp2STG/LNsgSOz/yt2xekWT76j73eTe2CCNZCdvAoIAf5TDdILMml4C7ZT32Jn2
X-Forefront-Antispam-Report:
	CIP:193.8.40.99;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom51.leica-geosystems.com;CAT:NONE;SFS:(13230040)(61400799027)(376014)(82310400026)(23010399003)(36860700016)(261102123227099003)(10067099003)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261026121527099003)(261022075727099003)(261009223027099003)(18002099003)(16102099003)(3023799007)(43062017);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	00TjRGqgYMHVqlD4aJTeD9x1DFY6NJSUfGjw54aSp06mAjUdV3vMg6cS8EodYU91s6M2mlyB5Jjdl4cOoHvhwA7megc+v6sZcOC89E15jSuxK4d3WhXUkeGnUDm2HOZIqAnAAMTWokpz4EOv3C0v4UYAcnWN4WVS0JB1CTUkabKakwfAng8mytdxmQJuOQePahhcAV6rcHNYBG1UG0ZI/1/Jz5TU+FXN3eTOynTx6weyK1QwruLl9xHSN0fRa7DQd+Yd4dwxa5az9Ln0s/wkhwZ88s67rMcrXZy7XVcWtLkjpyfV+p73NGujNQ0WwUwqgCnOQcafayYEvmhAluBi4shjpj7GyfWuuUrwYzhdudVSQTLrPVL2bJAGismbKxOGBmq4f7ScYCJvADPjiEdYryoV4d+iQ9iF6iB/izK1QQcIwFXydIimjj4Y7wsVUhMv
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 06:43:50.5444
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ce52259-ff15-400b-0892-08df447623bf
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.99];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000091.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR06MB8702

Our product uses the TI TPS61311 white flash LED controller.
The flashlight can be controlled in two modes: flash and torch.
Currently, there is a conflict when the torch is enabled and the
camera is opened. The torch is turned off while the camera is
active, but it is automatically re-enabled after the watchdog
timeout expires.
Also, When the device switches from torch mode to flash or
external strobe mode, the hardware torch output is disabled,
but the LED class brightness cache may still keep the previous
non-zero torch value.

This series fixes both issues by cancelling the pending torch refresh
work before switching modes and clearing the cached torch brightness
after a successful mode change.

Tested on a custom product board using the TI TPS61311.

gujie (2):
  leds: tps6131x: cancel torch refresh on flash mode switch
  leds: tps6131x: clear torch brightness cache on flash takeover

 drivers/leds/flash/leds-tps6131x.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

-- 
2.43.0

