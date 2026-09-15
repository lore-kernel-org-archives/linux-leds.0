Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazolkn19011026.outbound.protection.outlook.com [52.103.33.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB98339E17E
	for <linux-leds@vger.kernel.org>; Tue, 15 Sep 2026 11:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.33.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789473563; cv=fail; b=aP3S6xXI9jEnahb6DwHqUvYl0Zy1LORM7R5pa6VrssJ7gMI1/Vt83b9Ga74Cr/WEf4rS0LtFTWuWmCT74u5Y6YkKH6RHIMxq+o0yxSdoSveunzEqZvk+k1BT4GLJywYmc2zIFY6GuuB67NOhPkG9cEGpSBxNqimTko9DxF1UJC4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789473563; c=relaxed/simple;
	bh=R0i7hgj5XJZ2hIXM5DJk4RYOXcUVWe+UifwqpPMnfTI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oyEQhZLaZQVj0WXbcLG+1J5i5Gab1JuZ+Eywn7cBmBnIqtEHzIQC9PpQ7XVyMhwWyHaWmx2J1D9FoV/LNQba0XQPWoRvu9gsVGH7ZXpD39UEdSbRsGGVEels34bivXBeCvwvEalj+3EJOp+aT8MWHl7OxEiKYXxCmb96DmYsN5w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=sDMQSXV6; arc=fail smtp.client-ip=52.103.33.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="sDMQSXV6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jJCnbsW236tdtzH3XNyHZYm2p5ie23bvqrcibTdoRfEYAtaAWJp/Pfv2V0ZFWSxYWNEk5HlhsnTu/uqaVjAwkreU+7IMMzmeKrEzJmg8a6Y2dvCbdap160afsFdjd5eaLtxzFHM8RUuRwav3Kov1FxJEqNT8v+q/s+Rt4yiHSBb/rxABwO9yLfOfEU2NLeGhLnJIaJNiT+ZjrSvumtt8NMb72cs0uoiBnsAVa4dkm+kv2qOUCSQD9p36JUJg1yaNyRf7Z21SsxU8L840fdTZGx1yVV8LVVVRXOKFNvj0VsNPJDeknIqXfxRgf1aZ/5ls/+0TFtlrTkgc2EIeWq9p9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R0i7hgj5XJZ2hIXM5DJk4RYOXcUVWe+UifwqpPMnfTI=;
 b=jt36LhFCgtKmNFZAYRvoGUyqljfg6T2M7CIRY80MrKgPO51wzEH+Mi2fvJVOabisDHiYS9K/MkRzE2imfW8ohDO7VzCO63JgqbXINpgEJK6FV9/e2GPQZ1ni62qcryQF8IQB9tqdaWNtko5UhI2SAi00NDTRZ6dlVVPeyVlKxUohvbvtCv2nfngWvnco6oTvDDIpac0QAPV/XRyZBw65QNLgVai1Nun9csQnBBMT7PV14nRuo9z0IEzhNKNY3DtN1w+DycPc39juu1Uyt+cxTHvqsL2jfCLsTDd9IM8S9vxs7iewKgIogOiB+PKlkI0WLwO3LKRZxMy7Voio+8RTlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R0i7hgj5XJZ2hIXM5DJk4RYOXcUVWe+UifwqpPMnfTI=;
 b=sDMQSXV6VDwrADuZU7nGnnP7ds+Rl9N7xPVUUpAX5FFw5EnGJUYtE+Aqn8ViNeI1aYcKQoB4jgKn/Jf491tpM/A/2jih+MHvYhPBhJVxqsNAu4RWqiGs1kZ3UqiQlBQmFIloiO8fpnk6wHxODwu7hQBi5SwaPHUFSY3y8BaJg3f3tOrj586AKlE/ey+Il1S8pqKcKN5hYNLpMnhd+Dl1TO2snJYNoKWxqnlIe64qE7Pke/jmVeKnqgOHLeaNWhvHX64V59ypCRo5r3p//3SyD0orJGg1o8jBAJvdZ9iH6Qcswm2mpvGfVvWnqAwoIGIa6P5w7A9Crm3KwpQrcPqARQ==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by GV2PR08MB8341.eurprd08.prod.outlook.com (2603:10a6:150:bb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.8; Tue, 15 Sep
 2026 11:59:18 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0428.004; Tue, 15 Sep 2026
 11:59:18 +0000
Message-ID:
 <GV1PR08MB8497F20AFAF736BE301FC972C5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
Subject: Re: [PATCH v1 02/11] leds: st1202: Spell out the phase-shift
 configuration bit
From: Manuel Fombuena <fombuena@outlook.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-leds@vger.kernel.org, lee@kernel.org
Date: Tue, 15 Sep 2026 12:59:16 +0100
In-Reply-To: <20260912225030.E2BBD1F000FF@smtp.kernel.org>
References:
 <GV1PR08MB8497422B7A44424C4968AEC1C5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com>
	 <GV1PR08MB8497C0EF1F3979EEC073AAAEC5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com>
	 <20260912225030.E2BBD1F000FF@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44app2) 
