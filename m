Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazolkn19013084.outbound.protection.outlook.com [52.103.35.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1EF35C6B2;
	Sat, 12 Sep 2026 22:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.35.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789252199; cv=fail; b=lABPQzz+SFbXNmZNDWQyi7XJOFCdopF8PWs2dJlrhAdL3t/R+QVRyS5MudnmIzYBQminLShTVCa/qo/r8x8FenZpE7rSz/uHUxTV6a5/5On98t5eOp3gdZipWNujPkfsIZaD9TzDD7YfBWmkFpCaKezkUaW2uKKWj5S69E5oR/Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789252199; c=relaxed/simple;
	bh=H1S63Oh+gXaVCd4rjxIAHNXzLU9A4Pu359xb+Oe0fak=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NQ8iefliQ1UJn9f+CZAD16IdH+W5kPiUAcEfqktvZn3ZDtfM81Z+NdmXDspa2luU1ib8R97s0Age86RxSi4upI+zsuzOwRWm9MRR+aJ8ktfCBgWVIpatIqv56qnhOJAyUeowxUtMHt9KKatmSn+v5XrDuFwM5ZXklpnSI/mZxms=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=gk4pRlDI; arc=fail smtp.client-ip=52.103.35.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="gk4pRlDI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aQ+nES/CpeVubo9unkWhtYYSZPCvGBLtnrmYY0aR6WwVZGtZ2KiXEM0n7b7J6cqgb0fIWKK9cW7L0UNqb52Ki9x05bevCzUmttsCMel29ixW62am6IKXkAMX0YHY4iFBh+JBp+eUZS3lByZD8JZevQRRzDJCwd24Nq9lBNFh6FxL74GUM8pwEjwqGeUHTuJQL3O8j1gCgqBe/uxMhR3PkYx9auPk8RytO9cgCYfWiquw6B2CjNHovAM1hUfsxJwzNfZ9WfES7dRvDgNhHUogl0KWSJdGJUOAE2l6dexntxerAhORxgtgqQh7m1L8yk95bBjv1q90a5F1paC5/CYxSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HRDaF2ACg2iR2xEQX1VHQfDJC1h04fgslqGQDVbmoQY=;
 b=lAIUcCYn8CIZ/TbQEI7FeHCc+yAjfwk4NlghJQGZk4qrhN5Pa2LCKw5f6f6V+5nTkf5YqP1tBMn6Ep3m7G95oK0u1tNk3B9EWPpxerQva/Y7DfuHSSkCRCXttKrHepzZSdn7IOL5w/3Nemz6VbC2lzi30E02gZwMY/pWCqyzZ9fsjwuAM+rh97d1JRGU2zlStIyAwTZaaNlymKIDesDv9kd+UDcQKUGXApCDafAyIz7OIEWKLAsfpRkLysOZuFRivM+2ZBg1rgjmegy9oib1khSHBagheZg7P6ta30ZtOPsD/nvOSljR/nNN8tc1q6wdidfQY/r9bxyZsLvlTJo02A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HRDaF2ACg2iR2xEQX1VHQfDJC1h04fgslqGQDVbmoQY=;
 b=gk4pRlDIOtaRswFxI3k6261Mhm7ezGN6Abegy52+Z1jY/kCG8t/CoUm6m9kaRKPpTPFkE/I1RxtHMowVjR7yS0NW18CUxynMqMyix3rINJUQoQV5vS2wRT7r0u1OFSm5fa9NLJrIz397M2roOyRTiMoGzACid4/6aBubYcJPanx++XKHhsgw6BJtkzvy5kgKis/DoaGyHI2EU3/CPjTPKbjOzhPJIUjwi2bZbGa3UhoFnOHk8z0d+zTJD7gVNhxohzVxYomvFcn+7eZYK/wCoCPWQjPV2iocioIPcEDUex7GsWP5p2NT5Ln6kC4q5BbwERXZ+qgaqDfJ29279jcEsw==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by PAWPR08MB11560.eurprd08.prod.outlook.com (2603:10a6:102:50f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.7; Sat, 12 Sep
 2026 22:29:55 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0428.004; Sat, 12 Sep 2026
 22:29:55 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 01/11] leds: st1202: Correct the name of the prescaler conversion helper
Date: Sat, 12 Sep 2026 23:29:43 +0100
Message-ID:
 <GV1PR08MB84975AC922A0F9308A5A45F1C5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <GV1PR08MB8497422B7A44424C4968AEC1C5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497422B7A44424C4968AEC1C5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com>
Reply-To: fombuena@outlook.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0028.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::20) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <20260912222943.3056051-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|PAWPR08MB11560:EE_
X-MS-Office365-Filtering-Correlation-Id: 07e717d1-cc78-4218-ff67-08df111d5ed9
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|37011999003|19110799012|15080799012|8060799015|23021999003|24021099003|51005399006|41001999006|25010399006|3412199025|440099028|40105399003|2607281247196008;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FVQgCWrg7MayYDMxufU4X3yuk5RFo/DU41ok3XxZQa7aVc46vuWM/Hk/j2aE?=
 =?us-ascii?Q?JVLJh/TyomGsAFEfR7RcY6FNwCAZ3pd1hHdHuxQ1FRIIs1f5xB9tfARURb8e?=
 =?us-ascii?Q?XWFuSTUlwTEh/gREBJZM1SK2vXv3B5Fqt30DcMAd1c8zVSmEnIzINszX4SKN?=
 =?us-ascii?Q?/uKFHMOEN+UyJEEi6cYicUbOiBisDm02vaWu9qGnCwPqEyGmYw9ZdVyi9R1v?=
 =?us-ascii?Q?2TJxN+BMxJM+dU63YeJPHXn0EUBlOeYTPMtlY4z8AiHkFHQyJuKRqJ3SVp6k?=
 =?us-ascii?Q?wkbQUIiWwXrEWfuNgisMhsi3rdhVMb0DhTxP2yGDbMt++RVFU6iR0OQUj245?=
 =?us-ascii?Q?zUE2ANuPtCWH8nHgfUQGq7r6ZnUcNQmpe03hKQyy4wfg/qufOPaDb6kSuhol?=
 =?us-ascii?Q?ukUnvqjJJMgnD2W0bpwDIOIuUPF7xiZcUsTQeLHQVyMCLNSMG+AxYKzAh3+l?=
 =?us-ascii?Q?a+Xk6hU/ExD7+72kW2QAc0hTeC0kQZsuSj1fOPfT9dxegJN5iiYN/bsxrbu2?=
 =?us-ascii?Q?MmV5o4U4y5Dk4GX1glFyRSGeoONzT1zKLbCcZQqT7CWa0+dVZc7qBBN1Zew/?=
 =?us-ascii?Q?kfXeUOW1Y5/6l6Wd9hootT41ywflYg0ycMKr2PwHF0OzBKUY0uUGpgBW0lpl?=
 =?us-ascii?Q?zmgOb0HjctkWUHMC6aIJhc6P35/pO58FPCFthotdAw4C2TIkiMY7zS4RsVIp?=
 =?us-ascii?Q?dAU5ai0+EYTPDOlHScy3v7bX9c44pnUUONEqjAFDldbyIgmJkP/pcEG99NP2?=
 =?us-ascii?Q?hHvLwvHnNEPTuBSMq6duHg+FouqudhZaW0wBrA/OKgvh0Z1jysZ/BaKRyIdU?=
 =?us-ascii?Q?qnfpRhbuRzj4sWwxjcq1hqMuyl3NuNLKq6d3ScO8clQBOuqkvR64t6+b5020?=
 =?us-ascii?Q?lLZ/fUAE4ilJ0a6jZPEWSNyYVhM98kRRzIWkVe7j6zKgSBFrt1ceDI6c0qlD?=
 =?us-ascii?Q?fbrIHbxN3VJb5td722wPfsze+OD3F/ejcfnZxMEldmME2vi+pPK3fGvZ6fCy?=
 =?us-ascii?Q?HVGo?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?807r+Em5VJ+CATFaAiJZ98yreRVWKh//A9EIgtkGy5ln+w6bxV9b/r7zGQV5?=
 =?us-ascii?Q?ttr9WXlBTWnEDHTVFcLR1H3tBt/asWEgIOTYNnP3G4V9Y7mTeVn7HlJCuPkP?=
 =?us-ascii?Q?VNJPo7gSHq/rsxDkbAHSaTjOyeZkC7bREZLOGSybzaO1gsnKlEl7OC6YmxMR?=
 =?us-ascii?Q?EkhDjGh28T02abhJo9zB7RfcOAQ+JJDcGc/IhlSEKQv2IWsutJMlj76Nl40E?=
 =?us-ascii?Q?PN4bTL36eHTAvho30+Px2dWiEK+De4uAglpmpLkR0Gxp13Q4dTbM9xo4FefD?=
 =?us-ascii?Q?PlMGs4gSKZb/7lNn2kS4csZnuuHD5BU0TRBG/+0XdYxibW62WGuI+pzMcA1A?=
 =?us-ascii?Q?XD4ht3XScQxbZPnALOc2cjitCsaj+UE9O+lNJLSYQZ4hB9TSdiujOobrTqHj?=
 =?us-ascii?Q?4Dx9uhOYPVwp1oI07eTwbwr+dwwqQNXfxbaZdkOCZ3MmOTo574arRsHEgblB?=
 =?us-ascii?Q?z9i8NDhzIxpGq2/wersadUfs1kqcP4XowNaOR51qe/Xag3Y5+lmfko6s3FnE?=
 =?us-ascii?Q?tSaSjFx83JAKJF9SnmAreNBGZpyZeG+MPFqXaWHN1+168nZpo6T/xbOd9Qcg?=
 =?us-ascii?Q?4VJa7x4xQbITzbxUXZtotYqpfEoSc4bq2aaRRbVQVBj1QrAm1xToUuxNUweq?=
 =?us-ascii?Q?sx7v2Zipbe34kucZDoRr0I4SvNBsSyvkIsbKYapYf6IFB/4uPBOTcvMqDj+Z?=
 =?us-ascii?Q?G6+PBZgcD3nd4P1gwPCApYsFEAknSeeuPXWDFWxLZcAw9heOFfNpuNz2ytMV?=
 =?us-ascii?Q?KKeWi09ep2yPkmd1kNgSnKUlrlsopmTu4Sv/ShQvLtUxjBhEfq6GhcaSvf67?=
 =?us-ascii?Q?QR7TmoQ+DOdPWHijVzMTIOD1gLbXxJYOF55EV6bL0E/fizmYFDgm7A72q19V?=
 =?us-ascii?Q?+kc8oQaXEQTuUTkk4L88Dp5LimhLNnJHIJKTlYBcGxJzVPrMsPdm5FsVmT9R?=
 =?us-ascii?Q?lLIEloNWzUne6NGEq9+za/y5v8g3XBelIoH4lQ4vHLJd+nGqXqLV5MpfaN6Y?=
 =?us-ascii?Q?ZlX9sRnf5y4r5WZchQHqsiDW3uXfn62Bw/ltwJHbsbMfrY233BWlw4q0C0qw?=
 =?us-ascii?Q?Yi7pG/KI9ZU6C69xnnKuyE5+dClkL9ln7zjxNfmv1RbwxRtZ2LZorWI0uf/a?=
 =?us-ascii?Q?qHi942NWGQ6eogO3Tu69ZFooyCNm3RHW8qIclnweg1GpqCamUfgh+qY/HArx?=
 =?us-ascii?Q?4x7WcHc4NeCFdKkRYReD8zpRGdxekZ79ARQzlZsSVg6d+0BTSvp3oucDmJYK?=
 =?us-ascii?Q?mCQ+E2h2TFZpYK4PyfVIgnFBia5RUFvKWWIJpmtB2sw4pczGoc+82MVoD5+K?=
 =?us-ascii?Q?DEoXcjQZsYcR9l9xaBfzGQlpJpnmOGmfH6xwXJ1RrfMSkrWVigtxVUN/qgZd?=
 =?us-ascii?Q?68xvHld8bE94th4eOsycHxhLRG/4t+hRddgnTy5iGcgiAYCVjLvEzuWFY9Fb?=
 =?us-ascii?Q?oyGcyFj1NysQ7cOEZIFLuPX527PaNh9N?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07e717d1-cc78-4218-ff67-08df111d5ed9
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2026 22:29:55.5651
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB11560

