Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazolkn19011030.outbound.protection.outlook.com [52.103.33.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A16C480979;
	Tue, 15 Sep 2026 12:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.33.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789476346; cv=fail; b=QPC/OMy7M5w3y7IO/LLFaxr47BmE/WIFD3tTSEXHHKCBaMed25TF8s0cmB2M3elAeGOJusAAKJEGFGlDvhlIb1KID+6FJ3ETUuPIVNR5nnTXxV9WytHprhd1VShQY+DRdpZ8LBTIK4VPsaJZKg2R+MXWShQTlyVq5vxIH3quUiU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789476346; c=relaxed/simple;
	bh=T590OiFBmv098qOQudIP0EKpuN7HeEKPfGDQHjtTNfY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AR25cW8qljaZ7VBu4qPB9EJcijgBdBq8osIzJPD3NRvU13BEVNGxpR8Lt3t5rogCAGWRyP0MWSRO7RhU29/PfOVBc0mV7azyElHwagXE2vPha87PRLmuFyywAVmDoetVRsr4qtVVESfUYq1DY0Hr7wtbtNAGTs6zWnPAoUm1DCU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=h4vBkq0/; arc=fail smtp.client-ip=52.103.33.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="h4vBkq0/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WlLVuUQsfAeku+5UCCLS6isClZ+3fyOwYLFc46zoaOMronybSOa5+PziM+NpwFRl7Wr0kQR/KUPaRULgOVykyteCRpsQhVHaEQi+IfIIIxtGPPPLoKIQqQja974smllKrjUz2jQRgvhd/NJN1I/N0nt3DHPZSpBER9Hu+tB0HNvcL9Gh8KWEyrD2Gk4W7ic3IrApSCWKk3mdVtWM506DYh/2o+ZHrvwBoKVybOUEghiRG2uiERCildrFplojeHjippnZBgTgQHiDfRG5QjrfM7JnA0NMoCELsqJQDPa/gX6s+1TLYKB1I8NUscdbCaCrHl69yqHFpsTGYlhw9atDLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=abpftr+YChoKaFRZI5sDue2fH3Z5iF/LiMZRXu4xs4g=;
 b=trR/lDQh88A/WDfSJewAnYuES5vrU3316i5L0yhP4bhONNeYK471CeZWlhuIrPIg5dqdrh8g5NZce2NNPB5wg7bDvqni2VBXGtfglYP5Jl4gky+kH1dJVF13ChbhfcROyB3BrMiz1NJzdBH2FxsneAK/3MsqbxZSPZBxE9gSaakQpUzXKvjQ1nKxvUssCftLSkaoGcjti8aGpM6JvQmYWDqt7hXCOG9gDS/Ogx3U7gL3UnG5i36X9EoHeFsTuN/Uls8560PijOoIo4TZf7XWIpaymBLq/yvSBSJuPrbJTIbaso+GhwOnwY73p9FxloApXxh5aIT4ljlwhnc5roQzGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=abpftr+YChoKaFRZI5sDue2fH3Z5iF/LiMZRXu4xs4g=;
 b=h4vBkq0/2Vkq97KEEqU64ra+xpzU4+OzW6tiTK6jFpT9YU2LqOljUu+7tdH8W9eNXUE00kYyV4aGiAV6OKcjT7J2KnnI3rQxz3rmQvF8ycL2tvRpygj8Ld7mt1XBpU6UJsXeCXdx2cS++EeRHNdSxFini1T+Fti5ETy8ZqrAuW1Q+YNEcrnSkcDzqw0u4P62jO0qNO4BBItoJBqNBkcCQgouRlYFAN8PtY3pwg7V3KcPQEGqksFws4iJ5NdPq4g452NixoUT1sxrtXAPLOtcGUZuPaxzcg0ZXODBYemgqUjZh7ckfYmFbBzgtrkKqi5/IMw8HfTjnSjUVMAXMnL6Tg==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by DU2PR08MB10106.eurprd08.prod.outlook.com (2603:10a6:10:46d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.8; Tue, 15 Sep
 2026 12:45:42 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0428.004; Tue, 15 Sep 2026
 12:45:42 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 07/13] leds: st1202: Program the channel current for hardware patterns
Date: Tue, 15 Sep 2026 13:45:30 +0100
Message-ID:
 <GV1PR08MB84978D7C1CC0367D1818093DC5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <GV1PR08MB8497668D389D43F680D2CE3CC5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497668D389D43F680D2CE3CC5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
Reply-To: fombuena@outlook.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO3P265CA0003.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::8) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <20260915124530.3383786-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|DU2PR08MB10106:EE_
X-MS-Office365-Filtering-Correlation-Id: a88af25f-05c6-433e-dc74-08df132740a2
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|24021099003|16051099003|41001999006|15080799012|25010399006|23021999003|37011999003|19110799012|51005399006|8060799015|440099028|3412199025|40105399003|2607281247196008;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jiy8ecC04Q2rNC5SiGhQWs39XaqYj9M7I8w4stajDx1G3/yWsLm4+u/ROnYp?=
 =?us-ascii?Q?S4YPWqMspl2Ydnh0u6JfFmUUu5hgUwAt8X4ssn6mRCuEsQeSUCfQNY6knmgR?=
 =?us-ascii?Q?nsBdVa+cx7h6DxrS9AFyLIVX691f6iaAl1iZ7QLsObILqAFsTd5uYYN1VubR?=
 =?us-ascii?Q?dJ/nNpGyEwRkVwL6mk6V5pU+TPACTou38eKR7PkD0cZbI0pD5MymT9Mz+Nxu?=
 =?us-ascii?Q?7DsV//XgJwp8a66WTdYRY/EzpdAPMZlnUX6gdV/hAJqXNXWChzNBrFvFRcOA?=
 =?us-ascii?Q?RxmaYleWFKcnrIKsebEuUDvT/W6FsjsrGDD1bMXzc0e8Pnr0psau+/i8aD1t?=
 =?us-ascii?Q?O6m2gbASv0iSURfFPUQkxKVVHpUTB3EUo0yihXWqrCAyETcWF+9QdQ6KSbTe?=
 =?us-ascii?Q?hNRK/y7QQ/gnB1dayMDtyZ5yU8wfASsPjRSI2qjkTaVDrB8SEDh1bmaBwwYg?=
 =?us-ascii?Q?Ra4pVALTwxPrzzP5w6FqZYmR3N88TIRqKhGI5dawe0ZjXrjO/ekSbWefd/67?=
 =?us-ascii?Q?o2I/1JX6J5GLNlyrOlYWsLnhmIzW2byGqoADxrBy55IbgXke8yCIIvFh0rgq?=
 =?us-ascii?Q?F93ff4N+zdDo2a3gv8nU6DBt0bQ2wZ+eKc9tfp5I+XoLQ9fblosr+MnI/ybh?=
 =?us-ascii?Q?DHgPbLK6oGJj+uwIACw29T6t/F5uyRXRgZPQUJzZwn/YAQm2NiAEUsu+fMqH?=
 =?us-ascii?Q?NCbzYkpA8/dQI3lPtNcc0cXdcWDYqZCQRFJNrtgpVwOKupyQzUDfHr+JKSkb?=
 =?us-ascii?Q?MJWXOV1PucRAPO5WjPF5iOXfBeBpt/QZfczmjdH6DTr/IyGUvQ+lwt1VlpzU?=
 =?us-ascii?Q?9zU9D3Wpi+QdYZ+duha3x5HohhlYpHXf/zF3+ohyKGIIK+XT71nezpbNZTtm?=
 =?us-ascii?Q?iyEJmueiNRE+ThzZDGJ2kwwzRPuMpS4f8KsBJISl85qvRFiyDGrk1v7mm6CX?=
 =?us-ascii?Q?K0jfrwodUx3Dqurl7bt3BSeyGUyiEuv7uvINCsJ1gZqg9gRfvYPXBsxV8cEw?=
 =?us-ascii?Q?0SOGVnU83m1LzkIZTV4nd1oOyICPWx1W1jkCeLxVy1oh/1E=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?X2DZLFNTgNV9Oc/il6fODtZDrRs/QK3+VvfgPYwWm6aDHW9DvZlRuPSV/Acd?=
 =?us-ascii?Q?adlF9AK0N8Q1fJJwQH8BheP/FfSiYPLSQ8RKG7kOWq3rlLu6xJu59L/MSXIJ?=
 =?us-ascii?Q?yiQ7UA3vwyZyFCeZaKADgzh66ut1ham4oTdfqb6th83guLNaKEY+lxLgmYKQ?=
 =?us-ascii?Q?acqxvPvFFF+MJlOVHKXAmEH6uJggLujMbYgD23s61GnA1ras5uCr8G4jO42M?=
 =?us-ascii?Q?PipfqgEVc+wfoWOuKmKlQuShT0M43y8xfciJxh18gG0lVaeXzDVYNK/P0L05?=
 =?us-ascii?Q?6CP0a+mHLWg7EJammTiy4GUOpOszDsRTjEkdZQPLkmTGFKZbHGADlPPMm6BG?=
 =?us-ascii?Q?nRFrcAXAHcp8Qx8Ol/APXwAWSzwUdf+j/ae76qf/Ij3jT3vGYyAhfWJ3q5Hp?=
 =?us-ascii?Q?ZwcaAgpZNJFhG5V1bY8w+xzN3hj/ZcG57zh+9reTHFna7yjCAGw0Rs5klD8Z?=
 =?us-ascii?Q?SAQOuCffHtCBBSV7NkJax+L8DmGZEfq0gnK7p9lqzJAfyrAgObtkxeD7WNjU?=
 =?us-ascii?Q?E79EXfZw3jSQ57v0jTc/UE9B431us2PZuhJLVyq3nmTo0xf3xGQ5CC3dOp9K?=
 =?us-ascii?Q?vQRtzhv1B3+vewgKSlEf7OgUTXiR4s6xXqN8BNH6tydp+YN8peVZ7e4vGUib?=
 =?us-ascii?Q?mSMGug3KMwR8g8I+YyEazJ9iy9p3OmSNNe4sa4fVpWJpCnBGewhiVT8juirc?=
 =?us-ascii?Q?iQjbz8IEsb7SmaHg6zYwRdw7/FugqqG5lhBznQ5jgCc9nHYqcnts98SfvWCp?=
 =?us-ascii?Q?aocFgZjfHGJBJTRWwUP5YKAZ5QWcEi0mg+oVJE32D+F3eLdeX1b+N4krm4z6?=
 =?us-ascii?Q?sN3L6uljrYjTDL8oSMDaSA5tNGdMAdp8zr7JQ/uD8CvUxsBXkzlVH0WLxcIh?=
 =?us-ascii?Q?y5SMb32kFf46ssoMLeTTTLyhfAP/wy/HhEdkNS2GhP2cAsEGSJOp0Aq9aqvr?=
 =?us-ascii?Q?8C8MwX7VYQajpb0yTWDgKhMv5ACtOKhU6HYu2EN0tKqBvEPm7jLQOzdSRrqT?=
 =?us-ascii?Q?KzLSRVcKD6fndACpvT4rU+Db3fL9yc+HSQFpyViyniah89y48UjieddUY+HQ?=
 =?us-ascii?Q?wRhVj+D4yewhliIp9E0UbCsydLI/LT+XqKSvUDQ9tOtKPmise+PnwuyzA0mP?=
 =?us-ascii?Q?KozoF+UrVUONR5Kt2VLme+AZ+gnQPXb5WUrW+3gdjE8kvYnplth5oC3FGhJ5?=
 =?us-ascii?Q?NoSKFOZkAsn6Xcb+gOHcj9SALW9c9Vde9cqRTBecVtytVkHdM8/T1iy1gv8J?=
 =?us-ascii?Q?53/KAGxV2U26idH/aeJTuIbbz1Rxc26JWlgqLCjF3zr2MValhpGiE6jXcKC4?=
 =?us-ascii?Q?14vKiQ42ilF9w21JzBTXQWC1whydfW5ta+aZk9/pxmzKrKVFeJGa67A/1ZFg?=
 =?us-ascii?Q?P2ClGEuXmXCT5Au+jQsEW3vgVL5cKWF98mBoc6/4NWy3nEuuX6X7IeSAFaps?=
 =?us-ascii?Q?WCKE61W6/de4XGwrcafcDERqHjzesqxS?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a88af25f-05c6-433e-dc74-08df132740a2
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 12:45:42.2676
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10106

