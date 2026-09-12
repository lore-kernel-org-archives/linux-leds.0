Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazolkn19013078.outbound.protection.outlook.com [52.103.35.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34743C0A0F;
	Sat, 12 Sep 2026 22:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.35.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789252080; cv=fail; b=cLVtCoMaXSJh2p6sBQFchQ3q1iodLhaU9ZrPyZIGcpzcC+wdCtikEb5hR9uoxkTw53ugeWqV4IfRrIIKqCNbXARGHS722SBCe+DBwZI1Lh05BJ4jVUjympBdhEf24g3XMEcLtuHMJTUETWk2rH7NvMQhrbxmpBn6q63/PYpLsao=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789252080; c=relaxed/simple;
	bh=k8Ivl43S90om8AtVYAr9kflOKH/DmStKA7131rGtO9s=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=MrluhHjiMXXLwCmeaqAqcnuG0s58a6dpzKHIBWPlJS6eZbURBbsvcqIaAUs0qrjmF8qit/d+aWHmia9eJiOtpJ1efaorXgFf9PYGd/S++dhC7ZrkB/wYElv/2VzNhW9zmIwRjp0fDYVHfaCNCiyGizQXPaQRtwQrF8yupq5Uau8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=ZCOZJcCN; arc=fail smtp.client-ip=52.103.35.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="ZCOZJcCN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wLpk3AQTCdAgRSyVjKUbfVyNdk/kByWZO+u3ZA0iqQnwUuqRnsKVebQJR4Wt6Ln3ytzb/J2r+KbAVsvyqAyw4TicOcS67D8+AlM/m375smZyUDD3tuSj8bGY4HCMUVtyftLkUvOpObRWqh+xF/9qWIDF354bU475fqHh1PGktsiLXqnS5MOkCrT491TptnHsI2rSB4rU5MUly9Cyll3z1GU4Um4tqqFMY38O0HNtuINTF1SLGTX84nVklu+ATc7ehWEK55xYQBVTLNA7+AR7p1c1pbnzWGwj7K4kw2RXHDNixZ5G3gUvKtztA1cdgc1ADp9l7ib3EF0tz2MaI4OIdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ghu0Ql4s1zcAQncBXoWOOSNVer+ZoiRtGsCv0BHAzmY=;
 b=CieNeQdgwDy2MWxL0GUAZMXu5D1XVJIJiH8uQ9mET/iOifZEsPpfbY+WP3XXCKUy6OacFdh2AX0Is14C9pNsEuD7TxOcKa1gVuPMESx5ujbzB/bjMBHKy7e2R/h9QQxUNc7DL7M24avy07b7y5UH04oSwaFUTGj+sewxatmMDkqDIGJU+EOW1eLAXipbek4FL2PnMRG0prCdXK5oVi/8xLOmqhLGx7W/ZDhJjJMUI/h9DCjBl015HIkzFrGS5/gA7ROdK0ej+fUvrgsKYrNO3aRTjBvU+8SpxlGmIU03KABhXy+Oyn8oM70EWcfxPLeJ0XZE3QHee46fo0VS94eHDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ghu0Ql4s1zcAQncBXoWOOSNVer+ZoiRtGsCv0BHAzmY=;
 b=ZCOZJcCNXn5rXRziZuCO4KOUMZiLePaWzIHVtnR12BNJHBJUop2ONGw/wfg1yfB2I4FTR4n87lu2GEAVArV7OEHaUhABxUowNnoHjtN5NsphuUHGlV0tLV3k7SP88j8zALaSZEDV3WBMcy4VFaSVg7T9626YVGK3kyq2QuRCkikMEoZhw+IEHXeR8D5E1nE6gWb0BzEbqZ/wqLDGurHiNySPeYHzvAE4T9M/pDiAujTA2ReCekuRQMLE2XhjXvpKxGJWRM6mNz0oW9IpjBG1xlnwHFKAk0lmc1cOif+I0gkoMkycY03uzja2Y99uxhhfW8MDowTopbkchQvCbHdvQg==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by PAWPR08MB11560.eurprd08.prod.outlook.com (2603:10a6:102:50f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.7; Sat, 12 Sep
 2026 22:27:54 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0428.004; Sat, 12 Sep 2026
 22:27:54 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 00/11] leds: st1202: Naming cleanups and pre-existing fixes
Date: Sat, 12 Sep 2026 23:27:41 +0100
Message-ID:
 <GV1PR08MB8497422B7A44424C4968AEC1C5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Mailer: git-send-email 2.55.0
Reply-To: fombuena@outlook.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR3P250CA0002.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:102:57::7) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <20260912222741.3044463-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|PAWPR08MB11560:EE_
X-MS-Office365-Filtering-Correlation-Id: f3d45baa-d512-4ead-01fd-08df111d16c0
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5062599005|5072599009|37011999003|19110799012|15080799012|8060799015|23021999003|24021099003|51005399006|41001999006|25010399006|4302099013|3412199025|440099028|1602099012|40105399003|2607281247196008|10035399007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?h9Oi5parxMQhuptXGKwEfhqDgXr1NM5gb8EEhMrORfokE1IjRfLtT1Zubj6M?=
 =?us-ascii?Q?h720E3AOswNMS/xWwvw7v5ixjamGbRiJ+VFy9YaTHdyc7bjvStF+BFa1OulI?=
 =?us-ascii?Q?CzT47sxdFcIqmbGFV3G7da5koQYLebNIzXacwcKlP4sQtjoSgfqqILjUbtGQ?=
 =?us-ascii?Q?WEMzulF1GbRns6c26YMCy4Y3gk4UTU2s5Zs50FNcyBXYjPYlUy5fnhyeQUPc?=
 =?us-ascii?Q?bJl75qaXuIgIY9s5oCgr2+NUM+q+YAhNtbYc9ehtQg3yFJYPzFQsESKJjpVF?=
 =?us-ascii?Q?pfbqX0MGcHIPkBBUtpvcP50rQIQo+75tsekDEX9tGALGwfw6OmZQLTRsC8u2?=
 =?us-ascii?Q?natAQWiFiHgBf0imkd+vWiYMVJEVJNW4YxR8mJ6uC/l9RCsWg6j1R1AqECRO?=
 =?us-ascii?Q?W5a8a+wM62ji2WeSo6JBfQFS5ZRwhEGj7z+QVZ88UmzI3e3DPqsnM3TN/luf?=
 =?us-ascii?Q?DzQXg5gxbsUAovObWi7OFPYWQCFvM93hWw442vFfA1Od2Q5My4p0Rrv3umLd?=
 =?us-ascii?Q?oI9LxnIeJC2quRgf2RGFeWvYeMc3uKl/wNiX78E8+Cnb9iS3ADQqDABIJ+mj?=
 =?us-ascii?Q?ltcIvJJSNT2XTeXMFTu8doN9z3OwbZt6qB/WYQkAqjfUE69ljvb4IUwx0gza?=
 =?us-ascii?Q?mygMqIZo0RkWXg4K6gjyUEmBK2GPRVsjN92usTa/ogGSveo6iJgRY7BNCbkm?=
 =?us-ascii?Q?MQJud/ruX8ivtry53suFxmndH0636UwjMPw3IfoFyMaCM8LDB2+Q7MYPGyWi?=
 =?us-ascii?Q?zVMisiYaH35BZFy5xCjamhR3NsCsDIkBGONn+JBf8tAT+eYIitdvX3Y+U8jU?=
 =?us-ascii?Q?MbJQmY7YnFq0USaLA3EeJQ7EpFaxtLYwxYFpinScbDtLSWaBL3LAHdL96Zin?=
 =?us-ascii?Q?m3kMP9PDz+5qqfg3tNp/GrjBuUJX0Lx+HDAdXfPI6b0ernk44jGLfebLQEjk?=
 =?us-ascii?Q?AnkMR4gG1MLQctC9PcqqHR9/c41o2ibar0ACPmI0p+pvVn7q1SkYeCAMMDVS?=
 =?us-ascii?Q?uAVBfenR1Gp+MtY0blMMLcw0ujQcwc0kq1+brZr3vT/jZRvUgAYr/m3xZ2II?=
 =?us-ascii?Q?hnwvMtIjRfEKKw4ihcWYf+jOn5LNxEJLvcA8NkNpgaXwhoVwGKzFhEW2pjXd?=
 =?us-ascii?Q?g0vHlykL3IQ7?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?J5T5RjveRgttVmXhN1wYl1u6bwTv++TP3saE0gBrB3s7FV7Y53l04RjKyTYY?=
 =?us-ascii?Q?7rFb4S8xWwfvYt4r/GxY/Jauzwi35/SqRaYpk324Kzd2RVRXX9+ttICxapQF?=
 =?us-ascii?Q?FbjSSdZitMRrWKH+YCuzSj3CnsIAnmuCsazpFi4A2rDmL+LjuUf4rWSIxcy4?=
 =?us-ascii?Q?r3m9nYoL3llaJdRK8qsl51rNQfK/NE04gXxgZbEA23izIBFmmt74ajPEFV++?=
 =?us-ascii?Q?1Bsq/3BPaUktcJlax7P3AYycxfP1njFEoMgQ1Oc3An5z0YixW/eGmZSShLEs?=
 =?us-ascii?Q?iCvEOT9YH6648iSgsnUpvjcU5RY0ggskhHSMRGo9uBl6Pjc+SItdLqIfaC9K?=
 =?us-ascii?Q?/XfXFRugsZ+tJGtu94ltIbpcdi0rr9aFQ4K/hHBaE6f0ZvqBzzrSy93rvICo?=
 =?us-ascii?Q?ZOMvzJ1bCjvInK+zpjtXTOLaF0802S8Qk9kVRrRWRwRpw4CbsxT8ktNv6UKW?=
 =?us-ascii?Q?1izbcl/o8+XO2/hFTeQsfEZ9648wASoFTry55D4nDK5pbRO68K0KUv/1oPbP?=
 =?us-ascii?Q?Jaq6YtMUIvojOn37su3hkmiL1ohmHmlhC6HWndemLMMapOFt3EguHxJ/gT/d?=
 =?us-ascii?Q?wcdkjP7BxbIQdpxm14axt/kWMVfcf//xsqc8R1FxCAsm5HAPyVoe1jp0kKM9?=
 =?us-ascii?Q?9r4xupZghd/mc4mc7CuK+FA8H1Z0Tob32OPmu60zJmt1QFwZr1lQirpb+Y+T?=
 =?us-ascii?Q?5lIjByjEfrH8JsuVB1SZP1GcheaxfqfLcsWYtgu/gUvlxtOOTlqMIRUjUHTo?=
 =?us-ascii?Q?LdaQyJQ20+7UxBZ4JYwnZliOclC67JWstRWWhVrQeBvBD1U2cQqjsejy0s/I?=
 =?us-ascii?Q?UX/NcOZvxnaPEFli3nNxr67D+Z+535kEIJgtiyOfOH3XbPajG6ultwZyVdfc?=
 =?us-ascii?Q?7ip6oQqf5O2v340osVZFUUgQEgDA11xHbkcjTZqytt8aHd6Pok8sIXriTCmS?=
 =?us-ascii?Q?KMrC/Ey7m3HEGkc1MaqgINNJqAGp1Of5BcZi9JiXWBHIFO0q2sT1Z5NukTr5?=
 =?us-ascii?Q?GZumyLVrisfAG+e85gAvd32gDh+OQmBeel/6OCqT0Madfz9E8ZB3A+1Izsvc?=
 =?us-ascii?Q?YRjZyBroMt/Q1OoH/DiaaTJNI7k2JFfY3Vf5wfeqcmslOjx34AdFvpo39JqK?=
 =?us-ascii?Q?+JRRDlfraeXHB1LzTZDT4Rl+x4w1/ZqDNdpa9iGgdpXcut2RmkncoTP5mS0w?=
 =?us-ascii?Q?BGbSr+IJGgHrN9WDL/UxK06JYvz8TbVCCM4ZFkclMW3udGoXw6SqOXK+cdc0?=
 =?us-ascii?Q?pGQj6mIwD9xfxPMCZYZ75ADxd8k6A5asA7Ch1Jth8+xlzoX0omW7OQ6nKrkc?=
 =?us-ascii?Q?jRlmND+rPqlBCqteK4l1QAfkxJ0aqbasbtLBYlIekrXO1r6cC1zEGS/r8dUB?=
 =?us-ascii?Q?UgepeGLaKbNb/Yu75ADzbiMJRwT2bAUQjRQskZQvsZT43S8jrvnRkifteFBb?=
 =?us-ascii?Q?T/PAn68a7CTfhP41nLP1/7PvZbvCbwy4?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3d45baa-d512-4ead-01fd-08df111d16c0
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2026 22:27:54.8057
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB11560

