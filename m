Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazolkn19013074.outbound.protection.outlook.com [52.103.51.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6861125B083;
	Sat, 12 Sep 2026 22:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.51.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789252254; cv=fail; b=ttDQFhh8KkcQb1t0ESyTBiaNZs7x+IGHb0zR5QRbKSvfLE9RBTfeAuX7/6rbyIDnKHivd3wIc75Cs43PN/0g/V1WI8HmbOpnZkCQigx+68FW0KME4fvxRi0BVmmeQrH+UQbMoZe2qrPBry09IdSrr00pw/m/BCudB95FQda3goU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789252254; c=relaxed/simple;
	bh=QcxsksoMjeg3NJWPk10wfRFoN4TAJoTA6kF5lOL4apw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rV9jnYLA+E5nuM4AWhVnc8Grc9jeQ8BNzIR87wvfB7+qdaGZXb2Jf1ZoZDdHiIoo/oWRRM8e6L5b5wplkrvvIoZwI3jxcFnumkzeQaJkTZSvhIouN9pA7YPzuK0S3lY5L2oWroANEy3XlA83r5HsxYXenkMaOEhc9BLTLkYy0lg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=bahJnpSl; arc=fail smtp.client-ip=52.103.51.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="bahJnpSl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s1v6W+tIc1XLU1TyttIyEsS9S7BBh2yAY/R2L5kvjJyBXj1ncc+YAKcpV1vwIwYXtT0TKIMnJ3ISUi6/Vewxzl91UwDIhnLJd5HIKLm28KancanNoLzum1SEFwkL731PNuGEqHYHwL4kf7LHreMWDB1CqRim8IGnbLZsnhHhR5gWAx4fSvMpDYMwwRa5GZG0xmi78oMBXhTCrUjP/r4P1BKIVLIkBJJJG9hEJO3RkxSCsBQXPxS0R8Lvn6/OSQCF41vYZ0LxPOe2+q26F69+cYcM173Z0TRABqlPblC0dTlIkZG65dnPLomYZpzpuQLi4zyf4Pp7Lqcy86+bAcuesQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zzXFXYlEnY14+sALfJFArf1cbVBixY4nEONDy6wsckM=;
 b=emUpFBAx3ebfJhLkoarBn5eN65Y1ZahD0CT73sU3scwgfOsM9kcWG92VQwP7gmMvXtPmnsTIDx4WtZj5Fg3XmgK38cjDfkfY+5HC9BO+pVREx+GDPCCB+7ilJbIb+hFrh/IXLKW2iX76Ldod8sUde4ZlzpKHEprMQfu5DaarnRolQIYQjTDGevOWxVgvaYKbxV7Ob3kKu624D8HtxHfKA/ihvcdrlnDHgLUDSNP107vSG7HT8kNVM0MpWAtyJ7U5qQsx0BjgKFb7lgeY8Z9zFu19xnhNEVOT22AEkOHTybONgNIeoqt8SroOk2KsXrDVeqF9z+TVwKerEoEAu7jj2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zzXFXYlEnY14+sALfJFArf1cbVBixY4nEONDy6wsckM=;
 b=bahJnpSlJVC6KsR01rpw4eVdihzhgbC+brAkmkK0FW6XxgkosXWFKPDXMNZzkAt7DL/qSuYNEa/S5IySHiXb42zQuaSHDqPn3MdypPdpn2M8BGsp991qpFnwSJF+LwKWCqmN0qFTUaNxAw9nw4vxhhkMn01hpYsuIob6j3W9JGVBxynfp41MvYJyhClMZvhD7lv2kJKkBLrpDgUp46f24bhjCavmMq90Bz5euC/0NnBUxWkugDLMG9jRKRVfTK9+QagZESLoWMvxxcm7X85Kf6BKrVjExpYOTnXZZHuKugif7bqvPQT3NYTVnT6Kxevs3uTouR03T/gldfgEjp1y1w==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by GVXPR08MB11096.eurprd08.prod.outlook.com (2603:10a6:150:1ff::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Sat, 12 Sep
 2026 22:30:50 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0428.004; Sat, 12 Sep 2026
 22:30:50 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 02/11] leds: st1202: Spell out the phase-shift configuration bit
Date: Sat, 12 Sep 2026 23:30:38 +0100
Message-ID:
 <GV1PR08MB8497C0EF1F3979EEC073AAAEC5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <GV1PR08MB8497422B7A44424C4968AEC1C5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497422B7A44424C4968AEC1C5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com>
Reply-To: fombuena@outlook.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR3P193CA0040.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:51::15) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <20260912223038.3061327-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|GVXPR08MB11096:EE_
X-MS-Office365-Filtering-Correlation-Id: b53fd29c-d323-48df-ce2c-08df111d7f8f
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|41001999006|15080799012|5072599009|23021999003|25010399006|51005399006|8060799015|19110799012|24021099003|37011999003|440099028|3412199025|40105399003|2607281247196008;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JR8/R+kwXAp9SXtvp7xtatssYWxzAZ7rEAxAog9kmNMmK+t1B2GNhGsW4NY4?=
 =?us-ascii?Q?3abO5AQ4Ejw1pmCW8RP1rBuhgXg3Do9qQRlurzwk8kuKL5w8jNJemnZBeIy1?=
 =?us-ascii?Q?G+pG7k8UKNNV7fCiUFUE65fs+khe+fDw2Ovw/tqFF9zywQ32uHEfH0N7AKRD?=
 =?us-ascii?Q?8oAd4+dMdERaRUcBxnmFEaYQWg47jLk4ttqlURq7irSinKB45miRkJBOi6pz?=
 =?us-ascii?Q?LN/M2GNUbBtyuHzI/VEW+cvtXIoK0kk+PsM9LyK9lVy5IKKxDJGx8WCMnbi6?=
 =?us-ascii?Q?6s4NTDm+N099UjdsSHo3derLpXGipQ5Cf8YKk1l69UnsISuRo2o4UUZAGxfu?=
 =?us-ascii?Q?v+HnLe8RxehoaWwVDdhaEkX9x2ivAXfazQbmp1HDIEMbNBEum2JUnmP1zFDK?=
 =?us-ascii?Q?jKLklCmdnznTcR6wZrnYGafjzEnn+W1N/0ss5fVHHRnW53fA7uwoN/lSdedq?=
 =?us-ascii?Q?q8pkPR7DTbIG+8BIHOITLvl2PjABJ2s2JqMThAvWHKNzNq22t4hpu2SfwHEU?=
 =?us-ascii?Q?/54cf+5kIqg43PLN4xspmPo3r99esXUzi3WIAFewXv+U+i1Vl5MtSr2aj9Zi?=
 =?us-ascii?Q?poGrHPZ5HODOLK0ersnlqi+X1LIqKCYLe6uBUBmI0eB1WVnwJ6FUTdp4IFNw?=
 =?us-ascii?Q?bgx08te14Yxf1+0XIxczsP8KJHPwXQcigrR4FeRO8dqF5cXTI0XycGvO57yp?=
 =?us-ascii?Q?AzAxn7ilPEF1GFD2623lt00AU6dU9eUG1XL184p5sHzyRy4an2NVZytFfD2d?=
 =?us-ascii?Q?/bgnH4V9Hbp35CdgwVxEXX7odEL7M5fUsYwelQGnHBvRUPR2gBMPyd00OBcT?=
 =?us-ascii?Q?1+fWHqlYCxQskbS60/rAsMUY9ycozGlXz2PB7enUqAEjJ42JeAFzDAbKbXFG?=
 =?us-ascii?Q?yaDd4LKvQ+gCtQgQUu0RvmOEFhbyu5KOTeYQDVJS1bJX0UogVgDPhMCbTVpn?=
 =?us-ascii?Q?sVcM+8fZam9ise+p+deYuxLUfls9nZBP7nqkf0CrUpjT0Qtne8i4dQLOG/o2?=
 =?us-ascii?Q?BFrS?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nTLvlrw+oQ1LrEqBdNF2TTgHjHe5S7q+cO+Iu/NGfgr+Sm/98x3OS07dH2hE?=
 =?us-ascii?Q?UBuvyeD0l6pry9/rAkDIqliyMfs9Ps6XuFXQ32Lrxyz54Iewp3WwauLXOiqy?=
 =?us-ascii?Q?52RboUTZOFzminaVQ/x/uYUU2x/8sgpAdWjzKTGTQMcRxi/bXz5Bn0y3valI?=
 =?us-ascii?Q?yufEpKU/V4vtH5Ms8VgsvLjLoKcTH6qwsJX60uarPLffG5rzng2B2lDnknzl?=
 =?us-ascii?Q?hMGNqPxHtBh4bsiM6H5UJSttEGF2Yao8FJeX4f9tkUbjJdjU9eZzndmcGu4+?=
 =?us-ascii?Q?T+MAupoqGgGPSiZRntFM6YcvoLu+Q3lvVqUt0C0k5nikCPWqiqNKn3p5Hbri?=
 =?us-ascii?Q?8oAV3j3WOMU+nZ67cX96Jak/cQJpugSgISratnURehLo3NPjBaIJ4mDoOhcb?=
 =?us-ascii?Q?p5zd833IRL+md4Gy/4RgvCSjzc0eo+2vjlj2Vf9lhq3/5IA2HPfU29voh0Ja?=
 =?us-ascii?Q?SbV6jZIrJgHyKZZom6IXtuxNyQFesi2SvDjryOKt18KAuVpbX24Auu4mrQbN?=
 =?us-ascii?Q?5qFFTe8PuHK6ksIwBQy4MNRajAlnSMAcqmyEBpZpgWzy5u1Zgn75+W9MLRUM?=
 =?us-ascii?Q?rmozdYtYARXQAds4lsuxUfuXNwxAaiIuFn65imXKwZA0pDpJCTcK9Rzgq4Qk?=
 =?us-ascii?Q?XzZZF6xlHUMnxtUjhpb1k1phsa2uJ2n//wKv2aMUJZi52NyeoN6OqQWsaIfw?=
 =?us-ascii?Q?Tlpa44bhDGePXq3NNePgSJv6n4zRQZUyGgdA4Jb1T5a/KeeMoYb6Toyga2Cm?=
 =?us-ascii?Q?dmjzBvopZ/UKFIPX3bbMMO49kjgTubZVaJu8/5cXTR8iCIQj2T9mvT9R+fV6?=
 =?us-ascii?Q?OcLI5aorYwqwiik3xA1RIgRETQbU25BpjdUH1o1PW+lTfwlIrevjN3vbTX6S?=
 =?us-ascii?Q?2LbR/rSxIfDrKj8ogvWveV+cSyVOtfaxutV6nZKs8c1JcEMdi9h9xLnAzBtv?=
 =?us-ascii?Q?3Iy17AFYjoXcBAo/+tvEsuhL8OzGfeXYd6iIZkRAxUuoQkg1dF+oaDSRi5h8?=
 =?us-ascii?Q?6vxENYZ4e83dLXQfMExlohFHaWWCJbH90x4y0NZc5ET7XdA8pLfUMm9xhx0J?=
 =?us-ascii?Q?AeoeJFAfJRxeqeH9f1ZFzrz2/bIQLhFkX1iR8javVXf0IlMwzUS79UYzT3Ps?=
 =?us-ascii?Q?XWj620o9TG/GIR9M1FmF6roAszJmzrx0wW/TWzM7/NN7qXhiKCMQaZtsvNOL?=
 =?us-ascii?Q?yWNzFOCoBy/LWL8P3v85GYAXJLFl0JIPWBY8uzYkwoy6hma/p48k8AaT3MPg?=
 =?us-ascii?Q?4oNp+Nc3du5EA9vkMqkxA9elfDmfHnKiEjCGGMZAhtiwvYw0vpJYBvFqxwDr?=
 =?us-ascii?Q?+Xb+CFOTYXZdxbcPjp4ypHrd4NxxHtBhb0qPcAHJBt60Nqe7Ep1uj10azkzo?=
 =?us-ascii?Q?uilquxe4et0MjqvOkOdJswcpDzqH3LpnhBMf/4HBrrmaWGZc3trNk1YSysBF?=
 =?us-ascii?Q?CwjS75E3A5Wa/eOaYeprQvCbEnrLDAmD?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b53fd29c-d323-48df-ce2c-08df111d7f8f
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2026 22:30:50.5472
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB11096

