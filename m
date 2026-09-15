Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazolkn19010019.outbound.protection.outlook.com [52.103.32.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED64446D562;
	Tue, 15 Sep 2026 12:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.32.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789476409; cv=fail; b=fAG7j9X/FjOkjcFDIdPedwqKyD/QbUkC3F/Njm1+biCrlz8mKuGEyTm06LleoKjCVRZANk2C2/HJtJIFsnbWQRxxAvL+3drlhRsT4zC5oZ4Mu04V1F/1pmK7RtCy962xzWIeQFvxaRTmLD/8JWO/1RchkZqXeSRbvjRYTuvP1Ew=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789476409; c=relaxed/simple;
	bh=4Wkr83ayCFlX0sPrOoBmizj6c8q5FZH+/sM7yLn6XiQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oYumxj6jYTKSQcEyH3LNiA1416CUKPU7eygTuxf4hD9uJocefoxMmj0C5f1hBLjoSrgNkQ41Ynu0foVqB6CBTsFVL281W8qHsHpGLPnX7z4NQBFDvbNDJfJpQJrKLf4rfHljYowNCfS9pcWnEkJ9/ztTlgQkOmMPO1aYObOG514=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=lJ9lwVzj; arc=fail smtp.client-ip=52.103.32.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="lJ9lwVzj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TCG6eQUIiL3bwpDEKAeO75efx3xb5Re4sC32A9h3ZlBM081fiu6Bm6cHhOpDd6AIRgdnpNIVgTgZiBfi/lcCtCq0hUVFpPsZeXHIsE35Ia+mTpJuAqK9jvmI+2SSybzJetUBL3pzTde4+zh8WxL1hrNakxFa0mM4A16ISZFKSwE2xCL0tarcez3IPrO50ZA2CG1bj/cHAosFTDQ8rNJW8Isnni6Huv83IXOKTvoUjUXp5jFBmPCU7li2G5hzJrbzDfWA+SgqA/s14zRYLI6e9soqHcOVubsHukLu+wA9d0sdDzuBr09Zc6zTBIHhuixfGEWnc7MCoI1je90KmtuVZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l/ThI//8c7TqHuGGrVk8kCl6N35yNixcgr7QYcPVyEU=;
 b=Iu/F+Yfs4+Eqb7NNdiTgJEYgI2eN7sSsuRgFOjJydlqxFPgo1IzdpIyc6zu3JdjoHvDGn6aRv+46plyu+d/knAVS5/SP7/hIcqYyH2Zqj1Vx6ChaOeNrl+HFgEz/InEkLRIDHTwqSHu2b64M3gP8CnoU4zhejPLGf191gHB1w4EVtDmOW+NOBZdZTDkokpmQ6CTKNtgBxi+0p2Vo1YwboVt7POlwYL9Yw1lKbUEi+VcZ52TZ6yCSt20GYznfWmfBX1yFVGuozNhkd5bcnji4ujpJEUlry+3xW/wTabKyTBtM6Jwa8N+S4OSo46tjPf6OdOr9wJiane1PbBoy63FGJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l/ThI//8c7TqHuGGrVk8kCl6N35yNixcgr7QYcPVyEU=;
 b=lJ9lwVzj5my+AnixgyDo0jKr6c0CRu4I/YziZLa1cqwhPMMxjqr6oI5AXxEkEO4v12hauvlyPh/V/abF4KW3U9VE1BvQEWx0tr1dw23qFfMBaI6ar6Yd0iBZe80fBFUbwlW4Y2PFFcaYEg1vkFkFbi6OfuYUreRC8GVUmN4Lkn66eUQAI0zU8tz9/oQOxp8IAi7ngXok4v9hK4/S16NzUrHkz5xkRDtj3goyG4vsTwuF+FcIiyJE9hw/z+eS8SoPa0nMh8D58BOJiyvhSPmsZkh/MOQaFPg+ogP/XrfbyGdmIrhsCCMpoSeG46dkssFQ3ak+1qgQD+PKJrGLeodmTQ==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by DU2PR08MB10106.eurprd08.prod.outlook.com (2603:10a6:10:46d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.8; Tue, 15 Sep
 2026 12:46:45 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0428.004; Tue, 15 Sep 2026
 12:46:45 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 09/13] leds: st1202: Do not set brightness from atomic context
Date: Tue, 15 Sep 2026 13:46:31 +0100
Message-ID:
 <GV1PR08MB8497CF8FB57A272EB671F0C6C5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <GV1PR08MB8497668D389D43F680D2CE3CC5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497668D389D43F680D2CE3CC5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
Reply-To: fombuena@outlook.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0193.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::18) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <20260915124631.3389510-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|DU2PR08MB10106:EE_
X-MS-Office365-Filtering-Correlation-Id: 5db96a43-e095-436d-ddf0-08df1327655f
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|24021099003|16051099003|41001999006|15080799012|25010399006|23021999003|37011999003|19110799012|51005399006|8060799015|440099028|3412199025|40105399003|2607281247196008;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NyaVa6pIdoudVlkFkv6TqL5qbgTjTiaDZzhRx42C/ukYWJWdj95yHFykKcd4?=
 =?us-ascii?Q?VpnWZsZkVLUAxLK7lfbKGhWm3kr8d7Dh0jj0HTVpBGNnGrdKeXkoXilGlpOy?=
 =?us-ascii?Q?6IxX31hBd6FubENah7t3LQpuX9kPShBiSJ4IWUlk4yY33pgrlj1ph5J7Q/jF?=
 =?us-ascii?Q?XnyH38ZdfESeWpvf6t7JnWfUJDdBlC9KJ0M0G17TreKlep13OreB7/16kFrH?=
 =?us-ascii?Q?XCyJUfehdG7LGu08AptXwmJR+k4/2HQpGP0CO2ZJmuncFj++AeozzkaWh4C4?=
 =?us-ascii?Q?Lb1ZU6zI03pHpPtPgzDHKaZjZWRQBycQvb0a/RjbZeRxTPbFb/+xwIoacIHb?=
 =?us-ascii?Q?fEUZ5cSvxVd5GAVSgCDXdXfA5KedQCzTgXUSEtoLPxfHRFqHtsdtOPdBoFvq?=
 =?us-ascii?Q?rF2aJONvOwa6Jf9OXFJVtCQBOvj+LYdnb3ZhL6Z/v0ZnZpygSG+1fBl0xyyo?=
 =?us-ascii?Q?mBXIO1p6ae7XF51ByoSeaDquMggM0vGFf6D8u4bXTb9+0sasVRysb9jZ3f6s?=
 =?us-ascii?Q?uYKk7cTjgrMi6D6XSvohQWzgy9oyUMLloSHvUc0AeexgeLcYoKDBQAfR8gz6?=
 =?us-ascii?Q?pnZHgDMiHOC6BYwwo8C8JGJ1hhH4Yq3uKYqhHKn1JSsQLowagWQnBjqhr8KC?=
 =?us-ascii?Q?L0hyFWSTJpiD5TGHRmwdZemouad3pC3+/jhXiW+g5LydiLyssneral4IEBjq?=
 =?us-ascii?Q?OKAMc6xWpJN8h/gkPzGEJqLrq7GUhO606+gipCRFoKbxguNOsT4u+kvDynnW?=
 =?us-ascii?Q?e94cTALw3Yajw/ojEaN6t9euCnxShjBZRRn/PidQEMbiIX6N9barYFS5zHm1?=
 =?us-ascii?Q?C+VQuYFzTA2h8Xj6X5mfas/9aA73nCjKAlQ+S7GVAafF22G9NRwxU2r3EKPd?=
 =?us-ascii?Q?UfOemP558fe+hMgRRHmLfXNPCCXHNQK6Ce16u2E4/I184bhnEJDnYSUaSl1F?=
 =?us-ascii?Q?8PgVHlZQuv6bJj0DmkFqz0KhOzxlt98QbXD8hQuLe2UMYicabd3T+RiHgFe8?=
 =?us-ascii?Q?nReI0BUWaOMLLsXDjwyR84TJAn0hMBwTQ7dEiPjCCjTyEXI=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wxeazqJmzapR58L2vnHA8ntjTfuGJt6coJCUkz6oFgl1E3tby4abBr40Kdjm?=
 =?us-ascii?Q?A3rcmGv2Y+b9JcpsTnb1342LnGCKPsYieC4MCf3PBEt56rCbveUti+tDXpEM?=
 =?us-ascii?Q?3sB6vMZIsbNKtqR3Ckcfov3Se6evHqwQ27WXKT/YLT0xTF/j0TO+GKujbLnY?=
 =?us-ascii?Q?XCfS7xhEMw8ICY/YoBzLGLE4l7gOapGCcxklhUqtoGMJ0/tOqFFVZcOBpQ48?=
 =?us-ascii?Q?BhQzT9xwI6uiJMnJNR2jUx/6CLtsX8Fav2U6atknIWoCtTJoNVpw8fScyDBt?=
 =?us-ascii?Q?0MXca8Bl/qIvkb++dpENKOBwROt+3rClFgCwIyWCAfJJPz08nC6VptPCSxpa?=
 =?us-ascii?Q?TIhoYQcFd7piRIhOf+EaNcvtZ5GKQfAP67/jHaVAC50SasFeZfrcj4C+NUBL?=
 =?us-ascii?Q?ECb3OysB9UEcZI+3fgKGTiIjf2ELL6b8FVi9kBmWHq5q6xBPEudjsISHtvp+?=
 =?us-ascii?Q?qhS+No50ool2fQuXFlBEXYfSRoKt/Kajwm6cpttH6v9eCYyJq2A+9ptf1ErU?=
 =?us-ascii?Q?jZPgzo9Li3UwxVNV0/t7YRolUE2WN7erkA5PdOGvKyhWaiMVRO4+1LW4ypJu?=
 =?us-ascii?Q?Iz+Tl9Snf/hIP/G+GtUCZt70S9JGdyxfLGSpl7EbErf9bAvmTcZ6bEU/p5pv?=
 =?us-ascii?Q?92tvUBKRn9dcgFrANp77/XNBMXvspEjaXpipLvp8HDYnfVpjm/emLDl71V0C?=
 =?us-ascii?Q?0t0zMToEY7FyDW4bHPh1tIMBibstmO16X6OHJrlKvJbZuyNY9Ax+WENfflxZ?=
 =?us-ascii?Q?xhnXqPh0UngxSKxlmn3EpmpJAX4B3DVT8yFsUnYAeWTCpxGiMvnHRKlHy87y?=
 =?us-ascii?Q?lgJKjkATc/5Pl54ZdTs5jzOIM4mG7MhnKFRnkRPSoHrmeEL6Ak/ntIfuK65I?=
 =?us-ascii?Q?PvmSJiyoFh5DOpkcMYYvXIAmHD6S9mLuWUDQ/OI+C85RC+lioDTrkS2HgTp4?=
 =?us-ascii?Q?gvoiypfHC0TWgNtUPzmDXuSNKPRp4idVtU6sjgwzQwAqKpBs3APHjIBCwhYW?=
 =?us-ascii?Q?JkQgsJC/k3lsJC6XaxP9qdX8xzFyLpZZ0zNqcClc/4sR8Ar8QM0b4JeHiDDV?=
 =?us-ascii?Q?FxciXoguww4f0DCV6NzfVWjywsEB4WeGW116D7O7IftSpRQxKh7GS5Eh5KVF?=
 =?us-ascii?Q?pxK0hb9bBlTD9aWFnR2XkGKjUb1sQqbFnHUPU55q7lrARpNPB7N2ie0Hakn8?=
 =?us-ascii?Q?znby0nwYYNIxfrhgA7QgiNTXbAMJghIiQHEn/CZ6yeaZ/08hSaJrhQQYjHlu?=
 =?us-ascii?Q?T0BJ0vZHSGEmdwjebswLM51kghSwnKmhsi8IwRSAuM/KEAhB82t0VSRsRR/l?=
 =?us-ascii?Q?Cpr5SOQX5ccCrzeeY8ZC5qyWGaOJLmDvgIpRs4fQC+V/NrVbxWz0aEMkLG90?=
 =?us-ascii?Q?jnxzUDfDLqtzKLk5FsOCOp8WV7XVoHwY9iRUCgKUicWUrZ/6FZCj4LTnCLOH?=
 =?us-ascii?Q?5MMCVMblXKHnKsSyKE726fkMZCbnQI4I?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5db96a43-e095-436d-ddf0-08df1327655f
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 12:46:44.9503
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10106

