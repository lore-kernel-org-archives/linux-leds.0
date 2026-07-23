Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazolkn19013009.outbound.protection.outlook.com [52.103.33.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1A83EDE54;
	Thu, 23 Jul 2026 22:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.33.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784845616; cv=fail; b=kox9FiYi6HZCNAyEVTC/maEPO9eLxMgdyzmZTJ6sN/SknptpaGeH73fpToyoQ3H9UVcjsKxUXjFlQf49bK8r6J9rjRLDrntOf6ty9M5bxqZlRbtNEPIISmRj4mzAqk0yY6vLSFzayeGm6ZsbUiWhfvhOuC1ddeetKfNGNckwwac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784845616; c=relaxed/simple;
	bh=jz45/+Cvl/pa7nKauMYJcazIvVArUzpOzEuBkG0Roy0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PRbfIwQFCmmRkjktvVKI7Twy34pW+tOyJHtwnbxozhF2RfXleLMtBrIWG8rToMlr1cg+Sd8a5DGMmZiCcWD+8itXEpK2AIAO5fCOz4wwzATUGvDVbcrcONV1x1ME4xwqY1w4EihVe/qsL1EwO8B1/cGO5auiQfOcqK+uLJAd/NY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=H6/4Z0wu; arc=fail smtp.client-ip=52.103.33.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="H6/4Z0wu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FXKVz5FUz9FIGaHv6tn8d137zK28eEPKYoSVbtDs0VYXRHATkNWX1tu6KIq226LdX0nrgtbbtiYiQluAtTsFmBjKNJgLv/2rVnXax0gtWDudSrlZLXnUWhHmevjZc4i66TCdoZ6w7ZNv+sm/JUJnnOxNvSdU4p+E59P1qoVQTDW/Bt94DOmdtCayA1dclP4Ou116iE7EyLBTeMxRmnP0cbkqv9ZPJ2R7jB7/QHh8L+R2YFIA8r9rhtMwaDvGEsLxGi7CpCpD7hZi5g5KQp1HwXB1TqlOiMKTXTuZQoTyn6iInfPQV3OKs8vnIn3+tEyxYwkDgXZvbn69ZQHup0D6UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s3cSuuheozB2lKcB+7v/2AyXcCAky2A0apSNy4rCuRA=;
 b=fcawnAvXsWW/ySek4j2tJcKfZWXyOH7iyW34pugrBIuiBSUZ/VkvANkYx/j5ycm8lRny6ZmDraqZp4SWOC74PyE3pjQnxL9sBE/Trg1eZqw5/HHGGC4EhT2JKmUve0dKQHevSfIRWa+d6wZwIL6My7SWSmsLLnQMb9iUyf8AAbyMOLEMdUD7u++THJTrZM2NwIxQ22LzO17eu4pGd720ma8JJ2GLeGF0bDwjMXnZeREyLvvKlaITKy9cslTEj483XW/IJ52SQeWW/2BFnshUBEa/HcofHlXSgfvIhD2dotz1mC9Yo536tAh4jjBdB7VG0rv5DJQ7a1HcYVjoonNVFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s3cSuuheozB2lKcB+7v/2AyXcCAky2A0apSNy4rCuRA=;
 b=H6/4Z0wu9W08lhz+QSaj8NOCthG/yXJlq60WquckZ8Z07XyzRx1fQg2OrdlE7pW9+vOU58GFj4XVwNreBnOMt+b5XOnhAKqZxjKbJl/yRmmE0A3kIxxHFmlgAOUmJX2dY4bMxTS23LK9oRvg8VmhFQCPGwHOVgyKjRnxsTZZG6p+w2zI5Gwg8zhHVgmYJYJiEv7sgri37XqWe14jx4cchUxoMDelt4owISi3KkxQd7pxQ4JsPv5AxX4ULeTivgDOEScd77SSKLrBGenhx4x3WF8Vxe+uN0ynkxqM16kfFxL/z/QfAEeBCpNBATE/LtzDmuCf0ppMWNRubsN090wRIQ==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by DU0PR08MB8688.eurprd08.prod.outlook.com (2603:10a6:10:400::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 22:26:46 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 22:26:46 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/1] leds: st1202: Add hardware-accelerated blink support
Date: Thu, 23 Jul 2026 23:26:33 +0100
Message-ID:
 <GV1PR08MB8497BAA7ABE9F424FD6B6153C5C02@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <GV1PR08MB84979858573735294D41A189C5C02@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB84979858573735294D41A189C5C02@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO6P123CA0054.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:310::11) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <20260723222633.343229-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|DU0PR08MB8688:EE_
