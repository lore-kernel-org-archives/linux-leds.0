Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazolkn19011031.outbound.protection.outlook.com [52.103.39.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA93247254E;
	Thu,  6 Aug 2026 17:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.39.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786036731; cv=fail; b=QlwJ20UkWyzQmpxBv58rxlUte0GZVTj5w4K1OF8QJKmQvBY3rHhoL/my/a2rln/MPOLePMo1sBq5axSHi3JMXv5Jp4YlqZED9KVS4v7djxhP9QjFbto/JIAZRYJeoW2qJikLqbbbWMYmAMbDXm1U9zaJMh2CG45rtgsQkeinwWY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786036731; c=relaxed/simple;
	bh=q1uVY0cXuKwtfREKQgDiRkgwtCvLIsPF5/SvKJXbnYE=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=nTtdIVtkyVD2pzofMQRATsmDe/BnmeVEGesYiwTSS9WXXRKprm1YEa6OzLvbFLE7vBCC1hbXRbmg9egDIksK9f/YvhQe2foia5AoZobEEa+Vbz9lZSxogt+TPZK0zRHzlT92/MaAYLVPXeq/guDdrNAOf5aade4bA5+yz16skUo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=pPwmZOsV; arc=fail smtp.client-ip=52.103.39.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="pPwmZOsV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BBdCUtnv5O/Sj69t3Stas3MQi8XiP9oTHzW79OhsKHBgZDCHEEjQTMSSUHXBe0WHAvhk4Qjy7BFdC0eh5290A5JW3opO6/b9wsRI9O7MLgzCvnd8mORSzgLUQkb9gHX3C2RaLRRXfU56f4m7rZRKDvMWYm25WiS/diA1IZynaKYVgZEdXIElWG9iYIMY/w64I/rl/PBRVxw8KByG+zMhuCONxrEvWyfBg1IBImf1upteCh47HvSAaGTj/F8hSsYlKEmgvTBZIRIpxcQElqoTKRdEDRjdxEQDrIcmZrstGloOG8kQI36GI9EvcpFp7TrOOtiM1T4P3QR/CgqiLfvRKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aRAMACVzMAceGMYpxDXzRxJRLq6ioLQSXryiNNaNzhY=;
 b=neg85dh5HHWha1NQKb3HU7X6apsnaCAGbRpbXAS7XyVdPsaz2acGH/IjrfjI0YP1AJ19gve5fQ6xYVTn2pk/p6lmas1aTGYGG9mFisn2Oe3HqcAeXPZ3SbeAuaTluJj7OhX2+SDNw4odGyTt9xkhvE37k8+f2QVpJsL7BiOJp8YPUq5EIVKl+HVBYD93o1mts9XGIfslTVzZaM0PzQqFc3Yz+g0Cv/KyQOrmcQYV4N9E7ie0p00Zr+kHLsC5yW3PLaeMRuU1020VtVPwznpaO935jzaCwGKkIIvbb3FefrTqtPSlgVbmiNmXHX1C7DfsDU/PfSdW5+gUrXOC+nnhMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aRAMACVzMAceGMYpxDXzRxJRLq6ioLQSXryiNNaNzhY=;
 b=pPwmZOsVjwT/cu09UvzQRWdJZZ+HZ57tSjZ5TNeKE9GbMsFs+Xkzvd/JRx94Pk8gozBWViV73fQ7q8tmBlrc744gbGC6OSgwLZhaTAZ7RaYM+2/8ImqMAWvDTBsErKZWcLBQMKpvGS5M88L7MHXsFGH2UMwe5T4LKopG1W/Rx4PtBT9jWyniG3JwF05n3mUS84QbbIc++3QSC/2AcMiT9xBWqDK3aN7tC/aIt06K5gsN1hJsgvL1moUO3FgenFpmz8nfq+SPPzGmGdYG8Rlw/G6IE6NWd5iT1PPC8VfZsweGjkHsOgM0gCpnv18imqowEM4oythDvAaxsSxSjk6CfA==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by PAXPR08MB7573.eurprd08.prod.outlook.com (2603:10a6:102:24f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Thu, 6 Aug
 2026 17:18:46 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0292.019; Thu, 6 Aug 2026
 17:18:46 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/1] leds: st1202: Add hardware-accelerated blink support
Date: Thu,  6 Aug 2026 18:18:31 +0100
Message-ID:
 <GV1PR08MB84977DA9A154D7186B6EA2CBC5D22@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Mailer: git-send-email 2.55.0
Reply-To: fombuena@outlook.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0114.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c3::18) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <20260806171832.572582-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|PAXPR08MB7573:EE_
X-MS-Office365-Filtering-Correlation-Id: 43bbb6f6-c2b6-4cce-6ae8-08def3dec5b4
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|6090799003|23021999003|5072599009|37011999003|15080799012|25010399006|51005399006|24021099003|8060799015|5062599005|19110799012|3412199025|4302099013|440099028|10035399007|40105399003|2607281247196008|1602099012;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TEpBWXV2YnRxUEhFa2ZrMVczWjI5cGkyTnNyZDJ5SFM1TnpkY3JxdUFhSkh5?=
 =?utf-8?B?Y2dNRCtaT1c5SVE5TlIraERidU5lSzJSc0QyTjVWZ1p4Rk5SdU5vdFFpZXQx?=
 =?utf-8?B?M2RBeG1SZnhCbDZkallzQlM5MXprRjVET3hXaGJtNlphTjE5RVBaQko0OGNv?=
 =?utf-8?B?SmlRSXpwcGk3QUo2ZHNQRnQyZkszTHhIQzE4Q2E1enphei9sVnZRQzROeXBE?=
 =?utf-8?B?KzdldjRoYlBUZXNhYUxYQTJnTGhRdmk1d0x3aVJjekZmRktKbUZ0WTJtUC9K?=
 =?utf-8?B?N050MzR6M2NMYzRoWklic3NJL1BnYWZFL3NudkEva0VyN1dyMm1HZUNucUhU?=
 =?utf-8?B?RjhQK25rNytXcGlud0diNTIxaVkzZXU4bkc4ZllKWlJyUnVmY0RZSlppcDRG?=
 =?utf-8?B?RVdDR3oxSVM2NDVRaXhqZmdiMmVWN2I5NGNUbWFRbk5uMCtTaG5RZnRiaUt2?=
 =?utf-8?B?Sko0M0w5VUo2MHpuNkNHdEVSVUkvaGlwZjFxRUdOdVA0SXpOSGk3SDFwTU1n?=
 =?utf-8?B?VGJ1OWxvdzV6dnpneXhmenh1U05uUDVYZnRhQ1VXQ1JQY2t5dDFSR3YxbnN1?=
 =?utf-8?B?NUNyUmdpTUpERDlYUHl4TW5Obi9MQmdPRHI5Ty8vY3pvbzBmQXJIVURuTHRh?=
 =?utf-8?B?T2NYUXJJN2ZmcHZ2cHhkOGhRU0d5czNBbnp0MlNxelB4ZEFiSmhQMUNneTdy?=
 =?utf-8?B?c08ydjlheHZYTTlKQVovcGlmZ2tqa2lZV3FaZXorenVoODlrWnFnWTZUa3I3?=
 =?utf-8?B?QUN2aVYxUEVGL2k0MVFaQnJFaGdpc0pRamswVzl0MTYybC92aFI2R1ZodlhV?=
 =?utf-8?B?Y1FkcW5VelJwcTJMN3FmcTRLU01lQnl4dGI0TnBwOXloenU1aktHcUJRcWZD?=
 =?utf-8?B?RElNS2hqMDEvVHpVSHExdXZhRVBCTnNKVjgyVWx4UHkyVTBqenA1MnBTbjlu?=
 =?utf-8?B?MmFxNUhoOEdGTm1zUFVrM2h1bzdwOUFLdkZza2RkdjcxcUlBSURISE5MWWs1?=
 =?utf-8?B?QmdEMWZxZEdNbUt3eDRwbEprb2NEZ0hTZGE4bWRvRHFwWUhmajdUQkNVNWFI?=
 =?utf-8?B?ZlZ0ZnVuRnRYUTh2ZVlENEpOUHFkUURnZmpZYXJIaGVIaFBOaDAwV2RtbVZL?=
 =?utf-8?B?MkxBV2pOeEkzc2xpbDE3OHhvUUZYWjBBOEdZMDRjZnBRNDhSR2JndzNUK2VG?=
 =?utf-8?B?NHNHVkx0UGQxVXAyeUNOQ2pSU00wYkpQcDJRellRQjVOS2ZNU1FRdldjMmJx?=
 =?utf-8?B?ZXpXZVJGTEhraHFMaFNoWU9FM0wxMXdCeXQycmJ1czRSMEtmS3hwVHd0NFI1?=
 =?utf-8?B?MG1Jd21aM3Y0U21UR2kvc01EUzllRW9sajhCL3lLdXhoU3RSSDVYTWdaSnFR?=
 =?utf-8?B?MGRqYW1WSVIvVTNNaWV5azdyM0Vib2lpZk5Qck9jS2FjYkVCQnhaTEUrYzk1?=
 =?utf-8?B?WnhwUEFnU0lXdFJrdUkwSEJRSzd1SEtrVktUQmhtZkY0dW4wcldXYjh5OEd0?=
 =?utf-8?Q?2f7b02DpCCSid79lnbd4F2wT7iL?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZllYV1puRUxKeHhidkpJWC8vc005aG94MnEwd1hOQ21HWTV3cmt2RWVMWURm?=
 =?utf-8?B?L21DVTdLK29SWmx3VVBIUXFsZ1VIZE82dGdWOFd3U3A0Z2Z2N3doMng2cW0x?=
 =?utf-8?B?anZuajFxSnZYTU1XenR2OVdrcUVOZWsvN2hGSnU1cUY3ZW9CbGtPQ0UySERu?=
 =?utf-8?B?bFBUR2xTeC9LeFdMVXRMYndmdGE2RlZRS01jV3k5SDJ1YnN4VWRZRG9pbnM1?=
 =?utf-8?B?c3hObng3dS9mSnhqc2tNN2ZFYmlWZzk0ZEg2dm1rcWNWZHBCcUs1VFZpek41?=
 =?utf-8?B?SlVzd1ZXbkc0VzIrY09qUGpkMHNwV1VmUWtmN2JMaWxCc3VQakRWQ3RTOUpo?=
 =?utf-8?B?bXVxSUI4NHRvbkVrTGZVejdNUGM1eUZ1WEgzdEcwbUk1RkFKWE9hd3paejBj?=
 =?utf-8?B?YklQRGtNWENxU3J2N20vQS90ZlQzb3Q5VVg3Ui9VVWlUcmtINXo0SEhLZU15?=
 =?utf-8?B?SVZIbHlwT2NadmExQmVpSzVramtPVEZDZ3g4cXMvVnRlYjlVMU54czdmazBt?=
 =?utf-8?B?Mnhocm5rTTJFcU15RlhiRmVIUjVyNk9vWUZsajR6Y2hMV01MeEY5VDYwWEkv?=
 =?utf-8?B?SVEyZWt6b0g3dkdCalMwNVBtaW9sM05oYnZsQTFQRGZPMVVFa29pdWFuWnN5?=
 =?utf-8?B?bVZMcHlCeWJ6U0JTMXk2b1A1blR0bm84QzYvc3Q0Zm1od05pK1JXMjc3WDh1?=
 =?utf-8?B?dGVPaGt3dHlnd1o5OVo1RkNiYWQ3c1hiVXZYZUYyZHM1Nm82anlkNkpXMkJ1?=
 =?utf-8?B?Zm5jNnI1aXpyVlUzS3VEcnhZcndjUVdhdUhvUStJR1BIQWxMNjRmZDFtcW94?=
 =?utf-8?B?ZVhwS1VRd20zb044WVJBbkZMRmRHY3FyTWkwT3N5UVB2V0Uva0pGVmR5K3V4?=
 =?utf-8?B?VDdIVW0wRlJNUkMvTXZpRmpxemZYNjFLVnQyTWtoYThGWWl3L0EwRWdNSWZv?=
 =?utf-8?B?M2lFRjZ1aGdPakJ5TzdoV1V0K2xZMkhGRDd2cDRlWDNwblUwTlFBTkhQT29O?=
 =?utf-8?B?d2VmdlovZmVSTjVscEdLR29NSkhua2RST3V2TFRSWk5kcnI4Wmw3cDcxdlU1?=
 =?utf-8?B?OHNydTNONENjUXJ1QmJoQ01ZcjA3eVJMdGJzUnZrZUo0ZWlCbnorUDQ5Yk16?=
 =?utf-8?B?RXNWcm1nSVE5ZUNBNlNxMGpBQkhKQTErbHJTeHNPU3ljb1oxUkdzVkIzcTdV?=
 =?utf-8?B?SGcyMFMyd3Y1cG5XYm9HV0dtMDlOWGZFejlwMWN3eWtYd0syYnZUWjJ0Mmpj?=
 =?utf-8?B?QlNqUnVYZHhDNk9GemdLa2lsZnRTMDN6NXE1R0wyYzBsUjlXaFVJQU5zNHBV?=
 =?utf-8?B?VjBycTc2RExVR2NvWjhveUtkODUxNjBHZUFMRng0cmNwVm9Ga0pvV3FQNVNp?=
 =?utf-8?B?ZGx5RzBScUZRbFlESjJ1eUlENU0zUkFlOUNmcEFxZlRJcnoyNWlyT1VRTGpG?=
 =?utf-8?B?dm0ySTg5U0dBR1NMSXdFL1QxNlByZjNhZzA2LzJ3cXl4amIzM2NyOEVoU2hJ?=
 =?utf-8?B?dURCMVkxV0tzWjVSTXJta2diMXdsM1hxUEdZQzFWK3U3RGQ0VVRBb0JGYnND?=
 =?utf-8?B?UVlqbWxzQXFvWXMyZEdlUkhuNWI0Qi9mb0ZXRTgwT0JwajVSUGxTckN5T1JW?=
 =?utf-8?B?UUExQjdxRDVzRlh2WDhuNmlWOGtuSWNQY1p1TVJvL3hrTnNLalk0cVEraHkr?=
 =?utf-8?B?VEd0ZnVLa2dDVjlpc0hka0lqUE5mdzZYRk8rdmhEdXBtdWRrR3kyQS9xOFZ3?=
 =?utf-8?B?SE9DemRUVVBxTEpUZ253QzFRdUE1d2I0UWtoMFlNWGdPUGN2UlQ1bTg4cjlE?=
 =?utf-8?B?OVo2UjV4TSsrMmZWUURENnRacy9oYW9RL2txSWhWeG5xU2FGcmEwU0JsTmNP?=
 =?utf-8?B?dGFWL3ZWdTVCTVhiMHNTY1dQQlBWQjBEa0Q2c2o2TFdPZzJjSTcyUi92WE5l?=
 =?utf-8?Q?ZNleq6CrYnoavMdHUHfWXq9LSCigiMEE?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43bbb6f6-c2b6-4cce-6ae8-08def3dec5b4
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 17:18:46.2991
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7573