ST1202_CONFIG_REG_SHFT is abbreviated to the point of being unreadable
and, unlike the neighbouring PATS and PATSR bits, carries no comment
explaining what it controls.

Rename it to ST1202_CONFIG_REG_PHASE_SHIFT and document it in the same
style as the other configuration bits, retaining the datasheet name in
the comment so it remains searchable.

The longer name no longer fits the existing layout in
st1202_led_pattern_set(), where the continuation line was already 106
columns wide. Re-wrap that register write to match the layout
st1202_blink_set() uses for the same operation and drop the redundant
parentheses around the bit mask.

No functional change.

Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
Assisted-by: LLM
---
 drivers/leds/leds-st1202.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
index 5a2202fb4c22..d8a04e96fb46 100644
--- a/drivers/leds/leds-st1202.c
+++ b/drivers/leds/leds-st1202.c
@@ -24,7 +24,8 @@
 #define ST1202_CONFIG_REG_PATS             BIT(7)
 /* PATSR: Pattern sequence runs (self-clear when sequence is finished) */
 #define ST1202_CONFIG_REG_PATSR            BIT(6)
-#define ST1202_CONFIG_REG_SHFT             BIT(3)
+/* SHFT: Phase-shift delay enable */
+#define ST1202_CONFIG_REG_PHASE_SHIFT      BIT(3)
 #define ST1202_DEV_ENABLE                  0x01
 #define ST1202_DEV_ENABLE_ON               BIT(0)
 #define ST1202_DEV_ENABLE_RESET            BIT(7)