This series collects the issues identified during review of the two
previous ST1202 submissions, the pattern engine fix series and the
hardware-accelerated blink support:

https://lore.kernel.org/all/GV1PR08MB8497C0B898789BB73ACE6EE3C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com/
https://lore.kernel.org/all/GV1PR08MB84974C7ACD911E66864C5008C5DA2@GV1PR08MB8497.eurprd08.prod.outlook.com/

Both left behind pre-existing problems that were out of scope at the
time and deferred to a follow-up. They are grouped here because they
share that origin, rather than being sent as a string of two and three
patch series.

Patches 1 to 4 are naming and readability only, with no functional
change; two of them address comments from the blink support review.
Patches 5 to 11 are fixes and carry Fixes tags.

Patch 5 is worth a note. The eight pattern duration registers are
chip-wide while the PWM registers are per-channel, so a channel can
inherit a sequencer timeline another channel programmed and then sit at
full brightness for the slots it never set up. It clears the channel's
own PWM for those slots rather than the shared durations, which would
have truncated a longer pattern still running elsewhere on the device.

Patches 6 and 7 belong together. Pattern brightness values were written
into the 12-bit PWM registers unscaled, so a step asking for full
brightness produced about 6% duty cycle; and the analog current register
was never programmed at all, so a channel whose current had been left at
zero stayed dark however bright the pattern. Together they make a
pattern step of N produce the same output as writing N to brightness,
which is what the documented hw_pattern range implies. Patch 7 takes the
current up in pattern_set() and releases it in pattern_clear(), so a
rejected hw_pattern write cannot leave a channel latched on, and a board
declaring a lower ceiling through max-brightness keeps it.