This patch adds blink_set() to the ST1202 LED driver, enabling
hardware-accelerated blinking via the timer trigger.

A series of nine fixes to the pattern engine and brightness handling
was recently applied to for-leds-next:

https://lore.kernel.org/all/GV1PR08MB8497C0B898789BB73ACE6EE3C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com/

With those fixes in place, the pattern engine can be used reliably to
implement blink_set(): a two-step pattern (full brightness for delay_on,
off for delay_off) is programmed and started in infinite repeat mode.
Requested delays are clamped to the hardware range and rounded up to
the nearest 22ms step.

During review of the fix series, several pre-existing issues were
identified in the driver — including brightness_set() being assigned to
a non-blocking callback, the global sequencer affecting all channels on
pattern operations, and missing brightness scaling in pattern_set().
These do not affect blink_set(): the callback is not invoked from atomic
context, the function explicitly programs all other channels' PWM slots
to zero before starting the sequencer, and channel brightness is set
directly via the ILED register. The pre-existing issues will be
addressed in a follow-up submission.

Tested on LED1202 hardware via I2C on a Linksys MX4200v2 router running
OpenWrt. Hardware blinking confirmed functional with the timer trigger.

--- Changes in v6 ---

  In response to maintainer (Lee Jones) review on v3:

  Use standard if statements for zero-delay substitution instead of the
  short-form ternary introduced in v2.
  Rename loop variable 'patt' to 'pattern'.

