Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.58
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794897841;
	b=JIaZh3QLk+sQlIgAjIbc8WatHVR+6bdO3ke0VYJ/wPFTtN43S4RCxlu2IVDdKVadUG5n
	 87ZHBR317VBcezyI3RAoj+lPHI2chMaoKzwtVrCMelujQ2LTuMd5tDh5j7C+duycSm4fD
	 AzeZXIwcXhD3Df5k1zfJayswZq8Z/zr7R+cVR2gxKH4q2JAAQJ5cBRoaT0QrwEBoyHraP
	 WAPsu6JkhaWLKEebSr7uE9ClkokKptlIm4nTMAfwsU815C+J5fTgr+Ar+cpWrtsOYvoJd
	 fvUlgS6bmn+op8ZZKH0yKh1b2/+jYu+VuJ+ybjcUS+KXNX+8U5T4LASy5VXfWbGS3OQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794897841;
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
	bh=0u2PuPNVO3nTAQcaPsd7bGTquDyctWW/0JCudtITLd8=;
	b=ocwotKc8G0KAqttFxCbcyDIMw6wsFDfqfpY1QkJqUmOnz03YnIgkuSKByA7BVu/UxmwX
	 6VOoYW7RsHGRT5ZjQKfqeLcvnOUWlzZ+E+bsYLdyhAS1mSGsim/iwE9YSQhjyy4avBnZ6
	 w+afG10MLjhlAychC6+8H74Cg2DgxGNcdgrcpJT61I0lZP1lLgqPQ/yaB5y6hOB9D+B9p
	 Xe4ReXTPXGVo6qWq04dhCkipCvYehEu+xg/AETSolN2p64SUzia5WVbFg8XqT9QaMBu2/
	 n+kykiFCnafQbh7EzsPfbXzk90YQwfsebqG/sHbF+r/wwCKlRATKcIkh4Y6JkBa7B4Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=leica-geosystems.com;
	spf=fail smtp.mailfrom=leica-geosystems.com;
	dkim=pass header.d=leica-geosystems.com header.i=@leica-geosystems.com header.a=rsa-sha256 header.s=selector1 header.b=G8KggSnL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.58
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013058.outbound.protection.outlook.com [52.101.83.58])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6A7606A338;
	Tue, 17 Nov 2026 06:44:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C6A7606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.a=rsa-sha256 header.s=selector1 header.b=G8KggSnL
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jWSeCSn0o7xXQKlGTqUecDaUuJai2GL3Oueshm76CLQh1d7NhAvh6V8TUxuAzzuy+i3NjzUP0avCdj4/h377vtnqddDvab+moHn/tILJfMmrgI8n9bzMUjLwjqYZOQBKtfeMrvyTlMwfeH/S/Tjo0dLKXQ+LhBTIbfmsEzetDGrpW7aVVRMQLDWzlYEYvKZYZf2kh/qAvHBVVGZdLISIVDOm8COLijPUEm4H7pf7hI0wfuQhTVu0UU3yVc+x+GgprvsiyAVhZadQFRJzDtueyu1NAfh4sx4+tDxhGGTJLXtUfi6nRqf+OCXK/rZRmc0cIUrJ28ATvqPEYH9C23jN2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0u2PuPNVO3nTAQcaPsd7bGTquDyctWW/0JCudtITLd8=;
 b=b9u/jKkxFgChJvlPNOsgU1AlHjQ2Kkml7p3QZxS1Rp9vRFb8KuZeI5mQtnH8k5fm7AfXdXCKASF2daniZHzye8luRhTmhsXRkVPV0qtAV+jIYYgbLP9cjdZlDPy2pb1j0KPBoWbCD/6OPU3aXKdE9rIUqBIHzXF3372fBvJabDM5CuBtivlutRmEyMNFuC6igmsx/J/zaAEscjPlDOD4CQWiLizaUli0xJ0+jxTld8K1+lJjNEcSyzYEANdoPN65X8dQliyq1gZQeV+znF6KI2wt74gX+pSYrRELVJS5mvVIQjx53BzkLXzZgZ3UPBQBDNDtHkdlFujCAb8Ih/nOZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.99) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0u2PuPNVO3nTAQcaPsd7bGTquDyctWW/0JCudtITLd8=;
 b=G8KggSnLc3xocLib0FI5gKLJttudhbsEVugWh9+xyqDSVSQlXQvKUhfBTq7ILV5+DJKFp/5PmoBMg3FtLZicpJQuMQcKj8NQHeGb0+Wx+IY0yLT6oI84G9UEyCg3QdVXQI7jn+MKPQYkt8yvg5SRJeUXO6DJSEWXXsqHi5wz3M8=
