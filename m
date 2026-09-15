Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazolkn19012012.outbound.protection.outlook.com [52.103.32.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6EC43B3F7;
	Tue, 15 Sep 2026 12:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.32.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789476255; cv=fail; b=BOaR4fST3EBxIbn2C4MRBeszogPqifLQ+XHxYMrQZ5CjrTwCJuLVnTmnGiaLT4FI1nyzYetAmLO9z8o6qkckj+ck/3Yif7DW5zGpqJG8SDpu8xwTA+NSictfvGsw7osGLcGC/bOSouDBRYKlDobbOtsIw3G7XOmTmwr74sLJQHs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789476255; c=relaxed/simple;
	bh=yl9jpMtflPWbE6EywVZeL0I/mWtV0iHpsb87atVQs5Q=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=k3VkQMl2eemPPsh0jmEaYlMGo3ZttlIVmeuUgWnJLWrUozm7/buEIFu9j1gdpyfewpHGQAueS+Rmh7Ny+8ee8rwqggKnSmX/d3epMBMaRYzsbTTl9jAPVhhSGJMKQA0fEIEcsR6u3fkUoewKxYevkakC4evf4IHK53hf+1qTKNI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=F8V1b4qt; arc=fail smtp.client-ip=52.103.32.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="F8V1b4qt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m8AtMMAd9HcWtElK47Zm57qFflyquu2FF2ZmC/4LQ1mavKFdmSXltuTeAZuAwqj90B3MrOWLEdfYDVKNRKSQpmtMCtTK9G9N9hVQw108AwxVvhQP7hrRDkOintP/k0pbHoJ05uAmzpzyOpZB0Z0eb2akijAaoQD7hssHFY/kijesjdzeWQCQZS/Qr0vN2UCFbzIa8DLZU4IyQS2gxHml76fMKQYryU+TxvfJ4qA8f2NpgUj3huT2CEZN3T/I6A749+IDr3Dn3X/ONudhMAJYJ5gqOubH3e/IY1Y62zYFrdRqMi6/GsyDJKL+may5U/ntoWRtFLmZux/A3thj5D+hbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ITHLtabHshxbNyzkWb6lZkx9oPqEr3SYHDJB53rdpc4=;
 b=W/0q7Iu2EMZWQhE+6txiU/pJDBZpfZomHjr5sO1vsnf1uQNlARYuGH4CZa89UQehPT0xFL08GPK8VtnU4/qA80tYSBBF35cB42GGKswwa5A1RwFRWx7Lvvz652VMJ6U7P3Jbp2C2oujx8Li3uFmoCr0XvlvfzLtt+rVCvclWjlKid+xYk+1jEwoOENrR5EQqR1t2+tMYH5hR+DlKm+FMDnI1CDWuZCnZwwwAr+XhaCAmpKLfWc+uYZy/n15Tuo+To8jxrvsDaLg1STOW+aVfyEMHSQ+FSE0nHsi7m5BQPDMlA/DG3EmkfrUL2x2I1lVgZREy5UUEiQsW57pdgPXeKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ITHLtabHshxbNyzkWb6lZkx9oPqEr3SYHDJB53rdpc4=;
 b=F8V1b4qtBnnnATmknw9f6R3OHY3njHd7ixJnLRFN7HRVZPqB0j6TZVsqyQJt2GjHvfWZ6KbyZ27517WZZRQdRWcP2QvskH+uZG0nxchq3+22qY48P3+JuLFNU4eWHK39re5PIoavDckkzFkwBuy3/ISu0ED4acRXJx62jtQwpg73fnm5id/xoISDMSEIs2uJDNMfpkgfFV2UNO7I8iWyq1Mu+ngML7G8YIeiO4WYg0adpshnUlO3cVULD2jJIYNviEJhSkTieJBlh2jrbGcP9O+sJT/Dpgl7N7MlhBVxxh2JhyXBr8McTpOIdjXIdWvR6l0dpHeSpcW09XWWjWvwww==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by DU2PR08MB10106.eurprd08.prod.outlook.com (2603:10a6:10:46d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.8; Tue, 15 Sep
 2026 12:44:11 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0428.004; Tue, 15 Sep 2026
 12:44:11 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 04/13] leds: st1202: Use u8 consistently for 8-bit values
Date: Tue, 15 Sep 2026 13:43:58 +0100
Message-ID:
 <GV1PR08MB8497783FB573CD48491F9648C5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <GV1PR08MB8497668D389D43F680D2CE3CC5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497668D389D43F680D2CE3CC5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
Reply-To: fombuena@outlook.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR3P193CA0052.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:51::27) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <20260915124358.3375242-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|DU2PR08MB10106:EE_
X-MS-Office365-Filtering-Correlation-Id: dc03cecb-f5cf-460d-0ce1-08df13270a32
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|24021099003|41001999006|15080799012|25010399006|23021999003|37011999003|19110799012|51005399006|8060799015|440099028|3412199025|40105399003|2607281247196008;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?t0PKlwy5GhGZUy2uLjXsfQ9ufNfs/dToS293dYbSs4ICN0NKWqgWWt0/KPDL?=
 =?us-ascii?Q?/fqJgV22rghgUGOfCtFBIZwqdtEdW3CZ7jNSIZzZhId8AsCt4AR+12qV2Oy5?=
 =?us-ascii?Q?JcPSL6RaPaG+Jhfqpoq1ptQGQKB9StWGnw7NIxVYCWftYn4HUDn412vroTEl?=
 =?us-ascii?Q?LNws/l2WwP5dNNGe7CW2BfD9+3H8XIUVSji+xl1dBKi7th73QRrdKywsxu7y?=
 =?us-ascii?Q?tUTqTiCjxRsISG0uhis6x3yDSs05Vyf86iwaK0dcRzdoQZYuAWHfIHYs5511?=
 =?us-ascii?Q?zHsjyBeNwM+iHKurPe20FaC2l4ojNjiRRHacO0iIF9KBlK7o9EiG16qTEOjo?=
 =?us-ascii?Q?oACjfaNdOnpLoy0p/VnRuL+Vj5z7llVN3pCfXOHcyrr3VRpFtqqcgf+UbZiT?=
 =?us-ascii?Q?6bQGv1BF2IxD99yxkJc1gakQRwETeya4flPucmHuBcAvakVK65/czISnnBSZ?=
 =?us-ascii?Q?gT2ZWinVnechB5oauDLWADfeLicToHFcGwT4TmUJNO3chg36mHwfgjmZ3BY7?=
 =?us-ascii?Q?72kAzBK1XyFwz534KpfAoKIo4p88+gnAjlWye3LZlckqlJd9zrD1NmeNruim?=
 =?us-ascii?Q?v2rEUNTAgx/xCqtgKiKIunTW9mbSwBinBp/kpTACJWe/JYJO3w/R5hPwS5I4?=
 =?us-ascii?Q?4Sj8/rok80/tkuDg/8BBJ052x1N/cQeUhp5yCKMp02VTP7OTZn5GHLo6sKwT?=
 =?us-ascii?Q?wlgm6IkRRyQb16aKAavwv7UN0J+WoXEpMZeJ/X8khYr7tNVktsuUSWKrMdGC?=
 =?us-ascii?Q?EWAMIahQGXNx/8czLV4VVObJskyUgN6ytkU5gTTeV9phJMUlxS+0fURu9lEY?=
 =?us-ascii?Q?QkfbiD+2WJTSzV3Rtk3ZA2SWlzS2UU/Hy2n8Ig1qCj4d3EYl9ipZYl+0Mmz6?=
 =?us-ascii?Q?QyFUm03cbTGCwk670M+i14lBODzBstDiuhztO0rx2mhPVDyLfhsNs3NHl0Z+?=
 =?us-ascii?Q?OegDCVQ82fdBm+Y5YFyS8Fj6X3Ow6cgOCLETzalDj8mPjVaHt1tPeeTKmDKd?=
 =?us-ascii?Q?syB1?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oySoU4DyXktaq1gHn8DLmlkAUZFmruiwfIXxuR7UA7KYFpZHYH+n2YVixYuy?=
 =?us-ascii?Q?wTGRDvVBh1EdKuaYP/MMy4if7opCwzZBZGQzisCn/bm9leUWcgIE9RxmRp2b?=
 =?us-ascii?Q?388nB7vpYm+gm5rIJcTWJP56hmRsxh5T0zm8Kb4bqZ6Ucil1qS3Q5hYatLJ4?=
 =?us-ascii?Q?ObFbFFErABwFmwlNPkzeY9vXpJec/a3zbhFrdVH56EFLlUqKrda+eLFe4mG0?=
 =?us-ascii?Q?irBfTZ+7VOfclKnbyszao8nn7Ruu+qfie+qioRzGQjfd3bxX8qyp4hpVGcxL?=
 =?us-ascii?Q?j3jZUcQYvTlT4aNiKtrM6BBlMPQN2Ro1qDeT1IuoQulLQF7EZeQC2FDjHwqP?=
 =?us-ascii?Q?cIYfZzpD7hhn6mdE8nBaw56t7u41A8O7F4mnZHCsCuDzDhzxJnKaZ2V7sQdg?=
 =?us-ascii?Q?JcAQsl9dwbWE9fq/21mBPHoR+zyLS0u/OXks018sXEPgDJ9ENcyXqwuqwxha?=
 =?us-ascii?Q?Hh9NPP4QJLq8Ik32BLORXj31lERyBIk5ZkfMDvW5B7Q4iXNsRkYAZnbxwdOk?=
 =?us-ascii?Q?fDxhqh/L2u/e+EmncSqtOyTPQRheanCqvSmv+h0F1xH42bZEUsJUouaKDhIa?=
 =?us-ascii?Q?mctQSxYeORsUXsgWpqfvNUYW7A2uOszwGa9IBRgLnHDOrcm7L6QbOMQrWn7V?=
 =?us-ascii?Q?dfQOti/GqmkmNmd91mKrL5UXFSsMxg/xm6yeqV9oQanAYGTx1jwMkvZMbdh9?=
 =?us-ascii?Q?zs8Xo7I6zjX1xctgrgVIlIC1KtVIqmtcpnlfShKFgg+NyaXu4CRMQD98/OAd?=
 =?us-ascii?Q?fChKe15FJRjJLoZjJhnUdTGE06lPNd/oxr9QyON+tmD8en6C/abPo2xS+Vkn?=
 =?us-ascii?Q?uvAyRopvDN30Vq2Am6kMgLEjOdmGzbWdhE9aK1wCnazALDS28RzaP5WCZnDv?=
 =?us-ascii?Q?7LGmoAX2sTEzxdgfQyH8OVc1n3KArYosaYV7GF2xLkk4/tIETA2rHdKc802t?=
 =?us-ascii?Q?phooPdUNNJ4I6g+8zaEIc5grY8zzIC8eu6nEb/jgwpCQv8hDSniEQiEZ4nxX?=
 =?us-ascii?Q?Cz4G8deccHhXsD/cYIbio1zm2UyqmQ9nVqKMQxOqMlrpXg5cXGz4gvPIYhtq?=
 =?us-ascii?Q?gpZeHPnqF5Vink+apVKVw6G3F2H3idYzlub+M0kpO+IS/ihk7CPiEfNE3M/6?=
 =?us-ascii?Q?ESCCpeGgr2tijDwpqq00TZ7wmv3ANClNTmDWzK67tuH90xsbg5XXzolgg2lH?=
 =?us-ascii?Q?HVhiv8LTMxu7FaTiJKCOtnBwOpu3T79/DtQxe63YPYSjiGixUQwzg3iNK1Ed?=
 =?us-ascii?Q?txJd33QyZzkf3Z5azgt1Zj7vhkxCBaEddedTxncdhVZXN/8wiI+AId/5Eir1?=
 =?us-ascii?Q?XHtDCXVvFcVupthPCg91q5ahbwvIJOwUBOmKBdemMoPukC2gxI7xeJ8NOu+O?=
 =?us-ascii?Q?LsKUECcNmfMn/FKEhk8uvq6Kz1xLYHlKRdSHE2/S5zrv7s5bbOE4swBg2+S+?=
 =?us-ascii?Q?Mv/cgnqzacJqFUUlozSK/6ich2EC6IGa?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc03cecb-f5cf-460d-0ce1-08df13270a32
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 12:44:10.9552
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10106