--- Changes in v5 ---

  Use st1202_duration_pattern_write() for pattern duration slots 0 and
  1 in blink_set(), consistent with how st1202_led_pattern_set() uses
  the same helper for the same registers.

  Fix commit message: ST1202_MILLIS_PATTERN_DUR_MAX was wrapped across
  two lines.

--- Changes in v4 ---

  Fix delay clamping and rounding order following a review of the
  changes introduced across v2 and v3:

  v2 moved roundup() before clamp_val() so that rounding could not push
  the result past the hardware maximum. However, this left roundup()
  exposed to integer overflow for extreme inputs near ULONG_MAX, since
  roundup(x, 22) internally computes x + 21 before dividing.

  v3 addressed the overflow by prepending a min_t() cap at MAX before
  roundup(), and retained a trailing clamp_val() for the full range.
  The trailing clamp_val() turned out to be unreachable:
  ST1202_MILLIS_PATTERN_DUR_MAX (5610) is an exact multiple of
  ST1202_MILLIS_PATTERN_DUR_MIN (22), so roundup() on a value already
  capped at 5610 returns 5610 unchanged, and the result is always
  within range before the trailing clamp_val() runs.

  v4 reverts to clamp_val() before roundup(). Clamping first prevents
  overflow for extreme inputs, and since MAX is an exact multiple of MIN
  the rounded result cannot exceed MAX, addressing the v1 concern
  without the redundant operations introduced in v3.