Received: from AS4P190CA0010.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5de::20)
 by AM8PR06MB7649.eurprd06.prod.outlook.com (2603:10a6:20b:356::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 06:43:56 +0000
Received: from AMS1EPF00000094.eurprd05.prod.outlook.com
 (2603:10a6:20b:5de:cafe::5a) by AS4P190CA0010.outlook.office365.com
 (2603:10a6:20b:5de::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10 via Frontend Transport; Tue,
 17 Nov 2026 06:43:56 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 193.8.40.99) smtp.mailfrom=leica-geosystems.com; dkim=none (message not
 signed) header.d=none;dmarc=pass action=none
 header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.99 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.99; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.99) by
 AMS1EPF00000094.mail.protection.outlook.com (10.167.242.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 06:43:56 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.61.228.61]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Tue, 17 Nov 2026 07:43:56 +0100
From: jiegu <jie.gu@leica-geosystems.com>
To: Matthias Fend <matthias.fend@emfend.at>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	gujie <jie.gu@leica-geosystems.com.cn>
Subject: [PATCH 2/2] leds: tps6131x: clear torch brightness cache on flash takeover
Date: Tue, 17 Nov 2026 06:43:28 +0000
Message-ID: <20261117064328.4096518-3-jie.gu@leica-geosystems.com>
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
X-OriginalArrivalTime: 17 Nov 2026 06:43:56.0693 (UTC) FILETIME=[04E2DC50:01DD765F]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000094:EE_|AM8PR06MB7649:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 2e3dc295-cdff-4710-e556-08df44762773
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|82310400026|376014|61400799027|261022105027099003|261102123227099003|261028144727099003|261021123027099003|261021121427099003|261026121527099003|261026140227099003|11063799006|56012099006|10067099003|18002099003|16102099003|22082099003|261009223327099003|261009223027099003|261009220027099003|261009221727099003|261009221227099003|3023799007|43062017;
X-Microsoft-Antispam-Message-Info:
	ZIysNjxGqh5MRDhTG7HD/YyVbNi9ZDDKs8cGexF0pHSkPygsax+3IThOPH7UGpFmOTpdALQwsnjbeFb+RhVv6AX/CwubMVV8AIaW6DxH9Rh2ylLlmio30hW8TeRac2TNeqYbDiNVwO7FXnjWoB50zY/ChJf5b0nUu8R528tF6DsXzoCMVPJn6qnA7vveOXC+CoP8pVhjXLY/IT0zhI0OxIB0rkGxzd/Ho/e8c4dpzYF9mKIPk28VtmpeC+bTnnSv/Jji36AAVG/uJs4eDaJREKjaqdzf4JJLe6ZeYTJr5HTtsKLBbQRxyhVLaMcU93dc9qAjWHDHlfnoO8bdIvDExrU0qhqI45yzoKAvGeZ2KiAQumDYa6RoimpvgMyOlPTWYi7pzmVFMHxJBn1rK2n830vzaSqupkffJwtqFKp4yf1rG1rMOin/kT/ES/rsSrGjkuvE/f1GZAGXcQoylLCeslSDgUKkHE6SOsiwxs8sJeoqDe2Qe+YkgSDKVdRYBJw1dq805bKOI9WBVcMfGX+hvKCrikZ0rLSbnnTkZlwF5hj2MqkA92qmz6m5peX4/tm2Iykwyp5VYabzMSuRN+rLOTJ1EMmKgW1LoTBnHaYjkqXRDuaxDUBvIrVoN6n/Si79+V7//jgLKzSjUoW6THdE9RVHM5pmZy9XswPFbdLiv3RAy6e3W9U3qZoWDsDUT9JftLnF4bYuCeimXraJF0iafrAgSHZ1Wt5M3ISgMZqqmb8EsAK7UEI4pe6+9jeiRfwo