@@ -210,7 +211,7 @@ static int st1202_led_pattern_clear(struct led_classdev *ldev)
 
 	guard(mutex)(&chip->lock);
 
-	ret = st1202_write_reg(chip, ST1202_CONFIG_REG, ST1202_CONFIG_REG_SHFT);
+	ret = st1202_write_reg(chip, ST1202_CONFIG_REG, ST1202_CONFIG_REG_PHASE_SHIFT);
 	if (ret != 0)
 		return ret;
 
@@ -246,7 +247,7 @@ static int st1202_led_pattern_set(struct led_classdev *ldev,
 
 	guard(mutex)(&chip->lock);
 
-	ret = st1202_write_reg(chip, ST1202_CONFIG_REG, ST1202_CONFIG_REG_SHFT);
+	ret = st1202_write_reg(chip, ST1202_CONFIG_REG, ST1202_CONFIG_REG_PHASE_SHIFT);
 	if (ret != 0)
 		return ret;
 
@@ -268,8 +269,9 @@ static int st1202_led_pattern_set(struct led_classdev *ldev,
 	if (ret != 0)
 		return ret;
 
-	ret = st1202_write_reg(chip, ST1202_CONFIG_REG, (ST1202_CONFIG_REG_PATSR |
-							ST1202_CONFIG_REG_PATS | ST1202_CONFIG_REG_SHFT));
+	ret = st1202_write_reg(chip, ST1202_CONFIG_REG,
+				ST1202_CONFIG_REG_PATSR | ST1202_CONFIG_REG_PATS |
+				ST1202_CONFIG_REG_PHASE_SHIFT);
 	if (ret != 0)
 		return ret;
 
@@ -299,7 +301,7 @@ static int st1202_blink_set(struct led_classdev *led_cdev,
 
 	guard(mutex)(&chip->lock);
 
-	ret = st1202_write_reg(chip, ST1202_CONFIG_REG, ST1202_CONFIG_REG_SHFT);
+	ret = st1202_write_reg(chip, ST1202_CONFIG_REG, ST1202_CONFIG_REG_PHASE_SHIFT);
 	if (ret)
 		return ret;
 
@@ -353,7 +355,7 @@ static int st1202_blink_set(struct led_classdev *led_cdev,
 
 	ret = st1202_write_reg(chip, ST1202_CONFIG_REG,
 				ST1202_CONFIG_REG_PATSR | ST1202_CONFIG_REG_PATS |
-				ST1202_CONFIG_REG_SHFT);
+				ST1202_CONFIG_REG_PHASE_SHIFT);
 	if (ret)
 		return ret;
 
@@ -419,7 +421,7 @@ static int st1202_setup(struct st1202_chip *chip)
 		return ret;
 
 	/* Enable phase-shift delay feature */
-	ret = st1202_write_reg(chip, ST1202_CONFIG_REG, ST1202_CONFIG_REG_SHFT);
+	ret = st1202_write_reg(chip, ST1202_CONFIG_REG, ST1202_CONFIG_REG_PHASE_SHIFT);
 	if (ret < 0)
 		return ret;
 
-- 
2.55.0