--- Changes in v3 ---

  In response to automated review feedback (Sashiko) on v2:

  Clamp delay inputs to the hardware maximum before calling roundup() to
  prevent integer overflow for extreme values near ULONG_MAX.

  Other pre-existing issues identified by the automated review are
  outside the scope of this patch and will be addressed in a follow-up
  submission.

--- Changes in v2 ---

  In response to maintainer (Lee Jones) review on v1:

  Use short-form ternary for default delay substitution.
  Perform roundup before clamp_val to ensure rounding cannot exceed
  the hardware maximum.
  Capitalise commit subject per LED subsystem convention.
  Drop Assisted-by tag per maintainer suggestion.

v1: https://lore.kernel.org/all/GV1PR08MB8497C5B8CEB2CE19743DFCFFC5FA2@GV1PR08MB8497.eurprd08.prod.outlook.com/
v2: https://lore.kernel.org/all/GV1PR08MB84979858573735294D41A189C5C02@GV1PR08MB8497.eurprd08.prod.outlook.com/
v3: https://lore.kernel.org/all/GV1PR08MB84979E014A407174EBAE9875C5CF2@GV1PR08MB8497.eurprd08.prod.outlook.com/
v4: https://lore.kernel.org/all/GV1PR08MB8497E3103AD32162BD05D907C5CB2@GV1PR08MB8497.eurprd08.prod.outlook.com/
v5: https://lore.kernel.org/all/GV1PR08MB8497E2498ED9D66AF60A3ACFC5D42@GV1PR08MB8497.eurprd08.prod.outlook.com/

Manuel Fombuena (1):
  leds: st1202: Add hardware-accelerated blink support

 drivers/leds/leds-st1202.c | 85 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 85 insertions(+)

-- 
2.55.0

