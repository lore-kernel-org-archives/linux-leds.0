Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.71
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795161607;
	b=LltB3xAn9A5ob22vRnm4MucbHKouUFys29NG4TQMn+hAeDE2N27ywpUAU8VIW4n0Wcox
	 QKz9R1lDje+Y2wzf4Ycq6YHNjLbIQsy3QihmtTHeuj6OGhPcKHIxrSOyfvioQuMxUBxYh
	 dzo/o0fQlQhtlaJdcwBOnAi2/9glMngNkW5pXt8FECySX30cUR8KEGL2IYe0WZA1k24nm
	 CgDWA+kbzgcfZg6D+Ove4+liFjyDG6JuLzR+mhSMWTGuhl+WBmFy9tTIbvLI71NbbvGJd
	 Leere64gEQV4UbhSsyvFVtWTu9paUO1uNo6avwNx+WyEez2QcshOz9GdZa2+lFJhx7A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795161607;
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
	bh=etELiB/F93zZEuVuLcnBQISiCS0q614XYvFq1y12bMo=;
	b=Ml/SzoA4sMIScFLBS4HSRc6O2ohUCtzml2zM4wAm62igIUDhRMep42Yk+mMv8BFC2VKw
	 fsxq42mVGFzTdy0KqLxJs4uda/nkxC7qjRs+mm08/q1BHncU0MaVOnnW7+dHZzSM77xMT
	 M+BEY6nNqumVTvQMtE9k5p9Pw13Tavem6q2TkLdo6QZNwiConoFpnvpM6MYdC7qpabbIR
	 EhjwduGiFkWVeQUqa9lanjNr3p8NHj7mKkT2GKFQ+ABiXzUci9jjQ2RlqMWISYR8OYZiu
	 rRtRpEgWyTzn+ylzfVYdXIWUJmWCub1fGOxGZlVm4OMNNYSOLWXt40n32uy/2gh4asQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=leica-geosystems.com;
	spf=fail smtp.mailfrom=leica-geosystems.com;
	dkim=pass header.d=leica-geosystems.com header.i=@leica-geosystems.com header.a=rsa-sha256 header.s=selector1 header.b=nvicPLH9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.71
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010071.outbound.protection.outlook.com [52.101.69.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A9E606A325;
	Fri, 20 Nov 2026 08:00:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45A9E606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.a=rsa-sha256 header.s=selector1 header.b=nvicPLH9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qkhqjTO5CqcqtTMzACgXn1+DyulH5zDj65szKX5yGtkgpHIQiy9cNzXiERDTBZ6I+D0/I/LA06Kljr1owNqR/VerJN7kmtY5hkWuWG8+PQahZ82FpKzpkrbsz+AO0L3JlyfM+/ucP/fDuGNczdAMT3WpwgWlnUF0/sMxmm30rKMpaxQ0MmdCfGnaZxWDoJI0rzkfAgVMdra3SZOtKA2bAHynShBuh3rE4V54ZOMRBO29xezXRXmBblsd8bYfNopP6lZAS1mzaYk0XCqlEh1G0ItjtpSfMzzmPnV+APPDIsYciT0eSNFC7SvQU71aJaLdAGzBEpzfW6z3muIof5Bs/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=etELiB/F93zZEuVuLcnBQISiCS0q614XYvFq1y12bMo=;
 b=gStNogjuZ8eqLhcs57HuiexLbOt8WIz1/+aDdLQLfCMKq7oN7eIuN1zLJIHkeGFPLzpRNJMybb/e0F/QBpTJoIcJ29lRLmccRcj2/3zeYh/A6UQuQv8AB9QOP+UxxctTYzjbgqrgFZUE+NITuvM1iWDi/oaEpDTgwABQ0QSOfiajIkMyhbCufs3M1d7AhWyzdDfc24k0cN91DT0yhHpz2J0ysvzIgVQsEA/FDm+8jq3ijxwaQZ/g7UceXQZHhErpzNyh8Em+PCQhw94ZPdH/Up8YvFEkyUEaZZYMzw4sSuHKAcArMoYNFKDGb/IwK4uufU7CSbuiZTkH4RIBmc/YXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.99) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=etELiB/F93zZEuVuLcnBQISiCS0q614XYvFq1y12bMo=;
 b=nvicPLH9EUMwVrTbQiQb1fDImfMWyqfO6GmFZKblEV3ee1cZM9RSp6MptLmg3l1bVkNL8SevsR9uiw0maLxca2huzBsCvOyLPzdQXCNX6ofBf/1kqI5ZGfAOIfX8NfzIWXuidWJFfZlMt80PX3tOU1yXpVABOrOVBFh1Qpajr6A=
Received: from PAZP264CA0011.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:21::16)
 by VI1PR06MB8949.eurprd06.prod.outlook.com (2603:10a6:800:1e0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 08:00:03 +0000
Received: from MI3PEPF0000855A.eurprd05.prod.outlook.com
 (2603:10a6:102:21:cafe::39) by PAZP264CA0011.outlook.office365.com
 (2603:10a6:102:21::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.12 via Frontend Transport; Fri,
 20 Nov 2026 08:00:03 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 193.8.40.99) smtp.mailfrom=leica-geosystems.com; dkim=none (message not
 signed) header.d=none;dmarc=pass action=none
 header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.99 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.99; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.99) by
 MI3PEPF0000855A.mail.protection.outlook.com (10.167.240.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Fri, 20 Nov 2026 08:00:02 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.61.228.61]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Fri, 20 Nov 2026 09:00:02 +0100
