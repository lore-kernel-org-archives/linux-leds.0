Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.12
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792592953;
	b=000naV3HrOA18fcRS3TDS+MEiZJoLKhFQMxlROVbSBO+5QGnunELkjccV/M1vt05gCKw
	 AsV9iC3iSh+rcU22vXXlB9oocRjvHXnwsBUzlsMzt1jgIGfcy0qSucISAK5lEDftQdOwB
	 k4/Y9wkFYNN92mys0cXN0OG1KPX2jZlUCn6E0ZjHjBz8+NAvYRsINhzvUIBAx+anjnmFN
	 bzcOu6ejdTpEw3rqx/QD0tKAMMvivUGqsZu4z7qS01IDtJ+9m4mneqj1DuvWDREBMkDuC
	 BJPrIps3EMaRNVpLqKfdIbM0fuIc969gKbjLztbSP2SdfCQEHhD0wshsfVPnTJw7WKA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792592953;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
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
	bh=qdw5WGSgHnKV0cTvgRImIGPtsxZ/nU3yOXn8zaU25to=;
	b=Es+AiPO5MAygCbxAVR17518TVgBp8Xxd/3F4wJATbXLKQyBOMymeFV8CLj8SIngw9s91
	 c92qm6sj/y0mNgP34+tbCisn1yLR4y/3cueEyLtDk7h8FRHmKtRT9wr+oUDT+YMW3CsU4
	 rG76Ax+SCXLXm4nd1zP3OIORZJ1gVoPb/wjvPRZBt+cyr0MhRaViezdLM2ugG35dRWfvQ
	 fTsBO0TALY0avtOAMZ6w9/OC1+/28a1MrbSuSKZ1bN+ruEPzzxs2EDKsECcREUdNqlffw
	 mDzsrPFFG6IkzHwTosAipfpTARvCxNs2Y41yWnFO63Hb3vfWLYcf4mG8ebeQEjQm9WQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=bsr6P7bv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.12
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013012.outbound.protection.outlook.com [40.93.196.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE33606A31B
	for <linux-leds@vger.kernel.org>; Wed, 21 Oct 2026 14:29:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FE33606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=bsr6P7bv
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K6LVoEzpWAfJZ4gc/mNkGVGpIizp1M1HxyFkRi10JM6NFebc5s+l5tnGR7awJkzr6kIiiGjmpAftN9Fo9HAk4aQjjCTeLmuhdhFwyKHczWHQFvQfcB35Ca5Ijm9cX6cLyVeqvmMDSVxyD6tjgXSORo9p1NLT+zPHYZ5Ehw+u5PAV9F/Hdx6YMSFvn+HkL/Ve0ghby65g5kfCmJuFFmTvGmiRH3SI125FqPTIhqRiRUs9tMpwSw8ZPEksto3+eGcMY3WQH8wyfjF48uz90oV8/n3aI4vGT2gR079dopTzPMvY52TB31w45aL3DLODqujJY/gNh262XMe2RSYpAEmn2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qdw5WGSgHnKV0cTvgRImIGPtsxZ/nU3yOXn8zaU25to=;
 b=vjD2smQLZe7JjOlr3xaJtV2ExMCCSomTiHxF2Z7GOBim0rTnJkDIIdAwbMdOlmFvh9E0bug32OtM/VyYqpqmvJrcVJuy+JqpEBSPcylTfKqDpUyrOTt21L1yWe9c1WkBMl6AnBum5WJHgKrxR6lpwM+/pCenB6kk1l9GIGpWQULZaWzwI2cWNOd6HT3LttGWgM/PnrDLi9YqIKJqT4MT+AqvDZkXqeZQYF8UxM1UoK320dUpl+S+zVXx0LjexFvXA8DfBJg8RtUh7AMmnsyme2MCInbuDLCR2azSnTq0cSKi19zEhS1UmorRmXXnKjiet7Vlhn3YTBtQcbOR5jvPqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qdw5WGSgHnKV0cTvgRImIGPtsxZ/nU3yOXn8zaU25to=;
 b=bsr6P7bv9xGYe+ADNDQlj15wsnO4QFDA7hmpNidPTZmLgbOc6QCN9ZDTk1wrRA5/O8lEZLk6xtGZueMhQWEbD5oBimgs+FA7cFMh+xinZiLCneqAz0S+KhTwh73O9ybo5l+NbYbbAZJahKBJfCtJZEfLfXi1vC9AHMeRgoXk1gx9jwTHFOk7QYxgIUU+7phum240MWDANga5NxobaWFq4Rvm8nY60k188fA2rTBpeQfN+r8NGMkkZnSChKGexcJk1e/6Yg1t1+SdJzoFcPu1lK56FDszIk4xbh/PRWsPp3O1jmIeORzDBLbv4xLbkcUYtN8ZapMX+aVXPi28PV0niw==
Received: from CH2PR20CA0026.namprd20.prod.outlook.com (2603:10b6:610:58::36)
 by LY0PR12MB188158.namprd12.prod.outlook.com (2603:10b6:404:215::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 14:29:09 +0000
Received: from BL6PEPF00022570.namprd02.prod.outlook.com
 (2603:10b6:610:58:cafe::2f) by CH2PR20CA0026.outlook.office365.com
 (2603:10b6:610:58::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.15 via Frontend Transport; Wed,
 21 Oct 2026 14:29:09 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL6PEPF00022570.mail.protection.outlook.com (10.167.249.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Wed, 21 Oct 2026 14:29:09 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 21 Oct
 2026 07:28:46 -0700
Received: from r-build-bsp-06.mtr.labs.mlnx (10.126.231.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 07:28:44 -0700
From: Felix Radensky <fradensky@nvidia.com>
To: <lee@kernel.org>, <pavel@kernel.org>, <linux-leds@vger.kernel.org>
CC: <vadimp@nvidia.com>, <griffin@kroah.com>, Felix Radensky
	<fradensky@nvidia.com>
Subject: [PATCH] leds: mlxreg: Fix missing fan LEDs on systems reporting a unit count
Date: Wed, 21 Oct 2026 17:28:24 +0300
Message-ID: <20261021142824.603605-1-fradensky@nvidia.com>
X-Mailer: git-send-email 2.34.1
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
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022570:EE_|LY0PR12MB188158:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e0fca5f-2845-4800-eeb9-08df2f7fab98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|23010399003|36860700016|10067099003|18002099003|5023799004|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	WjrrHLljXjJRKvAr/bk/3XycBszLPmSj+0qpyCjZWEWE53J/kdLz9+f/APW6cgt5I7WraoXctGsQmM+6ad43QuK2f4KtFc3U9woytDKESfeBTxovky5leuJQoClusHyjvg4hcvjgs7U1s3KjJ0tdxduZGNdNQTVhtkLGJE2H3zX4aJtSoJ5nrLW3rVdtU/2JijRpXl4NXA5SDOXgXWjUefETXPMvzLD/5+S98b/KpaIKFnN7dv7c3bbhb00tldEI/Mc44cNJxx5V3f4YF3Kx9QOA3L23motT6+bG5YVqw52KteHGPduK/xlnhZ/Bv/VCEdRI9Avss928110CRIXpT9kBrfy+Re9AajJvW7IcxQT1S7DdnzQOTPyvkROEbRlbS7MgbmFFT0iEJY+EcebffmiIVw/Y/IWzb8YI+03hXaUvi+mU6gnwe9obBfB2T6DxdpMEYDJGr6bCh4OMM6RPUh9skCRpw8uTlwVpGO+SfcEyOFImPVlunT14+EKQwL2CsB/kzrb0SrLGWoggLc42dE+7Zll+U4ulbJO7xQLkxVQSMBAOPWoZrZlObIVW0QBT4WQLiqTBPxe2Q9gQYdddBuw1mfGXbRw9JoS2wMM3EVdWtW8FOE1EYFHU1whq93LtH0EmwaxVDApOXNpevOciZp0YpqIWZ6oxHrkhUPL6B9hcnegeczLq5g1Cx7cuI/B7eL0Y0Am7HYz/UXnku6o9zA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(23010399003)(36860700016)(10067099003)(18002099003)(5023799004)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	pIzkBOcM9SffzkJBPh3WQ04E29V0ppZLSoUeL4c5XQ/5PkOUn5H9fiZeZ5a2Ju6v0tUmRIYwafKf5iz7Wh0+gOA/xZ97VWo6YOof/23pz9jd7L7djIxzvJWKyXx9jAkyKZCs0MDjiMROtNzNlb5Pd20vg45meEp93wg6g2ZeNbd+31ipil7zhX13WqGDeWHcyR19FB/SZhYO4LO6vm1HnIYvqN8OO3muSwjxu9SS7+c4pRK4nn6wvU13wdTEU1+WImuMX9B23ywah49RpNb60+P33CiYJjcqii60DIA6++hrVt8gZqYrVBNoOTXvx1RmJ+Amm/kSP08oENt3JWE3amgQgIhgbE3eTuG89bcrTVEZxgsFXG5OFYp1+V+QvJQazIuk6HXvjWQGaY9fiKbxTwKvcuZW34HDECEjknxtW4JoYL6TwzXgzvDKQgUoLTPD
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 14:29:09.4296
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e0fca5f-2845-4800-eeb9-08df2f7fab98
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022570.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LY0PR12MB188158

From: Vadim Pasternak <vadimp@nvidia.com>

LED platform data is shared between systems of the same family, and the
driver registers only the LED instances that are actually present on the
running system. The platform data entry names a capability register and
a bit in it, and an entry whose bit is clear is skipped.

The capability registers are a single byte wide, so a bitmap cannot
describe more than eight units, which is not enough for systems with ten
fan drawers. Recent CPLD revisions therefore report a count of the units
present instead of a bitmap, and do so uniformly rather than only where
the bitmap would overflow, leaving no per unit bit to test. Platform
data describes such an entry by its 'slot', the one based index of the
unit the LED belongs to, and leaves 'bit' at zero.

This driver only ever learned the bitmap flavour, so every such entry
fails the presence test: 'regval & 0' is zero and the LED is silently
skipped. All twenty fan LEDs of mlxplat_mlxcpld_xdr_led_data[] are lost
this way, on smart switch systems since the table was introduced, and on
SN5640 and SN5610 since commit 3113bcf4ccf0 ("platform/mellanox: Fix
SN5640/SN5610 LED platform data") moved them onto the same table.
Nothing reports an error, the LEDs simply never appear.

Use a non-zero 'slot' to select the counter interpretation: register the
LED when its slot index does not exceed the value read from the
capability register, and keep the bitmap test for entries that leave
'slot' at zero. The bit clearing that follows the bitmap test applies
only to the bitmap flavour, so move it into that branch.

This mirrors the counter handling that mlxreg-fan already does for the
fan drawer capability register, added by commit 1e11552ee54d ("hwmon:
(mlxreg-fan) Add support for new flavour of capability register").

Fixes: 783259e9b19d ("platform: mellanox: Introduce support of Nvidia smart switch")

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Signed-off-by: Felix Radensky <fradensky@nvidia.com>
---
Note for the LED maintainers: an upcoming platform driver,
nvsw-host-spc6, describes its per drawer fan LEDs the same way and
depends on this change as well. It is being reviewed separately against
platform-drivers-x86 and needs nothing from this tree, so the two can
be applied independently.

 drivers/leds/leds-mlxreg.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/leds/leds-mlxreg.c b/drivers/leds/leds-mlxreg.c
index 1b70de72376c..e428531f4ac5 100644
--- a/drivers/leds/leds-mlxreg.c
+++ b/drivers/leds/leds-mlxreg.c
@@ -204,14 +204,26 @@ static int mlxreg_led_config(struct mlxreg_led_priv_data *priv)
 				dev_err(&priv->pdev->dev, "Failed to query capability register\n");
 				return err;
 			}
-			if (!(regval & data->bit))
-				continue;
 			/*
-			 * Field "bit" can contain one capability bit in 0 byte
-			 * and offset bit in 1-3 bytes. Clear capability bit and
-			 * keep only offset bit.
+			 * The capability register reports unit presence either
+			 * as a bitmap, or as a count of the units present when
+			 * platform data assigns a slot number to the LED.
 			 */
-			data->bit &= MLXREG_LED_CAPABILITY_CLEAR;
+			if (data->slot) {
+				if (data->slot > regval)
+					continue;
+			} else {
+				if (!(regval & data->bit))
+					continue;
+				/*
+				 * Byte 0 of "bit" is the capability bit just
+				 * tested, while bytes 1-3 hold the shift that
+				 * positions the LED's nibble within its
+				 * register. Clear the capability bit so that
+				 * only the shift remains.
+				 */
+				data->bit &= MLXREG_LED_CAPABILITY_CLEAR;
+			}
 		}
 
 		led_cdev = &led_data->led_cdev;
-- 
2.34.1

