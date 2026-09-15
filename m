Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazolkn19011037.outbound.protection.outlook.com [52.103.39.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88601396D28;
	Tue, 15 Sep 2026 12:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.39.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789476024; cv=fail; b=NIhHhrXx1mFT9Bq8INRORnFA2Nm5cDUAyaHJhJqP4NZKe0TbU5cA3uax+0my4rPXEr+qndx7kD1PBi7EhuWb2Jdp9HA3AgLlmkCmOPARYlOh0R/RwIqqhEZG6pqZFxXpZkEzo5KqZsTr9PbKtvvlonjn0gb+8CXNcEDlixVN3+E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789476024; c=relaxed/simple;
	bh=zfIsMZsIcJNnN/dYNbf6KdGiwmBdhVJjRWJukWPZ0L0=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=XGTHjDdS3hF8Fv9CIK6fK3+GgUG1MFFtVliZ6D9leiM23TFv2cGgeMYCQGu5JZ1cItvWyXZRSEJR09UhxeOuuMubpho2CH0+ZPmOhInvYWL9XDNxnFyBnXurE/ym4mgWUMiqO8VHb+GnOLqPhd/AmLyHK8XZFwLt5Yt9QUjS9og=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=ozdhGYVb; arc=fail smtp.client-ip=52.103.39.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="ozdhGYVb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y0WWBRsKO3do0Df0clGWSEJyj+QL8P0SM8bNF/6ZbQZy4w4o9Qv08pGvWgUH1nvc5QLrNahmJU37FehqdTUpb4U4pfvn0Vw7lk1meVInqJnrvXuq7zLuYdiazgF9yMxxkdPaF4qfL2m2YEfrx9pnzPDvzkW0HZWA/kBQPu2gKn+CIfaYi7Kzjjq/DoLla1jc+hoEqoOgI+5rJWNhesZfXkOAbHl6y9oRmrBO3cugHeg3uV3QeEqFxTjETq+rfNpKJQcbrH4jePdv7MfUVeuLURqe7vU5YGdYLkaY0jHDbp/DqEc4g8ziBLAizJk7d0GHgGF1qszd4pv9WI98GBNa/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=839TlPyF4hO8aJ99r2JbkdfYRx+FYbQQMSbPA8tkwdU=;
 b=BcsQssXpgJe7/eN/6aAFcsfzEEImwGHFWvncaOnjvMVYs0y5A0uFroLvBFW5dHuCxbDwnE3nNFQhjCqfmPD2jRU83U6QzHONbLNrYcQhyp2SgS5UtO8WFK1Dd2QUw+JLNjtGOAsU3MmEAdlbZWjPnwgacyFE8mqEr8pvjBwnKCfdcT7VO7wsCglKBd+cqH8rkGEnwJUdjjGaq+zUGsUbgjkawJoWkPQMPWF9+OAFIR73+yveZVFMJRX8C1nukZx0LgL5aYs6QEu9ac2TuIKE6BMaNafuWP67NhkLPS+bygZzkzKPxCCryNkmeoaLzKb6d9eAADj8RTuOGq8a/1qVAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=839TlPyF4hO8aJ99r2JbkdfYRx+FYbQQMSbPA8tkwdU=;
 b=ozdhGYVbs2jeinkkigWYELtStPOisS9MWFc06qzh+vLauy3Z8Bho0FZ7aTzAg5co6fiVwPOxwuRtN+4VysOTp+aV7g9ST24Tvac64SnGaPW3WlA6RhVLwyFkn2eg9rv2cv8W2b5NYo5oTFwDupgtwS/eg/ZtMVcijiDplN7yI+gwHzw61rlazzP6V3TAP3jkBWMfFVF4uUFN8Mub4YswpE5itZyOshSVBQo7P3d292U6a12cEBpK8wRwcj2cqqyVIjAs0BvI+tukcFRPFuyC0DgCi+oZrLs2S6XJNMWUf0FWhirJZ1rw5zgBcNhi/oqmoLxodzPTS0rd16nuHKCTqA==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by DU0PR08MB8397.eurprd08.prod.outlook.com (2603:10a6:10:407::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.7; Tue, 15 Sep
 2026 12:40:19 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0428.004; Tue, 15 Sep 2026
 12:40:19 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 00/13] leds: st1202: Naming cleanups and pre-existing fixes
Date: Tue, 15 Sep 2026 13:40:05 +0100
Message-ID:
 <GV1PR08MB8497668D389D43F680D2CE3CC5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Mailer: git-send-email 2.55.0
Reply-To: fombuena@outlook.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0145.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b8::18) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <20260915124005.3309534-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|DU0PR08MB8397:EE_
X-MS-Office365-Filtering-Correlation-Id: 7515e17a-522a-4138-296c-08df13267fff
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|51005399006|37011999003|15080799012|25010399006|23021999003|41001999006|19110799012|8060799015|24021099003|5072599009|5062599005|40105399003|12091999003|1602099012|10035399007|2607281247196008|56899033|440099028|4302099013|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?C9SG1u3qz6oEKmeOJQlBJH4hO+wbHjWms+Lfz5UWllFeS7ZMkqnMLVFIQOci?=
 =?us-ascii?Q?2RZNCt5W/3FgftQbKf02CBDHSeMo8op3PD+Rs+foBZJIm4Rm0Et4+5Z5itov?=
 =?us-ascii?Q?oPhoKx2O1gRoh0xwOh30OAccCPYgRy1bfDst6wPy6CN6lVwFYaYLFqX+i3Oi?=
 =?us-ascii?Q?XFiL8aj5CUiiJeWZgXWYTh2qiFaniEgroU+R71erUrSpPpCQKHjJpW1Xehlp?=
 =?us-ascii?Q?05x+2JR0ERhIJigm8JozX45ChS4BqsL02ZZO+MHZ/oXxmIcBN1GNbrEimeyp?=
 =?us-ascii?Q?6lKNYdGn2YaiqF9RZb8sMsayZSb5O/uWMrlIF0PJumE5CyYmInRw9hmKzSdL?=
 =?us-ascii?Q?+HgOTgRWbXHomm4UBrxOxc7kCbvnDWjDLMED+f/Y+WXCucm+I+kuKz+3yKYg?=
 =?us-ascii?Q?Yl8axPFj4NJKMwX1nUhW8qCWsUILVKejIeP0BBnUiUI8oXlgYhGwq1j7dTaK?=
 =?us-ascii?Q?GtTSVtSC9RvZBbbiZT16AfNkHNbKMpJG299vclD76PCTqBNGNs31TGiLimIH?=
 =?us-ascii?Q?7X6u5gzStBcCImxEJgrjUnIbpn6LNG+6j5k5LuP19R4F/5vgxMBn0Y5efUpS?=
 =?us-ascii?Q?Oxr1m+J4d5Fa2kDfdaI/bZYmrYL67ox9y1gTUEbdLLeP89qo/wkFfKNkNs/p?=
 =?us-ascii?Q?mfKEG+pJ0Ohqqcjoo7Pw61TCkSe7s/bdZePeK+lV0GAU1FAHfufPwSTDl8aJ?=
 =?us-ascii?Q?HSlxbb0QQtFk8cqiiT9SXU2fu4vbQAZdgcL3tQ+pSycjVT9LsbZ2g5waCZ8S?=
 =?us-ascii?Q?zlad6LogY/DRApPfPfE1CfoQMruyO+cqvpoIKX3C7G3eDcZwMeenqNa+nsk3?=
 =?us-ascii?Q?W3aSsyIvqESzRja8PjKQzUeYuv+rryYHboeX1gpfftRHeHSYZV6qPJiyvw2i?=
 =?us-ascii?Q?xscXbdM0dPsOV4aQK77IU2GISgaeagZVKUSgS4phGnbanLSC8QJnpBDJSqo5?=
 =?us-ascii?Q?sCo/Ny4OiEKhw65W4LBQcPGKmWI1diOqh5eafhsVF9FjDk3eMTEZaL8rJDYO?=
 =?us-ascii?Q?dMNDwlYLcrdGUThX3UdKwREIOnwCvnXEnSODHu3X2GuPCNsmy6/SOevoQ2LW?=
 =?us-ascii?Q?2LccSuyOY7CSoOF13LjX1f8fY1v8A15ULjiv7vXAdKhlxX8DzF/HuXYOJMn1?=
 =?us-ascii?Q?J0/O3pWazG/AakpjIF9GwizdqPiS6f3BiZkanHapH22Yr1Qu4EyEczw=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sBM0iw9RSmCchjSKbH9ooqxICs3fCwn2Vo55fyJnCbduL3OmxeL2rsC0K+0v?=
 =?us-ascii?Q?yd8kr6PS4wd9rZaAYL/zBeJCxpfPSPCeQV17oDcRHraBEh/kyfm7/pbuTGoH?=
 =?us-ascii?Q?vZ6iMcyWA0FMcpK1tdl37SJUznCutLiBCkzc9x8Z+WvoN/srLwVALmRcf7qp?=
 =?us-ascii?Q?ZVU+kdCOe3sW8cKfQ4XrP5oN6PI8XcReRgr329HX2t4TEL5OsrLspowvKNkF?=
 =?us-ascii?Q?ivpGs2LnSWVMcUXnjFZczec/8Gb+bMSTWrM/i2yvfaR/FmlYspXXsr/nK/XR?=
 =?us-ascii?Q?BvWYyxAtYpFBgWBc2wQqe2l0MgjPHM1fS8r7wqCtPr/zbcaZHT6eFjQuc+nz?=
 =?us-ascii?Q?sMZR93+aw48azFbt2OSEigpAsiFGgJYOuxWVUWEYYcYFF23FHHg577ojZm+G?=
 =?us-ascii?Q?UOpZD5hL6Df80WY3w/EfCiJW8LbR+NDHRHqQYA8zkN9zUcqPYqKrNN3sI/kh?=
 =?us-ascii?Q?LuE/dRElD+R7v6n5l8KnWkNqXpDRDUU6pw+foDvI/jczf/MytkLia/VrGUOT?=
 =?us-ascii?Q?+RUuUO0htBwF61MnJ0tV0l71SEcxP7FGe8TOMGuiL6WlyiG0v5R3Ruohtxjb?=
 =?us-ascii?Q?BMRgO+f7JjytZ3oBEkTcpNxAnI1tVgP6m2JUK1463D8dtdS4OBiaaRgviqdC?=
 =?us-ascii?Q?t0R/IDH1XUCnX7IvPyzTiWGym4Rw21uOJTkhyRUcQ5FgWBSPJ9PG/xrdg/4M?=
 =?us-ascii?Q?ePG9Mf2S8lMaoENjanmXcKkBOZettP1Kn/X0ewOMoiQDXLvRhgn3bZu7z7e0?=
 =?us-ascii?Q?D81XHwpNokP9tx/XRbIXytjR09cWdvGw0Noex4VhJQa1BSJSDa9a/U9xGYL5?=
 =?us-ascii?Q?JBSNBAC3pfjYOg7s3ExHOIJbwseYYWGHxWkQP2oXHxscIpOprUz3IZIN2Q38?=
 =?us-ascii?Q?bd7c9xUEpCsPHmAYdLUKXM9Fl/t+5BkiMHMIALAtXsjV4iGWByjRfA/kaQm4?=
 =?us-ascii?Q?aWyoKo/bZRFjtZiroRgvKcyeHKhqqyNZRFt8LPVTJnOImFj+hsQciQKYTPqC?=
 =?us-ascii?Q?Khte1jv4J90pVcmP46HpAgBGrt7CBLPwe7RpUemWcBLCra5hvMbNm25UTPhL?=
 =?us-ascii?Q?MeDxp7jFNWW/WY4rMtIzyvkghPA/vXqMkYvSW1ojST/chLShbyNsFcFNU/Sk?=
 =?us-ascii?Q?wjJOcQboH6gOzGT12dN4yuqgjNlGAMvGG0MKOloRzoatxroSVxiBIiCsqrxW?=
 =?us-ascii?Q?V7P4ZJaVfrn/ImN026KaOPVuj06yg2I3289dUPlYqdogjL3A1NTnVryf17Jc?=
 =?us-ascii?Q?6Y+e3AM8+Ucfnw6hMIA233n6A9MNcC1esx4wf4Gh2pHSiVr0VpO0szzfY4Mu?=
 =?us-ascii?Q?zwvB3v6ihCsQBw+qceGQ2biR8gIJF82IMqVKQbWCqaZdd+bubwzzGRMt7zsj?=
 =?us-ascii?Q?1fjTBZEw7teoHRR3eGlO1m32nze2k5RmYts04/0kfaykXAUy0layQzZw6DdN?=
 =?us-ascii?Q?4aABjCUy8ji1gO7vMl1RfSMJSy8zvaPM?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7515e17a-522a-4138-296c-08df13267fff
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 12:40:19.0456
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8397

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
Patches 5 to 12 are fixes and carry Fixes tags, and patch 13 moves the
channel current ceiling into a single helper.

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
declaring a lower ceiling through max-brightness keeps it. Releasing it
also disables the channel, because a current of zero still leaves a
faint glow on this part. Probe clears every channel, so the LEDs now
reach user space switched off, rather than lit at the power-on current.

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