A channel's output is ILED x Pattern_PWM / 4095, so a pattern is only
visible while the analog current register holds a non-zero value.
st1202_led_pattern_set() programs the PWM slots and starts the sequencer
but never writes ILED, so a channel whose current is zero stays dark
while pattern_set() reports success.

Zero is reached by ordinary use. Writing 0 to brightness sets it, and so
does switching away from the pattern trigger, because
pattern_trig_deactivate() ends with led_set_brightness(LED_OFF). A
sequence as simple as

  echo none > trigger
  echo pattern > trigger
  echo "255 500 0 500" > hw_pattern

therefore programs a pattern that never lights up.

Program the current in pattern_set() and release it in pattern_clear(),
so the pattern path owns ILED for as long as a pattern is loaded.
Releasing it matters because the trigger calls pattern_clear() before it
parses a new pattern: without that, a rejected or empty hw_pattern write
would leave the channel at full current with every PWM slot at full
scale, latching the LED on. Clearing before the slots are raised also
avoids a brief full-brightness flash on every reprogram.

A current of zero is not enough to release the channel, though: the
datasheet notes that it does not switch the channel off but leaves a
small uncontrolled current, which shows as a faint glow. pattern_clear()
therefore also disables the channel, and pattern_set() enables it again.
Both are done before the sequencer is stopped, so an I2C error partway
through a clear cannot leave the channel lit.

