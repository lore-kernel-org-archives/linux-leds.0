Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazolkn19012013.outbound.protection.outlook.com [52.103.32.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F0135CB7C;
	Tue, 15 Sep 2026 12:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.32.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789476295; cv=fail; b=s+/baS1y7g/2/GvjwaCyIN6jlIHixCJX7MeGniXZsLHH9aVcBgWfhZPQymsLrycyM89vohBZ8RGUe05TIxqaj2n1495mXIKkHOUT73xDubzYTNvRoytfOTMt1cAmwkE1BcTYEJElbbE3kxOUDrRHV/osZ4bb+nG8JNjKfQ6aqdI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789476295; c=relaxed/simple;
	bh=hLXgnBgQHAFolGe9gWvBEZjfjQqN6A0x3ZeolPn8bxA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jShjdhMJ00d394ewvLkpTwkM0x9E13xC8dbrKU5l8gsindWQtxSA5hBaqq1jUdRrFZKffvSsOBw7IZevQTyT+wY5PWHPxIQyLz6RilvhG5TR6ouBkYnh/1L8q4UACzV2Twtt4J8xIyVPYCt2DB2eL8A1PEKLNbCyM/ULGihtbG0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=VKRhc5Q1; arc=fail smtp.client-ip=52.103.32.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="VKRhc5Q1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FzengmjvVMBXoSdkXT6A2ePv0zGBGMeudX+AlPI8kbjhWuHAMxfIoy06v0riTE8mNU0IcShFXP0+TSo+8O9RRJsTijNesD61Ojz8gpljjYei5QsT/Cj7t8TWBTU5dkt/Ci3hXrGkoXYQzn5ATMw1a2uCXBbGYKvsvUInxXcAHENhTGDU29/8SV6rRHnHW/T/hHLufzC3cnDHYoZkHMi8vlHKkCMWNtZGUfzwwX86cHrY6yjYKj5uSHJoQx06Y4y+sAdE2mc+rvTHdEsAUSqTMijc1VRp7r4dGhUkq/QwZDrMbYMuGCI2eUqaHQaaqArCvCR/VDQHURAQpNpB3gAfXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LU3aOrGdS0/bstdOfFPOjaCjE4WZNUALgE7JueL4eKY=;
 b=TR+On8yGoOn/jb18r1Ohageruq62Yci+AAKKbR7qGsd767ZkKOgvEugp9TbF1+RoSKjUSDNrJVO6Jv8WIEHBc+po5/POCshDZsYjTbI7vPtmmkHf73vDuamjRmX6F25lHckgD+4NZUjTHlCObda2/ttvOIBafz+XeyLFGa28YE/9RAsIJpwHaQcsMiI7JJl+SOCf+qZXUUp0uwyXVf2UaxX/QHxsRFGJv+N3DzcE8Kp77HSotn2yqGcX19UIDE4UW5Iy4egH5GNiEsgB/f/KRgd1hhdzaz+sbH17vLdyiufV425zeSEVqpEWf19GV+hAMBXqLFtRbPFJ1yU2lTYbcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LU3aOrGdS0/bstdOfFPOjaCjE4WZNUALgE7JueL4eKY=;
 b=VKRhc5Q1W9kmfp7E07lS5yt6VnI+Ndz4ivcPwV/q6qNPRY4ts0vNyaUMZn3jf9EOBlrKeKRftvJOQ4j+2K/yb6XG+fuUpToOL8nN5lavX8tQcIwRC50MF65XA2vCetagWQjGQeUV5o6sXbr0PQ450RaSx96nHZ5YbS7cDoPkr1WM/MpwWOQNZpvAHk7X6uGvh367hO7lz3NltsJuq4MM3D3f8JmjpRVI0hL61N/v03STLZKzHfNzapS3XO2U9u1wJXI0MAsZtEi+ireIfVvBU3sUPMxF/hQfzzATc3lziqZlcwygdSv8SrbC+8aal3QTTZJD5DxhMtkj3C029sCvpg==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by DU2PR08MB10106.eurprd08.prod.outlook.com (2603:10a6:10:46d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.8; Tue, 15 Sep
 2026 12:44:50 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0428.004; Tue, 15 Sep 2026
 12:44:50 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 05/13] leds: st1202: Clear unused pattern slots in pattern_set()
Date: Tue, 15 Sep 2026 13:44:38 +0100
Message-ID:
 <GV1PR08MB8497E9939E3C0D68401659D0C5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <GV1PR08MB8497668D389D43F680D2CE3CC5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497668D389D43F680D2CE3CC5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
Reply-To: fombuena@outlook.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0677.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:351::20) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <20260915124438.3378875-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|DU2PR08MB10106:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bc672e3-f692-43ec-838a-08df132721e0
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|24021099003|41001999006|15080799012|25010399006|23021999003|37011999003|19110799012|51005399006|8060799015|440099028|3412199025|40105399003|2607281247196008;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?F5RAk9dpxXTGBOkKCYH4lbzbZTb6Qo1rQ0kEGdiLrvBnolE6oXwtFI02Ggh8?=
 =?us-ascii?Q?cFTHVvFreLRvkcPrJ3yT9vM0pUsSBjQg8VXl5SQ/1Iw/7Iq3bg0EyEr3iCUm?=
 =?us-ascii?Q?M5qBxlYHVY/LJEKmQa4X6ft30WVxJc8V1lC6jCYa5UNzkxiyJYyOP8PNbE5E?=
 =?us-ascii?Q?RG+yCi4wpLqn/xYRvhtyBu13iHiIQBLVVdbVBET4iWGyLPAPGvydwCZYkV/I?=
 =?us-ascii?Q?blTyuLxUUEsggWIL/scSnZu6KP4I0dQqLwt5Sokr0XTEEo61NHX4xZ0uwU9N?=
 =?us-ascii?Q?0xsQjqQSaglWhSBePB9aRgyitDVDn4ECap3VXPMcYBqhFssCbJ8f5bFgkxkd?=
 =?us-ascii?Q?pHdwDzWE75v3j0Evlt/iYfMtPYeCNel6cxDBhRrxi4194ghwPXsfS0Y9lN0o?=
 =?us-ascii?Q?mnPjL7c738AaarNYCyyB1EIYjPhecM1LG4lmYL3fZWraK0cOfxFPiqjm824t?=
 =?us-ascii?Q?GfX7jLJVa610GbTwKuf1S6iyn3QonBV7fcaifBb7ZKa4Xi99V1WaBmEciQh6?=
 =?us-ascii?Q?uGeIa3VD4Xa9GbIpcK27J6H/10lY1ZKix40eRxVUhy38qKYjFfWfbYz6snoa?=
 =?us-ascii?Q?2ZQFk1cJNRTi/GIq/3aRdMpIGdbd85poThnh2CfQGc/p1Ga9qpp+8AOCs642?=
 =?us-ascii?Q?a7Q/Ya8Z85LCD9AB+knFdGAbajl1gXBo/co8Uylsa1xbQWumszoQ4PV1TxvY?=
 =?us-ascii?Q?WyO31YXSDSjJnWWHMczvSqKViusflb9ZJq9PGrzNOIXVniEBiVeXBAuRK+yo?=
 =?us-ascii?Q?cenfYg1K9vQmpoTm8/gx/xFKwX6aLJPFg2FYq9CyZ6mgfN2aX8zjJT5Cez/A?=
 =?us-ascii?Q?K2E1kzuRQ5e5yrVZAxGYM8BhreO4g3aA99WEoNZe4z7mplpD0aloRgptKaOi?=
 =?us-ascii?Q?pDJJLS0Dxfq/9oty42B7bYwKv8MTPmReF17pL/aWITmA7YR1PREboNOa/5V5?=
 =?us-ascii?Q?ZOh1f8Ae68SN+dmcvoBa7wXbtPr2i0NsySXeqswZCbWg/OBRmpq2N9Hn+iBm?=
 =?us-ascii?Q?ipFP?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?t8XYJN+GGpHUJnvBg1wTVO6fHZbC8A0FFVUIJCbEqixa7EsOyx8jnORipNn5?=
 =?us-ascii?Q?Wwompi18vy1sn5D2YMFlpJO+pHq9EpCiZ0ipwOdubYhaXDYyuWyakWsvH+Xn?=
 =?us-ascii?Q?OAFLz/fTU60MZAMEJlvq4IzQF0F8aiRitK4shTmKjmg+Xi7B0mnxS3Z7YWiY?=
 =?us-ascii?Q?rih04KKmSG8m/RU/FJSZ52Dslen48cnGfOIcalBbaiXY72de5wTLfUtfdJbL?=
 =?us-ascii?Q?UjlL6r1P+LJNbtEz6FyC+4UCq5s0CUAaTTJem3jqzUCaEtWEYdvQ3tb6m0aV?=
 =?us-ascii?Q?wH2EXuy2AiHucNdcPycWIPPmjJcuuvayorIq8hqp6cMR72eTRvtHts47VhiL?=
 =?us-ascii?Q?pGKc/0xRVoEdvAvOQBpXpIGulC3DW5i2dTcEHhSGZT/8UnozU6BFQjc2fy33?=
 =?us-ascii?Q?8n+XZl/Yi78CDTnDOT3aXCvEsrumoktBANHMPCM672o98S0vxtim62gfKRS4?=
 =?us-ascii?Q?oaaPZhAHnGeYQBnmxbri5NwzuaU17mK5JNBBcGCuJjqN7700NTc21E3R/6Pp?=
 =?us-ascii?Q?SUQGOtdTtgvcbWp57v4dDc/qVTipqCe5WamZbN04M+SSobHwsDJ852Lr61kb?=
 =?us-ascii?Q?3jYe0ydojJKZOM1JPzVbsmWGx/XAJv3W9DGQdj7HXKGJL3tIlGGlzhYX55Hg?=
 =?us-ascii?Q?DIG7s/Mx/nuNgOckwPdAthpKGsiLtV2F6362b8PKpMa9MFyVmkb7xX1hpQvn?=
 =?us-ascii?Q?pvo6cau5lA0Jd3r20kljBdAgqcUwZVuCZZeKvREbU2MdZ0FH8cA5zE68kAjI?=
 =?us-ascii?Q?llwG8zhpcT0YWmyzXKQGEtFyoqGMJEf2myxs4Y7gFTdIHOTR5R2cgG6s/21H?=
 =?us-ascii?Q?Qk1AuFz36V2IxqvHoFR54YCXwaCOqd+3xLgO/I35AP93W74lwGOEIrdV5Hoi?=
 =?us-ascii?Q?hbNJjy7lLLb/6zfhJeNxDaWDRhON2+Iv5QhoafOowEsx2qOmP15GX22EAh5T?=
 =?us-ascii?Q?u8LK3lQpJv71o+tKRYSIGinsnVrmSBGWVk/LF3x7SVl5tKBXdOshQkswE8F+?=
 =?us-ascii?Q?9AmKk5PJ0B0pV2nXmEiFZATCUwBJOLvZEijp9Mz7w5qqb/NfLSPh2SrLKUZV?=
 =?us-ascii?Q?nO3B8rWUpnL2BGcehCeETSCesu5GlaG5DSyjYptN47YXDOy109s1Gju3sPnQ?=
 =?us-ascii?Q?45YVgfturzQW2x9LS1JViz/xULIhSspzodJKPZOx2Yzmaesv0YmVl62E2CG8?=
 =?us-ascii?Q?KDswIYnviieVb2+PyeuJEBUgZfV8yjlkBqWorR/6yBbQ15b6Ps0MmJ899JgS?=
 =?us-ascii?Q?QEv3mmLSMMSIujywtkG5taQ3UfguqaeoLmtMmPrckycLOs0k7F+tVs30jv7r?=
 =?us-ascii?Q?KuTXDm1N0l9wawzXR861BCGNT9GEf8LKJGBcUG/+Vv/k76TLH+25gk9OVsaw?=
 =?us-ascii?Q?Jl+qUuupDA9vng02DZy7Nb9Ina78Q4Ut6qWu5OdXYS43WW13/MtVDOkdRXGr?=
 =?us-ascii?Q?4n1diXxX/nikIwc4J6uGrEh2xvbGnFy4?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bc672e3-f692-43ec-838a-08df132721e0
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 12:44:50.6947
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10106