X-MS-Office365-Filtering-Correlation-Id: afdfab84-5175-4fef-a4ca-08dee9097ae9
X-MS-Exchange-SLBlob-MailProps:
	ScCmN3RHayHq8QFbWW6Ra03gxaeZK6u4ur1ln/2MOW+H3tT6ivC6Kq7SPIM8gZc+hEsH2yrNxvpqHGW4zsYRBJFRwB65V2nrCcibfllK7v0ROXmdP5wT8M2GP/6CTgtoJLDwSXhhshkr9cjAtVf6cXYaXlQHwlBq42p9rYQDAt9IPs+OrlY9648bKZaI3b+RQhQstqn56Pgo43t3QMx8SMTAaTcuPzzqZfggExPS+C4cQW8Sq6d8uY6j3YpVRWeq9S6jA4UIY6HT2Cv2fRkqYlMjiGFnPD+JNkemWtHgorxfbb9wuM3IapQCQwB0rNwFQ+ruc+VjzOFQkIzN9skJe64OhjwzJNvbn+1ZJp37Op6i1xWXeAsz2JDIHewnQEmb1/4T7YgNxxYWJzMDdsChvM0en+6wtmxm46cK7lnf/qssqFgfXNUNjnJVell9gwb1x64sfrL8r5yWmA0bqgFhVaXfRu9UWDQSyot3L562I8w/5Rs5k2eNA02gDZPrcsviSekkyQd0xJKrrWThE1lh4fBAJTbiTOiDUHgFMacAyGONjmgbCilLdUQztMhNh9yuOJDYRefBDsEI8S7wcR1licahkKuHtgCYhwgs5nOIZjU0YNpQFZ0jEJeHbbuw9mUut0Tg0oPy1bWYTz3+jkpwyGb43VpKMiZm60lGbkxZ40MnejZDakoNRhGUXVX6pp+aUfth0xNv7tfWdmbFzoZyvww1VCEjuWhiwkmVP2Nwp0M=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|25010399006|5072599009|41001999006|23021999003|37011999003|19110799012|15080799012|8060799015|24021099003|51005399006|3412199025|440099028|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5X1UX3OxqQcqQhzjCcZzrZHNCiDBOiLkzNr7TqCnn+2lPfpbd/+Z4rDWl0S4?=
 =?us-ascii?Q?f9hgtwDs8v/OzjSVBtV9uKRzKpa/iCnOxvJDX6OS+8V0TprSPmoEzPsuHLsx?=
 =?us-ascii?Q?N5Knv9WjhsSPUZdAw44q7cT2uQMCxiFMAOew9PE63ekRFzf45/L/EmxnN9bZ?=
 =?us-ascii?Q?XHmTEmBQWB5CSRh8C/0AhT6gB/2kxUeG0g0IySZ0Ge8giZNPKoklGQMqEgAQ?=
 =?us-ascii?Q?75e1TFXwZByrY6XSGe6GM8fiDRm4o7Hj2vtga4ABaQpX1FY7ugx0gGFn5Mop?=
 =?us-ascii?Q?49S60/ZEKd5jfnaF8XCmqdVEhU/p9E4HP+1E6s24LVZYExzmuHHgdDM4Km5x?=
 =?us-ascii?Q?MolDGz6hC9jbKehAFTNvXNZ/oKaoYscyA44cYGpixXHFhxuHa6pznFd6RWjY?=
 =?us-ascii?Q?BfF2b+sR6UYNezLQ9DTxerkUjZ9F5YDyiWXMDhJII8kVScXGfzqA59AKL/x3?=
 =?us-ascii?Q?Ie60sGovrZjiSRIwlOuO6NfJ5JxNQAEa+4fb4LMHN5yUy+H5Qbw1xbxn2fgP?=
 =?us-ascii?Q?pOR11Ky2DGBgZhm6UjbNZEGscBD5VJVjevZmhNvk210nilL9DX8AqqoFG+z4?=
 =?us-ascii?Q?roKSpGMh0OvP6MdyOK4OkmQ35vyrg0AEe8UEfh0bLFeFNAFjhBbagL07/eDK?=
 =?us-ascii?Q?HOTNXgMV/1L3X6fiBb8iyb6WoUjnPxOAftkrEaJhhJU2javuuvGfOBP+q7eq?=
 =?us-ascii?Q?1b0HLhohfSpuLEeHrKw90lJ11731XB3TAIFmftQcDDHjzDW0wk7vyZ98XYkg?=
 =?us-ascii?Q?3AQTAg7NyJNgLF7kTVaRxIo1FxFqEqVze13R8ivgfyGkcXIUK1Lnra48Ejgk?=
 =?us-ascii?Q?Cuml5LgiOWnQ2Ue4fU1U9IEdcRjqEjzsZ2qtvN7M2P8tRq4fF8oKcuSymV4b?=
 =?us-ascii?Q?o78GYGkOzTg1rdwrDJsbKt4UH40bvcprvO9E+J7ByOF6WMqeKcsgWCrwLsVD?=
 =?us-ascii?Q?1uMyUDX2M89uMgSlkMLejFCnmaRjKjvQAd3fKAfJTfEfvhFgOJDGbsH6nA3E?=
 =?us-ascii?Q?6pyx?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QRVG92rPkpTVmU4Qw2b0M54tXlgsoUVfuFeTuqkAKbolkAeYi/qUIlEKhaUY?=
 =?us-ascii?Q?WvUlZXa8z3YyExSP6eBP+kef1u9TA4DkRquo5/Iydt6sHGzZkugzBGv7dpQj?=
 =?us-ascii?Q?cCqCzbwjoXMfUuubPLNXt+/4CCBsxMV7v1+0nnGhbAHTKoZkTzmL/RpEamyj?=
 =?us-ascii?Q?ouDwnHNGobE99rXDijf96xZZuwBJURPTI204STJOE0GdBA1POaOZ0hK/0Up9?=
 =?us-ascii?Q?JgU5sFHHdflmpZNIRPDCb63w6SsBRSKxFJJWw3o+5D2U/7tYKl5/jUVuQU3H?=
 =?us-ascii?Q?uFnFDoWVYn9vM1PB1sEtS1KK1yUM/rtOPP+h28yE1oIE+WXLHKWdr91qJhJN?=
 =?us-ascii?Q?0FQlnh5DCJokND7IUeX38kYTybZRnktMSw/dUJNPb9YK/YCAglYT54vj6NFv?=
 =?us-ascii?Q?EGG60M7PR+nL1mOT35ohZhaGFsjg30atn9G3QhN5yTT2+lwedhTiAuUYkTyG?=
 =?us-ascii?Q?WG0hguHzv7gIVKzjfroxwT37DKMz9yIh07ghQTIJVfembP0toz0gtEKQLEt9?=
 =?us-ascii?Q?PIwzZ3PtSI5K4hZ+LqmHM2fD73lTQpNukcSf4CvHNDRe9ykeMnQ3xVa87nXI?=
 =?us-ascii?Q?zN3JJkrcxaRC85fjRBKCLlbDpoMU81Cyf/fXzWkdhDKD9xfn3vufEkNQGyFW?=
 =?us-ascii?Q?3geOOr2UeEnJjmMDz++791IYCYUi248YzGLFJFyrJ6p8Y19wjMniHu0Gh+Fr?=
 =?us-ascii?Q?PtAJ2/xmeY2S3uS9Xov+KyE2FNCkGtLZ3+4AZvqWxSwl0v+FuufS0A6CAEx2?=
 =?us-ascii?Q?utHpQzYM7fk2A++pZeiEyscvjrzyQ1FAFFmeU7UT4uBxb7wUWw9JlJI0Quh5?=
 =?us-ascii?Q?DaBfjQXvYBsKMI2JxPlkRx5nY6B0uX7koXqxa21g5risrC9ETHWoTlJjn+Bv?=
 =?us-ascii?Q?7U+pm+zpIfQvUYzXAyrUosSQy9ggf++TgpxjrGoaM8DydPGoyhwlYPjAr5BO?=
 =?us-ascii?Q?US0zLzI3m4InWH1Phb1HIJKLo+Yr4+LFP26gXemsybzXUmCI6LBUcc5ryakX?=
 =?us-ascii?Q?SElygQDUfkmvj7RRvwrOSfsB+8QfE5VwgkXW+N6IVfZZtgDQAd+NVJ6m8AHl?=
 =?us-ascii?Q?TmzOzQjwWiFQOLK42eEXI/zLNoKeo7YtzItwDcKlzvZDh5DntbZuxkyvhIJy?=
 =?us-ascii?Q?jHIG5R1HzLrZWQcYwNVlkuG2ylWf2l5cfTyIRIXCSntB4MbINl958sA5xXKR?=
 =?us-ascii?Q?kogVxDEdII9mTRQ9Y8gotmBlKb7zn4hwRK+BQ4Fx17bXSXjzFnsIUPgMGzZs?=
 =?us-ascii?Q?teLIkj8eEseKy4btxPKQEn3or0Jy7Oi2qeZUnyfu4S61G+O/K+PFuazhUT7l?=
 =?us-ascii?Q?X9kTtnbdidTrKVrc8/4vU87EA8dkLPrJRMYgqbxhQA6N5LT92P62LB9KKZPv?=
 =?us-ascii?Q?qIhASia4ak06eiSNhk1xHxqfP65vH+9NCrOe+TXAxMHXS61tYspGzNE+trV+?=
 =?us-ascii?Q?qZzIM3aB+8oPRbKjZOwDmuKot6doMxV2?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afdfab84-5175-4fef-a4ca-08dee9097ae9
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 22:26:46.2853
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8688

