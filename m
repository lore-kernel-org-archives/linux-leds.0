Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794897839;
	b=VT4XnxSENNZMgOFrA3Iy7zk0NSaIlBqrC8YFnTzESLcx+Ex3pKq5Cvsv7+M3To6uMFVC
	 yZbHpDceP7TnnOI4mN0aM5d4P9fEUojXqVFc0w+m6t+6qpqIPGeckYWdMPONWoriVTA5l
	 wYqYVl3Ko8K/C0dBH/h6IWj2XRRWVvbQlUmLwXIge/v44623DYk2NqRwKkZriz4kJiVld
	 A6CRIHc3RBmf2UFKlLwoVwy4kCvdoqZhVVR0zC0vt8OOju/3rtD2KAehKromk57MqTbld
	 if6L4NmQRogJzNXrwOW11SKdxtP+TvNxVDV7WNErLU01rwZFzwNWhgzThDt1WvXL0BQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794897839;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:X-OriginalArrivalTime:
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
	bh=oB3jWMvDPluWwB1rGSfSkqxrSRAXzLp+G8j/5/AQToA=;
	b=Z/9oqUNfZI0c7aiuHitRXUO4e+qMaO7z0L9t8P7zt9wUzdufCbifujr5kSF4HonDdipT
	 B/Juq70Q/vJ+Rm0YMKZHbgeVKTcjNggAZtJtNKyaCSmd35cLXnF5yVOFTFO1lCOVQkBON
	 mDVXOOksJcX7dfL5CPZShHQze3vLrSGWh3AdBGm2EOLwVudrqEUYlYtqBvo4SMCP/2e5N
	 gBsJ8plart6ucpkFOAdtUEA8DUH/1kyWAXyWdRk/GPLnr0SCBYCp21aI7sYZrhjyJ99zj
	 mg1x4knMxe2bNG7HdKy/AhaYWwldSnBOju9tz2XooaAw/KdrHED8tAtSVHA2oR1y6Jw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=leica-geosystems.com;
	spf=fail smtp.mailfrom=leica-geosystems.com;
	dkim=pass header.d=leica-geosystems.com header.i=@leica-geosystems.com header.a=rsa-sha256 header.s=selector1 header.b="a75I/RZo";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.25
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012025.outbound.protection.outlook.com [52.101.66.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0FE606A335;
	Tue, 17 Nov 2026 06:43:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D0FE606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.a=rsa-sha256 header.s=selector1 header.b=a75I/RZo
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aJzdx0Iuv+/JkG653pud2Qjf25oeQXlN9KDguU9HcEDM2OxfKDBemMf2eRUeWsxsOmHP7/rrVRpdZ2n4xi/awfA0Jf+nAf0kc5ieZ6yeB6wSTH+GNgwOsssubimdEoRtBtVPs+F9zaSteCpxpG9ugdtl11iSH71/m6KX+Vd7ibSC8Y/MQD0w83JQSdg7pvQ/cf499jnf5Cyb5yayZWGyiwwFpJ7INtjq973jwBnV9Tw5tpWfSmZgqGPAz8OBPYHqT7eSQfyXeJPATaL891Ng9cIPB0TD2bYkjte4KqHI5XPZBrFzm0c0AkrBRl1Fn5NToHc8Sfd6ymcuU4AIgNCSsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oB3jWMvDPluWwB1rGSfSkqxrSRAXzLp+G8j/5/AQToA=;
 b=r0y7T0XpMs5sL2SZzLse+uVgRXrkAa5bFtrqdyAbEKCaRm5TmFBYOhZv2MiUTpSoIki7hpKN2fFtYmnYFnKHkNR6GCG+uwy0rjJ4GP3zbGqLrF/9C8RhcL/lvUtQdOKmWnUEoa5uknC/Of7cFDeiUvrF+Zw1btT+R9p5o19EhSfkD0RLNO8ovY/QenVHdzquhSiigdvmgogRMCtyToWr9OV1OUQoqH/fUkGXeoWV5ldSW3XHyqPgQ5uzsOxIx4IiDMDLWsKTdi8WgIKj1GBp3kfRlS0UBlNt/WCon0HXHu5FqaAwlXp1uil8v3PWd+efWIIQ4VTwfn68tchjH7N1Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.99) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oB3jWMvDPluWwB1rGSfSkqxrSRAXzLp+G8j/5/AQToA=;
 b=a75I/RZofuarWVfcA4fwiXeNvDChoBsxVcDlA+UiFjDroijtzW8QdmtjETThOKz3caJEKb7syVzKiklpSK30AuuCmI0JanhTq83UiPx33+3dfUrMAnt0CVUO8T0O832vK/U//8YbwtrmCXobjp58Jb5hBudoBMSN1PD1AA89J1Y=
