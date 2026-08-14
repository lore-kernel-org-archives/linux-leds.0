Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazolkn19013081.outbound.protection.outlook.com [52.103.33.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B213C1D6F
	for <linux-leds@vger.kernel.org>; Fri, 14 Aug 2026 09:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.33.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786701416; cv=fail; b=qOjXdYSH4q4z4I1joIYxqhlgxGJGrkseMmUC6JmU/Ary62Fn7L+dSotEQRviP3wFsn3HCbJLqx6oWoJ1PHNERvIcirIeOVTPWHB3aws9E1sVCIUbavFuOGzeARgA3Ko++i4nQAIte1RRNOysMXCAbc2voeExB5rHvKnwCYg4sDg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786701416; c=relaxed/simple;
	bh=PdN1ISuRwpexwrsVf9YMgl1HG938Q7mY2xVbe7WChzE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KOO55wmD1sFFSXVTDbwUKcsWjlEtUTNdKKfk1HJHS+/fW0rmFoV24mycybW6oafPfL89aWN21aX62NVzRUWb6zkLnDteyh59NZ97PBvQYm1iyr8wKvzkOokLM+s1aKOmi9BBPVv/RZjQgl+OKCMemvgiysqlKz3ppa+lfl5uCR0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=F37cU1g/; arc=fail smtp.client-ip=52.103.33.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="F37cU1g/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZVtd6+itURsnE2SujpNATqz7xHkFCT6OnB1LDcsWQUbpEx3FjZAJE6+kK+meV69T+LX5cohCLoRocUnIHNEuo3PprU21igppv1HEZQk3HnZgTPla83r2m+pWXNz3Vo1mZGYAmnT9ND7EZIxm5fMv4kDBabj5yXiY97zu2TXx3S5ega35q8yRgnPmPgmOQqKg3UTqHe2+3VRWSgozizgwSgKnc4I45QTPCsWw1C73l9JVv4OFxK79JHUgDIUgWjBALAC0YpkEpoMqN4e07VClgmR2piWlVX7v8QfF63r9qPGDjil5CV1V7LBPlqSgTRFnO0VV88j2bGnZrAQQub+0YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PdN1ISuRwpexwrsVf9YMgl1HG938Q7mY2xVbe7WChzE=;
 b=VBzDrYhwT8/qj8rhqsUHvNryaJQuFVPg6bWPyZEAA+3Ud3y/GqPsfbcbHBzHeKTPFqNBdbBG4Wbk1sjwTTmkiOnrGdfNGUXpzHceCsW3jxO514HdwdzrQadrQ6sOwEMyhswmy7vMdKncW4crjprSG1HL2U2eSrA1jkwclt5G8u5eVOCWV87VWn6pZ0wKyp9jJk0XgEM4q/FxK/IBzGFdDYBUIZdQmQh1L8cWe5Lee4YbVYLqkqUA2evm5Pv9vuEUOHrmQahwekZyYbmHGtomCq9mfCgxkpO8d9jTNYUHxuS/ceVouUj7JyZhpmN9UPo09WfDyjrWoHj5VmnlV4GkIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PdN1ISuRwpexwrsVf9YMgl1HG938Q7mY2xVbe7WChzE=;
 b=F37cU1g/Fdj8u3F1SwvyRPxwTK0TRPl7SojiIM3DxkB2G0SZ+QjvcHfVegZxgUwLQpTZO5enxulquKw7wNahmMhMjB8bP0bFEIhkHKmyxRjVUu0YmHgo3ylrAqzpQBoZkhAn98WEa4tCxsoK6xlG6RuNJjL5zJ9X3JPYMg57qn45SLJJpboKdGz5NtNe03uyQfKozG8TUiXbeS7uNNI6DJuW10cdeNMy+f9ICQ9ucRo4ahE+Mym3AzAJBuDI3szhDbFuPx4ysf6hcbDcjXRm2GL2aj3eJ0JrkZdTaFaz2n/AYKJWnVpo4nY7M/EBrYl2gmNl2xeGS09eyaYNUpciwg==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by DU0PR08MB9774.eurprd08.prod.outlook.com (2603:10a6:10:445::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Fri, 14 Aug
 2026 09:56:46 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 09:56:45 +0000
Message-ID:
 <GV1PR08MB8497E81BDE07F9EA0D581DC5C5DA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
Subject: Re: [PATCH v7 1/1] leds: st1202: Add hardware-accelerated blink
 support
From: Manuel Fombuena <fombuena@outlook.com>
To: sashiko-reviews@lists.linux.dev
Cc: lee@kernel.org, linux-leds@vger.kernel.org
Date: Fri, 14 Aug 2026 10:56:44 +0100
In-Reply-To: <20260814093000.9E4191F00A3D@smtp.kernel.org>
References:
 <GV1PR08MB84974C7ACD911E66864C5008C5DA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
	 <GV1PR08MB84973F79E871176EB387C377C5DA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
	 <20260814093000.9E4191F00A3D@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44app2) 
X-ClientProxiedBy: LO6P123CA0008.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:338::16) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <ddc0f40c84b028b810c7244ef13fba52aa0d02a8.camel@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|DU0PR08MB9774:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d649aa8-ab55-47f8-3b17-08def9ea59a5
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|24021099003|5072599009|8060799015|19110799012|51005399006|15080799012|6090799003|12121999013|37011999003|23021999003|25010399006|40105399003|2607281247196008|440099028|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QXhWeWtZOG1DRnZLV1lxZnR4NmpaZTZSa2dQU3l3bHpRTG9HaHA3cXF6cE5t?=
 =?utf-8?B?VnBlV3E0cWloVXZEWjhJcGovbk00OWJ1djk3cVVVL3pDK1dEV2J4dzlXVkx2?=
 =?utf-8?B?RDd1R1FWR2NiU1VlZW12M3NIUHR0a1IvMGZrc2t4RFplbVlQSkRDai9IYWF1?=
 =?utf-8?B?YUEwSk9JcnZUaGR3MWlUSGE0R1NTV0VYT0lLSnNFZW4ycEpIZUhkTjduclBU?=
 =?utf-8?B?c24xbWxhVEFpNjRUa3g5Sk9WZnlyRDkySkpvVWNQMWx1bFd0UDhTWmtqWnRC?=
 =?utf-8?B?dUZFQjZocDhSQnlEbEFBcE1vbFMyRThUK3YxcDdwc3ZJWWxXeENMeS9oYk5z?=
 =?utf-8?B?SDViT21tblk3ZVBHWVBxc1FHdlU0OWRlNWd6NTQ0L1JibTRSb2RtNlM3bXJl?=
 =?utf-8?B?ZVZ4ZmF3VnRaYS8zQjhtTm9nbGRlQVpxMVAzNzdUaGhsWUtUN0Njdmo5b2N0?=
 =?utf-8?B?UWVPVkxGMzk2OTNlNFlGcE9qZURnZnY3Qm5RbW8yd3JHTmFjUDlHWEw1c2NU?=
 =?utf-8?B?Mk5uNkRUZ3pZV2hRSkMyL0oxNzYza0l2UU1jRUswbDdTSHN5YVRXYUZUcWIw?=
 =?utf-8?B?cTMvOWNMa3RPYVNFdy9QMmpHRmVEeC9qUUFNYTYzUjlIbkxKK3dQeHMvTldz?=
 =?utf-8?B?MnFjdUc4czJDeGUwbjZZMUNhMkc0c3doWEViRmpSKzVMUDY4WlJGVUErOWVX?=
 =?utf-8?B?clp1amVHVzliQzZsejhIN0pUZlU1N1BQdkxJRysyQmk3S2M3L2thTG1KQk13?=
 =?utf-8?B?Tngzc1RsL1kzWFBKUWFQZFh3SCt5RHkxeUtIVHVBV2Eyc29MOG9Eb0VRUnpG?=
 =?utf-8?B?ZEtzbW9SKzFVUWVKS1p6aGRpTDlad3IzWFY3RXA1cFBCcTlKS1RaL2VXZjMy?=
 =?utf-8?B?a0dXL1phU3hLU2oreGsxanJLNVVGTEtiNzlzd3NXbXFCUXdwQi8wR2pBNEpw?=
 =?utf-8?B?QmdEVzhYb1lVc3FnaGg1U3ZJUWFzaG5wOHV3U01aWjVGbGlBV1Iwa3htdzNY?=
 =?utf-8?B?b0xmQUNVVURDSmJIa3VOUnpPT3ROQ2xpLzhUZWEzd3NqZ1I3QXgzb3dXVld1?=
 =?utf-8?B?UXhUVm1KTDRqMWlOZUd2WXo5NTdVd0NncGwrcHFGczBpU1grSXNGWWpiVHBU?=
 =?utf-8?B?VXpYSVFzV0tVZjNqMVA5bkVkcTAwTTgxdTZkeEFQbzZyKzUrMUVKWlI3VDN4?=
 =?utf-8?B?TjNkdXZkdzlpdURHNWFOVWwvWDZxbkRaNWdQZU1tS1BZTVlRU2Qvc25rLzlu?=
 =?utf-8?B?VTVHUDZnT1VhVWM2My9pSnZvVHlZS0VSU0FucnJZR3FUcFZaUFJTOEFQU2NR?=
 =?utf-8?B?QzdtN1hDWEh4ZGFpenlwcmdhTlpCNmdUUFJuR0JldkFQZWo1ZmpOMGVJRDk0?=
 =?utf-8?Q?nKUy7qAmDpb07vXf81oej52nKBrEIUhQ=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UUM0bzZGb1Fmd0Uyc0F5OFFVbFhhN214dHIwd1UwdTlraEEya0JuaUhSZXBx?=
 =?utf-8?B?VFh1eUJsYzhPYUNKK3k1WWZNQ0tQTEh6OU5JSC9SMUR0dzhqQ3M4SFVVOVF3?=
 =?utf-8?B?eExzVUJpb2VvcENTSllMQVRkVGhrLzJPdnNFelF4QzM0TFhxMktLN1JQS0Ez?=
 =?utf-8?B?YVhIMCt0MDdmS2I3SlZtTjFxekYxSktOalg2S2RUcHF1SzJKSXdLUlpNZTBR?=
 =?utf-8?B?NTVDdkJjekR4RkI5V2Jpc1V6SC9pQTRGMGdrUXNqaFAwNTFhV1FCZ2hxeEhy?=
 =?utf-8?B?bW5KT1o1MjEwUis4SGF4MFNKelYwYUpUMGxBeFRmcjFrSUJsSVVxVHF5MHlv?=
 =?utf-8?B?RmsyU05xczVXbHc4eGRRcDJZM3JqRG1VOFFoK1IxdmZKMU92eUxmemJzRWZz?=
 =?utf-8?B?TUd5T3cyT0FmaHY3TkNYdUxYZG5YS3dlamRjYzBSKys2ejduQWh4STlBSHpy?=
 =?utf-8?B?VXVlZ0U0MXltTEV3bU5WVVU2UWdhZUxLS2dzb2l5dmkrVGlJaVdyNGt5alNs?=
 =?utf-8?B?dXU2elFOOFl5U1IzNy9Cb2tZYmNadElLV3NxNm15cEdtKzhOQ1RlRG1DUDI0?=
 =?utf-8?B?YUxEQWFSNjJqTlliMFdCN3NSd3FLSUJmNXpVNlZ3VFRXT1dqWUdTYUZpNzg5?=
 =?utf-8?B?SnZxRkFjNndlNVZBK1pYNlZSWC9SbkJHUllZWkFTVklwNVExMTB0aituMGU4?=
 =?utf-8?B?cVJYRGo3QlJwMHpWUnFVeVVMN0g0aXNmeTUyZy9ZR3JoZDJHY0JIbVZlVjRN?=
 =?utf-8?B?M05scHdEeDNYbEE1Q2N1VHNDbkV0VlhrdHR6djlEQ09mRm8rMnJvd0NERUhS?=
 =?utf-8?B?aVQxdGVPajMrOFlRME8rSHR3c1NjR3I3VTNuZlptYUtnRG5nZHNVM2tpc3U4?=
 =?utf-8?B?VXVPRTRCaTlBNEJxN0JsYU5RRFREeEt5VUc1ZWl4R3M3dmcxTGloUjM0L3NT?=
 =?utf-8?B?N2pyamlKcytYWXU5dCsyQ0l6MG5YSS9xa1YvN1hPMzdpT2hra3NKeFVwR3N0?=
 =?utf-8?B?OUF4SEd5dUhoRHdpbGUweUxPNVU0Rmw2bWx3MW5LcFZkU3huRlNETnl4UEhl?=
 =?utf-8?B?QlNUb3d3M25xUVVoT3VBWU5jZzNMUzFGYThkdGwvMGhyU3dnRzV0QWlWM2Jv?=
 =?utf-8?B?elF3N2tnbEFDdW9JS2I4am1PVzNwdzk0b25qenlwb1UxazZYdVZYVnhKeWRU?=
 =?utf-8?B?WkIyQ2haR21mMFRBUXJEN1ZrdE96Tjh6ZXhNQnhIN20yUFFTd21yc2R2Mjd0?=
 =?utf-8?B?VW1tWXo1ci9sWjYwZ2pJRjBEUm5LMnpKbW94V25HMFpDSm16S21qcytOaVF2?=
 =?utf-8?B?MW0wM1Z1ajJiNXhnZXArcEtaSGF5U05QemtsUkloRER3VEd2QTd5R3BaeXFi?=
 =?utf-8?B?WHVqekNUbXZMdnB1QWVwVmFhQ29QRDlrUzUvSHZEelV1KzZjQVFObGxuT3VX?=
 =?utf-8?B?K1pFV0FramcvVkdmSzd4S1Uyc0RPUlpyUGZaREpwWUJ3b25oOXFaL3p6Y3lD?=
 =?utf-8?B?ODgrR094QUFZbVhtM1YyNngwUWNudlFrSFF1U0lzMEJLRTExZW5ibmowK2hJ?=
 =?utf-8?B?U0lsUm9nM1BIaXVSQUFHMjdzZjJVSStMVGJnNnptejluOFJwTnllTk1yYm9C?=
 =?utf-8?B?Y1pQZEE3K1dEcG9oamc2ZUtTZTQwbGp4YXlZTi9CQ2ttU3RPbkJ4bmY3L3ZD?=
 =?utf-8?B?VVVEUExoYkxBbVZVSEJWaWV4MUhKTnhKWjdLZzlTekhhRzZvZ05IVzdzamx3?=
 =?utf-8?B?cVZpTUNNbG16eW1LRlZPaFBabXJnWEcrdWF2WFJGSmEwb3h5RkJscWFWTWhO?=
 =?utf-8?B?elRsQ3BSQmEvVnpBMVpQTVdjZjBNTEI5bmNBSER0Q1F6ejVJOFI1Ky9nc1F2?=
 =?utf-8?B?WTROMVo5WVlveVRlTlUrRndjL1dPb2JQaFN2cmdyZFZPdFBKUjd5akxCZHZx?=
 =?utf-8?Q?wpSOXFRZG/ePhlcJ3Ok5dKmJSMAWmhp3?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d649aa8-ab55-47f8-3b17-08def9ea59a5
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 09:56:45.8537
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9774