X-Forefront-Antispam-Report:
	CIP:193.8.40.99;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom51.leica-geosystems.com;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(376014)(61400799027)(261022105027099003)(261102123227099003)(261028144727099003)(261021123027099003)(261021121427099003)(261026121527099003)(261026140227099003)(11063799006)(56012099006)(10067099003)(18002099003)(16102099003)(22082099003)(261009223327099003)(261009223027099003)(261009220027099003)(261009221727099003)(261009221227099003)(3023799007)(43062017);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	sLRSg25899JdF18GBpd9GTnBwlUbODCsepVoqTjiGEjKjmHWG0XkrDCrEKkN2938fUrqurrGg3B34zDGxuSIRmqEciVnxd6e0Ac4k+quE2VhdaCdDSTil9KKPGrDsnOddYOcwp2y2RPiXT/CizUiFlhxA9zc9Q4BwU6or3DlOwHFJNAHP5CSupPOKDhqC5xfqJNwuKIVEMcgV5PTOcmNenjNIPrsRM66sBjt7gucHtHQaOjLJt7AKwSBszxilkfqFGA2qD+ollX2SZt/ubWWi+f6cJMMkzb7sAc+yozBzDaeag9d2nj+Vo8NGt9RYyx3VBITkowF9z1whnh7Wd3jUaqS6f/TdeEbI06ethJo0BzMRWYJXXLsQ98zSxvP3FHVO2044j2PEW5/ck0BaK1hwlWrBOWASIOktliQhUoclh2mrtjoLJXuR46Xk2/G51Lo
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 06:43:56.7722
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e3dc295-cdff-4710-e556-08df44762773
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.99];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000094.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR06MB7649

From: gujie <jie.gu@leica-geosystems.com.cn>

When the device switches from torch mode to flash or external strobe
mode, the hardware torch output is disabled, but the LED class
brightness cache may still keep the previous non-zero torch value.

This leaves sysfs brightness reporting an enabled torch state even
though the light is already off.

Update the cached LED brightness to LED_OFF when flash control takes
over so userspace state matches the actual hardware state.

Signed-off-by: gujie <jie.gu@leica-geosystems.com.cn>
---
 drivers/leds/flash/leds-tps6131x.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/flash/leds-tps6131x.c b/drivers/leds/flash/leds-tps6131x.c
index 823e0462939c..4f708cf56178 100644
--- a/drivers/leds/flash/leds-tps6131x.c
+++ b/drivers/leds/flash/leds-tps6131x.c
@@ -294,6 +294,11 @@ static int tps6131x_set_mode(struct tps6131x *tps6131x, enum tps6131x_mode mode,
 				       NULL, false, force);
 }
 
+static void tps6131x_sync_torch_brightness_off(struct tps6131x *tps6131x)
+{
+	tps6131x->fled_cdev.led_cdev.brightness = LED_OFF;
+}
+
 static void tps6131x_torch_refresh_handler(struct work_struct *work)
 {
 	struct tps6131x *tps6131x = container_of(work, struct tps6131x, torch_refresh_work.work);
@@ -398,6 +403,8 @@ static int tps6131x_strobe_set(struct led_classdev_flash *fled_cdev, bool state)
 	if (ret)
 		return ret;
 
+	tps6131x_sync_torch_brightness_off(tps6131x);
+
 	return 0;
 }
 
@@ -697,12 +704,19 @@ static int tps6131x_flash_external_strobe_set(struct v4l2_flash *v4l2_flash, boo
 {
 	struct led_classdev_flash *fled_cdev = v4l2_flash->fled_cdev;
 	struct tps6131x *tps6131x = fled_cdev_to_tps6131x(fled_cdev);
+	int ret;
 
 	cancel_delayed_work_sync(&tps6131x->torch_refresh_work);
 	guard(mutex)(&tps6131x->lock);
 
-	return tps6131x_set_mode(tps6131x, enable ? TPS6131X_MODE_FLASH : TPS6131X_MODE_SHUTDOWN,
-				 false);
+	ret = tps6131x_set_mode(tps6131x, enable ? TPS6131X_MODE_FLASH : TPS6131X_MODE_SHUTDOWN,
+				false);
+	if (ret)
+		return ret;
+
+	tps6131x_sync_torch_brightness_off(tps6131x);
+
+	return 0;
 }
 
 static const struct v4l2_flash_ops tps6131x_v4l2_flash_ops = {
-- 
2.43.0