Probe clears every channel, so the LEDs now reach user space switched
off. Until now they came up lit at the chip's power-on current, because
pattern_clear() fills every slot at full scale. Probe no longer enables
the channels itself either: st1202_setup() has already disabled them
all, and each path that lights a channel enables it when needed.

The current is programmed to the same max_brightness the PWM values are
scaled against, so a pattern step of N produces the same output as
writing N to brightness, and a board declaring a lower ceiling through
the max-brightness property keeps it on both paths.

Note that this makes a hardware pattern take the channel to its maximum
current, so brightness reads back as max_brightness once a pattern is
loaded and as zero once it is cleared. The pattern's own values, not the
last brightness written, decide what the channel shows while a pattern
is running.

Fixes: 259230378c65 ("leds: Add LED1202 I2C driver")
Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
Assisted-by: LLM
---
 drivers/leds/leds-st1202.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
index 5558ac9612a1..41eac6195659 100644
--- a/drivers/leds/leds-st1202.c
+++ b/drivers/leds/leds-st1202.c
@@ -221,6 +221,14 @@ static int st1202_led_pattern_clear(struct led_classdev *ldev)
 
 	guard(mutex)(&chip->lock);
 
+	ret = st1202_write_reg(chip, ST1202_ILED_REG0 + led->led_num, LED_OFF);
+	if (ret != 0)
+		return ret;
+
+	ret = __st1202_channel_set(chip, led->led_num, false);
+	if (ret != 0)
+		return ret;
+
 	ret = st1202_write_reg(chip, ST1202_CONFIG_REG, ST1202_CONFIG_REG_PHASE_SHIFT);
 	if (ret != 0)
 		return ret;
