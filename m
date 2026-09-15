Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazolkn19013078.outbound.protection.outlook.com [52.103.46.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B123B47DF;
	Tue, 15 Sep 2026 12:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.46.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789476452; cv=fail; b=TBWq6lIWiPabsy86m8mMnY0Scq0Apfcu0ttRHXdZEZ1MhlgqzBZVajl0khtEOX/69Ws3fkJX2WPxu8psNUC8+29yIDHaSrCI8wo0SXzaQA2r69CVn3DGmcTUtEAFk+KBExeTa93yPvgcaUSYoWdAXbhM7WqLgK8MwcNk5rdtqrc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789476452; c=relaxed/simple;
	bh=BKk9CMnGlkUMXEQb4w7CA6Dmh2mmTlWubCfWN8QgdXU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KERCbpeRZNhlhhRBI/xt/9fgCq/pfw83iiTs+5Wvj0rhP1EchegN3KMX6T1AfFPyNwi2WGu32J5vIK39mM+Punv3v9Jd8Nlv+DLRgD2WvLs5A4AQ8wjLHVJwC//ZJ0/CoIWsr9r5kqQwWvT2N+mYbxS0X2rLaJruKDYimVxGgn0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=PIqMS0ao; arc=fail smtp.client-ip=52.103.46.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="PIqMS0ao"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W71RnMuYs7804Y6QH0wcStuilm5tMxb/FW8tjJIlTGQG3+8orOxlWiYSdMrViRMKLuzUNPhg6Vh+Hm5znMSILswPQ7Wy5RIW0sZbeFjOoWF7YVqCibtn9+zkRtHAfKr5ZzQUtmTymF1JOYurjog6Qrpvjs1C5UQPjDALI6XU1JhjLOZVtQ+SFnv4q3TR6kpDGRPICTmV63xw1G3yWi4aHrRt7/NlK3hKEQpR1LNKEGlYepZf1HEV1faJyKwKAnud0NsNg16boQEkwud8KFNr7eOV8km9+sJ0lmfB3wOwbiGHCM3VkZ+dpj23VoXnNoMixnuyvCDkb60AsVJp2UhmMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vUsQwvGCdAcEAVzhEnMH0w4mI9DiaC+MJAThiHpVvz4=;
 b=UDFJEuV1jzsaxkv2l9/9Uby1hVnOR36W3sSQ4RCSJPNnE+XZ3m/Z9Iy/F6rx75caEf6z2JBZ5QnAegzZNl29fxcDE3YcQuzRfKKAyxmGsb2vonp5lSHZ0k9xcLG4UaIIW8zTMP4afB6nBWMa5FzL3XmGQd4O8oEwF++MGkdE28XUtTddr2S4xgUKBk7d4kBrQ9IIeEi6N6jQ+ToKilYFojPQfhYzz4BmHDHtsnM2ggoCPOjqeY8i2tnMGaRF1g7tUfNRl4wIY781VEkpR7aaTTIYyPT194dw1B9rOgfymy9IXk09Gq4q17RdkAAUjHGmNWtbke5Q3OxtsChK62NiTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vUsQwvGCdAcEAVzhEnMH0w4mI9DiaC+MJAThiHpVvz4=;
 b=PIqMS0aooI8rjls2NcigEKFhHUZNYlL7k3S5yIsmpobDzk8gX3LROjEGW0PPju190Ami9peo94PPOMKC02auKRRgYAkzyl3mAeYB3s6Czf+kTWX6NoO1yZePi7DrRQHFhGCm0+ghtRtlukuuvHJ7KeqPnm6kRInFsGbl/wLeK5CPp1HOZSi8HaRPWsM3F8+4I0JJLSLZSqUcph3LlyCxGXVn6mddPX+7V8enVLtXwOtgBRpVE6hGhjaUijNm1ef65ewPpr6nFta0QlP83kMx3KRxLGvkD5yK9JRlKX6kSlN9Z2v8h+GSImfHpvnc+hsyIEvXSK/biq/WeImvWgqe6g==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by AS8PR08MB6263.eurprd08.prod.outlook.com (2603:10a6:20b:290::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Tue, 15 Sep
 2026 12:47:28 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0428.004; Tue, 15 Sep 2026
 12:47:28 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 10/13] leds: st1202: Clear unused pattern slots in blink_set()
Date: Tue, 15 Sep 2026 13:47:16 +0100
Message-ID:
 <GV1PR08MB849770CF6D41F3DFF56B1AC3C5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <GV1PR08MB8497668D389D43F680D2CE3CC5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497668D389D43F680D2CE3CC5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
Reply-To: fombuena@outlook.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO3P123CA0012.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::17) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <20260915124716.3393662-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|AS8PR08MB6263:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a02d551-f03b-4263-cd19-08df13277fde
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|24021099003|41001999006|8060799015|19110799012|5072599009|51005399006|15080799012|23021999003|25010399006|37011999003|16051099003|3412199025|440099028|40105399003|2607281247196008;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?C0DSqGE6NeJnCamN7RGq5/7Leo6z5ebzPcJecUzS3ceVmCMxTLh7OPs3D1Xe?=
 =?us-ascii?Q?wtnQx21i0ZDCXLx/gqkpF7YYRJ3Nj2NUbErPMFQ9x6EWG3VYRYGUKL0IxO2t?=
 =?us-ascii?Q?xEvo3hY+1o/5E+cu0t8Yd82n/VA09dEa3kkdGEgCEKqVdzWoZdt/+YYs3YA7?=
 =?us-ascii?Q?obLPqH4e34O7wAR8tDl3W8GQTxiqgduCv1VvkfZs6ZxzGoxkhnXNkREcNkhh?=
 =?us-ascii?Q?PxSrNEUQLKXnTFXWJG763pmq6XZYJFrSRLDfsxRy0uBRATzjxK7cEwJ2eHru?=
 =?us-ascii?Q?FupQoCeV+BQkPp/6NP2GQmDb62mmVlvlDZASsZCDTwkG/Iq47GmiJZi/1Y9R?=
 =?us-ascii?Q?2HYOTWh985GcC+UzFffZxbFypeE6y2/5VTGuuBoQvX8U6wtb40hgPEtUFzQ5?=
 =?us-ascii?Q?LfrrWKqtc10LqAx0F7aLcqiyP/A+4k3viHWyNVxAQ40SAccfzlBEKyn3f/q3?=
 =?us-ascii?Q?qwiRPpJ1YOQ2kJ9We1vlVhtO65wy3CWCBkXKcwS53dGxRnD/ekbhHCUyBu7G?=
 =?us-ascii?Q?cMaUPtL9ubPvLYRaxt//eYfGVCCPXjdjVV+woXu+CIOdMVm5muEV4CYLcwX+?=
 =?us-ascii?Q?p9WlWjWbQn+gwNOLYa2odcTT0vj3BwCRIK4j7EcFE1VUMM5IC/D99zt7Xmdo?=
 =?us-ascii?Q?t6SlYe9cwQ7WUw2t0IzRIe3eeg4sqqYZzQeBFXGsp8MdYeMIWZ3XGbTjepMD?=
 =?us-ascii?Q?FcVq6A98S82NneSUxHmjrGlc+QeBRST5GHB/9MZn4gNmXSHNrM1ezAbFIb4p?=
 =?us-ascii?Q?uliN2RiCxTKKLv5HaYnRkqxXKEWECECcULgaIjmLluEb8/tbZ1sCOMI7lhMf?=
 =?us-ascii?Q?IlGtG4rJJutdAy+PGtNiTFPm4UP3lJ5YLSYPEeEfOUYIxK4TqMyEEpDgtSpR?=
 =?us-ascii?Q?Bg4xM6QABXWl0iW6yQlz2pfdzfvqiwb0FEBE0v6os6euomADoloaFgfhVIyc?=
 =?us-ascii?Q?R/QBSh7gZwoEVaUm7msqjBcXoSZG7aLg7Dqx2BdirmWtI0Eja7rRlmB9bVGP?=
 =?us-ascii?Q?Io6e6lU1IwHFw5IDXtU1zC/6ie7VdvDkD34mWrAxcZhOawI=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?c/R5MziuOWC3kqDUJl4unMgq9RPgAHuMlE3H6A990ZU13N0K8/S34Bgi5Y3j?=
 =?us-ascii?Q?LOxc+/gI2BKVqR0jsupDG4oFUM0LNpQYDgkL0ixupxccEsBswmZkTJEGsw9N?=
 =?us-ascii?Q?Jz8pA8SsqSlZXjT7VYbofqqXe7i2KTf0En650RpQRqdTFF+nJ7Ejewwf+b8G?=
 =?us-ascii?Q?vdRcR0oS5uoQQW4sx4fhG/3CRGWKkcckdUM8uq8N4Ag8xfVvQRyzv/MKafgv?=
 =?us-ascii?Q?4yUJLz5jPzdajQqBQwc5qHkUYSg2PC9xv0amsQpjFxX9250hFIuFbTj0ZsQ+?=
 =?us-ascii?Q?JXGd8gSOlks6bNSDSa+5YT3I0Y4ZGjSQCKd7C6faPfOrR2o6qPBuxdloOm4w?=
 =?us-ascii?Q?DqdrJvcsxmVuqtM93o3f3MSeiHmmCLv780tO2DifjBpdTHJmRwHhOtnWDzYp?=
 =?us-ascii?Q?HD8xJpi4sESsIsQMED4BajsPcFYCTKtCCIJKeHy+yxmPfpsFQng9QW/24Peo?=
 =?us-ascii?Q?C9QXGvgTonhFEr7MhUdhlIRkq/GCGGbPbnIQ29js8cK67hixMoQsinM0r2HK?=
 =?us-ascii?Q?9VZ4K7zn9cZqg/Y7au7vZI6XpOO23EGHqAtlNEI9Ke+WGn7aDmaNp/AfOXnr?=
 =?us-ascii?Q?c2tGUSWKoG0V8vanhfJ9jynnApuktjVs9y2f2S7L3YAcCLFgmZFa5g0We3oX?=
 =?us-ascii?Q?ny5NP071RIvJadox/Wry8nPTmBoLHR1lJJ4o+p6WpedOCK0LqOK2ERI+kgMv?=
 =?us-ascii?Q?4JRU5kleJ8vBzk4ndPeZpjNWZ5znAw4ypDyN0XSIwzRosagY7tuQ5bJUCYtc?=
 =?us-ascii?Q?ojhwrewgEBj824Ui2DqDqFDBZbLup9kT2CEnIkjewstArlqjL6Xsnzd7Nv+Z?=
 =?us-ascii?Q?IVOm3KBBlLrxucMBbdx4i2BDATQtWv6NAKzMheUNljoXnkhW/jBp73XYZZVB?=
 =?us-ascii?Q?wr5Sx2AoRB+S+RTvyTk/RmsAdCApBHQJV2rqMQ+z3hI6OTb/ITt221K9WS/n?=
 =?us-ascii?Q?I4YOW6Y95jupxe2+ddGS6soFTnRNAzG0+OIgEaQMLDVSn1ZUXm0GOClTQnrx?=
 =?us-ascii?Q?sETP3DNX/7+gwm+NIbJT+XD8B5Jn5vCih98DU8JVTrWi+RynkOlgcL1aMS5w?=
 =?us-ascii?Q?GE77yOoOMS3KCpTnyNShb6u4ewMKRuJHJYBXG3UIOkJGN0lWc/2qINOisUUr?=
 =?us-ascii?Q?lAkKElO37QQ/VFN2Ga30J/o8kRqD2Jx52kkEI/4cdaWs8ei1/NMIGHCZyeHG?=
 =?us-ascii?Q?tGk/sZjF2L7Yq/WNvi9EkUblxAJymwU4xvyB5JnRHrhD1nfjdN2C6it2ekKZ?=
 =?us-ascii?Q?u541K7kEsJNakN+0L1M4+8k0D6gEXjPs+dI6G86NlakM8ThT7gD/L84AVyQd?=
 =?us-ascii?Q?EpRj3yx3yrQ/RRsaMj06ipSttRzOJ5vA24Ik3WmcrcvvRde3PAa6yqqipB9R?=
 =?us-ascii?Q?8H+iRe8Hc3p3LMo2ajT4MlQzyF7hukiapc0wN+Gw19lhelUrYRUET1TJeVuJ?=
 =?us-ascii?Q?C83MDnzQnXiefb/NUDBeNtSGJuzQtw86?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a02d551-f03b-4263-cd19-08df13277fde
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 12:47:28.3363
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6263

