Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazolkn19012008.outbound.protection.outlook.com [52.103.32.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580321E5B68;
	Tue, 28 Jul 2026 10:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.32.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785235955; cv=fail; b=BThebmRhyJHAuebYJzN/jH6Afx2uSczThbBfg1dTCYRNmG6E4mnE0B6pXPJNgH9GyoUVrXYFVXVi3mBzxYKYN7RPvxJv5LiOpkoFObuaBoaNMUV9ELRCvLzlyrH99Gz8q3P46+Aa2tgAOOHAam5pReVBY+jzWHOT74PQM5jCydY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785235955; c=relaxed/simple;
	bh=gb9z2INfVKEU5uO1zNrPYBlw+S8Bmom34iff0NyI2uQ=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=S3k9kpt8aOrdMQtbTWscNsOIj+2r3qgiys8GtgSzQ9JQYc7Aguf3XrLiiWNYRWxjbyOhHtTCnANjfoJgyTTdSz48ZVaO/CbVVTevx+pDlE8AqoSUZ5gJFBU1ySvq43rELfeFuUjh/Sa1swB31gD6r4tFKmLZT/WvXkSgfn/fkM0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=uuTFPvji; arc=fail smtp.client-ip=52.103.32.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="uuTFPvji"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v645cQvMNovKNwOnUgVaT1yZ70SHHKuMD73+c8lwuPu7AaLxKYdZ+vMc+UuH3oBNPKuWxzKL7Y2DQeXmNrysRKTIOrya6HhEtNV8dZauztHRRLDkOBfc0gqc6r4s8e58pLkRZ0V7gZkvBpNVnDTxcpI5Qw1uJKSqaBcgz7lJSNE3/BuxvmjSbxFDtRszCeBEI4JO6NNNnpgRXMfQCqutWvQuBVAf7HYBjxrzUAM2n6UMEsY3IohBhJduQhGdXpcW0wFS0dYiCfV826Q+xzE2zhUQ/tobmdu3WmdR382uia4Y0M/AEZlAxjb2UQs/u9T8jgK+EsgzEWC2KXUVz3HkzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jvN44n3tjKpR+rQJKKSxXqBaeKFxTjUd3CG6RovC6RE=;
 b=k0bIqUzHH4e0RSu9vHryGglhywueyymqZn7mWhTqJKTYA+KzevKCbyXTyiF+04ynCtCf3v0qM34rtOe36kZqghRzpb47z+TjWcXWJVi7a485ghanvF87b7QL6Be3mPsNTK87zNIn6MfZAx6yPZEpWLhUYKKUrNcr6v9TVl41XuTpj6Loph81jbPF/MVn9dlD4QHU0swbAm0okO+aZr8/hFRrVB3Oudot8NQQuFfxdaHZBAJ05HcVZ0Rv9WReFud01C115xQ4KBMFh0h3lbcl7ejLxDRN4j7KH1Xq6XxVR2MpKV5a6L0wFoWXMkdAhGTqHmJgX9N55cqdS+EhpdLfkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jvN44n3tjKpR+rQJKKSxXqBaeKFxTjUd3CG6RovC6RE=;
 b=uuTFPvjiBBYt199gWps8UwQvL0W2WVQKYGgNQw3CyYu0K2wi6E1xmqZg4zyooWVZ5LirSfFZ0YPlm2KWSuANQj43GBeBoxHq1mbYvIrOD9dSswcQbge4tzHxoR81IKoUUAO95WikVNWkhl3mbjx1BHVUIRWVYbq5rcUGGsh/CONO+XGupa2qF78hmJg1K7BRZGB5MDyjvKrqTPBTKjEIOdMLjbXC53nqIZOF5RZIplWUY4O9eXTAxqIM1kmruqelyrxxjki+120cErCqVtIgP8APsxZeDissJa3Aiw9peVJsD6ASuHrbx65qbkJGzdnTO0sCwwXFtTxKas5SwERXyQ==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by DBAPR08MB5704.eurprd08.prod.outlook.com (2603:10a6:10:1a1::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Tue, 28 Jul
 2026 10:52:23 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0245.012; Tue, 28 Jul 2026
 10:52:23 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/1] leds: st1202: Add hardware-accelerated blink support
Date: Tue, 28 Jul 2026 11:52:06 +0100
Message-ID:
 <GV1PR08MB8497E3103AD32162BD05D907C5CB2@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Mailer: git-send-email 2.55.0
Reply-To: fombuena@outlook.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0030.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::17) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <20260728105208.336129-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|DBAPR08MB5704:EE_
X-MS-Office365-Filtering-Correlation-Id: 443b1d23-5cdf-4c24-c711-08deec964cfc
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5062599005|51005399006|8060799015|19110799012|37011999003|23021999003|25010399006|24021099003|15080799012|6090799003|5072599009|10035399007|40105399003|1602099012|440099028|3412199025|4302099013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eVZ4NVR3RFJHZ1BoM3htYlNKM1pOc050RnQ2cnVJdDZlU0Z1QlIyamRiRndH?=
 =?utf-8?B?WnNHUHJrN3ZpdUVDcVFIRkZpYWZ1V0toejlmeTVub1VQa2ZBcVhvNDZrcFly?=
 =?utf-8?B?U3duY3YzNWZNdXJNdVNka1lEN1ViYkRBa0lHYTlGUzY3YkRubDV2WTR6aHN3?=
 =?utf-8?B?SzlZSEVyRDVQdnUwWFZEcWtHbHVCRVVJZ0N0NktBUkNRaWl3eVVMYk1CRy9X?=
 =?utf-8?B?RndrMk0xalpBK0ZXTlZiaWJ0M0lBYXNIaURkRHBod2JaMHNUSnAza2xtSG5q?=
 =?utf-8?B?NHdpRnVBNmJPVEMrdy8yZUlwM1ZjWEcxSGJqKzk3ZGdyVHZBMm9hcjVXY3Jv?=
 =?utf-8?B?MHZBdlRUWGtSRWNqaDBnV0VMdkM2Wjd5RmxrSGxoU01VcVFmWUJ6eEdRVW5C?=
 =?utf-8?B?MUZLTFZIRW5mdXBpbENkVGZrb1BEL3FTbzFOaFl3QUlCMHVuMDVXVkRubWJR?=
 =?utf-8?B?N2lHKzB5bFA2RkZwNGRqaEhMVzBnelZ0NC9pTjh2a0NjUjBWK1U4MWhXVGVO?=
 =?utf-8?B?eHNoOFZpR1ZuZVF0UVM0VXlxTGd6eW40VGp0clQzWmErWDNORUY1Sk0xQnQv?=
 =?utf-8?B?OFB5Si9VdG5rTC8yZUZzWEhWV0NNbUpobml1QkdlaDBEbG0vaUVvcXFwbXVm?=
 =?utf-8?B?Y2dUT09PeHQ2dzRxbG9GQ1l5SUx3bmZOQk9ZWWwvenZDYVUwNXlRRXREU3hy?=
 =?utf-8?B?eHl2amtjQ1Z1NWR6VDZnclYyeXNhOURrWk5vS0twT0o3NDFGdEpmdjFBZjZ6?=
 =?utf-8?B?cHJmQmJxUnlmWGRNNTBVbUN6SmgzbnZXR3U1T3VpMWpQMXhPb1h5V2xmZE90?=
 =?utf-8?B?S0dyM3lHVTJLVlZnbDFMN0hIaFNhdWVQakVFQzRxWE0xV05UMWZ4TEpERHk3?=
 =?utf-8?B?WXltRTlkMkJYckhPbkhUYjkxTVA5WW1hUjZ6V084RVdjbHpyQkJwS0tNUFRV?=
 =?utf-8?B?ZFNkMVNuWklaR2RITjE4RmRUT1RwRE5oMUczdER6S1p3YUUva1piOEN5RER4?=
 =?utf-8?B?NmJtWHRkWDM3a1RycUlVeGdzSEdKdDNBMG9uc3BzaVh6eC9kRDI3YmVEK2FH?=
 =?utf-8?B?MWhpcTA0L0xMY2swOHY1ZHd3bjNXdm5FcUNuY1pYOG00SjFDaGZoNUhialBJ?=
 =?utf-8?B?cENBSlBIZGxIRElFUjFLQnRQNit0V3hhTHd4ZkhYK2ZzL3dvOG9JNGNHS0Vw?=
 =?utf-8?B?NFRiZnN6bTNmdmk3QUVFVWI0aFYyZ0Y5clRBZGljNmRCZ2x3YXJzZ2VMeXdy?=
 =?utf-8?B?VHFxRGYzL0xVVGxJMXdnS1J6L3lLQVpjR3FuRE81dVc5cDdaa1Y3cjFzVmNF?=
 =?utf-8?B?ZVRJQmpnckhDQi83Z2x2MllEVVc5aXZvZ3hVMk1vMytsTFlQZC9HdzJ4YVEw?=
 =?utf-8?B?Wk9YWWlkQ0k1NnRQMnJQSXJIc3FPWWJPbGdVSFU1OGR2NUduNCtjSnpCOWtO?=
 =?utf-8?Q?OpRsL+P4?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?blc4NFcyOXRaRW9rNWF5ejlmeTFSSmRrL2t5YjM0ZVg5aTF2dTIrZmV4aU5v?=
 =?utf-8?B?RThpMmVhOGJtcHFKd2pVRnlZQ0UyY2F4Rzc5WHB4ZnVPcWRHWmpPTWx4bHhM?=
 =?utf-8?B?eUt3MGZxQWx6bXdWaWVTZHF0Z09ISFRhSmhORHlkck1hbytMVUJkT3RzY1py?=
 =?utf-8?B?MmhwSnhBaEs0TmJmM2pYRVU0VGV1aWprVm9IM0haUk9iNW1QKzYxYU8yUXM0?=
 =?utf-8?B?blhraUpuSWVsOWV1MEZyWTRiNjRYYy9neVpXWU8xeWhsUkpaOUhKUU56cDky?=
 =?utf-8?B?M2VZR255Z2g0emtaL2t6bk1lT29nOThadkRsa2M3eVhBb1BWdG9iZkhvVVN4?=
 =?utf-8?B?K0dHWnE5ZzFZWEY4U0Q4alBydy9ITlo5cUxPZjlQTWQydGk4L0dUQmIxOGoz?=
 =?utf-8?B?c2dtT2ZBOGIzUHpuOG9WbGsvTTFTNkZKUytuYmxPdjdoUitsaU5xbTFCclRM?=
 =?utf-8?B?SzBZaVFGV0ZpVE1nNUtWTlJMZ2dzYjlDMTEvUXBkZitvRkRPZFZ5TWlLUk1y?=
 =?utf-8?B?aUwwbmVWQkw0bTQ0eWF4WWFLbWJWQ0tFdDZMTVdUcENGeXYybHRGVXRnM0RU?=
 =?utf-8?B?VUZOdmJaLzJSeFdHR0xhVkdWcDEwZFNMVDNZaHhlcmRxb01BMHlMcXlGN1dQ?=
 =?utf-8?B?V1VwcnlncFg3ZVJRSVpSVmxtQzhIa3Q5TEo2YVJhMUN1VDVKRnFKZTFCcys4?=
 =?utf-8?B?M1dKS094YVZWZ09ReGVkYms5elhRcEdkdGJKcGpsbEJoQ2pwckhIU1Vackdt?=
 =?utf-8?B?RjhWK0xhN292Z1d6V0dlemcyOEUxVUpQSE5HMnFkemV2RmNsNVpaZEcxcGxD?=
 =?utf-8?B?WjhNUFdxeFVRVnc4a2lKWlEwbXNwLzR1RzVtd0FiQitMN2J5Qm4rcmRZdTZV?=
 =?utf-8?B?YTRCTW9PZm1Pd01paE0raTB5QVFMakwrOFgwcHRtbmpqZTFuMWxvNjcrTjBF?=
 =?utf-8?B?TEE0enhNMjM2QXRKV3FuUWh4L3piRXF5NVZLcHU3bUlhUjJaM0RCRXhMc3hO?=
 =?utf-8?B?NGpPMjFMQ29GQmtsbjNkYll3V1hoMEYrTTZ4QUd0clNwc3BTUGoveHZMSE5t?=
 =?utf-8?B?cHZGU0VXUVlkYnpISDZvL3RGcThjVUFHbHpGcy9BR214S1dLOEtjRlc3b2Mw?=
 =?utf-8?B?bHpGc2dmVStCT0VBcThaZ1drbTVyeDZBZ01lZVhpNGpkM2QzQlNaRGF3TGxI?=
 =?utf-8?B?cmNzSXZiZ3dQU2tpc0NTSDN0cmVsTWpMa2JIZGlTdnFYS3VMVXpzVFp3cEZr?=
 =?utf-8?B?c3J2RDRTRUNnTkt1amtqWnB1MXNtaEZjc0lrTlV5dHVvWXhYaTJ6c2RvOHNn?=
 =?utf-8?B?RkNaUDFqR0JLWUU3NXpzaGhwd0JnTTZlb1dnZ2s0bXk3cWlJNHJCbTJhdDlz?=
 =?utf-8?B?R0ZGTkN4MWRhbVZ6SG96NlRqU0xBTTZucnhFQUFCUlFmZUUxdnhFb0kxOWJD?=
 =?utf-8?B?Z24rV3doTXFVc3AwUjdWWFZqdnJUZmV1UFM4amFIYUZkLzZUQXhrR2RkUUFR?=
 =?utf-8?B?eHZCQ1BJYVJOcmhMZ0V2TWVJQUFMZVBnUXJFTzVJNzRJS2JFMnZnbTlIRjdU?=
 =?utf-8?B?MGxzblBNOXQ5NWUxSkRMYWh4UWFvdDErdDNOUDhHMm1IVGVtR29Ma3l4QlNl?=
 =?utf-8?B?NFkvWnVQNHhnQXJxQm01MGxHUGQyRnNmQXBaNVFPMGpyZjZTQ2R6NG4xL1Vj?=
 =?utf-8?B?WXVack5FY0dWTlg2TVduWEYySHp6WmZaQmFJTXpUdEVWVmxPa3hBc3V0a2lS?=
 =?utf-8?B?UW92SldRM0tNSy9nMzRIVUs5UXBhU2JJdU44ZHBMVGNsZkpIbzE5UVkzYWFF?=
 =?utf-8?B?TWYxU3VTcFl2UGlZN1QrVDZRV1RUZ3BpTzBvQVJ0NHQ4WVBITTZtM3pESnFh?=
 =?utf-8?B?aUYvRWRSTitycm5TeXpKVnZVZFE3VDNxdkMzZXFOSDBnNHd5dTRyZmgxN21v?=
 =?utf-8?Q?R2xDB3vvLkOxvTd1xRKC7TxcAG7tx1Ve?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 443b1d23-5cdf-4c24-c711-08deec964cfc
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 10:52:22.6962
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5704

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

--- Changes in v4 ---

  Fix delay clamping and rounding order following a review of the
  changes introduced across v2 and v3:

  v2 moved roundup() before clamp_val() so that rounding could not push
  the result past the hardware maximum. However, this left roundup()
  exposed to integer overflow for extreme inputs near ULONG_MAX, since
  roundup(x, 22) internally computes x + 21 before dividing.

  v3 addressed the overflow by prepending a min_t() cap at MAX before
  roundup(), and retained a trailing clamp_val() for the full range.
  The trailing clamp_val() turned out to be unreachable: ST1202_MILLIS_
  PATTERN_DUR_MAX (5610) is an exact multiple of ST1202_MILLIS_PATTERN_
  DUR_MIN (22), so roundup() on a value already capped at 5610 returns
  5610 unchanged, and the result is always within range before the
  trailing clamp_val() runs.

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

Manuel Fombuena (1):
  leds: st1202: Add hardware-accelerated blink support

 drivers/leds/leds-st1202.c | 82 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

-- 
2.55.0