Implement blink_set() to enable hardware-accelerated blinking via the
timer trigger. The LED1202 pattern engine is used to produce a two-step
sequence: full brightness for delay_on, off for delay_off, repeating
indefinitely.

Requested delays are rounded up to the nearest 22ms step then clamped
to the hardware range [22ms, 5610ms]. A zero delay is replaced with the
default of 500ms independently for each of delay_on and delay_off.

The LED1202 pattern sequencer is global and its timing registers are
shared across all channels, so only one blink configuration can be
active at a time. Other active channels have their PWM slots zeroed for
both pattern steps so they remain dark rather than outputting unintended
values when the sequencer runs. The target channel's ILED register is
set to full brightness and the channel is enabled, since the timer
trigger deactivates the current trigger before calling blink_set which
would otherwise leave the channel disabled.

Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
---
 drivers/leds/leds-st1202.c | 82 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
index 168df5ecf27b..fff42fc16441 100644
--- a/drivers/leds/leds-st1202.c
+++ b/drivers/leds/leds-st1202.c
@@ -15,6 +15,7 @@
 #include <linux/slab.h>
 #include <linux/string.h>
 
+#define ST1202_BLINK_DEFAULT_DELAY         500
 #define ST1202_CHAN_DISABLE_ALL            0x00
 #define ST1202_CHAN_ENABLE_HIGH            0x03
 #define ST1202_CHAN_ENABLE_LOW             0x02
