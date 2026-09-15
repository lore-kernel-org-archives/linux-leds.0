Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazolkn19011026.outbound.protection.outlook.com [52.103.33.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1BB4A49B3
	for <linux-leds@vger.kernel.org>; Tue, 15 Sep 2026 12:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.33.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789473605; cv=fail; b=Co9ewHvSXsMD7nBpGCod0Rb1Jkya9cmn5eyfgtDTT2VY2dIRRTMEqWlSLfcvJPakg2+Iv0Im6i/T43lClCSwJFfFT44FWCBRBSJP1IBQoW+jp3P0KSqk4bLRJiMZwauKSSZCkftwYU/t0hGLKHefEgwTcDtxx3OooJc3rP7H/OA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789473605; c=relaxed/simple;
	bh=Ra2Wj2zezkdd8rkDjYRN0xh+2t2Q7H4EYqT3F52/KL8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FVD0kYk7CBxCObEZFTF90nqHYtCqONmRwqcrTMbizXpgSSXE93rraQ3HJyXBnCNEIKs9APNBVSSrjG3usve7aF0w5KAHBB5rvHQFL5OojVfvA2v1JYPiXJEeu0/ezQ/X+2659NILLGrNb3RPkXYa+dtabxex8fYScP7xXh1r86c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=ajxPMAPS; arc=fail smtp.client-ip=52.103.33.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="ajxPMAPS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QiLBkO3AcX75CX/1UduT698qmZpTWT5XwXfhAFBwpRRR5jOQmIF2hQP8Kd01qyEEebketQrcKMnAbPcVLSYCftx2lvuii5wddFdRD6QREJROVmGu/UsWc0IC46ck8ItQ490NlDZz+kkYzESyCoTJ9DdFXbVN6bLEVbLUIsD1GL0FPbBH+OCEp1HReamkNoo5FPJGjakvyrfxNZIL/3Rd8VUK84Q+Wx6fJUtNmPO7YaUxe5L+WA0NorfrEktFcy3aWIMHZCbt892/0vPMi1+R3CPTAQpPfJb46K3pxBV6Xg4o/Ifzbleiqy8g6mdGM0qLEtWl61j0uZNH9W3JTNTWPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ra2Wj2zezkdd8rkDjYRN0xh+2t2Q7H4EYqT3F52/KL8=;
 b=FvjILK+TKuO/nVN0j1ycpPj6U5ZEII3J95A4PUdwoOM+7F1Cp7gSdI37TMA98yC/ER3ieGaTh3k3JnY8MFVxOBZhwqxR1WzFKGEnwsWyiAucpUBKumtUFfFJKbFHg2zfC/P2FaUoKC636XUvV32rGHIlAq7JfejMO7Bol1LWVruy0ZcZBrWtCZkZ8lYKZwzMo+ncfaB0ta3mhS5sEQMIWoNz50gqFoG1zleNKjr2wCB82kVoSBy/oR6C1KuistakwSVvKB4TCucKxNcEyylT2hiRtCcLSEpgndoF++BCFmq4aMZEbvcdgj8Xrkyyj1JkQjKbmBXjCcakFNisM8O0ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ra2Wj2zezkdd8rkDjYRN0xh+2t2Q7H4EYqT3F52/KL8=;
 b=ajxPMAPSCliJYf+4CZLl6u4wHaXp8oOm95eH2U5f7D6VdV8xjxhIf62Z0eloGS+FjsvdsqqULWsd7NKjatFLZX6eIB9aTZ1Af5+kSIrn/nRYwiozEbsyQbsqVWb8vK1mFrWAsrkBD8XnEIvgba32TKmtiBNZXdgx+PAPMJKfkponNjoaqOx6qvNpfL8A/+5vUEu2b/ktSZruiosh8X7W/2nAizY5Bo5DSR+g9XDj2fBTzEwS5S2x/KY/lllA5oV1teZU3KpxJVLoONlAr/ByJwJgo7xKv+Qs9SUbeyFsypCTB08FkW9KtrkbLyzr61RULWZi6KSYrbc79dPE29sgAw==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by GV2PR08MB8341.eurprd08.prod.outlook.com (2603:10a6:150:bb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.8; Tue, 15 Sep
 2026 12:00:00 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0428.004; Tue, 15 Sep 2026
 12:00:00 +0000
Message-ID:
 <GV1PR08MB84978DF7C5D928F55E7032A8C5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
Subject: Re: [PATCH v1 05/11] leds: st1202: Clear unused pattern slots in
 pattern_set()
From: Manuel Fombuena <fombuena@outlook.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-leds@vger.kernel.org, lee@kernel.org
Date: Tue, 15 Sep 2026 12:59:59 +0100
In-Reply-To: <20260912225234.7995D1F000FF@smtp.kernel.org>
References:
 <GV1PR08MB8497422B7A44424C4968AEC1C5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com>
	 <GV1PR08MB84973A1571DF402225FB78AFC5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com>
	 <20260912225234.7995D1F000FF@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44app2) 
X-ClientProxiedBy: LO4P265CA0095.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::19) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <d68722d78250b95b7099b29dbc8bf124f9454add.camel@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|GV2PR08MB8341:EE_
X-MS-Office365-Filtering-Correlation-Id: 020783ef-de51-4d0d-6e79-08df1320de48
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|25010399006|51005399006|24021099003|15080799012|19110799012|5072599009|8060799015|23021999003|6090799003|37011999003|40105399003|2607281247196008|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QzhrcXNydnA1VUdmUSs0dzJEbHdJWVhJRHcrcWxNN3ROWW55aWZzd2IxNmJT?=
 =?utf-8?B?Rk1vK0RDSVNyS3NpTmYwblZ0UEZnU2hSNFdlT3JBMkZBTGEvNXU3RHBlaE9k?=
 =?utf-8?B?ZzZZMWpvTS9ENjc0V2dGUmtHMUU5engwbkU4SndNbmw4ZVJQQnZHemIwdW5H?=
 =?utf-8?B?Y3dQZ3liSE5XTGJYRmwvckNPeUIrK1NnNWNQc1l5U0JDUjQ5WWI4UVphaTJh?=
 =?utf-8?B?dzdWaUI3TCtyTEw4bXY0TFp0VmtCY1hJNmF3M2R2T0hCTU4vM0FlMSt4ZTZM?=
 =?utf-8?B?VWtmNmVBVE8weWdJSEdSeUM0QjI3U0JkTC9RdXhFcTYvd2pZdWtSTE1WWVhz?=
 =?utf-8?B?MzlVTFZrSDExUzBGNFJCMGR4ZjJldWJ5SlRRWVFySllpZVlsRXZyaXltMGFz?=
 =?utf-8?B?cmZ2c0UwUEo3cmlrSzluUmJ2Q0l4b3VMRDNBbi9Cd0VKcWp1NFpPM3dqTlFw?=
 =?utf-8?B?Rk1PQUVrTDlpL3VlSEV1NkRhL0hIRFh0NEhETy8wNUtFTUUybyttdTlPa2tw?=
 =?utf-8?B?S1Iyd2F0eUZmcTRPbXVZY2dPSkpvZkxqL2VyQThLY0RLSGMwMHVRM0oxcFRs?=
 =?utf-8?B?RCswcXZQVWpiaDE1OEEvcmJ3QkxjOElueExzcFppcEtkS3lwTWRrTEVlS1V4?=
 =?utf-8?B?Z3pKRFZLbmVZbmRjNGwzYVUxZXJaM3R3Umk0M3NOWGx1TWZYVVNRcmJqS2Jj?=
 =?utf-8?B?cmdlSWszajBOTlFYZHppUmJhaUovMW1ISVErVm80ZkFZb09Qd2cva2JGK3JU?=
 =?utf-8?B?VXdMVnBsT0tDSlpxTWdVTmpldXE4ZkNiVDg0emJHRHRNb0pweG84NUxZL093?=
 =?utf-8?B?QWg4YVpNMkdJaTNDRDVwUUFLand0WmFaR0k4cStxR1Z2eUdaYlJEQUJjemg0?=
 =?utf-8?B?Q2x1a0kvVTFiT3VHenU0eTg3S1hzdC9Jc3FMZzNLZ1ZPMXMraUpjWGo0OVZo?=
 =?utf-8?B?a01SbEdKc1VremFkRktYRHhURXhjMXdxeDhzcmJpOWR0YWFDUzFuK3JiSGNa?=
 =?utf-8?B?ckk3Ukp3UktBTFpwMEhSbkU2M0VmSjlYME80RVNSSlp2YkJzd211MTB5YVQ1?=
 =?utf-8?B?NkhaMTVJM09XVzFlVlVERWlVajIxcFJCZEFKdnBBcFhVNTFRUE5MVjFZMkJq?=
 =?utf-8?B?b0hYaktja0t0L0xTNElEdlBoRzJTUjlvUTA3YVRhWHVUTzRkbjIrMnFqMHBF?=
 =?utf-8?B?VXRjVkFyZ1hzQnBra3BhVFJYOVhQKzZpMTlGZmR0QkJtd3ZGVFJHcS9YRTkx?=
 =?utf-8?B?TEV5MVZiMWIzQ3ZmTXF6RlJKK2tOY0dRT1M3RDJ2eTdIcTQ2Q0NmL1ZzMklM?=
 =?utf-8?Q?mkPvTb/cLvHUv6lyw/ZKfbhA9cdmZ7NQyn?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y000TkduaDhxYWs3U1RnKzBobEswZ0NRbXdlQTE1QU4xMWlRYnJDWXB6L3Fx?=
 =?utf-8?B?aUdRVjY3VkpINXZwWXIwSjR5YXdoTEJUWitTSkRzYlh3YlJ6N1hnaDJvQy9K?=
 =?utf-8?B?VUtUa3dzMlVqM1ZJNkFndzRqZ0lzcFRybjVzR2lzYnhjSHlmVVgvRDJwcTh5?=
 =?utf-8?B?Uk1Gc2lMVjlkcTdjWmpZUTlnU3Z6NkFPQUIyb0cxcTJWb0cyZFIzRFNiQ3FW?=
 =?utf-8?B?cUVMN0ZPTkJYL1drdlMxUHRQWUdnMkhCMGlsYk5SL1FnZE5ITUhVTHI5akJV?=
 =?utf-8?B?eklRZ01RUllhMlFnUGZFT296eDhydDJWMzVTd1dRdFpIaHRURzFqSEtpNXFO?=
 =?utf-8?B?N21VQmRVc2RyTElDR21wL0toTWQ3RDIvVVlnTFZyVHBCMlVXamVsanREN2hq?=
 =?utf-8?B?dklXWjI3MHEvQTdkWk1qM2R3UjhkVThJeGxsLytBc1g1TnpCM01pbGhuZS80?=
 =?utf-8?B?STRrY0VOdWNvVElGMCtFV3RiZEROOFdTTDd4Nys4dEswVElGU2hTd3pwNTFm?=
 =?utf-8?B?RnJqMDM4QU1ENnMxWm5Ja2ZQMlRnNXF4UGhCVXVFTjBHcnlZVlFvKzkyT1NE?=
 =?utf-8?B?Yk10a1ltd2xiT090ZThVZ2hBblNtWXJLTUxEZWdOMGplTDdRZEZhS0gvbW5w?=
 =?utf-8?B?dkprZml1ZkZCcHU3K1VSclA4Z0NBVkF3djI4a1FTdmMxNXc3ZTBjeDdRUUtT?=
 =?utf-8?B?Sm9ya1NHRFFTMWg2WkhUTnRaMWRDaVAxczZBK09tSCsvclhuTDRnQ0pjdUww?=
 =?utf-8?B?SUhsOE9DR2RXZ29SeWVtK3J5enU2Skk5ei85TDdVZDBNai9mU0tlSER3R0cy?=
 =?utf-8?B?ZkY2WCtxcHR5L2paUGU1d3FQVThUamZRZXJJbDZjQWV2Sm9hTjZaWFFNcDlN?=
 =?utf-8?B?a1VmcFBzVSszWWNlUkxQMFVnZjR1QVZsOWpCSUtiVEUxTVNJc3MxRk1xSUNB?=
 =?utf-8?B?TVEwdUtKSTRiak05UDluMnJjdEFGQUh5bHM5a0tvejgranQ5WHl4bGFuVkpu?=
 =?utf-8?B?V2oxK2tLTzJPaDdGa1A2QWtxeVRrR04wL1ZqSWhoTjk2YkZuQzVGazZxOFhK?=
 =?utf-8?B?ZE5DWmZuVEgxK0R4aWtOZ0Z2a2J1dit5akEwYTdJRnd3MW1TMTN6eUpmOVRD?=
 =?utf-8?B?TXR1WWtrdllZa1cvVFJJREM4RUJ1T3p3clpCUWxOekQwV290ZVhlQ29EbGFO?=
 =?utf-8?B?bVNZZlV2eGlFNzZTTG12YVhBUFMycGtkZ1JDWmlVMjBsWGUwK2dFT0RJNksr?=
 =?utf-8?B?NGtYRDB5VFI4Skg3djA2ZDdScHZXbVpKaDZwcHVOU3J1QTNoazg2T0Uvci90?=
 =?utf-8?B?R2laY2hZWEJmMzJQK0FqNDJmVXFZUWY1SUUvRHZxU2pWUjRVd1ZaSTJEYlVM?=
 =?utf-8?B?RzJsbTVmRXM4cWtEaDR5dVdZOVgxWDNabmR1UHZ1RXZSaUd2Vk5FMFFxc3BW?=
 =?utf-8?B?R1o3cFJqSjhWVnp6NXJyTVZkZWg0Z1Q3TWtIWDM4SFZoTnUzeGF6b2tMVG5W?=
 =?utf-8?B?c1YycnNET2pKVTE0cmlPcXhjNnZPMVdXbVRXQ2lXUWNqOThNK2NwemY0TlFM?=
 =?utf-8?B?UkdwK0VBNU1vVnBIYU5RM0RzWisrdUJ1dmFYVnZZKzZLd3B3Y1RabDdIZGNS?=
 =?utf-8?B?MXlaWVNBQzg4aC9FYjlTYkdzbTFUTTloc3hTWVFoaTRkUm50OTlRTGdUS0Fr?=
 =?utf-8?B?OEEveVF1UlRlNVVRVXZmOEViWk56K2NmTUJCeWNJV3BYYmg5eUwyQ1pXdXFM?=
 =?utf-8?B?QzdWdWxNcU9ZdUFaSUV4c2g5R2g3ZE9BSE0vbUNqN21UR2RYdm5mY2ZUVTZv?=
 =?utf-8?B?SHNNVDNuZ2tTT21jbGk4bXRUUXo1bFZEMWU1dTk1bEZsWGZFTjN4cklGSFAr?=
 =?utf-8?B?c0pYQXBvWTVmZ1BUbjh1R0diMWJ5L3lYWWI2QjlGWGxiOHNhQ2ZUUmNnRjhW?=
 =?utf-8?Q?ISZ/CX46U8c5S6u2bO1fZjX6BncoyJot?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 020783ef-de51-4d0d-6e79-08df1320de48
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 12:00:00.3498
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8341

On Sat, 2026-09-12 at 22:52 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider:
>=20
> Pre-existing issues:
> - [High] Activating a blink on one channel forcibly turns off all
> other active LED channels during the blink cycle.
> - [High] Clearing or blinking a pattern on one LED abruptly terminates
> or corrupts hardware patterns running on all other LEDs due to shared
> sequencer registers.
> --
>=20

The st1202_blink_set() comment is about intended behaviour, as answered
during the blink support review and described in commit 35cbd34a6a05
("leds: st1202: Add hardware-accelerated blink support").

The sequencer and its duration registers are shared by all channels.
This is a hardware limitation, set aside in the cover letter as outside
the scope of this series.

--=20
Manuel Fombuena
