Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazolkn19010017.outbound.protection.outlook.com [52.103.32.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070EA3AE6FD
	for <linux-leds@vger.kernel.org>; Tue, 15 Sep 2026 12:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.32.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789473642; cv=fail; b=EpETgmShatgPCWMoA+VTKG9CqjrWalNQUVUDffsidBgJjHFb4BclUGZPN7/0qh/eSHAq1bp7ojjXE6CE0cjS0jTR4CEWi80gQ0IsCwBnAjToCwLFkPIUl3lKIi3gthKYhUCSdvD4ussC31FYEzlkLqxhdpav7ibZT6joBp4E9no=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789473642; c=relaxed/simple;
	bh=y4pM5Iklw4DH+P+vXRm3oLaV1uhibSAeSlFgRXdp4yE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=b3cvVBQzqXZW4prPwSQPqqUZ5FTMnzxXUwf/KQjyLp/oANSxtvYfYF/k8Om08WvR0X3qOmmFefLWbNJf/NGoaroJFmRQmMSpK3HpLFSjVqDHyj3nC2ftAt/4+UnZeILh3BrIw/zc+dTZjJqiIUDeaNmlQeWoI9uKlQNDcyor9Vc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=Juls1n46; arc=fail smtp.client-ip=52.103.32.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="Juls1n46"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=joG1Jmi0+VwyoY06iUUFRgMGHx4oyDiW7JKxV0Q+TlR4Ii6gQwGPKDNjkvs641LWbjOIDnZdW2QpIKndiaWc7EPoamprcZVFw6bcM8ZOT35dW2dLOfhz3C+PkGKIEszSyFMOjBOidizGkhpw3bbf8YZLftRqhHgE5h+AXKFvKxKMvvPyH4SePa2ZyXDdnFRSUySSVF9GqnsJTT3bh07NLILhfMBFAan2gHagUcO8cSNzKWhAYOgiiPc2wX8WTiPzYJpbeLeYykwr91PExEuiwdwUX+CjoZ0eUaFe3hLDBTSfD2FYr6eY2YZCQadH71s6tevHjw+LQLlkOgbkkFJJdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y4pM5Iklw4DH+P+vXRm3oLaV1uhibSAeSlFgRXdp4yE=;
 b=at3/9kLKFnJDovBjjLemHDMHsPpzCGYTNN+CCJDNUfDbXWJqC96Ry73x93v3TDCF2fck30UwJXsYYEsq8DuhxC1vNQPMCHY2r1btpI9wPAWU3wkDqflnAM6kbcj7m9atrw6GFJSRtSjlf4ky81MVFXIMt4cWxjNW90p8suW2+NXrzJlu/dsVxKPlPa1/kMtV1LO23wGJadbhvTrvqVWUsXz6INKOt/51s/1Hn5lrkOIlVfkoN0DBTgcM+UpAuYN0CNfEeigQ5GgRXpBdD89ptb2Fqv8eVJUainURRzQriAL8PWIsD2SfAA4sf3ktz1HnAGysoQn8qEeqj7S3HOlC4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y4pM5Iklw4DH+P+vXRm3oLaV1uhibSAeSlFgRXdp4yE=;
 b=Juls1n469tWtTLp0HnJKUFTYTPyE173RP7EHBID4YHbzYLIaNYu7Dhl58fq1x6/h2TnUVIqHfFe5w5UviUubWJdPFvO6kMF/tivGOQ44XoL2w0a6CqmVpaRwtkXzmMwCsswpGZief6RzgGOmFVnIEUpCHFWM6b7GgU9mIcZqeeX3YnxQMH3A8IwehLejJDrbwO0fVyc/TRi2N9A5fiLEwycWMXluDP9vRV+UqRDKfedInBtxwRhslNB1FCLBLgV2Qkrf/MG4+HjfnUbvwH0udUqjNv7hIzulsusg7yWho5jfLdVl/Qw0tfpMLfB4pXC0MFjwCGuC/UfoSp1kX4+cfw==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by DB8PR08MB5418.eurprd08.prod.outlook.com (2603:10a6:10:116::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.8; Tue, 15 Sep
 2026 12:00:38 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0428.004; Tue, 15 Sep 2026
 12:00:38 +0000
Message-ID:
 <GV1PR08MB8497930AD37B4B060E8E4E8FC5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
Subject: Re: [PATCH v1 11/11] leds: st1202: Honour max_brightness when
 blinking
From: Manuel Fombuena <fombuena@outlook.com>
To: sashiko-reviews@lists.linux.dev
Cc: lee@kernel.org, linux-leds@vger.kernel.org
Date: Tue, 15 Sep 2026 13:00:36 +0100
In-Reply-To: <20260912225557.5CE461F000FF@smtp.kernel.org>
References:
 <GV1PR08MB8497422B7A44424C4968AEC1C5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com>
	 <GV1PR08MB849736BD134900C02F674EBEC5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com>
	 <20260912225557.5CE461F000FF@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44app2) 
X-ClientProxiedBy: PR1P264CA0092.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:345::18) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <9ddfd1f3658fae62b105cdfa8ef3c67fa8f8fb53.camel@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|DB8PR08MB5418:EE_
X-MS-Office365-Filtering-Correlation-Id: 140551bf-91c5-4d02-50c6-08df1320f4e9
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|25010399006|51005399006|5072599009|24021099003|15080799012|19110799012|8060799015|6090799003|23021999003|37011999003|40105399003|2607281247196008|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Wm93MFVBQU9WOERyNTQ4QloycDZtMXg1RWg1NUw2amwzcmlaUEwvVzQ1L1Uw?=
 =?utf-8?B?QkJsTkRYcHdTVUlZSisrVk44VEVwdXRKeUZwL0tkQi9zSmVKZTY0a0lzbzJa?=
 =?utf-8?B?OW92bUtlL3ExQitFMDdNbWlNRzVETVVWUEpqMjR6Z20vSXFOT0s4eEx1SEt1?=
 =?utf-8?B?Ty9pWGRLeXRqemFiTTlXTEtnY2NrbjMxemE3VE43SEpmV1dvWW5zdmRRVjFt?=
 =?utf-8?B?L05uOFpKKzRaaWI0eDVOYXVoVVZmTlAxeldZMHZrSy9VZCtqRWtxdk5XTTdJ?=
 =?utf-8?B?amhCdnJ4cG9YcWowM2UwbkNMa29vWk1ncXorN2ZsQzFkSkZZUkgwRnpuTlZF?=
 =?utf-8?B?OW1yWWRESVd6SzBpTVJPSDlLcFBlVnc5ckQ5WGt1ZTZPbnpIYmE1eUsvNVpQ?=
 =?utf-8?B?UlBzRkp4MFVHcnVkVlZqTnc0dFFidmpSUk1FVHZwVHhEeVhIbjhtcnFNenFC?=
 =?utf-8?B?MHlwdW9CVTVjUmpGVU1WTCtnNUVCLzcxOGt6VU5SU3o1SWN5YVZNK1U2QmdV?=
 =?utf-8?B?WVVldE5uQm9oclBIWFcrRXNWTzQ4NUFDUFB1dFFQSlhObk1STXNkckIxYzBK?=
 =?utf-8?B?Vm9rcVhNVFRSb1FmbFp6ck50UGRmU3hlQU5ma3JVZGRIMnp3MDA1U0VsYVFx?=
 =?utf-8?B?Rk5XTjJ3aXhpclZ4SXVicGx4czRYL0xlZDJWZm4vSG4zNkRVZU5SaGZjSENW?=
 =?utf-8?B?aE1QMkRCT3hIdkhpaWxMcWdiQnBVRUNWUTZ0ZTA4dGhGT0ZmTW9JN3J5eGox?=
 =?utf-8?B?NVIwU0QzVElhVXptUWY1aHpKcWtGTENKKzNQMWxqOUtRaW4wUHkrcGplVmIr?=
 =?utf-8?B?MmUrOStNNitqYkRZT0dXbFNjc21GdzIyWGQydnE4WXNLUXovTnY0b0xhQ1Bn?=
 =?utf-8?B?N2kwNFBCS2l4bEZQUUNTVk5mSm5WdTd1RUM4VVZiVVR3Zmp0R09SVTZ5ekJM?=
 =?utf-8?B?ZVhlVWM2TEhHSEdBVTNUck5IeTduSXA3OGErTmpGUGRiY284VHBEYWJqSk9i?=
 =?utf-8?B?WEtKN2YrSkNocDJhOXlkbU5SUmNUL1pSbUloUkR4cXVPcjIzejBLeERkMXJa?=
 =?utf-8?B?VjM4ZkN3TldZcUtwN1BWSHZ1d3Zqa0NBL1FPUDJ5MVhQNnNzNXZiMGJkMlpZ?=
 =?utf-8?B?WUdqOU9SYWdBYUhOWUllZEtmSTZaYldDNXd3UlVaSmc2eW5rcHd4ejlZcnlD?=
 =?utf-8?B?NmhqRThHamJoMGx6a2tGSjNBeS82SnV3Q01BaVZrd0RuNGdvSU9PdUlPUEw3?=
 =?utf-8?B?Tkh1V0plM3VZTDRseDNTNDZzdG1zbXVDT05HaGllZm41Ry8rb1NtVEdxZFkw?=
 =?utf-8?Q?ZxJcCgHLC5XPlsTCsACJXzltcBIz5sF7Ds?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QUU4TE9vVGdUTEJhTXdHM0E4TmhLblBFeEdPU1BIQTI3aGdZOFRSRE10MnJ1?=
 =?utf-8?B?dGlxMUJKaUVKUjlmUlZpRHVTYzRQQm5EMTE2RTY1ekZWZkQzQUpFbzhXV0k1?=
 =?utf-8?B?SktHQjJZTUd5MVFuenJwSmlXMnN4WjhIQU9JaWpYUld0TDYxL3FwZkk2MUVD?=
 =?utf-8?B?VjFkRHEzTkJzQ2lGb2RJYmg1ZnBpMDJlcGFTaWtUU2hBK3NVV05oSHZYeWxO?=
 =?utf-8?B?Y3I3aG1sRXRKVXA4Nkp2d3o4MzRsVWNWTzVmSFVhYWxabmh0NnBqYjE0V09K?=
 =?utf-8?B?Y0YwQ1NXYy9nQnVNcS9IRTNEWnl1YTJNUTdDVGRscTkxeDYxaEN3akZkS2dI?=
 =?utf-8?B?NjJjTjF2bzJURFUxV2JOUnFZSkVoNUV1dXhOTTROK0tORjA0RHVQOWRqLzMy?=
 =?utf-8?B?RnJJRFdtR2RCRzFYSFU0dythc2ttTlJmMnZxUXVBdjhXdXV2RWlveWlaelMy?=
 =?utf-8?B?ZG9iVFNZKzc2akRXMWlKL0lYa1hyQ0s5bFRxczd1Z0lXMGtadnVLbHFKRk1r?=
 =?utf-8?B?MEVsaWY4bGZMY3lqRTdMRWNzVlN1akQ0djh2ZnZWTHVmTE5jWjBKSnEwR2xp?=
 =?utf-8?B?bWlqMTFpTjJ2VFg2SElIZysyakVaRUhGN1ByRTRnejBYY2FLRExMMDl2Tjd0?=
 =?utf-8?B?QnV6d2NWdmtvK0YrOGVseHQ1QW1ZdEROQWJmczN4YzhIZnM1K1JwMGJkRjJi?=
 =?utf-8?B?SzJYZnlLTHVYZzEySFpBazZxamRHSk1KNG02bnhmM2ErdUFEaFJMUzAvaGxU?=
 =?utf-8?B?VEREd1lBNVJUOFVadCt6NEpIRGx0cFd4Zk1sNkZnWmVSK1dYTTJPK3dhM2RT?=
 =?utf-8?B?bHRTd0ZJN0I1eWxIU3ExOEJ6b3pyMGF3bUVvT2wrNGNEek05TUh4SXllb29C?=
 =?utf-8?B?OFI2RjdlOW9MZE1uSjJpR2xYcUpMM2RwNCs5YzBpZWRhVEhxSC9KM2hxcGpL?=
 =?utf-8?B?bHhBNCsyRSt3eWJFUEFQWUFNamRBZVVIMEtoM041RkVoK3BzaW5PU0p4eUZN?=
 =?utf-8?B?LzB4cklXaVl4aEsrTGNOVmFEWU9Qd3VzOHZtZUs3UzN3S2I0bmtJMVVjOTBn?=
 =?utf-8?B?cjRuQTFKRzlsK3N4UFdQMkRyT2grcGFhdEw1NnYwdWZ3cXRHcU04Tms4RGpX?=
 =?utf-8?B?RUhkWGJGd1h5aFdyQ21jZlhaNU9nL0J0MVFpWkNUbHorSC9nR3lucDM0SE5z?=
 =?utf-8?B?b280cjhGQkkxb0hLbU0wbkx5TGpPSTZWNnNibnZmQWZRMTE5V3JOVFdybDBV?=
 =?utf-8?B?OGZjWXNITCthMTc1U25hTFFRcS9IL2RpOTdqVkdvVWptZnJrMEhBUlhJV0Ja?=
 =?utf-8?B?UzVTbStnbFJsbHVtSVFtZG5wZTZ0aUk4dy9KMEI3OExiYTJPY1FJenkwcWRj?=
 =?utf-8?B?dGN2L1J0NXZ4bkdITFJQYVhIZlFGWlhyVldvR3lnakxkSVJhWS9UZXlqWktW?=
 =?utf-8?B?UXU4SnNzek90M2Zhc2VFMzdtTTNndURNUG5tQkdJNTlmTkxRck1YcEl4QkhU?=
 =?utf-8?B?OUd4cmlaZXRoRE82VWFjUWRXWGVpend6SXl3Njg4ejNPRmlQbW9ONFFxdnZR?=
 =?utf-8?B?eE95dE43dTF4L1pYb1ZjbmJER29Td2E1ODVTZmdsQlAydDdDUWw4Tkw3ZHFQ?=
 =?utf-8?B?Q1gvV3BZaEpvK2dXSEJXeVNDSlQ4QW9nRDdBV1daVFppWHhSelhsdmo4Q0Ix?=
 =?utf-8?B?Z0hXNzRKaGh2TFFiajBUa2YxclYvV0UrOThyRkdMMnpsdU45QTdDWFEzd0Zx?=
 =?utf-8?B?aGtReEpSRGFweFdmNVcvbEJCWThtYk1MTndHTXZIRHlKR1h4ZEI4Vkgvamly?=
 =?utf-8?B?R0w4bjV5YWQzREVvUXRTSXUyZ2RwaG0xRzExOFZjLzBoSXlLNzRmaTBkOENn?=
 =?utf-8?B?cjBRRFltSjNJOWxCSHVTcW1Rd0xxdk1ha1BVRCtjdUk0Uk1TeUpSZnlQTk51?=
 =?utf-8?Q?ssUu+PYChOWFVZCQ2yGo96Bmfj6vGKGM?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 140551bf-91c5-4d02-50c6-08df1320f4e9
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 12:00:38.3803
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5418

On Sat, 2026-09-12 at 22:55 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider:
>=20
> Pre-existing issues:
> - [High] Blinking one channel forcibly turns off all other active
> channels due to a shared global sequencer zeroing out their PWM slots.
> - [High] st1202_led_set() passes the requested brightness directly to
> a u8 register write without capping it, causing silent integer
> truncation that can turn the LED off.
> --
>=20

The st1202_led_set() truncation will be fixed in v2, in a new patch
that caps the value at the width of the current register.

The st1202_blink_set() comment about other channels is about intended
behaviour, as answered during the blink support review and described in
commit 35cbd34a6a05 ("leds: st1202: Add hardware-accelerated blink
support").
