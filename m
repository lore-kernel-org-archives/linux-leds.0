Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.16
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795161608;
	b=vFqZSiRAxpgLWdLSHbZzjPy1E4nXIRBsJNdBFF60KAkeyaWS8ak97hY2+qAJxM2E3RFV
	 wuwB9P6/9iCPc06X2YjDq6PA5luqVfm6qX1GExlyzkSbS4/4tBVNBl1aG8qlBJEtRqQ8Y
	 iZmg9ZARnrDHgbAXHYxnN22gWXfwX2WAbyxs/0m37e0KJqfYMQQBXWtoekKLKz40HJAQb
	 zr7sffXyeEtJN4WFoAWPp37v8lUktv5CpcyrZqbnmwB36t5JuQqAkhZmcnoM+YB4xQeEB
	 sRyIVhr3i+BsMdT2V+ZEv2aj2AlzbYkgLvZxmJTRBo/fUEVWgEmP58jVJNX6PQdGWMw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795161608;
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
	bh=yuODzxwVpT/hI0DRUgvjOFkvr4nXvEJC0FKGrEVUdGI=;
	b=wNrzd7VNexmEe+W5sf5sS3y5eC3GVABDpVUzhJ7/XmmyZxGqMBrq2a3Vl8Gb83GVX/rN
	 Gz4hn2XQPpIlt18vlgDkFRSFSdsbr9usNA6RzsiwnsG7lBrOu0wkUNJVKmdABErQ5GY9l
	 TL1bEjNDjF8H/frNZaGZfoSRL5PeGQDXAZ/WWSZeq5eqLgDDanVnIh053CXTlEFfYQXgW
	 3D/i+RXrzVyHnsY9h4nE+X8RjhaAX9/yWF2gD4FEkScG256hNNDibtQUlWOdrDEH/Cvcq
	 HeKH2dcORGuZqBYinHFb+tnggb6T1gD6nov3llKXTygeIwKrgQ1t2dRe97MynVmDyhg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=leica-geosystems.com;
	spf=fail smtp.mailfrom=leica-geosystems.com;
	dkim=pass header.d=leica-geosystems.com header.i=@leica-geosystems.com header.a=rsa-sha256 header.s=selector1 header.b=QIddOgFW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.16
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010016.outbound.protection.outlook.com [52.101.69.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53FA3606A331;
	Fri, 20 Nov 2026 08:00:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53FA3606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.a=rsa-sha256 header.s=selector1 header.b=QIddOgFW
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iURc096EbH31PmjcLBqWg/C/br24AEASQrje3hcgccpEQbAHA8+f29c6RTYjWOxwk4eu9Fl06aBhR81xfAjXsO6xQm/5YCPvhOOo3XLbK4WmhUK2BQdNHek+OXRe90lKgQegFgE6YWBZ0JwoQRKMw61ao8DNN990PPFDVE+DR3TUZ0sHI+KEuWtvJvtusyIpzT/i0hlsaknKALrcAWwE8PJgAlxIpW6IdaWp3chRbyGd9hVcnoJumtLZUrCVar1yPAPH0wqUHjgKx8IsaJCWTbgMph7J2ilEAFt4lHRGN4enVHRtwdazM8t4wJWrTIlr1ivkxGE3JJIErTqbojMEfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yuODzxwVpT/hI0DRUgvjOFkvr4nXvEJC0FKGrEVUdGI=;
 b=bSrXcerTlMuRNBnyC2PfiNj2Yui72WozhplCAt1iV+lh8IPOKPmms0sEH3rwAFJnbV6JcxaNBCtVkQIT3LlgA0iEMbE684QIl1e0fEjjVjJIysnmxLOWc1gT3nudhHhDRACvxCnmxx2v1fbp3uZM5+Tzhi0RO3hbJO3Bl830M4v1K9SPr6kPFEqjgz9J+dEixI5gICYzdHfegtEtRP3huOO7K+unhNHLXOVGs5Yy46u39ndkiLSLOJMDYqrFm842O321VA+7Ttfy0vW/orIK7/nbnhF5watxqAic54thec91CuDVJaLKakmE/2UDKefeQkCTWkQUM0eeCISplg09WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.99) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yuODzxwVpT/hI0DRUgvjOFkvr4nXvEJC0FKGrEVUdGI=;
 b=QIddOgFWJ2z92wMbAVe7JvsaykMohVb4OB1DxCvnIKlcAjEMxMX6L5a9nBJjI2Wg1crQLif3Fl74GvJHyfycAjHEOkVDbD8nXJJ0zgi2xhROOTB+OyWfskAOvk40uRLwSN7ymsrvd7XkP/ueZsv6W9Knj+VZFgDNa1kY/ONEEmI=
