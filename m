Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazolkn19012015.outbound.protection.outlook.com [52.103.32.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8AA736164D
	for <linux-leds@vger.kernel.org>; Fri, 24 Jul 2026 15:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.32.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784907501; cv=fail; b=jBQIQPvxKpBmmQJnPiIH5uDQmNrP2otEI/19Ma0fpMXkQmUIRrAtCpmA4e7jQjJrXsMw+uAjxEWcHyQC8VTc5iNiElbAydhhV4ZlsCl37nPBe5u5uecxJd+MvRPDflObnMqo9rC7b3+DCVP9Z41CirT6FOgjIZzKhAaFgAgIrm8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784907501; c=relaxed/simple;
	bh=xGW0ewAWPFAAy+MmZPSD/56hel6Ltqhq7O6qKllo16c=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kNdU5Cpz1I/mXZG8gfrA5WJO2UEPYaplbU5v7EIuwwa46Bxdwhw5wiF1mcJvB527jZHruRg1Y9pPF/HF7J8Rcocp6g2f318UKdVi8M3XAd1pz1XR+WBoE8Y/HYqQ9lJP/PoBPFU1mAPpwvPyezKA67h6czxt8tT0nfNPpRjvfGk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=PpKzi1rT; arc=fail smtp.client-ip=52.103.32.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="PpKzi1rT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uyG+UVXqX+H5YsoyHwq/PMprSGM8UDMJL2HALvEo7dOTu3dHcI3lSt8Oclf5lNK11G6hziZdP9TwC1eRzEbDo+BEY/CWvolgaYLZx5hkCcMPGsc63jVW1mEULHhCHnoc+Huuam977Z5vkM1mJU7Kze3DONGEQx6jNgZoDKlhm0bJpOurM8x4dXfT1tdQ6E5FN/mDv9yOELlrl4lQB9Upf6gE9B5bdodGw9u/ncLrZp29tNPmkee6O75r7t1ytf8Wja7PdIniFE9HpLUQN+Exb+6/Y9UBcImS4yua1biT30bxGRL3UCXbcTrCIBUsbmPW/KwikBMLJtMRQI27XkDm8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xGW0ewAWPFAAy+MmZPSD/56hel6Ltqhq7O6qKllo16c=;
 b=xzPn/brE/IG0iZAcFeCmSql2KTJqdxUo/kX8cXTaW6X8eL1rBEIKmChFnONGSdjJOOsDclkNxeA8k8PSS3bIgQTGxYpfhhcC7ZW7/w/ZukqCCIkORFEwMFw1iMtvCWjPE4hATVr2TgBM5WWszu0tUdUk0djSNpOBcCoDaH9JSy17JPQsyzsZ5JfFKX91/DtepKI7mr3YPLayrfObyqqAUY84CIIl/WzPhrZCf6D3HBjTRCJFcn5zioi02yx7gYOIu6kMOTZVGf2vylIvR8rxVJvasdv28eyW2f7erIEIYzE8AsOmMjaoGn0W20ItxlUsewD7tVa1woOcepZy2iOFPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xGW0ewAWPFAAy+MmZPSD/56hel6Ltqhq7O6qKllo16c=;
 b=PpKzi1rTjSD/5SozRnN/1bgVHKdD4mm9oduiaGlZnFmb+JsLfesfmkenvrnA//T8sMuCuTEJOeBsHcUXL5P18jUYDjLfaM+iK+RKq+f41XZFzNsy9kTYQjLAMynyOYbeEVzk/RYbiNlvD2jHb+p6GLgytoQaHnFuoaqRw5kk2CnnLVrPh4kj6JzGE8Eue3Qn0CYwwoIjEWaQa5XoYQlkz6gn4Dii0uZ+Bfp1LjeQzUsGw2OcdpnKJb4Ro251eGTce/gArbfeLkERkSdryzSNPY4NjLCfwbAZgZIMkr8SU2IClpKTuEMPhP1dFx2a0kpFLh7ZS/6ornoVNmge0HvDKQ==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by VI0PR08MB11017.eurprd08.prod.outlook.com (2603:10a6:800:250::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 15:38:17 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0245.010; Fri, 24 Jul 2026
 15:38:17 +0000
Message-ID:
 <GV1PR08MB8497EC69C453ABC4F63C3149C5CF2@GV1PR08MB8497.eurprd08.prod.outlook.com>
Subject: Re: [PATCH v3 1/1] leds: st1202: Add hardware-accelerated blink
 support
From: Manuel Fombuena <fombuena@outlook.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-leds@vger.kernel.org, lee@kernel.org
Date: Fri, 24 Jul 2026 16:38:13 +0100
In-Reply-To: <20260724121207.764491F000E9@smtp.kernel.org>
References:
 <GV1PR08MB84979E014A407174EBAE9875C5CF2@GV1PR08MB8497.eurprd08.prod.outlook.com>
	 <GV1PR08MB8497508C31C9EFF23E85073CC5CF2@GV1PR08MB8497.eurprd08.prod.outlook.com>
	 <20260724121207.764491F000E9@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44app2) 