The pattern duration registers are chip-wide while the PWM registers are
per-channel, so a channel can end up driven by a sequencer timeline it
never programmed.

st1202_led_pattern_set() programs only the first len slots. The pattern
trigger calls pattern_clear() before pattern_set() only once a channel is
already in PATTERN_TYPE_HW mode, and activating the trigger resets that
mode, so the first hardware pattern written after every activation skips
it. If another channel has already programmed a longer pattern,
durations [len, 8) are still set, and this channel's PWM for those slots
holds whatever was last written there.

That used to be LED_OFF, so a channel stayed dark for the slots it had
not programmed itself. Since commit d2ca0e2b6d64 ("leds: st1202: Set all
pattern PWM slots to full after clearing pattern") pattern_clear() leaves
ST1202_PATTERN_PWM_FULL there, and so does the brightness path since
commit 7cbe470366bd ("leds: st1202: Fix brightness having no effect while
pattern mode is active"). The channel now plays its own steps and then
sits at full brightness for the rest of the sequence.

Zero this channel's PWM for the unused slots so it stays dark for the
remainder of the timeline, as st1202_blink_set() already does for the
channels it is not driving.

The duration registers are deliberately left alone. All twelve channels
share them, so clearing them would truncate a longer pattern still
running elsewhere on the same device. A channel whose pattern is shorter
than the active timeline therefore keeps the longer period; that follows
from having a single hardware sequencer and is not something this can
correct.

Fixes: d2ca0e2b6d64 ("leds: st1202: Set all pattern PWM slots to full after clearing pattern")
Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
Assisted-by: LLM
---
 drivers/leds/leds-st1202.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
index 90f69ac16714..9985b4b60989 100644
--- a/drivers/leds/leds-st1202.c
+++ b/drivers/leds/leds-st1202.c
@@ -263,6 +263,12 @@ static int st1202_led_pattern_set(struct led_classdev *ldev,
 			return ret;
 	}
 
+	for (int pattern = len; pattern < ST1202_MAX_PATTERNS; pattern++) {
+		ret = st1202_pwm_pattern_write(chip, led->led_num, pattern, LED_OFF);
+		if (ret != 0)
+			return ret;
+	}
+
 	ret = st1202_write_reg(chip, ST1202_PATTERN_REP, repeat);
 	if (ret != 0)
 		return ret;
-- 
2.55.0