The driver spells 8-bit unsigned values both as uint8_t and as u8, a
mix present since the driver was added. The register helpers and the
prescaler conversion use uint8_t, while the rest of the driver uses u8,
which is also the preferred type in kernel code.

Convert the remaining uint8_t uses to u8.

No functional change.

Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
Assisted-by: LLM
---
 drivers/leds/leds-st1202.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
index ddb8c6027706..90f69ac16714 100644
--- a/drivers/leds/leds-st1202.c
+++ b/drivers/leds/leds-st1202.c
@@ -59,7 +59,7 @@ static struct st1202_led *cdev_to_st1202_led(struct led_classdev *cdev)
 	return container_of(cdev, struct st1202_led, led_cdev);
 }
 
-static int st1202_read_reg(struct st1202_chip *chip, int reg, uint8_t *val)
+static int st1202_read_reg(struct st1202_chip *chip, int reg, u8 *val)
 {
 	struct device *dev = &chip->client->dev;
 	int ret;
@@ -70,11 +70,11 @@ static int st1202_read_reg(struct st1202_chip *chip, int reg, uint8_t *val)
 		return ret;
 	}
 
-	*val = (uint8_t)ret;
+	*val = (u8)ret;
 	return 0;
 }
 
-static int st1202_write_reg(struct st1202_chip *chip, int reg, uint8_t val)
+static int st1202_write_reg(struct st1202_chip *chip, int reg, u8 val)
 {
 	struct device *dev = &chip->client->dev;
 	int ret;
@@ -86,7 +86,7 @@ static int st1202_write_reg(struct st1202_chip *chip, int reg, uint8_t val)
 	return ret;
 }
 
-static uint8_t st1202_milliseconds_to_prescaler(unsigned int value)
+static u8 st1202_milliseconds_to_prescaler(unsigned int value)
 {
 	return value / ST1202_MILLIS_PATTERN_DUR_MIN;
 }
-- 
2.55.0