st1202_brightness_set() takes the chip mutex and performs I2C transfers,
both of which can sleep, but it is installed as the brightness_set
callback. led_set_brightness_nopm() calls that op directly on the
assumption that it never sleeps, including from softirq context, so the
driver can sleep in atomic context.

The driver also installs brightness_set_blocking, but the core only
falls back to it when brightness_set is absent, so st1202_led_set() was
never reached. It merely turned the channel on or off and ignored the
requested brightness, so dropping brightness_set on its own would have
lost brightness control entirely.

Move the register programming into st1202_led_set() so the blocking
callback honours the brightness value, and drop brightness_set. The core
now defers the update to a work queue, where sleeping is allowed. Errors
from the register writes are propagated rather than discarded.
st1202_led_set() was the last user of the locking st1202_channel_set()
wrapper, which is removed.

Programming every PWM slot to full scale is kept: it is what makes the
brightness visible while the global sequencer is running, without having
to stop the sequencer and disturb the other channels.

Fixes: 259230378c65 ("leds: Add LED1202 I2C driver")
Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
Assisted-by: LLM
---
 drivers/leds/leds-st1202.c | 45 +++++++++++++++++++-------------------
 1 file changed, 22 insertions(+), 23 deletions(-)

diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
index ead7a3669312..101468557f6c 100644
--- a/drivers/leds/leds-st1202.c
+++ b/drivers/leds/leds-st1202.c
@@ -173,27 +173,6 @@ static int __st1202_channel_set(struct st1202_chip *chip, int led_num, bool acti
 	return 0;
 }
 