X-ClientProxiedBy: PR3P195CA0020.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:102:b6::25) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <175baf1d34ed20f9cc6114f45f38b7e4cc794e2c.camel@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|GV2PR08MB8341:EE_
X-MS-Office365-Filtering-Correlation-Id: 3192d9ba-b9b1-490d-e30a-08df1320c51f
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|25010399006|51005399006|24021099003|15080799012|19110799012|5072599009|8060799015|23021999003|6090799003|37011999003|40105399003|2607281247196008|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MnlmRDVTRVdDN3c0NEV5b1B5VlV5VjlYVGswZFZOLzI2K1hZZHU2UmM2TVpj?=
 =?utf-8?B?by9WdENXUkEyNThjS2lZN0J1ajZqN3NINlhiY3JneWlVZ1M1Ty9neE1yemNY?=
 =?utf-8?B?dUx4SmFzNVlRdGcrZ0wzTUdPQnNyWDROenhkbUtMT2FBZGtaU1RkY2VrYTU1?=
 =?utf-8?B?T2wrdUxERld4RUlEMFdpWHljUzBOUHY4ZmNQYTRlZGRqb3BuM0dCb2YvdUVT?=
 =?utf-8?B?UGtEMG5pWXVpdVJlaUdqSEJYUldEUjlBUlJtWWV0dnhOd3kyYTJ2TzdleG9z?=
 =?utf-8?B?OTdUUTlDVXp3UTFmdVdqcm8wQTR6anBGM1dsT0VNM0hFTGFicWNndm1mWHVm?=
 =?utf-8?B?a3hkNWhKK290bkhqVURRZUFic3Z2ZWpBUU11T1A5SVJPakdEc3hYZk9uRXgw?=
 =?utf-8?B?Vkp6U1p3dURTM05UU2FMVGFReGxseXZsTis3dlBnUXdybUZENzNRZ01PYU9n?=
 =?utf-8?B?WEI5Qk5iWVBMRTVrSFdOamRJbVQxbmV5ZWpRcjNxSVBlcm0yWk5WcUMrSGhz?=
 =?utf-8?B?RlJMMzB1SWZtVk5LbTc2VHMyVUE5WkdXdFp6M2ZVazFDNG13OW1JdTRxTE9y?=
 =?utf-8?B?U2pBaFUrWnBndUwvRWdiWWZkUlhBK042eHNUYWYxUWEvRGcyaWlPLzg4S0kx?=
 =?utf-8?B?bkpFWkdwb2ZuVUVUc3V2dWZwbTZGaVpubk9mSTYzT0xRckpsNWUzRUFFbFRq?=
 =?utf-8?B?ZG54U3R1Y1BLUlRkbVozTFNNR1YxZXhKQm00TE1oa0ZNQm9yS3lyd3VVcGZ2?=
 =?utf-8?B?NXY4dFo1M0puN1lrbEY0ODEwSGp6VCtQT3dyNlNheWttSjVjYTNpcmp6Qzkv?=
 =?utf-8?B?eVVBdmk3ZWcydU83OHFzZndLSmVROTRzOXFJUWp4VTE2cnFjdjl6eTA1ckJM?=
 =?utf-8?B?dGF1QzN1YkdlbUZDbE1oOG80SDZrUXRjY29BR2JvVjNFWUhPZVZWQy8ydVNm?=
 =?utf-8?B?aWRCODdtQVJGNEhlTk1yTG40Wjk0bDVUU2FQTXRQTEtnVnRhbVFtWTc0d3ZG?=
 =?utf-8?B?ME9FNjk0cFVQc2FFbHdCU0hSeERXNTc2NTYzWmx5ei9UMXN1aXRwZGpOd1JZ?=
 =?utf-8?B?cStzMnB0aHIwaklybjRhWlFCbnV0bUk1YnFtSXBKYVBZdHdzQkRMSXo3SEI3?=
 =?utf-8?B?TUxXMG04c2ZHenRjeStJT2tUaGFvVkw2aGl5TVd4QnV3Umpta3Z4WUVreUU0?=
 =?utf-8?B?MUFOeTRVSklwVis1L0IrNlhMMlFlL1pNcmlPOUZyY05nUExVOHNFZzdlakdY?=
 =?utf-8?B?dU5LOTFuOUlPUDIwdjgyT3NJV2hPaHp1U3BOaVRyRTZLUmNndDFVUk5rSmpu?=
 =?utf-8?Q?YGtKGyQ6WMVvcHrorWVUtLhXeTX6VHZVYF?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aEN0NzJzeVdtSUQ1V2QzNkg0clVLZFRDSkc3S2lFRTJPVitDTFBoVmJ0cXlo?=
 =?utf-8?B?d3ZLbWd0RWQ2OFEwMmE4S1JyU0ZrUVladENCMW9ZeVNRK2UzUjF1ZVQ2clhI?=
 =?utf-8?B?dnorcnFVenlXOHlVeTRqZStMZXhJdG96c01CSUtlSmFvazNCVWNKOTFNTnk1?=
 =?utf-8?B?TXNkWUxTM3RTUnhmVGJKZmwydUpDZXd5UzJaY2pDSUFuOEJHMkVFN05Mc1h3?=
 =?utf-8?B?VmROSXdZNHlGdjRSYmZSbnY0WlBvVFEyQzhUZ09vVXVuelRyMkkrQVZlSm91?=
 =?utf-8?B?ZkdQeDA1bmpHQjRnRHVTaWVkMXZTVFRYWW9RemtBWTdpWG9ZeDA1WkNDeVU5?=
 =?utf-8?B?TEpjanhJNkxDSlhmZ0JCOEdlNlVUTGxwQk5DWEg0RnJ5U00rYWlOTDFrR3p5?=
 =?utf-8?B?b0dybW1jOWdqRVVBeThyUTkrRmZEYXFSNjVEMkZmY2YrclNicXRuQ0lIanFJ?=
 =?utf-8?B?MWk3aVFHcDdFdk5BQlFuUllVSEFvdjM3TVdVcVAvUk5qSzlVWGpQaDFFaTlO?=
 =?utf-8?B?N1p6MXg4clNvbW1jUmYram9DQk9UNjQvemZMTm16U20wZ3E4Qzg5dDRER2d5?=
 =?utf-8?B?Mmd3Z2E2Z0hBZmdaT2paNnlSVGE2R0RKbXU4blhYcmk4MTR6eUExRzN5WUlU?=
 =?utf-8?B?ai9nZmdJbVljV1RQMllIQTFlTnc5NGYyNis0UUpNRW9BZDZweUNqbGNOS3Fh?=
 =?utf-8?B?LzBjQkNGU3MzNEk3Ry9DU1dmcVdQV0dPRjlmQk41L01qcURUZVJ0Q1EvcHlD?=
 =?utf-8?B?RHQvTXZoRjVMOWJjbnJYb0taS0dZbklZcXhHQWhubTZIMERGT1VDQzRKbEdh?=
 =?utf-8?B?OFYrdlNlcGhEd3RsMFRFVzZMTUFSTmJUVUtuTEJsUG5vZ3MwWGZVekx2MkZK?=
 =?utf-8?B?NjNkWU1qV09peGNIT2RBVlh3WnVydEdxQ3VYaEl0S3ZWWVpiZmJyVkU3dWJu?=
 =?utf-8?B?MjVyMDRHT3J0K3Q2NHlJR3Q5Sk80S2NuT0VkdEM2TEpHK0tFVnRWN1pkeTJP?=
 =?utf-8?B?RXp1eUZoS1ZMenpTYWx4UHY5OXhzaXFCSERFdjdZRkhVUU4vODhVY1FrdUJS?=
 =?utf-8?B?WWhRVU5EYVN6SWFCdlVVNlpiQThZVGEvam15WnhROHNuNGZVZ25uNmlWN0tR?=
 =?utf-8?B?dEJQblhFRFk1bEpGcXdCSm1vUmV2U2hxV3pLbVFDMHU0YVlBY3g0aXpPZ0Mx?=
 =?utf-8?B?VUhnVlhBSjNVazFINTdDMkRYV2pyUjluV3BybTlWZWdoTXhFZ3Y2cjBjVWxz?=
 =?utf-8?B?REQxS3MyZk1HVVc2ejNsT3ZhaytUTHdGK1JVMmt1VmxldTZ1UFN5UXhDTzhx?=
 =?utf-8?B?aXFJMEdtcE5JMzhwNHE3UERxMWVyTkpBdEJZU2ZFeUVvYWtkWnlJV1VxdllZ?=
 =?utf-8?B?MGlVb3Uvak1rWGVFNEhGZ3ArdW1QUDdNMVZKL29MejNkS2pPNGhXNGpjUUxy?=
 =?utf-8?B?RVQ0K0F5Tjg1d3ZrREFXSjRxMUVxcUUraFQ1RkdjQXQzRzkzVnRNVlgrSUxw?=
 =?utf-8?B?bGZ4QlU0U0hkbWxYTVRiYk1tRE5hMXhSdU5uMVJZaFdkUHlzS05XTHV4anVU?=
 =?utf-8?B?cEYyb1EyZEtKRlRnZDhuR2VxL3IrQklVM0h4RnZSQ0l4TVF1empxRVM4YnYy?=
 =?utf-8?B?Mm5hN1hGZ1RRMDhSTWt5WGJYSkRqTWQvcFpTa0lhWVlvRmxnaHk4UFE4Ri9F?=
 =?utf-8?B?MnptcGhDNkx3amNxY29aR3F6a2JSOGJnN1Q2bXJqOXhJZWFkdHp3OFFtZ25Z?=
 =?utf-8?B?K0xyV2FQOHZNSnNoa084c1IzVHlHeG95Mk00TDNycGd2NElBcUVkTGRNN2I1?=
 =?utf-8?B?a0dYU2hjSG9XUW5NU2NsamxEZXdCUHRWMU1oSXVKS01tUklwQS95TnJJRm9Y?=
 =?utf-8?B?Y0hQcVE3MmtaWjR3TTlDV3ZyYlhkNFR0T01LT2hvRWlialByM3A1NytWYWxp?=
 =?utf-8?Q?wyNtBgB1dilTZiZ8A5m10tCtwS9yab7b?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3192d9ba-b9b1-490d-e30a-08df1320c51f
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 11:59:18.4404
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8341

On Sat, 2026-09-12 at 22:50 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider:
>=20
> Pre-existing issues:
> - [High] Blinking an LED destructively zeroes out the PWM values for
> all other channels, permanently breaking steady-ON LEDs.
> - [High] Hardware state clobbering: per-LED pattern operations corrupt
> global sequencer configuration and step durations.
> --
>=20

The st1202_blink_set() comment is about intended behaviour, as answered
during the blink support review and described in commit 35cbd34a6a05
("leds: st1202: Add hardware-accelerated blink support"). Once a blink
takes over the shared sequencer, other channels cannot keep their own
timing, so they are kept dark rather than outputting unintended values.

The sequencer and its duration registers are shared by all channels.
This is a hardware limitation, set aside in the cover letter as outside
the scope of this series.

--=20
Manuel Fombuena