st1202_prescalar_to_miliseconds() converts a duration in milliseconds
into the prescaler value written to the pattern duration registers, so
its name states the conversion the wrong way round. It also misspells
both "prescaler" and "milliseconds".

Rename it to st1202_milliseconds_to_prescaler(). No functional change.

Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
Assisted-by: LLM
---
 drivers/leds/leds-st1202.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
index ead144155849..5a2202fb4c22 100644
--- a/drivers/leds/leds-st1202.c
+++ b/drivers/leds/leds-st1202.c
@@ -85,7 +85,7 @@ static int st1202_write_reg(struct st1202_chip *chip, int reg, uint8_t val)
 	return ret;
 }
 
-static uint8_t st1202_prescalar_to_miliseconds(unsigned int value)
+static uint8_t st1202_milliseconds_to_prescaler(unsigned int value)
 {
 	return value / ST1202_MILLIS_PATTERN_DUR_MIN;
 }
@@ -126,7 +126,7 @@ static int st1202_duration_pattern_write(struct st1202_chip *chip, int pattern,
 					unsigned int value)
 {
 	return st1202_write_reg(chip, (ST1202_PATTERN_DUR + pattern),
-				st1202_prescalar_to_miliseconds(value));
+				st1202_milliseconds_to_prescaler(value));
 }
 
 static int __st1202_channel_set(struct st1202_chip *chip, int led_num, bool active)
-- 
2.55.0