@@ -275,6 +276,86 @@ static int st1202_led_pattern_set(struct led_classdev *ldev,
 	return 0;
 }
 
+static int st1202_blink_set(struct led_classdev *led_cdev,
+			unsigned long *delay_on, unsigned long *delay_off)
+{
+	struct st1202_led *led = cdev_to_st1202_led(led_cdev);
+	struct st1202_chip *chip = led->chip;
+	unsigned long on, off;
+	int ret;
+
+	on = *delay_on ?: ST1202_BLINK_DEFAULT_DELAY;
+	off = *delay_off ?: ST1202_BLINK_DEFAULT_DELAY;
+
+	on = roundup(on, ST1202_MILLIS_PATTERN_DUR_MIN);
+	off = roundup(off, ST1202_MILLIS_PATTERN_DUR_MIN);
+	on = clamp_val(on, ST1202_MILLIS_PATTERN_DUR_MIN, ST1202_MILLIS_PATTERN_DUR_MAX);
+	off = clamp_val(off, ST1202_MILLIS_PATTERN_DUR_MIN, ST1202_MILLIS_PATTERN_DUR_MAX);
+
+	guard(mutex)(&chip->lock);
+
+	ret = st1202_write_reg(chip, ST1202_CONFIG_REG, ST1202_CONFIG_REG_SHFT);
+	if (ret)
+		return ret;
+
+	/* Zero out PWM for all other active channels to prevent them from blinking */
+	for (int i = 0; i < ST1202_MAX_LEDS; i++) {
+		if (!chip->leds[i].is_active || i == led->led_num)
+			continue;
+		ret = st1202_pwm_pattern_write(chip, i, 0, LED_OFF);
+		if (ret)
+			return ret;
+		ret = st1202_pwm_pattern_write(chip, i, 1, LED_OFF);
+		if (ret)
+			return ret;
+	}
+
+	ret = st1202_pwm_pattern_write(chip, led->led_num, 0, ST1202_PATTERN_PWM_FULL);
+	if (ret)
+		return ret;
+	ret = st1202_pwm_pattern_write(chip, led->led_num, 1, LED_OFF);
+	if (ret)
+		return ret;
+
+	ret = st1202_write_reg(chip, ST1202_PATTERN_DUR,
+				st1202_prescalar_to_miliseconds(on));
+	if (ret)
+		return ret;
+	ret = st1202_write_reg(chip, ST1202_PATTERN_DUR + 1,
+				st1202_prescalar_to_miliseconds(off));
+	if (ret)
+		return ret;
+
+	for (int patt = 2; patt < ST1202_MAX_PATTERNS; patt++) {
+		ret = st1202_write_reg(chip, ST1202_PATTERN_DUR + patt, 0);
+		if (ret)
+			return ret;
+	}
+
+	ret = st1202_write_reg(chip, ST1202_PATTERN_REP, U8_MAX);
+	if (ret)
+		return ret;
+
+	ret = st1202_write_reg(chip, ST1202_ILED_REG0 + led->led_num, U8_MAX);
+	if (ret)
+		return ret;
+
+	ret = __st1202_channel_set(chip, led->led_num, true);
+	if (ret)
+		return ret;
+
+	ret = st1202_write_reg(chip, ST1202_CONFIG_REG,
+				ST1202_CONFIG_REG_PATSR | ST1202_CONFIG_REG_PATS |
+				ST1202_CONFIG_REG_SHFT);
+	if (ret)
+		return ret;
+
+	*delay_on = on;
+	*delay_off = off;
+
+	return 0;
+}
+
 static int st1202_dt_init(struct st1202_chip *chip)
 {
 	struct device *dev = &chip->client->dev;
@@ -301,6 +382,7 @@ static int st1202_dt_init(struct st1202_chip *chip)
 		led->led_cdev.pattern_set = st1202_led_pattern_set;
 		led->led_cdev.pattern_clear = st1202_led_pattern_clear;
 		led->led_cdev.default_trigger = "pattern";
+		led->led_cdev.blink_set = st1202_blink_set;
 		led->led_cdev.brightness_set = st1202_brightness_set;
 		led->led_cdev.brightness_get = st1202_brightness_get;
 	}
-- 
2.55.0

