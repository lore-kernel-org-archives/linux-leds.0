Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazolkn19011076.outbound.protection.outlook.com [52.103.32.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E30B3F4DDC
	for <linux-leds@vger.kernel.org>; Tue, 15 Sep 2026 11:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.32.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789473575; cv=fail; b=uqAEoG5/baa/zqzeFa2IGAXqqjaWBfZTaL8yuWGESVHUP0qn+oIEv/cWUGc3+AGq2BKRHD7EKT/p028W7PnZPMZ1Z/pX3IoeZtJKYNOKONJwk+hVGD5DwXYVvUnSSjHiBG1j0Ipcrv3h1gmKlHhpR2nw54B2A0kfNjz/GYe4Jvs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789473575; c=relaxed/simple;
	bh=jrhDOOFG4g7CRS7CnPtcp+x+5SqDE5Ch14N8ViYP9q8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hbQMVS16786j2GtJAgtq+8EFApVrkZK4OSc0bY7dZChAe5Txe8PquiE+oxkj+gno0u7fvt8Gf5pv5II4CWXFp19gx2GVRGRQ5/rgl+YoyeNSM6897d3HMS1xRLFo7REbbszEoC54PKk7kivUbWIpqhxvECUJp4mHXJqqiJTzJ0o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=umReRcaA; arc=fail smtp.client-ip=52.103.32.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="umReRcaA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dbk259rAi0v5AwBWkQioXXy47PQpKT3tEZee9dyXRpt5N3OujfaJmcBsR3TP4h2GDKqQAGxLzYeJNd3dZnflXf6oAbiNLAgGaoBH+ieNQk/J4whwO1dZbWIF/sK/eZ2T8dg9y4n+nQsXzCJd4nbThpsjPwGeIkfVsqfE6TM+2G3hRj8jxfpe7JvXrjwpzAaxvi9NHBRRUiybNs6/QifIJa9mPn7tgrFUSrZj/gg2clfTG2jpDyAVj7fJbt3+3QQH10uGNlORXs4SXtllaVIMZZSbu6BRFYWRg8QuFvdAwUtYWCE1HU/isBkf28JZ01FacPCd26Zymj42Y5yuPjQqrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jrhDOOFG4g7CRS7CnPtcp+x+5SqDE5Ch14N8ViYP9q8=;
 b=iBYWNNikMNzOcW95VAg8lf/YBcMxdSQ1yAF0M1s/Th0/NXXojPCf9Pm8jESy1AdVxL6k1/E3rit/5p0653S6l2bt6tlUlp2pmhWdoDQ/jHSGhHiuP7I3ODzcbTL0PO2Clg6LwNP1PQICsrxEcq8esOrh/IR6pmagJrd9IHPkfx5dpDj4FRkQrcnkR3qlXUTxdI2CAvDgtnobWk1iyHZbDzc2jSV/vkJDQ95UGEk66SYZycvFBapx0XZ8aixsYEgpytnJ0ruCnvaOCjnkuQDBDaBje9+gkaEstw3KlSNxvMVQ8FvDdNcTvF3IvrHdpjv6zBFW40KcI8cMTLBweEU85A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jrhDOOFG4g7CRS7CnPtcp+x+5SqDE5Ch14N8ViYP9q8=;
 b=umReRcaApJe1jVNXEvrgEI7+ZYRG9Qy9wx1R7wFs2UkxHa0zYSFez9mbcOMMYOb8KruIWvB6uCM9HtL5sXR/+AfoagmbwTY89YwsutTDpJzv2vQMrMPnEVy21vGVQHig0pSaMNmuZdq9AlngbRr2PJoUBU2yscxomqG9DpqBu0JJjOsSFZyYycViLjJsc3qRfnUXBoWoNcbQ8cWvuShftl88NkGFGJebIlP5Q8If06s/2KEblSilQ6gd/+0Y45NtGQhWdR/05/PjpChi0Noj9Ofeui+UVFlBy+HTM6J9bNlOzhIVInF2cxoIOJR2TFFlT/hKsIq9wRI/h3bhkcM0zA==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by GV2PR08MB8341.eurprd08.prod.outlook.com (2603:10a6:150:bb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.8; Tue, 15 Sep
 2026 11:59:31 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0428.004; Tue, 15 Sep 2026
 11:59:31 +0000
Message-ID:
 <GV1PR08MB84975E7ED199D77AF3E5E711C5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
Subject: Re: [PATCH v1 03/11] leds: st1202: Name pattern index variables
 consistently
From: Manuel Fombuena <fombuena@outlook.com>
To: sashiko-reviews@lists.linux.dev
Cc: lee@kernel.org, linux-leds@vger.kernel.org
Date: Tue, 15 Sep 2026 12:59:30 +0100
In-Reply-To: <20260912225106.9BAD81F000FF@smtp.kernel.org>
References:
 <GV1PR08MB8497422B7A44424C4968AEC1C5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com>
	 <GV1PR08MB8497495AB757A3CFF797654EC5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com>
	 <20260912225106.9BAD81F000FF@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44app2) 
X-ClientProxiedBy: PR1P264CA0060.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2ca::13) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <2b7fc1de1b3288dca95eb94199b77c3851bf6af0.camel@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|GV2PR08MB8341:EE_
X-MS-Office365-Filtering-Correlation-Id: 1afe7a68-3b03-4899-4c93-08df1320cd3a
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|25010399006|51005399006|24021099003|15080799012|19110799012|5072599009|8060799015|23021999003|6090799003|37011999003|40105399003|2607281247196008|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VEdZbXRMRElwVUkxT00xeThnOXlRZlhHNTdyMk8xM2VTUWlqUDhZd1AvQjRs?=
 =?utf-8?B?OGZMbU9KK0tKUzZVaVRiMm0wMlJnSGpSL05mU2FRS29DSW1HeE01QnRrQ3Ur?=
 =?utf-8?B?RjRqckFJZWlMWjZydXgxblE5MEtlRHFrTmsxSEg3cnEyT1lPcmNnajVCS2RQ?=
 =?utf-8?B?THVOc080SlVFVzYxa0d5MVdNQUlCbkgwRTlIaHNxTk15bmlsbkgxVU83Y3RR?=
 =?utf-8?B?WUMzYVFjd3FRN1VBYWJCS3UyZkxBci9jY0V2eStCZWNBT0VuaWtYc0NkMnFD?=
 =?utf-8?B?QjZBODdSVzZHL2dCVmJqQ0hmUmsyM0l2M05iZXVDS3BvQXZJcmdoaTM5K3RQ?=
 =?utf-8?B?WDMvbmNUaXZQdFNxNlZqa2w0ejZMbFBISDZReGlRcEdvU055V0ZRQzUrMVd2?=
 =?utf-8?B?ODE2ZUVGMWRtUFM0ZnVSUUxlYWFRTWN2UTI0S3pQSGZzR0RJbkVzQzRRZGhX?=
 =?utf-8?B?d3lQTlo1dE1KTWF4cXdqNGxhaStsSm9KOEZ2K1JZZFdNYVc2MWFFMHBIWDUw?=
 =?utf-8?B?Qlc3OGRvS2hzUkluOWp2R3NSMm16YzJrWnpWT3A5T3NqcmJoWjFvWVZZcFBv?=
 =?utf-8?B?WUlaUXltekpxY3dRazYrVW92YU9Qbk5idTlZOU42ZDdNdHJwL3U5T0lCbnNP?=
 =?utf-8?B?ZEhJcVErNE1KZU9xeHdEQlFraS84UXFmRVp1bDg1dmdadXRIb0s5M1dJb0Ew?=
 =?utf-8?B?QnpEMmFKT1JzbmZSNyt0ODY2SDNnOThOMU51bFhCMU1BRmg4eFFoNnpMNDl0?=
 =?utf-8?B?cTB0UmFPbTNUVnM4WXMzcFBNNjhUYklEY0ZGVmV3OHZ1UTBzRE5qbGFhZUNx?=
 =?utf-8?B?RHhDNmNGUXhQbEkydWFYRG1lKzJqN2kxKzA4STV5dzIyOUFrR2lYY1U5U2Fm?=
 =?utf-8?B?VkZTUXZlekhnUVRJTHJ2MUNxRmp4MGhzc3VDbUx6SVo5alV1cDZJdzkvOS9M?=
 =?utf-8?B?Q04wVnR6OGxuWVhBZTVvc0VacHdNZTJuYWtkbXpiakpNSUdkUFZSM2hHMkdz?=
 =?utf-8?B?dmtFRlppOHRpR29kVDBHb3kwUjlnbHIzdVQ1ZGNHc1k0OWF1bTBEQ0dYdlA1?=
 =?utf-8?B?d1RTWjNDbk9hUk1Fd0lZamhMaEFwbitBMElWcnpEMmRxQTVSaDRSV0xFSGEr?=
 =?utf-8?B?L25ITmcrRk1IN2V0KzdsaWZwSFI3Q2tMcGowdVlHV1Q5TmJtekZZUWtFa3JB?=
 =?utf-8?B?UHlNeU1RUmdjQm5YT0liM3hoMUFGVko2M2UxR2hjM1creWNNOUVtS3ZpQ29L?=
 =?utf-8?B?VlM2dkxFTFhpZVNTWStrTXBOMFI1L2RJd2JHL3NmRkwrS0dxbU5qS3oxbEEx?=
 =?utf-8?Q?pUjMtt6Zl7mQYA/ptQ+sq0hhz0DTbMjj6K?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NmZFdGViOXE1YTllaFQydlJBNTJ0cWJMYXBvanp3VmlwOWF3L2F6NU55eW9M?=
 =?utf-8?B?WlR1U2dyRUs0SzJNWktTYS9YdzJGN2hsQ1NnQ3NzWlkwUDBadVVrVzc2Nm9W?=
 =?utf-8?B?R1l4cmFCMTZqZ1JvbTVmNUVYQmRFQk9aZ2hpMDl2S0pBNmcxcTVCVDVQRGN5?=
 =?utf-8?B?VHpCK0JDcUdZYklIWlR1YWExYVVSTUxYclhkZE5IWXBrRzBYY3dwYnh0UGFY?=
 =?utf-8?B?SUp4T2JHMFNDSitwdVUvQU9zQXk0NCtZczVnMXZNckJKWDV2RXAyRzlUL2tW?=
 =?utf-8?B?dzBGSzErT1BXYkFJaWlTVDBGN1pXem5ScEEvWDl1R2lKYXZIckVNU2phK25X?=
 =?utf-8?B?a3dobm00Qi9pV3FsY3V1eDQzSUpMVy8xWngvbjVNZ2VZbHNUaGsraVZNTnJv?=
 =?utf-8?B?Yk9pd1YvbWhUeHlWVGZDRUYzS0Z6L1l0YnViUE5rUTFENTlyQWYzRER3Mlpr?=
 =?utf-8?B?WC9GRStUdXMwcHVLbE1tZmFvbXlXS3hET2tmcjVseXRRQ2Q4Z2l3VkJjMmlu?=
 =?utf-8?B?VXl5aGtmbDJwWjRCdFgvRlNKdDI0RWRTQm1lNHl2dmNGVHJFcExqVTYwQ1A3?=
 =?utf-8?B?TThFQk9yb2JRalhKQTZJZWNtRyt5ck5vSHJtZzRKaTUxSllvOWppMkl4M2dk?=
 =?utf-8?B?SzBrZ1JtYVBIdElXOUx1S2RHWEQ3RkdSMTNaZVlZc2VCbkJabnJXK1NDUzRC?=
 =?utf-8?B?Qk1lbjNlUFRWeXFvSDFQTEhWeG51MUJlYW1GV24vcENBSWUzOHEwVEJnaUU4?=
 =?utf-8?B?b1JhUFZiTkNCamNsbjdnb2JDUjVNcnI2dHY5dkRHcm1hZGNCSWcyOEFZVVlU?=
 =?utf-8?B?TWxiMWZTa2x5cmE3L05sNUl0ZXppYlErSkhzMWRxZTR6Q0xxWWhyR29NVVhl?=
 =?utf-8?B?azJCMGo2cmdWb0QxTlFFM2lUNE9Ld2Zkd2Zwb1haREtFNkhCK0xjbEhjWGV2?=
 =?utf-8?B?ODNseXQzV0luS2dQUVJKYmZaWmdhRlkxOTNydml2clpWbm9ZVWhLa0VxNkxY?=
 =?utf-8?B?ajVDL3o0NWtLNFNzOEh0SmZRTXdIUzlGQXF0TGp3bzBtUXFTQmtHemZjcEJK?=
 =?utf-8?B?elRMbGRleDlsWkJLcE1aODRFNi9IMnNBd3ZzU1RxNW8zd1NuRDFWYU5UK1ZY?=
 =?utf-8?B?dWt4T2V2WXRTMHBxUHJPdE5pS2MxM0pKcWJ0YlEvVTVTL2hzRHhNT0pwMHJy?=
 =?utf-8?B?MVpTV3RXQVh4cW5pUmtuUk1uTEh0Qy9pSk4vVnJpYThMSlBxVmhsT2VuWndv?=
 =?utf-8?B?WDZIZkFLb05UeVJxYkRTcU5NSXZaaERhQWZQQkxTOTNESCt0aXJ1RWVva0lN?=
 =?utf-8?B?bUE0N0hNK2cwWEhGeUVneDk5QnlGdWpxemtlVmFLK29nSURlSVZmR092ZkhZ?=
 =?utf-8?B?VW9lemlLLzc3U2JVcTQzWXZJUS9WMGR2QWpPNFRnM2NZZXpqUzF5Mk5yOWNI?=
 =?utf-8?B?b2dHaUlpanJyL2g2TGhoV1JxVDg5ZXBLRkt6a3JYV2xPSDB1Nit4b0hGNmVw?=
 =?utf-8?B?MUxCSnBRUkx5ZHhGRHJnWHJ2WkJtczVPZlRVODEwQTlJZHFPQ3dTSHVHTXlQ?=
 =?utf-8?B?SHBpWnBSUDRpZHc3OGd2Y3BWTGFFMlFCQkFYY1p2YktWNzBlSVpDOUpoODlB?=
 =?utf-8?B?VnFVZHhIWlY2YkR6WldoV0FXMCtTRjcyZEh6VGNHaHFKUEhzSml3SnNNUjg5?=
 =?utf-8?B?b1hZOHZKaFpxSHpDZEJQOFZ4eFFiU0VhU3BlZVVwRVVLbHo4c2J4ZjRxa1lT?=
 =?utf-8?B?TVlUbE85Z0RpTTRsR0pzYzBmT09KTGJaS1h2VFp2T0NkTzk1eUlSTHo1TDEx?=
 =?utf-8?B?bFM4RndxYTFKbXhNWkNPdGU0QUorQkJxU2xUUGUrZmVlZ1ZLL0lJZ2ZlWlEw?=
 =?utf-8?B?aG1qU3lBRVZ5NDZUUUZoUTB0VHZUOWd2ek04elk3YnJXTElVcEtramUxRlZM?=
 =?utf-8?Q?tYSl7guJ6Nb+MRcJdltX3DLzqreEFDhf?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1afe7a68-3b03-4899-4c93-08df1320cd3a
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 11:59:31.5480
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8341

On Sat, 2026-09-12 at 22:51 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential
> issue(s) to consider:
>=20
> Pre-existing issues:
> - [High] Incomplete cleanup of remaining hardware pattern durations in
> st1202_led_pattern_set.
> - [High] Global hardware duration registers are corrupted by
> independent LED pattern or blink requests.
> - [High] st1202_blink_set inadvertently turns off continuously lit
> LEDs.
> --
>=20

The trailing durations are not left over on the same LED. The pattern
trigger calls pattern_clear() before reprogramming a channel that is
already in hardware mode, and that zeroes all eight durations. Only a
timeline set by another channel can remain, and patch 5 deliberately
leaves that alone.

The st1202_blink_set() comment is about intended behaviour, as answered
during the blink support review and described in commit 35cbd34a6a05
("leds: st1202: Add hardware-accelerated blink support").

The shared duration registers are a hardware limitation, set aside in
the cover letter as outside the scope of this series.