Received: from AM0PR02CA0159.eurprd02.prod.outlook.com (2603:10a6:20b:28d::26)
 by AM8PR06MB6851.eurprd06.prod.outlook.com (2603:10a6:20b:1d0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 06:43:55 +0000
Received: from AMS1EPF00000091.eurprd05.prod.outlook.com
 (2603:10a6:20b:28d:cafe::48) by AM0PR02CA0159.outlook.office365.com
 (2603:10a6:20b:28d::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Tue,
 17 Nov 2026 06:43:55 +0000
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
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 06:43:55 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.61.228.61]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Tue, 17 Nov 2026 07:43:55 +0100
From: jiegu <jie.gu@leica-geosystems.com>
To: Matthias Fend <matthias.fend@emfend.at>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	gujie <jie.gu@leica-geosystems.com.cn>
Subject: [PATCH 1/2] leds: tps6131x: cancel torch refresh on flash mode switch
Date: Tue, 17 Nov 2026 06:43:27 +0000
Message-ID: <20261117064328.4096518-2-jie.gu@leica-geosystems.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117064328.4096518-1-jie.gu@leica-geosystems.com>
References: <20261117064328.4096518-1-jie.gu@leica-geosystems.com>
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
X-OriginalArrivalTime: 17 Nov 2026 06:43:55.0021 (UTC) FILETIME=[03E3BBD0:01DD765F]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000091:EE_|AM8PR06MB6851:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 1fdf3a5c-a95f-4285-9d19-08df4476266d
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|61400799027|36860700016|82310400026|23010399003|11063799006|56012099006|10067099003|261021123027099003|261021121427099003|261009223027099003|261009221227099003|261009223327099003|261009220027099003|261009221727099003|261026121527099003|261102123227099003|18002099003|16102099003|22082099003|43062017;
X-Microsoft-Antispam-Message-Info:
	4fxegQmiWgsxjaabJ6UN9IeS/rV6A1VQWA7Z1rhpmCCzXtEvzmnx7XP5DluaYOAK7HujVaXl1Wp9ruoMTw6G9VAPKmMXGtjjDfHixDeyE1/FBCuttgRHlVGjCHFcXuvi0IU7C78e2eHAXVaSWReLgJ8P3SAHPXU1kTjjY0N4d0NwDzg57CxUnXjfV30I+jpF2wIcKK6NWdKpD5XV8o98eAdDKezeMaew7YoXLm0HJv5wQql0ybmwwqItIkg5IYXPSkaTI9iOhRlAwfFA0X1VrOh+H8s/f03KGJL+O5IXIcchooTZQVFwaBdXo0NldM0YVvwLaRefkOvlBxhQWJeiK+6YvIxyKl/XPZ3czCZ4vFTpwWe+ZnxMzd22o6HlMlO/o6OH1WIxDgyOSNgYh9bKihyzceZ2Lc7KQjYr1keHsUoTiqpWCybTULspgg9EEBVLOtHsd90PQpSIQrHjVyvHle8S79GS/rVanlMM1U3oOS69ZBCizPkZQbkJoAYzuDr0BSDszzz6oKU2zXyfbrrA4Rp/bIOt1T8JHMXeifzSt4wZ0W/bgYowWGLz9iISUMAuJFhfeoh5di/FVgtJuNWj48KveQfz+yigx6IRUEI6dXQ97EzPXt0l1GAscDXwYm/peIXOqQOOGiaRrSA7XcrbTQgHa0e8HCldzxABKe8MoTzfIfD02/k1FNrwyyc/pTjqVYFOEM2skbrA536oOFQiTNpVM9ppjgPPOQsVObwysebAjvPMun6m5ayKUz93/gdJ
X-Forefront-Antispam-Report:
	CIP:193.8.40.99;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom51.leica-geosystems.com;CAT:NONE;SFS:(13230040)(376014)(61400799027)(36860700016)(82310400026)(23010399003)(11063799006)(56012099006)(10067099003)(261021123027099003)(261021121427099003)(261009223027099003)(261009221227099003)(261009223327099003)(261009220027099003)(261009221727099003)(261026121527099003)(261102123227099003)(18002099003)(16102099003)(22082099003)(43062017);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xH+rfI5G2xiIB8LURbXZHqSbCs4MCG6H0engzt3ul+eARLeA6s6A/vg+QGpIHEFW89Z0H9qYc8C+5H2NB+W441OHJyzrsOC3Je8u18eah+1zaK7gjrKhV+9xL+51Rox5zRgtVVwc38J1CMJvTnv5xhoy9ePflRazmPGLWYpDjAWWike745Nl5B1elbNMSUMhoXL2WjzN82OENhyET8e4uYf5ZbpPcXLM6tF3OrIVwD7fp44h8mBTv7ZvHlDHWwPYD+Y6cOfsXv2gR1iYve1hliOuogViPDvSqIT4hf3WPlvNdxUAY3kb18v45B7SbXjImblcvMRSEfr/5W1TRlEV6Ake4YSU+68mUX/l1XG4cmftNToHr5TOHPpZjelmsLFnro92TR0KMTUH3nnlcN+zJURfk4gMu6axqvYWXwvrec66vLQyoGND9wTaYu9NA7Vk
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 06:43:55.0454
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fdf3a5c-a95f-4285-9d19-08df4476266d
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.99];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000091.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR06MB6851