On Fri, 2026-08-14 at 09:30 +0000, sashiko-bot@kernel.org wrote:
>=20
> New issues:
> - [High] st1202_blink_set alters the hardware state of sibling LED
> channels by zeroing out their PWM configurations, permanently turning
> off solid-ON LEDs and desynchronizing their physical state from the
> LED subsystem.

The zero-delay handling is not a bug. Converting a zero delay
to a default value is the established convention for blink_set()
implementations across the LED subsystem. The timer trigger does not
use zero delays to signal steady-on or steady-off states; those are
achieved through different triggers or by setting brightness directly.
The if-statement form used here was introduced in v6 at the maintainer's
request precisely because it matches how other blink_set callbacks in
the kernel handle this case.

> - [High] Hardware blink implementation incorrectly intercepts 0-delay
> values, breaking timer trigger off/on states.

This is an inherent hardware constraint. The LED1202 uses a single
global pattern sequencer with shared timing registers, making it
impossible for two channels to run independent blink configurations
simultaneously. When blink_set() is called, the shared timing is
reconfigured for the requested delays and other channels' PWM slots are
set to LED_OFF so they remain dark rather than outputting unintended
values. This behaviour is described in the commit message.

> - [Medium] st1202_blink_set hardcodes maximum brightness, completely
> ignoring the user's requested blink brightness.

led_cdev->blink_brightness is set inside led_set_software_blink(), which
is the fallback path taken when blink_set() is absent or returns non-
zero. Since st1202_blink_set() returns 0 on success,
led_set_software_blink() is never reached and blink_brightness is not
updated by the core before our callback is invoked. Using it would risk
reading 0 or a stale value from a previous software blink, causing the
LED to blink invisibly. U8_MAX is intentional.


--=20
Manuel Fombuena