@@ -287,6 +295,10 @@ static int st1202_led_pattern_set(struct led_classdev *ldev,
 	if (ret != 0)
 		return ret;
 
+	ret = st1202_write_reg(chip, ST1202_ILED_REG0 + led->led_num, max_brightness);
+	if (ret != 0)
+		return ret;
+
 	ret = __st1202_channel_set(chip, led->led_num, true);
 	if (ret != 0)
 		return ret;
@@ -455,7 +467,7 @@ static int st1202_setup(struct st1202_chip *chip)
 	/* Duration of initialization */
 	usleep_range(6500, 10000);
 
-	/* Deactivate all LEDS (channels) and activate only the ones found in Device Tree */
+	/* Deactivate all LEDs (channels); each is enabled when it is lit */
 	ret = st1202_write_reg(chip, ST1202_CHAN_ENABLE_LOW, ST1202_CHAN_DISABLE_ALL);
 	if (ret < 0)
 		return ret;
@@ -502,11 +514,6 @@ static int st1202_probe(struct i2c_client *client)
 		if (!led->is_active)
 			continue;
 
-		ret = st1202_channel_set(led->chip, led->led_num, true);
-		if (ret < 0)
-			return dev_err_probe(&client->dev, ret,
-					"Failed to activate LED channel\n");
-
 		ret = st1202_led_pattern_clear(&led->led_cdev);
 		if (ret < 0)
 			return dev_err_probe(&client->dev, ret,
-- 
2.55.0

