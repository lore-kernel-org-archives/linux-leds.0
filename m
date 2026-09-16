Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazolkn19011078.outbound.protection.outlook.com [52.103.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA2A4A5C39;
	Wed, 16 Sep 2026 09:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.32.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789550497; cv=fail; b=ZuI9gSe2+iRANKnpntCoD8gU2QhGk6ZrSTj4c3tEFaKqyjSv4zeTzvIEYh0jMY/fHjPY0UNyfiY2zdwt4wliSzLHNoNZh8PVMcPse06qbERHkPUDHM29NmDDcps3hjF29BIjoHyoLoXggRzPChH8twsFYy2NmaNmv6UzduJ66CQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789550497; c=relaxed/simple;
	bh=cF2e0AMohgwnKvPjDGwnD3iCbSXnaXVK+ddYsxVsjz0=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BbHVLYEDrq2ea13E2C011burHKerQqvzoD1LYczXKw09G9gTFBwMz4Kkp9UUF5tXMufubo4TyV3w1Nr/FrGpU76Q5nkRUQUKKNSC+zBDLUxt00AXIxLm7s4DsZPCXP5sRLxL9XRLtCTMfTPIf70eFTCxFfxPW6OjLKpNBoHM3kM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=l8MXcX2u; arc=fail smtp.client-ip=52.103.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="l8MXcX2u"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r2kskWVWYD1EBTIv+1PV4TUGXviBbw7alGqTx7VbTkVzzJUV+70Hgio9KaQNn8CIWNNWs4BO8WNODQQi3xMqAC2MwNzULK25kTOs8yVEd3xmH6ixM54lqIgoua3x3YeK61929C0AWoY0BFul2bhnvdrGZjpyptiyZxig1NvrlNpd/4r9en2I9u0FeS1iJuxdvgt5tvN8bahbLR8AizAsU6ZRBgIq7ZQgC0w7fWvb/O35XVhwMPG/6FjDdtE1m+vKU/LU3x+cMIo6b9r53KyFp8hnYezOrRSpeNm0znigiVlZzYEvpr8IFddY5VreMd6t0DtHIfxSFZksM/8bbmFTAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cF2e0AMohgwnKvPjDGwnD3iCbSXnaXVK+ddYsxVsjz0=;
 b=FYwIdbgyP39LStPEyPPHwSTVXcZyEHznrM7fpQKxXIGLwUdfvTNdgxeSH2OAr68AKSxGgwHMWQ+muhQ5oy5nounJVYVOKjiChS11V26SGJtXmaQ+8sbbVyhRuplOoCHC5kUapvIyNWURyvBDdgGfB4/aKB0p51DWM0pdbtdSDXqush1o1gFQ7tG/NTaZ8NnDubacYSXk0vqSao9cDPZJh06y1xTScG6EpJjCbOijS7/+2DYMle8NIbFZi7h6tgL4wM6Tf98oDhImQkR/StiLwgT9bJr/eOUYq3SRSDtaAdDn6MTSMtbKvpU/O7+irDNXI5kYrJnmPdFTx97Crv65Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cF2e0AMohgwnKvPjDGwnD3iCbSXnaXVK+ddYsxVsjz0=;
 b=l8MXcX2uhfT4Lg0s5LuEBMWQFBuhuGSkxDmzWwdaRJi5H+0SV9GfOc5awgMF8jsVbHtgmJEFU8BJZ1rVssRrHpxijw5ejVvAKtxmPgTXePDoTlTJKv//EJ6zQ3xqgFagvqL39y6+p42ArCgudVNMJcZtkX6aIajhas6rfBXbvHi32W1m9t/ZwtjOA/tqqtos3pQrj7bDvR4JQUsqX2uJC31YLusxJsG/l+MNVw9G4UdVOFbCMi+lxM2joA8tU5PSRj0ha+6T+AGmCkW46N70+wRVcpyrM0dAybCvlSDQKahqSA2aQYCj9W7xpcezNz7Lf4K5ausFwz6J2q95IjwcGw==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by GV1PR08MB8156.eurprd08.prod.outlook.com (2603:10a6:150:90::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.5; Wed, 16 Sep
 2026 09:21:12 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0428.004; Wed, 16 Sep 2026
 09:21:12 +0000
Message-ID:
 <GV1PR08MB8497AA46026A94E115E8B926C5B92@GV1PR08MB8497.eurprd08.prod.outlook.com>
Subject: Re: [PATCH v2 00/13] leds: st1202: Naming cleanups and pre-existing
 fixes
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org, pavel@kernel.org, vicentiu.galanopulo@remote-tech.co.uk,
 	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Wed, 16 Sep 2026 10:21:10 +0100
In-Reply-To: <GV1PR08MB8497668D389D43F680D2CE3CC5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
References:
 <GV1PR08MB8497668D389D43F680D2CE3CC5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44app2) 