X-ClientProxiedBy: MN0PR03CA0008.namprd03.prod.outlook.com
 (2603:10b6:208:52f::15) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <b84931c37b5548a28d272737c8d2b898395cd994.camel@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|VI0PR08MB11017:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ea105b1-3af4-4c05-a0aa-08dee99994a5
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|24021099003|5072599009|6090799003|19110799012|8060799015|25010399006|23021999003|15080799012|51005399006|37011999003|40105399003|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MzNnTkYyQ1dtNnhXSG5iWndSU211d2FPZy9lWHVndmRKM2hZY050Q2xGMXhG?=
 =?utf-8?B?dldTRVA4RmpFbmNvYXk2QTBnOGZVSjBHc3F4V25JV1lhQnozaDVtYmJ3Zlh4?=
 =?utf-8?B?TmRFcFlwS0Eyd2JQakcwTzU0UTkyK0p2RGZZREFvZm5TU0U0WU9mdDlrNlRq?=
 =?utf-8?B?M3FkN1RvZ3dtbUZ4blB3WEJwenNaRFd2Z2RjWUp6bFRIamRsSEpHQ3BLN0p4?=
 =?utf-8?B?c3MwTEtWUDM3SC9NRlp1UVNSZHdHYlBsSGRPQW5MOCtzUUt3WDBqaTNBSWJl?=
 =?utf-8?B?a3NpUkVzeWhGWnJ2VlVmM1J5VWFGZmVnSEJuaDBFYmg2RFFQU0xSMTUrTWRB?=
 =?utf-8?B?OTllZzlvRXEyQ3VhWW5UNFRkQ2NoYnVoN0prL21yQ1kvbDV3ZzVmUUE0dlRS?=
 =?utf-8?B?WXVKeU0yeVJndWdWZ3NFbDVVME5sKytqQlFWNHNNVVFvZHJxMzkzbWlOY2Er?=
 =?utf-8?B?ZUxIRDlOK29WQVBmZ3JReTNRTzJETG00Y0hxa0lIc2dWK3VBempRWmlwbUJH?=
 =?utf-8?B?Y1VVSnFRRFp2a2J2eG42NHpnaGRXNDcvWDF4dEpZNGF2N0FwdVdmMnFaSDNk?=
 =?utf-8?B?U0lPTEJkS0Fia0RTRjA0YUQrN1lmdGpnUTNSWC9RYndzN1VXa2VlNFVFWHAr?=
 =?utf-8?B?V0FEUWlYZkJmYTlXN3hSbmtGaFZSRVBRcjdmSmliR3pHcVpDU1JoeFcyeHN5?=
 =?utf-8?B?bWpQUzczRXRKeHlvcTQ3M1phOGZKMXYwUHlXMWZCTGpqck01L3hGMkdsQ2k2?=
 =?utf-8?B?Q3grNTRPTVF4MjZ0anAwdTZYTUd6ZEVLM3hNaUNCQW9aR25Fdm96SFVCaitM?=
 =?utf-8?B?NCtYekdJaE5JVHJraWE0ME56eGZMZFA5T3ZaSDlDaS9uc3JtTjAwdWt4RmZ1?=
 =?utf-8?B?WGxKRlV5YmZkNEdBbU83QXV3VU5mejNDdGFDdWNXanFvOUdMTGU3TEQ1WFli?=
 =?utf-8?B?NThFa1hNdHJUaElHalAwWGowRmRYdG16VGZhN2drN2JpRi9zSTVwMm9QazZz?=
 =?utf-8?B?SnFHb3EzVmFVZi9DbzltY0FMd3ZSQ2diYlUyeHo5VnMyMkdaS2R1YkhuaDJM?=
 =?utf-8?B?YkFEN0FlMGlmRHp1bXZZRk0vVVJzdXlsbG45VVVMeC91ampPd2hDV0g5Y0Ft?=
 =?utf-8?B?NlloaW9pR2JYbXpmYzJpV0dYYlppdEpSMmdLK1pZVU80ck1vc0o1VGs5bm81?=
 =?utf-8?B?QlVQbE8vRzk1MWRHOGI4S1lHayswRXZaek1MNExvSVJKemVvWnBFOGM2L29M?=
 =?utf-8?B?NEt3VGtyN1ZZd1JKWVYxTjNBbkR5Z050ams2cmdialdXSHozTk1lMWNSYkdj?=
 =?utf-8?Q?j3t6jx9sxKTv+rIBQTSiPpH7a/K6ik4cdc?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OVNlZHUwNzk2Nkl0eW5FbVVjTWwvWS9yY2RLZVREL2pGMU5JS2NOU2FYNUpG?=
 =?utf-8?B?SDJuOEdaMXRFQk56Nk9NZ2FMSjFOdTFLcG9TZ0NleXMrZzFaZ2JHTFBIbTJS?=
 =?utf-8?B?Q1RvNSsrZGVyeTJhMGtWZ1NFYUw3TGNSUVdURm9neFQ4OXJyZjVHME1SSFYx?=
 =?utf-8?B?T1hGekdkQ0NLSU1Fb2ZaMXJGOG9tTTdRQXRPYmJGanFrVXRjME5DTG5BSURj?=
 =?utf-8?B?ek5pbXNVWDNnanZ1MUFKaFdUSERxcGZpbEhKMDJ5VElaNVNJd3Rlb1BPVC9K?=
 =?utf-8?B?ZUNNVGFQSGxEa3dobnVHUnoraCtHZjBqTVR5NFlMTVVPckplTTVpQnhnV2JM?=
 =?utf-8?B?d0FUVUxTQXRDS21EbkgyTll2WHRSSk5sVkxzQ2p2NHJwbnFIb1dFa0hKTGJB?=
 =?utf-8?B?SVNrU3RzRjJySzZyWTFNdVBrcnM2R0dacTBDakoxQml4dUVtaGd0UFNURXJB?=
 =?utf-8?B?cW0xVmNTZmMxMWhUYVFXN2VzNWM1RTdFelZpUHF0OEE2bVEyU0cremMyV3Js?=
 =?utf-8?B?ODB1blpxZE1ZQ0d6eDVueXlQQ2cweTFFd3BpaytmTmIzSHBMMjBncFh5ZGdR?=
 =?utf-8?B?QXk0SWEva0RZOGxTTldVWVV6WHdyOG0vT3Azd0dZOHlPWnpiMDdUbVFMTlE1?=
 =?utf-8?B?MUhIWlNvWXpldEFhMU9XZzNvaWN0VlNvVUVkT0ZpbHpOeTFpZ29HbzU0WGtM?=
 =?utf-8?B?aXN0aVVjeHZxYjF2Z3VqVU1OREhnK2pDOXlycGxHR2hqS3o3aXhyZHRBOGJX?=
 =?utf-8?B?U1FucnM4SVRQdlpvOU52bnJaOEFXUURkOFNrekR3Z2FtMzV6dVpxdTRKU2JW?=
 =?utf-8?B?Y1RSMkx5bXp3L2tlYmgyYjM0bEtyWkQySXV5eWhXT2FpRlM2ZGkxOEYxdXll?=
 =?utf-8?B?UDdmajM5ai9MWTJ1OStJUFd6N0ZtQ0dPdTJsc2VXZEdYR1dnN2hYdWZwMnJJ?=
 =?utf-8?B?OC9xQjh5NGMwd2FtbjA3WUVQSHhaSXd0R21pN3F4b1JsUC9hWnpiQWplcTBB?=
 =?utf-8?B?M05uMzNFcDQwZTJZVjlQRFVGQ0E2ek1oT3N2WTAvTHJNejJpLzRxZ0k5Ylha?=
 =?utf-8?B?UllCZExSR0FjbXg5WmV4bkovKzRvdzlMMUlNYTZmMXcxVkJRTHAvbDFwZE9s?=
 =?utf-8?B?dVhydE43M3ZwM3IyVmR6blQ5eFl1ZTlCYU83Y3VRZ2pmSkNZS1RyUVQ4N2s4?=
 =?utf-8?B?YXl2a01sQlJDcnNUci9IQ3ptaFp6SWdydlViTFhvYmt1TG1nSGRZR1o2YU81?=
 =?utf-8?B?aTUzQUFNVnRqL1UzbUM3UEpCWVpyNjN5YStEVC9wTmdDSXE0ZURjdjFYbjFC?=
 =?utf-8?B?aG50Y201Uk5mQXhjMmw0ZVR1amdQWWZVYTBudDIrNC9VNGlmdjR4aSsvL0xx?=
 =?utf-8?B?cmc0QXRQelVuY1dvY3poUjlneDlROC81MWNwcGdkTllJUmpsVVdKeGNkYURH?=
 =?utf-8?B?QkpSV21kcURVbFc4RU1pUWZoaVVHQnFlNTB6NWFQQURvc1k4V3FrOWpyVk5X?=
 =?utf-8?B?bC8xbXZKVUNEenNBS0krQitEUzlNWnJCRzJOUzhjTTNnSHlHQmZBMGZZS0ti?=
 =?utf-8?B?NVNmNHJ1MysvYlFnaUVFZmxac0xHTjRURzI1YUQwenpSNWI5TWM4c3JZb09p?=
 =?utf-8?B?K2gwTnRVNzFRVktZbTc3SEw2MCt4Y3lXNUpVK3VjbFY1N01kQk1vOW14dmlk?=
 =?utf-8?B?alFoRC9DS2xCa21INHpNRWxhRkxIVlAwSFNnM01aZWxZMUVSY3k5U00zdnN5?=
 =?utf-8?B?Vi9tdHF4MW9rdE9wVTZlL1dkL1hUMGtmVnhyRWlTcyttUHQwK09qUTVadVJn?=
 =?utf-8?B?VjkyUnpwYzEraDU2cjZlUzFUOTJsTDcwbmQ4MklXSWNxNXlsOEFGOXBWSmcv?=
 =?utf-8?B?bTNaTnVxeXd0R3BLV2ZGZnIrWnpaM21mMDBJTzgyWENZR24xQTNGOUNNRGxy?=
 =?utf-8?Q?hPKaKsD3Eh58i9zYog8kGsabRVSsUFA3?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ea105b1-3af4-4c05-a0aa-08dee99994a5
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 15:38:17.0447
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB11017

