Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazolkn19013078.outbound.protection.outlook.com [52.103.51.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF09F47DF9C;
	Thu,  6 Aug 2026 15:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.51.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786031180; cv=fail; b=iYory3lIMwNzSFotWANmPaPAEmEH0c2Kre6PuKCbqIQuBQ73hgq/lgx5OSw52CS8dWtN00fmSx9AXFl2Xc/HLliQ0PmoaQmnDNYKRxXWzwFGQalQ+jkBg1b1z1MNjY6QUslmlHPqRb5f8APobAvOJIkYyejb2raCQXwqTTY3q7g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786031180; c=relaxed/simple;
	bh=R9poVaBcyhWJVrQdbrD3v7Rnjgy3Co40ZoA/42NX9us=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=khzNHUhkTQShkeFk4f6AsBPeU593xDC7tIKyzcsChaQGMCyqoPQFjRrXaGSd1/cDZ7m7qM7XY6AdpfVWHheVXs8eOE1yqREACPuEHdou7gJXOml55KFBXQ+UBvqFhFnPXSFsEfjKS+BfDHD8s9B+sx5080bLaOe54KJjWPALHLQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=o2KOVFPY; arc=fail smtp.client-ip=52.103.51.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="o2KOVFPY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d5yoVhcIsvRlAOPrX0mhbsHn31zc68nMckaVMb0Hmpjccoo8E405s/zHxc5tee+RUtC+7wL9MsPvgdk/4XtiVaFXuOXmo0YLgGLjLotpKGVFIAaKRYPsChZJzbSy+Ey3OpdGsIzOyEpjeWBfvINtFZMUBOcU0SajuFC4jujnSlVl5Mq4QdjqaFax6p4nc3SzgSWU89E5xRDctknG4BflphncfPH+8NYfnoAAdToK9t//VtI3CfBTjAHhGqUYkcdOd1lUsh3qineebSWlVnhxrxKoyNLoGfW22/VSC3CjvrnxiBKKICoKcks2jSEubvIeO4I6UdlXJZBzm3z63buCmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gmU3O8SuIZowwben1A39gGZvfCPTefzRr1KNg4KTXgI=;
 b=XK0Zci+Lg7OPxuyr3bF0u2wN/hzRPCk43XII8xdw4WpDDJZqdw0W7uNpJox88crK83qvBO/tYdg52ihoHPg6xR5rw5hFLZtrAmVBC3TW/ZKcgfQErnZkD3IVnklsQPuJYUwfrH6QIbjNAqYAl4S2UcPTYEScNB/9BMasFsL8i+KRjUERlXzBAJfKFb67HV54FNexKl8pwukaW+ysnKn3En1+J8qu5Sn+4rMarHkQd5jF/Eg8aSgOaArbp1LbyGrRbHiVHLeTnDmGRKfoFl7ieDVRkvTAM77B0Vesare7UgRCSRanPgef/W9ydeL3NQuRgmlISq58m8mND/PAPCYkEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gmU3O8SuIZowwben1A39gGZvfCPTefzRr1KNg4KTXgI=;
 b=o2KOVFPYdeC8vZ2tWCcDmpJRPMrhx/caY4f3aqxUJLoT58810bOIB7mCFfbtPpPUS6Jv6crg6Mavm4oIc1WKzr4zgUYXMoVUQ9lkjn+gYqqNJ4MHZcXJdTiNEYyL50YULS2Gm4Ar999jh6jaGE5ByfYEN7TrNXk+xDbnADe1CojNhsoNaYafwZG+jLTzOZOsDOkK3/Ts82fsZPKD2CIx9bPhECVSFscezkWit+ifYTDRmvpQ6sBYv3/oRF8n4qumDzkpx9EcP4qbPakGN4Qd+kYS9H40A8ERkdrBvmp6e4frxNin5JJHhhdlIaWofiKfnNuif+KdBJKwzTeixANjOA==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by AS8PR08MB9837.eurprd08.prod.outlook.com (2603:10a6:20b:616::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.20; Thu, 6 Aug
 2026 15:46:16 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0292.019; Thu, 6 Aug 2026
 15:46:15 +0000
Message-ID:
 <GV1PR08MB84979E2A4384EAC5898A9656C5D22@GV1PR08MB8497.eurprd08.prod.outlook.com>
Subject: Re: [PATCH v3 1/1] leds: st1202: Add hardware-accelerated blink
 support
From: Manuel Fombuena <fombuena@outlook.com>
To: Lee Jones <lee@kernel.org>
Cc: pavel@kernel.org, vicentiu.galanopulo@remote-tech.co.uk, 
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 06 Aug 2026 16:46:13 +0100
In-Reply-To: <20260806134533.GG2869284@google.com>
References:
 <GV1PR08MB84979E014A407174EBAE9875C5CF2@GV1PR08MB8497.eurprd08.prod.outlook.com>
	 <GV1PR08MB8497508C31C9EFF23E85073CC5CF2@GV1PR08MB8497.eurprd08.prod.outlook.com>
	 <20260806134533.GG2869284@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44app2) 
X-ClientProxiedBy: LO4P123CA0686.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:37b::18) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <3f6ebbc676c7207a312ab1801a482f741f72f129.camel@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|AS8PR08MB9837:EE_
X-MS-Office365-Filtering-Correlation-Id: c1e953b3-f2aa-4879-385e-08def3d1d95c
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799012|51005399006|8060799015|19110799012|37011999003|23021999003|24021099003|6090799003|25010399006|5072599009|40105399003|2607281247196008|440099028|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U1JBdFNJaEJQQXFjM0tRQjZoaEx1S050RnBYQmpxRkN5NXY3YlM0WkpVVDhu?=
 =?utf-8?B?dHQxL0dvdFE5dTFta0ZTTEU2b3YwV0UwbGdGMkErM2QwZ2tCdXFTK2o3L24y?=
 =?utf-8?B?ZFZDM1R4THV3K3RHbDByWmpWRG5oSlV5NXBrK1BuQWpOWnNjNVNNdERQemZU?=
 =?utf-8?B?WFE3Y3ZEUXBGanJHb3V4MDU5TVM2SmhRTEZyc0w2aUdtUVR1T3VYZitxVU1W?=
 =?utf-8?B?c3k2V2FjTXFDMjE0emNhNVh0L1pwbmFzVEV3Rk1tRkdzb3JDbVFKZGJCVGdQ?=
 =?utf-8?B?b01CRWZpc0pxVjNHb2pJbWM2aXZOVGlXc1RIOFQydTFHYUg0NGw4aXpKYXly?=
 =?utf-8?B?RmpRenhjYVhTQjFwZk01aTVTejUrNUw3UDE1d0p2V1VvdXFHbkpkN2NRVGdu?=
 =?utf-8?B?Tzc1cmdQS2ovcnZ5UFFVdHpNTjk5VW9MVm11ckdnV1poV21lTG9xRW5iNFpo?=
 =?utf-8?B?YmxIQmpKZnYyWCt2T3pQRXZhcmMxSFh4eVNxcjRLdkFtam1TenVrZVNwOS9o?=
 =?utf-8?B?QjdJcFI4bzFLbkxVYXRUeGJKRzlKZ3c0RHllNUdlcThCbmliSXErNlJMdVNJ?=
 =?utf-8?B?TkpBbmZqRVBxMU9xVTJmY3B3SlI0L3JQNGJlK3lYdVNhejhZZUtxMXJkTlJG?=
 =?utf-8?B?ZGF4cFVQUFZpVXhJTG9vUmg1QjJSajk3SHpVSUFRK285cEl0ejIwd0EzWDhz?=
 =?utf-8?B?a0NlRXZoUGhhcUNFZklvTVgvM0xSa1JNZHZYMGZKVVpzamJBZ0VENFFTbkNt?=
 =?utf-8?B?ZGFDOFduTE5JdmZtakprOC9ncDZiVkdGaTd1SGZ4U2lmSHpQOXhWZW12YXJy?=
 =?utf-8?B?TWhwbURsWDZFc1VqV2Vic2V5MUVsbTdNeGU2Z3FVeXQ3TGF3c1ZvN0l6YXk3?=
 =?utf-8?B?Z1h5SWYzMGhJcjhpVGt6UnUxRzY1eEVXMEdiclZ0bkJ1VnNlN1laK3k5R2h2?=
 =?utf-8?B?aWtsZ3hXWTNOKzd0Smw5RnV0UkRzaHVDQld2Q085dStHOWVuUE92blVocklz?=
 =?utf-8?B?Y1M4TXFsemRaaVk2WVhaYWNnZGFtbSs5SHMxd0xTRUtlei9pRGpkd3o5cWw1?=
 =?utf-8?B?VXpsOGZnSGZ5b1I1SERmUjhETGRzNFl6TXVQd2hRZUpyQ1I4cUErSWo4b3Y1?=
 =?utf-8?B?K1dkZEtneUUwUkRYem1GRTMySGY5bEVJaG0xS1QzOU9XS2MxYmZKaEZqVUpO?=
 =?utf-8?B?MW0vNG9Jek0rcGJCRmZhNnBGdW1OSWltdHZZRXg0VkEwTVpCNUdjUUFuK1g1?=
 =?utf-8?B?Uk5VMys5WE1XQXcybWoram9Rb2E5MWRmRUpQcDAzZWVIN3FITnkrUkxyRGVh?=
 =?utf-8?Q?K91AxbwnwC7+Yh1lLsa1va/BFZj9+y0Oen?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c0Y2QUhTVFFzcGh5UjIxdS9ldTdKZFlWQmo5ZTdPVTRKSm5jOXpiVHJYWG80?=
 =?utf-8?B?bmN2eE9YRmdYNk5xalg3cVVHK0NZUnRnZWhvTHhMRjZ4bXRmSVoxY0l4b0I0?=
 =?utf-8?B?WjZkSTZXOWdWOHpNaVc3MTdvRkZ3a3NjOW9zMWViaUZqV0F4MDI2RUNoYzJr?=
 =?utf-8?B?dTJTTUI5T1RkaVFwamZEZ3MxM3Z4KzBmZ0NZWHQvczBESGZUMStDOW9XTE9U?=
 =?utf-8?B?MlNOR0hWc2l1S1FmUEhoOUxxSDVoZU1HQzc1ZkM3bjdDZzVBcms0ZjdSMWNn?=
 =?utf-8?B?dEJjdHpQN3h2OTZ0TXlyZU02V1FrSHNYVHRUYm9UVS90UzFoM0xyckxaT2d5?=
 =?utf-8?B?bmtQNThBOWhhVHZMKzVTeDRGWXhHcVB1bHRVa1JLOTUyZjlicVNqTzJSY0o4?=
 =?utf-8?B?Rm1TdWFUdGRCNnZkQXg5VTFpL2lrRVpYMnFsS0YvVTIrdWczQ1E3bHMrcWVE?=
 =?utf-8?B?MHgxcFlFanJkWkNNc09aSEtpRlpBNURsS2R4cXJRdU90R1hwaVhGVlRpZjAx?=
 =?utf-8?B?dVEvQlQvWEdtcnBSMnA1eUJUSnlzVnI2RnFLVkhrQzJpMEpqWVp4WWZOcjJ0?=
 =?utf-8?B?NEVjZC92SDRRTWNieE1teUVxV0VrZ3M0SFE1NC9QV25leHlmTTE5bWd2RTdE?=
 =?utf-8?B?eGFURDdSdHV2bmtQSzZIVkg0UEdGOG1HaUh0VkhPOVNzVW9ubmY0aW9vRWF2?=
 =?utf-8?B?dldKMlRYNHJkREpZMlVZdHlBME1JZmVyUStGZFZiSHlrckFmemprODZCTjdP?=
 =?utf-8?B?V1VnemFsalZwdDg0MW1za1o1U0pNUEZVaVBvbUdrcU94cVIwQ2J2b3RvMk5Z?=
 =?utf-8?B?bk12ZXp6YnZzajIvc1ZyYldVSm1hNWo2ZXJPRDZSM1dYNVpDL3I5Zm1ENnda?=
 =?utf-8?B?RlN2OEZoNEg1RVJEc2EzY3A2M0FyVXpTZjdRM3BmdkNKbEdETEx0MU5GQjNO?=
 =?utf-8?B?YmhyUUFoT1FMSXRYRlRtUnk0cnovd2x2WDZJVmFzR2RXQ1N6dmtRamtUcXJL?=
 =?utf-8?B?VFY5UXoyRGJlTEhhKzcyaW1sU2ZLcVFrb002dXB1Q0Z0TTNWMVJpRDU5NjNC?=
 =?utf-8?B?TkZROFhYNkNVUFkvRFpWMWcwTE9yOEJkNjVVU2lGY2NLTEFmTTlISVJOeXFM?=
 =?utf-8?B?RTVXZVA1ajhSZDE4VU9yZ3R6ekpuRTNpZEQ2QjlRczJrZGxNSnhtcDhXbTZ6?=
 =?utf-8?B?eDBURUkwSEZLNzZuQkppb2VqeDZaN3lTUEoxeHRtRE9CSTR3Zi9FaWtJSmg3?=
 =?utf-8?B?OStPa3p3UU1Ua1lVQW41Mk1UMDdDcFJhYTBndlNWZmF2WmRMYUdXejBidnlY?=
 =?utf-8?B?eldKTUhYRFpTTURkcXA2WERGeDNWUlVxRlY5Z2Rxd3IyVzBIQWIzT29XQVBM?=
 =?utf-8?B?Q1JXSCs1YTdJMmVwMmFYQ2xkczcrUEI1dEh1TkdHck56UEc3MGVvQ3hNaVV3?=
 =?utf-8?B?WVNCd1NzYU5VM25jYTZkQnZmZm5HamZQVWpCN0NLOUE0K0lYY0tnN0pISTBn?=
 =?utf-8?B?WW94NXdodzliQ01MdzRhSVU2WmRtT2ZPcjg3Ky9lcFBOYUNCL2QyVlNnN0gw?=
 =?utf-8?B?d3RhWmNZREFMblFjNUw2RS9US0QxTFlQTTZGTFltV1ZyUkIrMGEvaE9wRWxn?=
 =?utf-8?B?OFArSUtadUEyVXBEeW1PZXpYYU8yUDhKR0QrTlVzUVFaVEJoZ0lxNUduc1d3?=
 =?utf-8?B?d0lHVDJxT0wyQ2JGSXpYa3pFZDhwK1JWcXA5WVFJSEllQkZ1clQzOGt2RHRH?=
 =?utf-8?B?MGdhZ05rSHMraXNlTW4zNng4SEx2cmx6eEc3dHRYWmRWQ3Bwejc0UVI0Q1h5?=
 =?utf-8?B?WXlrV0N2cUVON3NWa3o2OTVrY2t5bHR6aTlhdC9VWTZNVGdBbFcwU2FDejN0?=
 =?utf-8?B?a3JnaWFaL0hHVWg0OEdMRDNYWDF6djdROGZtREdyR0ZhaXJHVGpMZE42ajRk?=
 =?utf-8?Q?h6ybYdlqpU+0aO2RI8pxUj7w2BtVOQJM?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1e953b3-f2aa-4879-385e-08def3d1d95c
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 15:46:15.8860
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9837

