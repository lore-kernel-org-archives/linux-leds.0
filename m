Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazolkn19011073.outbound.protection.outlook.com [52.103.32.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483003CB907;
	Tue, 15 Sep 2026 12:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.32.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789476153; cv=fail; b=Z76TkyFBblp3EZAEFIpZ06XE7s8uqxbLcD2yh/SjiRGPQFwN1Ju5Xp+XznYoXH4psgE03PPXUNoh4AYemLIVyDUhMeERCq8AnhxqxZLMNPMoqLeLeUwccJlonHhjkBZh3Fju4VqYjKGLUMWKVxOapQmVv8g6+Ufo2P6SaKlxpkw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789476153; c=relaxed/simple;
	bh=H1S63Oh+gXaVCd4rjxIAHNXzLU9A4Pu359xb+Oe0fak=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Nfwq8yjAsSjX3iacBR2vQWMEi1g4y9oHL9wfkSZzDvTz07wKdUnjHDahDY8DrK3TX6L/scKsVzbcu5/56F2PNmiGvBmeblw3+FKmadN3wGshGfqa8px6nIA2e5nHbHuA0bOFlKdhRq9aFhxfnWgDFMJO36YH1qdoo/TEwqS7pB4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=l83ETJBD; arc=fail smtp.client-ip=52.103.32.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="l83ETJBD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=khOzk+rQav15nkQYExLKhfH2FPkMwZ+g0DxWg74pLHQ09e2dzMTdtOtKonlTm6tx95mkFWrxOQyu0F3wBF3dw7VsYn/tXz+48A171rTBOx/M/TkdEd3OEaQ88LJp4FU+N40W8XIiz5rBsVkFHGkLjIixcZsCtToAtprvTpm+c7gmDbrJUciL6c/92/k+nlWic7QMuCrGVbF3D3AnZW2KaJy1XmfUBTwzFgOJRm18ZiuA2lmc2DX+bPM0QemCkvGY3wSJ5BsHzE3EOwmU54offCJrZe5xqL9MXcsRxRDchOoQTIdgrTHzl5rj4ENU3I75Onej6qk5S6CAzAZ/5WMKwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HRDaF2ACg2iR2xEQX1VHQfDJC1h04fgslqGQDVbmoQY=;
 b=QsBdtSBNSWMRWaG0eqHMJbwo7tqRD/52TulyDbeAI8usCBqpQziPkV0ownd4QwNUfYng+PbadEbwqA2sGj6+e4KzDDcq3AhDJaVi+IwWvF2/s0/KrPHW8gcCnvNJKFYia75pcB3DL9VS0VpzjRJE+pX/CsyswmqdOdyzWFGryWhCKI0GEE+CfdZVHQ9u6nRlTjDUxQxZ0dQ4UZAFvQcuqjIp85j7Gn6favySImOBvp1z5YhpRWNGJRfk8iT62dFU3+BZv59eh44BTMpLQ4/CRVsdL8q/+/nHorso0ONgyGFq7DodJ934XWdtedeUrExQUDDOvaVK9BcpGrD6PAFO0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HRDaF2ACg2iR2xEQX1VHQfDJC1h04fgslqGQDVbmoQY=;
 b=l83ETJBDC+vc9KO3gNL2EaEsme0Sl9m3EoNIe8esVHpSLagadiaS9S/qA5uUidM6Lz6LwJdW7F9js5/T3p1nWJdEBa2Q+oOYqwIyf9QPjyK2OK9cXWlYiKuqy0uVPg/ixnIoJVbYciFWvGJtXO/f1Gcn2Cih6oAFPLzzNg/8CVDG4lv+2xwLJLPZ8H6yjtJgIyh/SRlqUmLj/4Ipq6ZIVo0J1st4OCj4+IZjZLN8oGLKEHLKiKjeuYO/uBBjdTsKCWL1jjslwITLH6K2d6pm3rdbEtrhD3EuVraSavegxQ3WCIZVlZnmKnIJ/q+JUqIPuvs1lH6E/8Bcudjio/MaRA==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by GVXPR08MB10666.eurprd08.prod.outlook.com (2603:10a6:150:14d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Tue, 15 Sep
 2026 12:42:28 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0428.004; Tue, 15 Sep 2026
 12:42:28 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 01/13] leds: st1202: Correct the name of the prescaler conversion helper
Date: Tue, 15 Sep 2026 13:42:15 +0100
Message-ID:
 <GV1PR08MB8497AA602374777F1BA08E07C5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <GV1PR08MB8497668D389D43F680D2CE3CC5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497668D389D43F680D2CE3CC5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
Reply-To: fombuena@outlook.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PA7P264CA0207.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:36d::17) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <20260915124215.3365667-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|GVXPR08MB10666:EE_
X-MS-Office365-Filtering-Correlation-Id: 7947dd03-4075-4c58-a81a-08df1326cd15
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|15080799012|23021999003|37011999003|8060799015|19110799012|24021099003|41001999006|25010399006|51005399006|440099028|3412199025|2607281247196008|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xLR43zlpHqAKU522TH9N41TVCnGMfqAT+Ngr7hVE1vyukSVETGJNjBWoL36p?=
 =?us-ascii?Q?fypgcMRiYO7IcA0wIgHLqpCO7pNXX/Og3idj5WS48HEIERKJC069lY9zpG4c?=
 =?us-ascii?Q?G2pw/xCpT7He7ygRwRczxoaN2A1vFHvkJsZYee1OOPYcJcw1NExnA1fTZQ2G?=
 =?us-ascii?Q?0rvemvQfC4qdiyYyGFpUSEcIY6rGldTqNblcsv7LRtQSfbsTY/iIm0vPwqcu?=
 =?us-ascii?Q?peZaFKQMiw+nUTrgQjpQ9odCn2zQPJBRgau1Rm9WiAaFRe++3t/8dtMakKZ1?=
 =?us-ascii?Q?nNW5at8Ncb0SYaIaQFC1yxBQ7YzGh8SbYCzQmjm2k+wzem/lioO712gCahx4?=
 =?us-ascii?Q?CjkCthN9yS9TbyY1IcuQ/JIRjNAUodgzs460X652hTDygGTfdfax6+C9Q1K3?=
 =?us-ascii?Q?092h8jFJ7/uqVYncALUevAQyACvOolEvyYGiY7XdeZEAebJYgLw7CF4l1+1N?=
 =?us-ascii?Q?krY42Q3knnFha2elZZ5NLp5DgpXO/bLhI5qV47V+rBdDRYXLU1aV5ZPfDc58?=
 =?us-ascii?Q?Z8DcwlLHhKCBf7IvbvdzJQrwCRZIVvxeSCHXYCddEuIhj4+Y16jq96lYs1T+?=
 =?us-ascii?Q?itBQqz9+8dvQROC/tQpHGRwlcKuEIhmxN6ceUD2cV4/+PrEYEg4AL7Ak5bB/?=
 =?us-ascii?Q?psUrKSm6ZF8pwiscrN+CImIxgdI6jnujESFxrZDl3Xw4CauFFh4blh8yv8QE?=
 =?us-ascii?Q?oC6emRtqEJ2E2Eu32GtFhfpWzOvgzjU8Fp5bT1s1dlhqklDNfPMOk+MoHnaF?=
 =?us-ascii?Q?hbtw7BQBeDTg+A4RCsB2pENfID9k+0UtIqkSWxVnTUTpe3ESWRAjVng4zw9z?=
 =?us-ascii?Q?NzF4OA872SJTYs1EM7v/9ppRq3f7WNgKFwS7TrxMx4fZb90iseE/6W5uTaPt?=
 =?us-ascii?Q?hrXUr547K/bL/ZVZyndu8kaH3vgDWc1DCZuK5669tVC/fnJ83i8QyDzVUM1r?=
 =?us-ascii?Q?/k5cq0c9l0ZshAh/88en4nBUCSHhqUbrhWOkLtxX+haEL50iU10uikbRilJH?=
 =?us-ascii?Q?Fn0E?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VlbvM2TghbbaHwCk6PoqZlyvhFooQpGQdIRZibPXrqGnkSKjkd3VnX1RfLyD?=
 =?us-ascii?Q?fyIbVv9O/194C28JAvi60n+OE5daOHOZ6jK69Ew7zfaDHP88bvavQ8ajR0bZ?=
 =?us-ascii?Q?kFFyOHVdPJSqStcq+tTQWFVEtuVg9HGFsOIsMi6/kEWSs90YNJ6bPaP/CYrQ?=
 =?us-ascii?Q?lyhZEtS5KWs9yKnSJNvpd/hsVHntU3GlfYzlCZAFV1bi0CMx/E7ecjMiZpxk?=
 =?us-ascii?Q?L7MRHgmk8pFdHXwLinQbg7hZv+CoaafMFpW5Uf2QxfrbmwihQkjkP3jRuV1w?=
 =?us-ascii?Q?Qq+dl9BTIce6qFcyrmwKDEIr9Wh0j5ZCKH9u78UuU4/tiKNz52AjKHpa6Var?=
 =?us-ascii?Q?agok2xEaeCgYEo+KXf6KzmacaZ3/VVKQ7AVULqxrJXBqrEfp0WX9BnxHveth?=
 =?us-ascii?Q?D37JP32RhYZawJDzYuH58PWKTj5V1MGvqdzbgol7pFLdxegST60UpYbJAo4G?=
 =?us-ascii?Q?Xiqnl388Q71JJl5TeQsPxhMqSVoZcopFm1uF7X65CJJjM+4KR3DHFAErQ0f+?=
 =?us-ascii?Q?YPc06GZLSxxe6r3VoT6aO3B4t3Dn5dYx0lpY2fXZ6J+sXw3n+RMxdrJ8WJ1/?=
 =?us-ascii?Q?ZAZF/8YXvFMtjiIh8p0OlC4xYZLZknn2acG5v0C8hLCsvhapdK9TIMfpv3W9?=
 =?us-ascii?Q?cbSX5Mf+7NcT93vB6p590P7qnRm/o3Kx2zIz6JcVvOsFyVuCysVn+8kis6Gx?=
 =?us-ascii?Q?9t1v02qRbwd0kN/WRunDtfT4sMCSPdUIMXYbvH3rlaffX/U+4TRxDNTaCIBw?=
 =?us-ascii?Q?mVPKrVvomufaJL5/Qg74y9FrbDAp+JTDurlK+Hll1Av3Ho9dgA33YzI4NXWJ?=
 =?us-ascii?Q?RlkMFMEDkDEGQTxwiCINOQCzx22CZoYRkHLw2+Sqh8YQUp7qOZhm+mP3M1wP?=
 =?us-ascii?Q?7EiegfKoeDbw+t9NzlvVhU3LfmkigmVlXobDSMmOoPk6MrdbkoPgc2zO8YWc?=
 =?us-ascii?Q?xPLy+PqVV2zuhTg21Ua8QyKVne0Pkl83WdcyrJunDIpvQXr3KSsNeHbiOdkN?=
 =?us-ascii?Q?Y9B9M8zvPDnuuvzQ/lbfUzVJsfOaVV4ddfoVddgdwzQ8fDKPN60Tv5TXd30y?=
 =?us-ascii?Q?mA/rB8zEix7gvyFM0VWhqSa8fsp8ADBB7zAQBL6kgieoXXi2gSCvp4vARRbm?=
 =?us-ascii?Q?X6Eu7xFTPu37MWzEP24b3GDYsdbGX1nTAFnry9RHp397zc3zJq+GxFeldsAR?=
 =?us-ascii?Q?+nGcIdawRyfb/CYwkpjIz8S/WJ+43fEdpQ/ziIE287qkVekT5IaMla97hyxy?=
 =?us-ascii?Q?8uxdQnxdYoBa2rakKsyrK3nJ6ySpaP+jrkT22jAEHpMwWOwe+UffcJryvtFc?=
 =?us-ascii?Q?rT107M+S7rDqUJaDHQFDz3ZSH/TyuVWfjzWJ17MXme+nh7+UlW+bzFoELXLW?=
 =?us-ascii?Q?qx2Xy7gfIoiW9KZ7kDx/1v9xlwMM6bmn8Uan3g9l7EcY0SYRrw2f5xOC4390?=
 =?us-ascii?Q?axrPchL/CHc19oXV+5ExgnYFlpuyHFdk?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7947dd03-4075-4c58-a81a-08df1326cd15
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 12:42:28.5788
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10666

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