Received: from PA7P264CA0079.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:349::14)
 by MI3PR06MB809822.eurprd06.prod.outlook.com (2603:10a6:290:200::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 08:00:04 +0000
Received: from MI3PEPF0000855B.eurprd05.prod.outlook.com
 (2603:10a6:102:349:cafe::7f) by PA7P264CA0079.outlook.office365.com
 (2603:10a6:102:349::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.12 via Frontend Transport; Fri,
 20 Nov 2026 08:00:04 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 193.8.40.99) smtp.mailfrom=leica-geosystems.com; dkim=none (message not
 signed) header.d=none;dmarc=pass action=none
 header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.99 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.99; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.99) by
 MI3PEPF0000855B.mail.protection.outlook.com (10.167.240.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Fri, 20 Nov 2026 08:00:04 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.61.228.61]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Fri, 20 Nov 2026 09:00:04 +0100
From: Jie Gu <jie.gu@leica-geosystems.com>
To: Matthias Fend <matthias.fend@emfend.at>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jie Gu <jie.gu@leica-geosystems.com.cn>
Subject: [PATCH v2 2/2] leds: tps6131x: Clear torch brightness cache on flash takeover
Date: Fri, 20 Nov 2026 07:58:59 +0000
Message-ID: <20261120075859.731257-3-jie.gu@leica-geosystems.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120075859.731257-1-jie.gu@leica-geosystems.com>
References: <20261120075859.731257-1-jie.gu@leica-geosystems.com>
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
X-OriginalArrivalTime: 20 Nov 2026 08:00:04.0422 (UTC) FILETIME=[26B43E60:01DD78C5]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF0000855B:EE_|MI3PR06MB809822:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: cc8fa6b3-06cd-48b4-5abd-08df46dc4945
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|61400799027|36860700016|82310400026|42112799006|10067099003|11063799006|56012099006|261009221227099003|261009220027099003|261009223027099003|261009223327099003|261021123027099003|261102123227099003|261009221727099003|261021121427099003|261026121527099003|18002099003|16102099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	hZpjZ0peWDr/3qxyBJaa8kdoPPilThICxUkAR8UxcrUbhqQPuaX90Eh6owJG3CUCrwJ0ukX/oFLVfQD4vXFxEyjvnRCdjKH68BTl2W2dyrIpbVhllajqoZ3tuqYjpsQ/J5Bqe/1GObNH7DOLMmTR4T4wbIvrMOPiVGK4iozGOggqvDxNq6CyUh2/XfQSw/VfJp3FsgjfOl9a3acA5ZYSF4OdK8gEYyqvFSeydBLdk7ESMArFHds5QeBGCFsI8XLnxCWR1tpIanVIUyxTVvqXxiws/xBrhDzj74Sge4Xzwyj3OKfzqs0uS7D0e02yVlza8of8zWg8Y6nOltK9+FSJhyY62xK0Kq+JB11apEIW7QFiVDrVGrUsIifi88cqGv6H6yfDUrVRIdlLQVycAMqnMffLn2l7+zhQMEkaq5gf2H+qpessRdqgG8Jg1Wat1hvYDr5oFfZH+q/vuUcipHl/6M4xlRODL0ZOGUy+GjXgkakF1K9NpIHBu1yZ/vfAapA6/8/qg8Ib8Fm0nsRj8tLxC2BjRM6vRxZs5IbdazBxtgnm42T6vHNK1NCsTi4KvRuqGSkYQ0p59A9TyvUCGwJvr6lJumUQQKM5/MR3COkdO0QwPgEVAPociqPJ2COXg9DBM203i6u/zg6558hs49jvYczqZ3fQj2jB2GLuC4ChML2wvIxeMneGApAkK+ZsTyErfyDsGUF7k+UtBzbwOzb0Sg==
X-Forefront-Antispam-Report:
	CIP:193.8.40.99;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom51.leica-geosystems.com;CAT:NONE;SFS:(13230040)(23010399003)(376014)(61400799027)(36860700016)(82310400026)(42112799006)(10067099003)(11063799006)(56012099006)(261009221227099003)(261009220027099003)(261009223027099003)(261009223327099003)(261021123027099003)(261102123227099003)(261009221727099003)(261021121427099003)(261026121527099003)(18002099003)(16102099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jkI1ldgAKFZE5H08LTSHP3+h/I6UEJ6p+lvsqJXtxYRmpbf2g3PQsRYaK9FzHW5BiOLOHkc/03ZFAJC6ZPV1h9KHuUai11hf80QkMyXYxdi2/oCmFxfe4qOeoJtVcqWxpWg1kmpyhx2Y87UdzOkOFEmVA4GKmQiJsxDFtXGexI7JU5W93d1JU+mhLQzUoXX9OXOh/QGbmog0tMz9+R7Ssv/6/Wx+HaqbsOs3Q+m3uyommASj0lFDKoZCmkh8BjvVUQQZVTwuAHtIXt5c1ECeRfEZIdbLYmhs9/iwf360442bvEtK1ynNi2xAU0TkluJqukby0EeEoYpYJbBOXypzkNzDN9155hxCHmzGknooFsrQiAtfcga9TjQQY7kxtsdokNGBJ3uI3+FX2l8pEaRiVWuKATwSw9cWOaelhJr0MEKZzWF3XdcG2RLIeXkItlvO
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 08:00:04.5502
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc8fa6b3-06cd-48b4-5abd-08df46dc4945
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.99];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MI3PEPF0000855B.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI3PR06MB809822