On Fri, 2026-07-24 at 12:12 +0000, sashiko-bot@kernel.org wrote:

> New issues:
> - [High] st1202_blink_set() forcibly zeroes out the active PWM pattern
> slots for all other LEDs, unintentionally destroying the state of
> independently configured steady-ON LEDs.

This is an inherent hardware constraint. The LED1202 uses a single
global pattern sequencer with shared timing registers, making it
impossible for two channels to run independent blink configurations
simultaneously. When blink_set() is called, the shared timing is
reconfigured for the requested delays and other channels' PWM slots are
set to LED_OFF so they remain dark rather than outputting unintended
values. This behaviour is described in the commit message.

> - [Medium] st1202_blink_set() ignores the LED's configured brightness
> and forces the hardware current limit to maximum (U8_MAX).

led_cdev->blink_brightness is set inside led_set_software_blink(), which
is the fallback path taken when blink_set() is absent or returns non-
zero. Since st1202_blink_set() returns 0 on success,
led_set_software_blink() is never reached and blink_brightness is not
updated by the core before our callback is invoked. Using it would risk
reading 0 or a stale value from a previous software blink, causing the
LED to blink invisibly. U8_MAX is intentional.

> Pre-existing issues:
> - [High] The driver assigns a sleeping function
> (st1202_brightness_set) to the non-blocking led_cdev.brightness_set
> callback, leading to kernel panics when called from atomic context.

This is a pre-existing issue outside the scope of this patch and will be
addressed in a follow-up submission.

--
Manuel Fombuena