X-ClientProxiedBy: PR3P193CA0053.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:51::28) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <90ef084d6a1b0bd4170725852c2fa88f1183b797.camel@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|GV1PR08MB8156:EE_
X-MS-Office365-Filtering-Correlation-Id: f9dfd6e6-8801-47af-0bc1-08df13d3d94d
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|25010399006|24021099003|51005399006|15080799012|23021999003|5072599009|6090799003|8060799015|19110799012|37011999003|40105399003|2607281247196008|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TDdIVEJRNUUvQjRSMVpsZDhONytNQmd1YmNjVzdQaDJOczRvbkxSNzNIK0Ri?=
 =?utf-8?B?SHB0RmRuZ2lnT0hFbGFtQW1INFVJRmZIK1RFdTNONVFvUXRZUllUdjduSjVq?=
 =?utf-8?B?bmgvWUNlS3NKaEtBS2M3Q2lpUVMxcXJFS2toMjJTbEhadVlUME5TUkVqZGFO?=
 =?utf-8?B?S3gwNVQ3Y2ZtQkxWTG5WMTZkQzJQRDBWZldwOXR2ZDQ0MUVneWduNFlhRDk5?=
 =?utf-8?B?dGpkelpLdzk3anZ6RCtNUXFNQllHVTE5eVI0TW5lbTJGbm9IdFJjNERjTzRD?=
 =?utf-8?B?N1I1amZ6RWZMaGVxc2hHNlRmQytNSGF4U1I5aGZ5eVg2L0FqcTJlcVJHT1Ar?=
 =?utf-8?B?S0xVYkpBYXhVOWZabVZweldpaDQzODF0djRpMnZMREFiQjFwb3BKN2pRYmxr?=
 =?utf-8?B?K0duck1wUWNoRE1zZFA4VlAzUHhoZnRJUFdWMEZ3K2hqdmoyMGVZVklPVW1P?=
 =?utf-8?B?VG5keVpxMlBEbENaSWNMOGNXL09xM2xha1lraTlIZlZWRzQyU2k4TnZSc1Fz?=
 =?utf-8?B?b0tCT3E2QVlNUXk2WlU4UXR4Ky9LYWh5QUZLQy9ZNEdlMHp5RENIUitzYVRh?=
 =?utf-8?B?SlB4NExPeXVYdVZQMlNWR04zcjAwODFnSmU3eWRaa0RqMTY3VWsrZWpmcWRv?=
 =?utf-8?B?bzBVK3NQc2hqY0hRakZicFZRODZaOUZXMjlYckoxWUptT3JGaGh2STVCaGh6?=
 =?utf-8?B?YjBLREt4V1YyZ08ydTczaHpSME8rSlRjc2pPbmVkVURUaU1DVTI5WC9HR1Z2?=
 =?utf-8?B?V3A4YnlvaVpuTzQwODJDemRJUi9nQ011aHZ3cEJDRHJLRFJvUE5pQm5LbnZy?=
 =?utf-8?B?bUM1a0ZzSldVdW5rKzV2RSsybVREYTVMR3Z1bFcrNVBJdTBBU3U0bWFqNmd5?=
 =?utf-8?B?ZzFqZFlDTndQMTZRVktWcmdIUkdUcXB2UDE3Y3p4ZFMvMUdTY3IzbCtzeC9B?=
 =?utf-8?B?MWI3cFY5RC9wYU5SVHl1ZTJmd2tpRFU5NnFidnRFM0JPV2JFNUUzaUdpMm5J?=
 =?utf-8?B?SUJPZWUrUm1OV2ZpL3RNdGhGTDZ1a25vQ0FSTUFvQW9xVldRVDE0UklKL2ZQ?=
 =?utf-8?B?em1tMVJtUDhJZ2NtWGxaUlpCQkxWNzlieFFjdDROZ2daLzZGQWErNi83alNx?=
 =?utf-8?B?UWlsSzRQa01jKzB6Lyttdm10VmcrN2RpdTZOMExBaVo4UTN6QUpidHVUbkFS?=
 =?utf-8?B?NnN0UExETTFFSTF1cHYwTDVOMFpITEwzVWpKWkxzbWRkN1gwbEZxMmxPQ3VY?=
 =?utf-8?B?cWJIWTJURTNkNlQ4aGxtL05CR2ppa0FJcmQrcHlFVmVLblJFNDRadkMvZEtw?=
 =?utf-8?Q?6Q4sUrPjsXkaXAO+oJhEV3d76h8D90SCzy?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eWI2eWtjT2pRekVKeUVOQUhFeGVKb0FrZFhnc1FpZE9BdU5mTWdVWWJMZ1c5?=
 =?utf-8?B?TjdLQjBzYnhlMW9OT09tdkNENzQzSDZCemRqL1V6Y2xZUFZZNmtIbkdKb2dS?=
 =?utf-8?B?R3JzUkcrMTI4Wm1QOE1IWVdJcXZyWWJPTjQ5cFVXUFNIZ0ZUQXFGU2JSZTJp?=
 =?utf-8?B?RGtZcjhQY2hKVXYzMzFCaGZHam5NY2NoUFNabmQrVVpSL0k1dUVldWZPL1NM?=
 =?utf-8?B?YVorZWJPNU9uemgxckZQRmRVMjYzNFhPWmpmTG9oOXFLejZlNmR5c1ZMc2ky?=
 =?utf-8?B?NlhzUUZ3TDR5V3EyclFwcTJZTHNzQ1JHWWVVUlpuUTJDc0hMY2M4L1hTRyt1?=
 =?utf-8?B?VjBtYVFUTi9ObFdBcEp3cFBRQ0hQYWJmdDc1WnBld29neFM2YVh4aDJhckhw?=
 =?utf-8?B?SXUxd3R2YmF3eU9aVXRJdVdIZHNKNFJLMmFhN3ZQK2syZFlhUGh3WS9FMW0r?=
 =?utf-8?B?MW8zRnIwcVFEZ2lEdEtsUWRqaTdkUElzWUVMVmU3d05XQkxlaTJSczJFL0I0?=
 =?utf-8?B?QmRodUJEVTI1aVpRSFJCSXQxTnBrUjgvcXhHL241RHEwRDdFZTVPV0gxanM4?=
 =?utf-8?B?Z2JYS3dvZTR0QVhMQ2hJN0UrZWhGWk55NmZTZDVpejY3cm0zTndJTnlRSnVi?=
 =?utf-8?B?SDQ2QjRKNjVWTGNOaFF3WDZKRkZaREJTMXp5dGVKbW0zdVcvTSsrbVJ3eVRG?=
 =?utf-8?B?Z0NYczIrM2dGS240WWZ6MUwxR29jT1YvVU1zY3R4dTF4Z3lXMjdndmlUVWpx?=
 =?utf-8?B?SzV5WkdFNzcrUGpJU0R0d3RQY3pWNXEwRUdadWhCZGwvRWV1d0JiM0g5dUtq?=
 =?utf-8?B?cFlRL3lkRkorbWs3ekd3ay8xTkZUenkvVCtUS2RMTStBbGQ2VDVPNVpIWUNp?=
 =?utf-8?B?OHcyR0VocnBTZWFLNlBFb3JJdHR5THlFMlpZY0o1WlpoOE5iK2lEemNsUkg2?=
 =?utf-8?B?enBHSCt3MEYyUFhrYmljOEF2RDlUOHUyZ3NKcDVJdUVhSkIxS29CdEFaYlNl?=
 =?utf-8?B?T2lBWC9KeVB5bURvbm45QTRFaWFKejdMZEU5aStWc0ozK0IxejZISDh3UXpU?=
 =?utf-8?B?NW84SU9LUlJ2UHlJUHhwaWo0cDBVSUhGNEhLaFhwRkNKUElIT3F4K2FadVFt?=
 =?utf-8?B?MC9tNG05Z0UxeXpRUEdaTGtidW1pM0RRSndjM1YxYjJpUkgvMU9pSlI5ZXpu?=
 =?utf-8?B?dERPenU4eXd0eEdldm1qRnRQMmtIUkgydkt5bzZNWEF3eFVxYklYVEhGVURx?=
 =?utf-8?B?dXFLa3JBRFpYNmJCTmRrd2h0ZUc3Q2xsL0l5aWxEZklTb1pqZ0NtM29yeWtw?=
 =?utf-8?B?S3V1R3BRcXM0WXdHTXVLdVV6eXFzMzBMZ0IxOFNTSVRUTUpVSWRhUDdYUHRL?=
 =?utf-8?B?Wm9ZYlZnNjI5cE1GRkd4UFZERE8zWGcvSGU3aDFOcTN2OTNCY0t2a3c4cmV2?=
 =?utf-8?B?eWtLdnMraTE0OVc2TlY5NjJxNzVCUVIwOWRsY3JGM2p0V3JMN2ZjM0xGM3JM?=
 =?utf-8?B?ckxINFdiNnloK1FwVis3TkhET2NrU1V2MFcySDVqVnR4YkRtTEdHOWh4WlpN?=
 =?utf-8?B?d1NqeVVwTTJkalNZNmUweGw3cVpRMFU1WU82OWJlZnVmamp0anJRU08rL0RH?=
 =?utf-8?B?N0x0RE9aZXJqdHRESUtFbkZUeHRsMk9xbG83THowZDdyUVcyZVFidWM1QmpO?=
 =?utf-8?B?NG82UDArNC8xSHhaTmlMZDg4YjBjbGU4T0hFUkdodVBHNFg4U1RXc0RBWFkz?=
 =?utf-8?B?K3RnS09adGZxOEowUVdlSTE5cEtKd09VMXAzSTIwMUZ5c1g4eW1vc2ttMmww?=
 =?utf-8?B?dkFGRE4xMUxtM0tnS0lmMlVPcytjMXVQWkZFNTFrTk4yZHNKWm1CODdEL3N4?=
 =?utf-8?B?ZXYwMm1HTU9XeERpVHdRNmZ2TEZTRFBkTzNZdkFUNXprVmlXQ3dUb0dqWGc1?=
 =?utf-8?Q?qNOFhPJyYoIUXnFvzz4uwhSyZXQ+ejZi?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9dfd6e6-8801-47af-0bc1-08df13d3d94d
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 09:21:12.2216
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8156

Out of the 13 patches in v2, Sashiko AI review only found 1 potential
issue in patch 12. That was addressed in a direct reply to that email
and doesn't require changes.

Unless another reviewer suggests changes, there will not be a v3 for
this series.

--=20
Manuel Fombuena