From: Jie Gu <jie.gu@leica-geosystems.com.cn>

When the device switches from torch mode to flash or external strobe
mode, the hardware torch output is disabled, but the LED class
brightness cache may still keep the previous non-zero torch value.

This leaves sysfs brightness reporting an enabled torch state even
though the light is already off.

Update the cached LED brightness to LED_OFF when flash control takes
over so userspace state matches the actual hardware state.

Fixes: b338a2ae9b31 ("leds: tps6131x: Add support for Texas Instruments TPS6131X flash LED driver")

Reviewed-by: Matthias Fend <matthias.fend@emfend.at>
Tested-by: Matthias Fend <matthias.fend@emfend.at>
Signed-off-by: Jie Gu <jie.gu@leica-geosystems.com.cn>
---
 drivers/leds/flash/leds-tps6131x.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/flash/leds-tps6131x.c b/drivers/leds/flash/leds-tps6131x.c
index 823e0462939c..21957e4e3db4 100644
--- a/drivers/leds/flash/leds-tps6131x.c
+++ b/drivers/leds/flash/leds-tps6131x.c
@@ -398,6 +398,8 @@ static int tps6131x_strobe_set(struct led_classdev_flash *fled_cdev, bool state)
 	if (ret)
 		return ret;
 
+	fled_cdev->led_cdev.brightness = LED_OFF;
+
 	return 0;
 }
 
@@ -697,12 +699,19 @@ static int tps6131x_flash_external_strobe_set(struct v4l2_flash *v4l2_flash, boo
 {
 	struct led_classdev_flash *fled_cdev = v4l2_flash->fled_cdev;
 	struct tps6131x *tps6131x = fled_cdev_to_tps6131x(fled_cdev);
+	int ret;
 
 	cancel_delayed_work_sync(&tps6131x->torch_refresh_work);
 	guard(mutex)(&tps6131x->lock);
 
-	return tps6131x_set_mode(tps6131x, enable ? TPS6131X_MODE_FLASH : TPS6131X_MODE_SHUTDOWN,
-				 false);
+	ret = tps6131x_set_mode(tps6131x, enable ? TPS6131X_MODE_FLASH : TPS6131X_MODE_SHUTDOWN,
+			       false);
+	if (ret)
+		return ret;
+
+	fled_cdev->led_cdev.brightness = LED_OFF;
+
+	return 0;
 }
 
 static const struct v4l2_flash_ops tps6131x_v4l2_flash_ops = {
-- 
2.43.0