On Thu, 2026-08-06 at 14:45 +0100, Lee Jones wrote:
> On Fri, 24 Jul 2026, Manuel Fombuena wrote:
>
> > +	on =3D *delay_on ?: ST1202_BLINK_DEFAULT_DELAY;
> > +	off =3D *delay_off ?: ST1202_BLINK_DEFAULT_DELAY;
>
> Could we simplify this by initialising '*delay_on' and '*delay_off'
> first using standard 'if' statements, as is common in other
> 'blink_set' implementations?

Fixed in v6 using standard if statements.

> > +	on =3D min_t(unsigned long, on, ST1202_MILLIS_PATTERN_DUR_MAX);
> > +	off =3D min_t(unsigned long, off, ST1202_MILLIS_PATTERN_DUR_MAX);
>
> Since 'on', 'off', and the maximum duration are all of type
> 'unsigned long', should we use the simpler 'min()' macro here
> instead of 'min_t()'?

No longer applicable. v4 restructured the clamping and rounding,
removing min_t() entirely. v5 and v6 use clamp_val() before roundup().

> > +	on =3D clamp_val(on, ST1202_MILLIS_PATTERN_DUR_MIN,
ST1202_MILLIS_PATTERN_DUR_MAX);
> > +	off =3D clamp_val(off, ST1202_MILLIS_PATTERN_DUR_MIN,
ST1202_MILLIS_PATTERN_DUR_MAX);
>
> Is the second 'clamp_val()' call redundant here?

Correct, and it was removed in v4 for the same reason. ST1202_MILLIS_
PATTERN_DUR_MAX is an exact multiple of ST1202_MILLIS_PATTERN_DUR_MIN,
so roundup() on a clamped value cannot exceed the maximum.

> > +	ret =3D st1202_write_reg(chip, ST1202_PATTERN_DUR,
> > +				st1202_prescalar_to_miliseconds(on));
>
> We know that neither of these words are spelt correctly, right?

Yes. Both are pre-existing in the driver and tracked for a follow-up
submission. In v5 and v6 the misspelled name no longer appears directly
in the new code. The calls go through st1202_duration_pattern_write().

> > +	for (int patt =3D 2; patt < ST1202_MAX_PATTERNS; patt++) {
>
> pattern

Fixed in v6.

--
Manuel Fombuena