Patches 12 and 13 deal with a max-brightness above 255, which the device
tree allows but the 8-bit current register cannot hold. Patch 12 caps
the value st1202_led_set() writes, which previously wrapped, and is kept
to that alone so it can be backported. Patch 13 then gives the ceiling a
single helper shared by the three paths that program the current.

Three points raised in earlier reviews are deliberately left alone:

  - brightness_set() programming every PWM slot to full scale, and so
    overriding a running pattern, is intended. It is what makes the
    brightness visible while the global sequencer runs, per
    commit 7cbe470366bd ("leds: st1202: Fix brightness having no effect
    while pattern mode is active"). Stopping the sequencer instead would
    halt the patterns of every other channel.

  - st1202_blink_set() turning the other active channels off while it
    runs is intended, as described in commit 35cbd34a6a05 ("leds: st1202:
    Add hardware-accelerated blink support"). The sequencer cannot keep
    their own timing once a blink takes it over, so they are kept dark
    rather than outputting unintended values.

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
trigger delay quantisation, a rejected or empty hw_pattern write leaving
the channel dark, the LEDs staying off while the driver loads, and
driver unbind/rebind cycles for the firmware node reference counting.
dmesg clean throughout.

Patch 6 was additionally checked at the register level with i2cget. Left
unscaled, a pattern step asking for full brightness programs 0x0FF of a
12-bit register, 6.25% duty cycle; with the patch it programs 0x0FFF.
The datasheet (DS12875 rev 2, Table 7) confirms the PWM register pair is
a plain little endian 12-bit value, low byte followed by the high
nibble. Its helper scales against max_brightness, clamps both ends of a
signed input, and guards the division, although the LED core never
registers a zero max_brightness.

--- Changes in v2 ---

  In response to automated review feedback (Sashiko) on v1:

  Patch 5: the commit message attributed the full-scale PWM left in the
  unused slots to probe only. The brightness path and every activation
  of the pattern trigger leave it there too. Commit message corrected;
  no code change.

  Patch 6: the documentation now says that a max-brightness above 255
  saturates, since the current register is 8 bits wide.

  Patch 7: v1 wrote the channel current after starting the sequencer, so
  a new pattern began at the previous current until that write landed.
  The current is now programmed before the channel is enabled and the
  sequencer started. pattern_clear() still releases it first, and now
  also disables the channel: on hardware, a current of zero still left
  a faint glow after a rejected hw_pattern write and at boot. Probe no
  longer enables the channels; st1202_setup() already disables them
  all, and each is enabled when it is lit.

  Patch 8: the missing reference dates from the original driver, which
  already registered the LED class devices after the iterator had
  dropped its reference to the node. The Fixes tag now names the
  driver's original commit instead of commit c72e455b89f2 ("leds:
  leds-st1202: Fix NULL pointer access on race condition"), and the
  commit message covers both.

  Patch 9: st1202_channel_set() is removed, as it no longer has any
  callers.

  Patch 11: no longer moves the current write in st1202_blink_set(), so
  it stays before the sequencer is started, for the same reason as
  patch 7.

  Patch 12 (new): st1202_led_set() caps the channel current at the width
  of the register.

  Patch 13 (new): the current ceiling moves into a single helper, so the
  three paths that program the current share one limit.

  Other pre-existing issues identified by the automated review stem from
  the sequencer and its duration registers being shared by all channels,
  and are outside the scope of this series, as noted above.

v1: https://lore.kernel.org/all/GV1PR08MB8497422B7A44424C4968AEC1C5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com/

Manuel Fombuena (13):
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
  leds: st1202: Cap the channel current in st1202_led_set()
  leds: st1202: Give the channel current ceiling a single helper

 Documentation/leds/leds-st1202.rst |   5 +
 drivers/leds/leds-st1202.c         | 163 +++++++++++++++++++----------
 2 files changed, 111 insertions(+), 57 deletions(-)

-- 
2.55.0