Patch 9 is the one worth the most attention. st1202_brightness_set()
takes a mutex and performs I2C transfers while installed as the
non-blocking brightness_set callback, so it can sleep in atomic context.
brightness_set_blocking is installed as well, but the core only falls
back to it when brightness_set is absent, and that callback ignored the
requested brightness in any case. Neither can be fixed without the other.

Patches 10 and 11 do for st1202_blink_set() what patches 5 and 7 do for
the pattern path.

blink_set() programs only the two slots its on and off cycle needs, and
leaves the other six at full scale. Those six are normally invisible
because their duration registers are zero. Durations are shared across
the chip, though, so another channel can set them again, and the
blinking channel then lights during steps it never programmed. This was
reproduced on hardware by blinking one channel and giving a second one a
four step pattern.

blink_set() also drives the current register to full scale, ignoring a
lower ceiling from the max-brightness property. Patch 11 makes it use
the same value the brightness and pattern paths already use.

Two points raised in earlier reviews are deliberately left alone:

  - brightness_set() programming every PWM slot to full scale, and so
    overriding a running pattern, is intended. It is what makes the
    brightness visible while the global sequencer runs, per
    commit 7cbe470366bd ("leds: st1202: Fix brightness having no effect
    while pattern mode is active"). Stopping the sequencer instead would
    halt the patterns of every other channel.

  - Only the pattern timing is shared; the per-channel PWM envelopes are
    independent, and running patterns on several channels at once is
    what the hardware is designed for. A channel whose pattern is
    shorter than the active timeline therefore keeps the longer period.
    Correcting that needs the driver to track sequencer usage across
    channels, which is outside the scope of this series.

Tested on LED1202 hardware over I2C, on a Linksys MX4200v2 router
running OpenWrt: brightness values reaching the current register, the
atomic-context path via the heartbeat trigger, hw_pattern on two
channels of one device with different pattern lengths, a pattern
programmed on a channel whose current had been left at zero, timer
trigger delay quantisation, and driver unbind/rebind cycles for the
firmware node reference counting. dmesg clean throughout.

Patch 6 was additionally checked at the register level with i2cget. Left
unscaled, a pattern step asking for full brightness programs 0x0FF of a
12-bit register, 6.25% duty cycle; with the patch it programs 0x0FFF.
The datasheet (DS12875 rev 2, Table 7) confirms the PWM register pair is
a plain little endian 12-bit value, low byte followed by the high
nibble. Its helper scales against max_brightness, clamps both ends of a
signed input, and guards the division, although the LED core never
registers a zero max_brightness.

Manuel Fombuena (11):
  leds: st1202: Correct the name of the prescaler conversion helper
  leds: st1202: Spell out the phase-shift configuration bit
  leds: st1202: Name pattern index variables consistently
  leds: st1202: Use u8 consistently for 8-bit values
  leds: st1202: Clear unused pattern slots in pattern_set()
  leds: st1202: Scale pattern brightness to the 12-bit PWM range
  leds: st1202: Program the channel current for hardware patterns
  leds: st1202: Take a reference on the LED firmware node
  leds: st1202: Do not set brightness from atomic context
  leds: st1202: Clear unused pattern slots in blink_set()
  leds: st1202: Honour max_brightness when blinking

 Documentation/leds/leds-st1202.rst |   3 +
 drivers/leds/leds-st1202.c         | 145 +++++++++++++++++++----------
 2 files changed, 101 insertions(+), 47 deletions(-)

-- 
2.55.0