From: gujie <jie.gu@leica-geosystems.com.cn>

The TPS6131X torch mode uses a delayed work item to refresh the watchdog
timer and keep torch mode active when driven over I2C. If userspace enables
torch and then the camera stack switches the LED into flash or external
strobe mode, the pending refresh work can still run later and force the
device back into torch mode.

Cancel the pending torch refresh work before switching into flash mode from
both the LED flash class strobe path and the V4L2 external strobe path.

Signed-off-by: gujie <jie.gu@leica-geosystems.com.cn>
---
 drivers/leds/flash/leds-tps6131x.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/leds/flash/leds-tps6131x.c b/drivers/leds/flash/leds-tps6131x.c
index 5c9a5af5af05..823e0462939c 100644
--- a/drivers/leds/flash/leds-tps6131x.c
+++ b/drivers/leds/flash/leds-tps6131x.c
@@ -378,6 +378,7 @@ static int tps6131x_strobe_set(struct led_classdev_flash *fled_cdev, bool state)
 	struct tps6131x *tps6131x = fled_cdev_to_tps6131x(fled_cdev);
 	int ret;
 
+	cancel_delayed_work_sync(&tps6131x->torch_refresh_work);
 	guard(mutex)(&tps6131x->lock);
 
 	ret = tps6131x_set_mode(tps6131x, state ? TPS6131X_MODE_FLASH : TPS6131X_MODE_SHUTDOWN,
@@ -697,6 +698,7 @@ static int tps6131x_flash_external_strobe_set(struct v4l2_flash *v4l2_flash, boo
 	struct led_classdev_flash *fled_cdev = v4l2_flash->fled_cdev;
 	struct tps6131x *tps6131x = fled_cdev_to_tps6131x(fled_cdev);
 
+	cancel_delayed_work_sync(&tps6131x->torch_refresh_work);
 	guard(mutex)(&tps6131x->lock);
 
 	return tps6131x_set_mode(tps6131x, enable ? TPS6131X_MODE_FLASH : TPS6131X_MODE_SHUTDOWN,
-- 
2.43.0