st1202_blink_set() programs slots 0 and 1 of its own channel and leaves
slots 2 to 7 at ST1202_PATTERN_PWM_FULL, the value both st1202_led_set()
and st1202_led_pattern_clear() leave behind. Nothing keeps those slots
out of the output except the duration registers being zero, and those
are shared by all twelve channels.

Another channel programming a hardware pattern longer than two steps
writes those durations again and re-arms the sequencer, so the blinking
channel drives full scale for the extra steps. With two LEDs on one
device, blinking one and giving the other a four step pattern, the
blinking channel lights during the two steps it never programmed.

Zero the channel's own unused slots, the same invariant
st1202_led_pattern_set() applies to the slots beyond its pattern length.
blink_set() already zeroes durations 2 to 7 when it runs; the slots are
exposed only when another channel sets those shared durations again.

A channel whose blink is shorter than the active timeline still loses
its own timing, because the sequencer has one set of duration registers.
This only stops it emitting output it never asked for.

Fixes: 35cbd34a6a05 ("leds: st1202: Add hardware-accelerated blink support")
Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
Assisted-by: LLM
---
 drivers/leds/leds-st1202.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
index 101468557f6c..42989b4fbaf3 100644
--- a/drivers/leds/leds-st1202.c
+++ b/drivers/leds/leds-st1202.c
@@ -358,9 +358,11 @@ static int st1202_blink_set(struct led_classdev *led_cdev,
 	if (ret)
 		return ret;
 
-	ret = st1202_pwm_pattern_write(chip, led->led_num, 1, LED_OFF);
-	if (ret)
-		return ret;
+	for (int pattern = 1; pattern < ST1202_MAX_PATTERNS; pattern++) {
+		ret = st1202_pwm_pattern_write(chip, led->led_num, pattern, LED_OFF);
+		if (ret)
+			return ret;
+	}
 
 	ret = st1202_duration_pattern_write(chip, 0, on);
 	if (ret)
-- 
2.55.0

