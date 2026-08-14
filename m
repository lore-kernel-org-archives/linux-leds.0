Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazolkn19012012.outbound.protection.outlook.com [52.103.32.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B9B4570C2;
	Fri, 14 Aug 2026 09:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.32.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786698910; cv=fail; b=p4vVTY91xADDCvlVLkjJ9p/eN6kMEu/QqTHxvxvnPSIYgXOkz+6Uz9JNtaJLlaMy1/qeCs2xJDUCXB4UN/N1j27Hr9ZSDefPlsZ03GcJoz2+nFuR6HiHWBQel0ypy1lT+8rkewlwNsRVb5tgAmW/VlLlwkSc9udyoE5Jrj8NBJM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786698910; c=relaxed/simple;
	bh=J5wCQh8KNmR6vwp6dfFlUTySb1CiG5J87I3EFcN5NA4=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Gd3AhGzzFcYvV3M88kWAABKOT3T3m3h+Nwxr92nz/22G++oeOGyB1pLiktbQjFzob1pREu9SqEtG38DeqCHICE2xZDF9q3hQ6XADpnpCJLB6dF6adK8f37QKw0x9vgbTuz33tEPsYGy10vzuzU4k1GHoErvYDUwK+bJW1LGdh8w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=rpId8hLJ; arc=fail smtp.client-ip=52.103.32.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="rpId8hLJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KHg0Djjqlrb9Xi+Gjuzg6LFS2dshQ6YfmVJzcHOsfycTOr/FVFa1o6wffrLD+c2wBa+hj3bP6TFMS8GW3opUPDhAavCXPSLHOkf3UN24gxrEcNiZcuIodL7Z4dRydnd3gxF6Hf2V9WFcUWq8UbYCwDlB8tywxly7gbqo0RNMD5uFbwdD1o9w8rDB7ufB6XZDYIUmEGNjYAcOooUFeHWxQRWs1D+nz9ooC/55Z3ZUAYAAUqOnIu6xDH4lR+xfH4pWuM4P9B458Hycm7QRrbeb62rNW37wOtLSJB/9l8z7PKvZaIJCyAHPXD8L7jlspR5e9x0PZT+kztHdU2fOzJit2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=muYhrzl1aYodVvkKdndjp321pmSLkMvqBdJwcxPjgxc=;
 b=wjWCL1YDYoEe9EBaRI/w5rGgZ/AHLXEHyXj7C7NFIBtxQUW9XnwL08hOj3OL/KYCHPxbXaOKzdeUfLBMMMA4ex4t+iHTJFvgm9S1gJFFAOeAv/dbdeGiu3rnTMcuMth8kZslE/o5RLBKDJyzbxS2sOtCoYO0K57mfXnza0UYDGYT5S4WmBd/ydqLDYFZSnJ3Rt6V6LbpL5b2A0w10XZLsIZdckedSqdw1FRHakcopfu6yCmS8dspi1wFoRdG+h+1zL6/SJq5cqzHCN9/0JTouSqVwjl39wI2QUkbwUowI8vQG0PBtc4DCtOQClow+iHNkU395z9/8D/vPgD3lpuX4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=muYhrzl1aYodVvkKdndjp321pmSLkMvqBdJwcxPjgxc=;
 b=rpId8hLJsare+z12AyK5qFG8Mm0zYCKGyHnknMIswL9nrnGdnnOz7ibv/WvfRTcSZmZ054zj/795RI86tO8TS32jxORzmDWdSCOGdPyuNgNSBCh14k0BjZt87cHPPcpTlzYlk2JraFg4v6KLIXIoEJC6vYisg4A2ti3T8SuVUMo6rhXY0zo7api66bjREyZ3HCDLIgM/zwsbBrqaN5baGEXSODZ3s7AzJafS/ViwDJah3gp22gfE+sIUSlRPXw63YIxnJEGCTij62634MSysHhOqC/yxr77nCEY9hBMTWXTYuLPryVvL3UKl+Q+ophtlH1DcB4t8pqHi5D/SqenjOQ==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by AMDPR08MB999870.eurprd08.prod.outlook.com (2603:10a6:20b:751::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Fri, 14 Aug
 2026 09:15:06 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 09:15:06 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 0/1] leds: st1202: Add hardware-accelerated blink support
Date: Fri, 14 Aug 2026 10:14:43 +0100
Message-ID:
 <GV1PR08MB84974C7ACD911E66864C5008C5DA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Mailer: git-send-email 2.55.0
Reply-To: fombuena@outlook.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0128.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::7) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <20260814091444.440780-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|AMDPR08MB999870:EE_
X-MS-Office365-Filtering-Correlation-Id: ad2a921a-3fd0-4ef6-5e3c-08def9e48770
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799012|37011999003|23021999003|24021099003|19110799012|6090799003|8060799015|51005399006|5072599009|5062599005|25010399006|40105399003|2607281247196008|1602099012|10035399007|4302099013|440099028|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SHRzTkJtb0N5SFYvOWczbW1nazBBM3Vmdi9rZ2ZnSEpuQ3ltWFlrSXM5TDla?=
 =?utf-8?B?Y0hldkE0Tzc3V2FCTDdaRUNMZ2pUZ3pCM29yK20vakFhbmVxZzViK2NXejNo?=
 =?utf-8?B?U0lXRnBpZjJCZ0t4emRJa0hWbEtmeGRtWldPODdIdm80amJsUWtKZG9QTGow?=
 =?utf-8?B?Q3VEdVNBdnN1QktzdGhvenIrRnFTeTEzdTRLRDNVMnk3b0s2S1I2U1hzdkJi?=
 =?utf-8?B?S08xbE1wajFDYzVVVUJYaDJ6cVpyMm5SM1Y3b2Vkb2d3QnNmdGF6eGs5VWtU?=
 =?utf-8?B?TWUyV2xhOXo5VFBlNFRTaTZ2eDNKblR2OWhJYjV2aEEvLzZvL1M0L2NVbVM3?=
 =?utf-8?B?S3F4VnFaNGs5Y3E4WE91dFZ6K0lSYVFjV3B6SGV2MXZlc21nWmNhaGEyRE9X?=
 =?utf-8?B?c3VTL2tkSElCd0dSSmN0RFBid01pS0hYZ1hsQ0dqR09FV0pEK3FLdTl2VHhm?=
 =?utf-8?B?NTZyYnlkeW5JbUlGZXZ6V1ZhaWFIcTcyaUNkblRDRTFyYnpWWEdOeDQ5UzhC?=
 =?utf-8?B?L1hMcGI3QXZ5bytRY1Z3SEkwVFo1ZlZsUmlPaUQxRm53SXRiVVdDL3NqdTBi?=
 =?utf-8?B?OXFGc2xsamFLZGR3RGtEakZBN0k3WmhseXlvaHcxV0Z0bGt2RDQxbElycVlU?=
 =?utf-8?B?WEtGLzZOVGlKaDUxWFd3UmxaWVBwNERKaHRrWGlRZmpYVTc2emE1WUJkMGZO?=
 =?utf-8?B?eHJ2RkkrN3MxdFlZbHBDVm5NN01mVzlGNWMvVFN0TldzTHpXVDVOclVuanRZ?=
 =?utf-8?B?bUdmVEF6N3VUZG1nZWtyTVBGMUxxL0NJcE9kY2JkOVN4aVdPVmlwaHhqQ0JK?=
 =?utf-8?B?TFd1NTMwcmtUS3g5cFIwbEU5WWphN3Bhd0NWWUIrL0Nkdzh4ZjdSV0NsejFt?=
 =?utf-8?B?SjJyNFIyczR6cWJvcXhZc29veVZHMzdLSE84MllTZEhUTWd3OUlLdVByMmxD?=
 =?utf-8?B?NVc2WjJ0M0d5NEx3OU9pVERaQ01QTFlTV0JiczIwZ0tyWFp3ZWZpcmlrQ21H?=
 =?utf-8?B?VUVMR1V5T0NpYXFES1VpZUhJWmFreklra0dQMy9qYzhVMmpuNCsvVEU3Rm00?=
 =?utf-8?B?ODBxcUR6SWNFSmE1eXhnbzB3Qm9iZXNLc1dHYWNldEZMMk9WMWdMRm1YcExr?=
 =?utf-8?B?dXIxRHVCdkM3OGdmMDA3dWh1OUdmZ3hyQnJqanUrclhYdmpac2UzY2JWNE8w?=
 =?utf-8?B?U0hFcUtOL3I4ek9HMGNUNmNodkdzRzViUUF2OXhQZG1GcnpIRHJ6TzA2a0l0?=
 =?utf-8?B?UmFLcUhVb0pvbmhlYmhWVGtoY2hSQXY0UVZZZktlMEVnbFdNMTRlTlBrVlYw?=
 =?utf-8?B?aDBmVFZsU0FEcHduaTRFOERibmRMY1NkMjg5aklMVmNjQWFwbTlmLy9JNEpa?=
 =?utf-8?B?TUF0Z1dDUURBbUhZZjlaYnVyZzZzR0RBVW52MmZuRE03YTVXOWNiZ1JOd2Y3?=
 =?utf-8?B?WlFXc0cxQ1lMT0p5anh6bURQYmJtTTlsYzNJLzVVVm1TbW9xNFZ6Y1JGRXBS?=
 =?utf-8?Q?9qmjuAcGvI8hC1uVyZIJ+/gDGJL?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?STJyakhNWG5maG8xRWxqY2tMeDkrZFlweG02cHgwZGppRzJHWmNZQWtiSHhG?=
 =?utf-8?B?OVo4MTF3NzBIUHVmNmlUNXdvUyt6YjVOeDhueHNTK2R5SnIxSkpKZEN4UjNH?=
 =?utf-8?B?MVJ4a3IyOFR2dE9kRVFWdzZNUmtYNzdvRkV6a1Y1UTJRMHVNUzAwR2pYK1pO?=
 =?utf-8?B?VWkwb2pJbUpEbmlwOE1zYVFvRWF4bzBNa1d1TlNBaEF3cHBnOWo4S0l5Mktv?=
 =?utf-8?B?dnFjczdLazBncEh2UndWbTlOV29paVUvUUtDRFhod05oNXBURDRNS0YrNlBa?=
 =?utf-8?B?aWd2OFBkajk2ZTd1ZkplV0RLb3JpKzZqM3UwNmJDei9HUEhnME91NG1nNkl1?=
 =?utf-8?B?Y3lxaXBYTTJodHRWUE1XK2s5YmR1cHA4d3pOMWp3NUFlMnJIeDRhVnRzckh1?=
 =?utf-8?B?QUMwaDQ5a3pXOGZESnJBRjNQT2o4dkZPSzVLSnU3YzRsK0RDbm9IYXZaRWlY?=
 =?utf-8?B?bncwdzBOVkFBOEFQejNrWEhFbkFPQngvcy9PSXhJdzhxT0o2SnZBSzYxOTlV?=
 =?utf-8?B?MjJDaVVMNEhtTGdvM2U3aGlZemV5SUFBZ2t0UEphS2Z3YW5IRkZrSG5UUFN4?=
 =?utf-8?B?eGEzRHFvOSszV3JoZlhlem90ZHcvamhoUGhjdkEvVXJ6VVZZckVPNDB5TmV6?=
 =?utf-8?B?d1BIWFZHSmFQd0pac0tZZ2lTMU5LRG9TSFZpSmZ6T1VoY3pBamUvVjM2VXdG?=
 =?utf-8?B?ckFaa08wOEhNMGRGZEdmOStIU3FhR1A2UTF1LzVPRHFtb3oweFlkOFo4VVlF?=
 =?utf-8?B?MFFNbXJ4NjV6aFgxZEpERHVOcVlzQWJBQkRqRHpLNWIxaSszTUxwTHZVMW1q?=
 =?utf-8?B?MXo0ZUxONVpkamlTRU56UnZhTHJxQStEb0wrelhERGdXeWJwbDc0ZWJadlAx?=
 =?utf-8?B?YTExTVh2bW9sV0FocUtWcWI3aUlyMEExaXcrdC94N1Fta21WZDVSV1crdW9H?=
 =?utf-8?B?YlRUNmd3Qm1UTUM0dEVkNmd5dUVCc21CWW1uUGpRYXdmY3k1U0hSYjNQZjVF?=
 =?utf-8?B?dWlJZUFTdkxHTzNaMmpWcldwdHZEMmRPd0hScS9KQVR6L3cxSGt3Mkt4M0Yr?=
 =?utf-8?B?S0YyMXdkSkdJWWQra1d6NUZxR1IxQzhXbFl2MXlZK2l2NXNza0R6K0dvK1Zz?=
 =?utf-8?B?VnRKamxjWjVtWDlUTE1VVGNLNk5UZUJETllJY0xHRVdsL0kxdm54SDV6aU11?=
 =?utf-8?B?Q2FiMmZLeUYzdlFYbzFPMFBZa1lIYm5Wa3FLemEvTGVtR1A5VkhmTUxkZXVW?=
 =?utf-8?B?YlFMSzhHaEE5SjdvcWVaUysrN2I3M2hNd012N1NiNEtNNlNXNG5LMGtiMHh2?=
 =?utf-8?B?TVZibTZ5VDhoRDUrQi9HUnhGajdCS2hrWmpNNkJGUlB6S0lLUGRMWUt4dWdE?=
 =?utf-8?B?NTJhekY4SE5vV2t0RmpzT3BQNUxvMlBCemlJSlBKTXpISFMwNFB4OGRaRmtB?=
 =?utf-8?B?a25jLzM4R0doYlpDRm9CNFRPYklzWHdSTG9mTXBQRWlWR1BxVG94TFBlY0pl?=
 =?utf-8?B?cUd0TzZEQ2JrbmxBK0xkOXdhVGJnRlRRTGRjVUsxMGhkUjd4cHA2V2FQQW94?=
 =?utf-8?B?RlAyNUFKdXRBRDU3ZEZtZWhzOXhWMnBDWm92V3RuMG96R3ZLU0t4MnN3aEpq?=
 =?utf-8?B?QWIxNVNhSlBRbVJ1em55L1dRN1BEL0FSbDQ3citVZ2NBVU9MNTZ1TTl0QjVN?=
 =?utf-8?B?YTkxdFFlb01QU1dKTWp2MVBjUFY5bm9rSlRsUVhNV3dUNXZDcFNINEg3cGdx?=
 =?utf-8?B?SzdMRzkvSzBVbXQzeFNFcldrd1RGQjJhYXRZK2RzYzFCM0N0RGJzTXJ5V2t3?=
 =?utf-8?B?OUVNWEM0MXBzOW02NTI2OFYxNHVjUksrNTRocUNLMGtpSmIzMUswbE5xekpm?=
 =?utf-8?B?ZW5wdjYxQk9MU25UMnJkaElTUldkM2pxWVNFdGJORUlPMkdzV1hOV0FNeml5?=
 =?utf-8?Q?D/KoBzzhs70XBfQ+Pj+qf1xnGJAygfM9?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad2a921a-3fd0-4ef6-5e3c-08def9e48770
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 09:15:06.0449
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR08MB999870

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

--- Changes in v7 ---

  In response to maintainer (Lee Jones) review on v6:

  Rename loop variable 'i' to 'chan'.
  Add blank lines between logical blocks within blink_set().
  Revert loop variable 'pattern' to 'patt' for consistency with the
  rest of the driver. A driver-wide rename will follow in a separate
  submission.

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
v6: https://lore.kernel.org/all/GV1PR08MB84977DA9A154D7186B6EA2CBC5D22@GV1PR08MB8497.eurprd08.prod.outlook.com/

Manuel Fombuena (1):
  leds: st1202: Add hardware-accelerated blink support

 drivers/leds/leds-st1202.c | 89 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

-- 
2.55.0