From: Jie Gu <jie.gu@leica-geosystems.com>
To: Matthias Fend <matthias.fend@emfend.at>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jie Gu <jie.gu@leica-geosystems.com.cn>
Subject: [PATCH v2 1/2] leds: tps6131x: Cancel torch refresh on flash mode switch
Date: Fri, 20 Nov 2026 07:58:58 +0000
Message-ID: <20261120075859.731257-2-jie.gu@leica-geosystems.com>
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
X-OriginalArrivalTime: 20 Nov 2026 08:00:02.0750 (UTC) FILETIME=[25B51DE0:01DD78C5]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF0000855A:EE_|VI1PR06MB8949:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 481e97d2-cf6f-4888-0bed-08df46dc4852
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700016|23010399003|376014|42112799006|82310400026|10067099003|11063799006|56012099006|261021121427099003|261021123027099003|261009223327099003|261009220027099003|261009221727099003|261009221227099003|261009223027099003|261102123227099003|261026121527099003|18002099003|22082099003|16102099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	vEuhVUsxbR8I9sx/3hvLnc6zgcDVoVO8wQpSgsrKAWqQ5kty3BEcnYWpBzDM6fhkucBbCauVS8mh/tdsRUXyrgcwboyPt0ZxtMIJOrcS38uS9X+SqLAdGecgnNGcL0ioCm9xIuGZOmgohxk6BGDrFz5ayinZxJXTVT+wKgVuDHaYJKEGOFBRF/kxWk6Y2FBlgemnlx4oP8lo5oxgR4PnMJigbdaSPNRES67eN/fEdy801U4jx+t/YHfs3M1rmtO4Q66vn6zxrkyuhEwv7R2K5Y00HpzS3UeIgtIN5pH6h8c1FvYOzLNUI9xCFvZ9K1kC7Ej+Hq/FhnlI0YG3lQXgA8wsV3UybYSD6Zq06EfSKCLLe6hR/DPs4Ns1v16nLVRIBc6rMep12UVDJXb4BNLD5i0hYFI84UXRfLH3uR6PxdTRJvIjQVoVR5pmOaqToTsr2+3D/1hsycT+RZp4wkbcezw0jlwmBE8rZ5cvzE6KMA5Bje10gsHjmvtYH2bwG/KtA5TodE9zQyHqprtWHYFmODONmdZtFzANqaBudxmgKQrffeQ0wHhomyrXNZQZV56z2gmzPPv8BF2EJX+PZs4B0eRUm663owpoNMHXsoxxifTPD7ZW/eN6lCwxHoM+Q8XZKWgPrLBbzrXCL6v3BEfpXVgDCe1o9q12aQCemqbnbawpZ6xtz2OqP38BlmI756WV/+JvUQeOzwCDTSZ83y0cIw==
X-Forefront-Antispam-Report:
	CIP:193.8.40.99;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom51.leica-geosystems.com;CAT:NONE;SFS:(13230040)(61400799027)(36860700016)(23010399003)(376014)(42112799006)(82310400026)(10067099003)(11063799006)(56012099006)(261021121427099003)(261021123027099003)(261009223327099003)(261009220027099003)(261009221727099003)(261009221227099003)(261009223027099003)(261102123227099003)(261026121527099003)(18002099003)(22082099003)(16102099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/GcocGvYOdRSKx+aP9PCYjJ3euj3Ba8EzmICurN/mT99x4HfIQA84qq8v3hk7DNBo47onbQ2CjoUVLr4NS3eo9JB3F+o+xER0K22vbQcoTzJDr9J0Js0OOqbbeAlZfZ5TO4DD/4zAMBZHRasw8V/2kODzs/2OPAFux9g9pFm+AZTYxH50S57PSEkBBiVEOAFxDePrKjY26WaPDjlOeH5P2NPreqBlAp5l8ZFF2e7oa4QSLrqgwO7mix9YeXbalNjL4YPy+QmZFuS7bv65KM8GVQ/M/sW2g0EyxVY5UTksvqVE4gcfUFWFMNtu2nvxMEYSZCTsuHwTUBaKkcHa+a2vAIo6oGTcYz3EbN/0pooPSQPMrMxZi2dULX9VMfCR5v6Wq2PXGWszPcWvWS+nMTB3qS9OuIc7iHlKp3FU0MnvtFZPp7Cd3wgq9trDF5GbwLa
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 08:00:02.9246
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 481e97d2-cf6f-4888-0bed-08df46dc4852
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.99];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MI3PEPF0000855A.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR06MB8949

From: Jie Gu <jie.gu@leica-geosystems.com.cn>

The TPS6131X torch mode uses a delayed work item to refresh the watchdog
timer and keep torch mode active when driven over I2C. If userspace enables
torch and then the camera stack switches the LED into flash or external
strobe mode, the pending refresh work can still run later and force the
device back into torch mode.

Cancel the pending torch refresh work before switching into flash mode from
both the LED flash class strobe path and the V4L2 external strobe path.

Fixes: b338a2ae9b31 ("leds: tps6131x: Add support for Texas Instruments TPS6131X flash LED driver")

Reviewed-by: Matthias Fend <matthias.fend@emfend.at>
Tested-by: Matthias Fend <matthias.fend@emfend.at>
Signed-off-by: Jie Gu <jie.gu@leica-geosystems.com.cn>
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