-static int st1202_channel_set(struct st1202_chip *chip, int led_num, bool active)
-{
-	guard(mutex)(&chip->lock);
-
-	return __st1202_channel_set(chip, led_num, active);
-}
-
-static void st1202_brightness_set(struct led_classdev *led_cdev,
-				enum led_brightness value)
-{
-	struct st1202_led *led = cdev_to_st1202_led(led_cdev);
-	struct st1202_chip *chip = led->chip;
-
-	guard(mutex)(&chip->lock);
-
-	for (int pattern = 0; pattern < ST1202_MAX_PATTERNS; pattern++)
-		st1202_pwm_pattern_write(chip, led->led_num, pattern, ST1202_PATTERN_PWM_FULL);
-	st1202_write_reg(chip, ST1202_ILED_REG0 + led->led_num, value);
-	__st1202_channel_set(chip, led->led_num, !!value);
-}
-
 static enum led_brightness st1202_brightness_get(struct led_classdev *led_cdev)
 {
 	struct st1202_led *led = cdev_to_st1202_led(led_cdev);
@@ -210,8 +189,29 @@ static enum led_brightness st1202_brightness_get(struct led_classdev *led_cdev)
 static int st1202_led_set(struct led_classdev *ldev, enum led_brightness value)
 {
 	struct st1202_led *led = cdev_to_st1202_led(ldev);
+	struct st1202_chip *chip = led->chip;
+	int ret;
+
+	guard(mutex)(&chip->lock);
+
+	/*
+	 * The output of a channel is ILED x Pattern_PWM / 4095. Setting every
+	 * PWM slot to full scale makes it equal ILED whatever the state of the
+	 * sequencer, so the brightness takes effect without stopping the
+	 * sequencer, which is global and would disturb the other channels.
+	 */
+	for (int pattern = 0; pattern < ST1202_MAX_PATTERNS; pattern++) {
+		ret = st1202_pwm_pattern_write(chip, led->led_num, pattern,
+						ST1202_PATTERN_PWM_FULL);
+		if (ret)
+			return ret;
+	}
+
+	ret = st1202_write_reg(chip, ST1202_ILED_REG0 + led->led_num, value);
+	if (ret)
+		return ret;
 
-	return st1202_channel_set(led->chip, led->led_num, !!value);
+	return __st1202_channel_set(chip, led->led_num, !!value);
 }
 
 static int st1202_led_pattern_clear(struct led_classdev *ldev)
@@ -436,7 +436,6 @@ static int st1202_dt_init(struct st1202_chip *chip)
 		led->led_cdev.pattern_clear = st1202_led_pattern_clear;
 		led->led_cdev.default_trigger = "pattern";
 		led->led_cdev.blink_set = st1202_blink_set;
-		led->led_cdev.brightness_set = st1202_brightness_set;
 		led->led_cdev.brightness_get = st1202_brightness_get;
 	}
 
-- 
2.55.0

