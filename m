Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazolkn19013081.outbound.protection.outlook.com [52.103.46.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C21427FA3;
	Tue, 28 Jul 2026 11:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.46.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785236694; cv=fail; b=cV+Tftww5Uc3eeQ5Q8mP/p1k6u+xUo31ZiOKMOiCDdPIFDriu5qlkGMapCE2MFRBN86wxPVyJYLCveQg8LicK2EVbfjGjRYD93obGo8pn/E08pj2tVOkDesjKggiZKKwlBWK0SJygBCVeKNFmtjI2nBJjzbLGuQhtvx/mzu2OAM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785236694; c=relaxed/simple;
	bh=95UwdW/ZOpmdjXi3v0DIFXxyEy8U4+wrM/3moiwX7O8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VyOOKtxy8lsZjy0gV6fxrhbK3e6ImO2AgeD6iByx/GeX4O+OxnYRQY9+MCeIw0fN9dtWAE3vxuN2U8C3gJDtnsN8L98ZS0hQZu7fRQNvWGQN5uJ4gvKzAS1nz7mcjWh9JG+Iy2KsmdswNDINCTbEt1yD6KsU3Uy6uuPUarElciY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=WhLnrj9R; arc=fail smtp.client-ip=52.103.46.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="WhLnrj9R"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=spl1RIYJj0T3U9x0zFlMBpn+1WRliT8d2EvtLaFl3Roq7SiV26oOryYbFO2jmgkwomVm03w8FbJU8i+U5BZl5E8odB58dxlWHa63BQxFDU5zhNkKnmIM7Jhxa0kDv/SoWAKhq7W9iJFKFmU4q6ohUgygQayh9cnD01h1wcVlWR6sV+DjOL4LQlf/mo6Ar0bZXUVm3z9XX/g8TpJLnsgiG9Csga+yNEd8mynu/9kRrUWDV4bKpacX9rXSziGr81qYUcMQ2BQv8gpsWCOh4aQEDLwBTDHUDczvtSPJaq8qAcY7ehCiMzvWzb5XfyficTvW4hb8X9O5cjISdL6/bbtbJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=72/+WmOfOhnj3gabtrKg2hMi6FUS1Ssgdd4Jv5D2/SM=;
 b=QvLdPE8OVsY9XBJXLroUdSAThmI1W+Ff7GFLvtH3nIKkgOzpZZ4CcPSySK0eF7msHdNBCnin4ixRdGd8ieO/6pLVtfgENEpMxxYkCGVkBIMyBF2IhfpQbDdwXRabIVSNK1K7zoAkhe3O8FuNW0kVVjUtrx5Exmx7M/4qQ52xLzPGgFJMwNPZuxdr+Spt+AY1kS+2xiKbqOlzyI7MMeJPA7HZjiR05Ak7+tWUDILfBRsVjKD5+UmKoVKxPGKbrrOVAmU8+BO/ta/+jCtxrOUObg3EOwBTrledxo6MpOU4tqbNgkZWBZMLzT5VMdx+5gspXpzRvfKPRZmIWmjU+u2coA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=72/+WmOfOhnj3gabtrKg2hMi6FUS1Ssgdd4Jv5D2/SM=;
 b=WhLnrj9Rc5OgbANRhpFCl9XlU992Pp9RFR2heQdzPTqi/pzaf6VKYL6Mlc/6m1WwxiPXU9jVplqPVAAhMroZMz1tOUD2jZAHCkvE8YSvZsYmxMeViI7JWjp4OOP1r4VuP+LJcQIzTAQkRkLt35neFE8fOgkpTOkO/d16HqWN3j0JzcJ8ROp13cDmdXiziU+pOhCkUdTmXArapd/4sjtuQrJrK5D/AWogJ/dktpOrLzZrwgPVfUt88/ouE1UU+s8YPC2edCpgO5cB4VDxxfD8DLVq8BUuwkEMaaxHCFH2tOqozP1xfkUBCbXUow6E/UR3mRXFXa/f9WGazG0L4KWaIA==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by DB9PR08MB8506.eurprd08.prod.outlook.com (2603:10a6:10:3d5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Tue, 28 Jul
 2026 11:04:43 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0245.012; Tue, 28 Jul 2026
 11:04:43 +0000
Message-ID:
 <GV1PR08MB8497DF840169A845B8397910C5CB2@GV1PR08MB8497.eurprd08.prod.outlook.com>
Subject: Re: [PATCH 1/1] leds: st1202: add hardware-accelerated blink support
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org
Cc: pavel@kernel.org, vicentiu.galanopulo@remote-tech.co.uk, 
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 28 Jul 2026 12:04:35 +0100
In-Reply-To: <GV1PR08MB8497F18EA89C954C987B3FB0C5C02@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <20260723121339.GG3363113@google.com>
	 <GV1PR08MB8497F18EA89C954C987B3FB0C5C02@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44app2) 
X-ClientProxiedBy: PR1P264CA0154.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:346::18) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <2afcb0702ac19f2e4c56ce4765e075867ba9b353.camel@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|DB9PR08MB8506:EE_
X-MS-Office365-Filtering-Correlation-Id: 419f83ce-c96e-4028-f499-08deec9803a5
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799012|24021099003|25010399006|5072599009|6090799003|51005399006|8060799015|19110799012|23021999003|37011999003|440099028|3412199025|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RVNURFRsOS8wTlJRZGt5UVl6OHlKUDZ6REZXc3dHWGVGTUdJanJRazdXYUUr?=
 =?utf-8?B?TEVWVXBxSndUVStXbjZjY29jU2JiOGZRdGhiMEJhUzdzLzJPdGVESHdQYXpR?=
 =?utf-8?B?OWRmY0UxQ3pMU0c1UnpyZDlCUVgwYVRoVFVSTVB5dEJsakhERWJWZC96dEEv?=
 =?utf-8?B?Wk1DUjhMVkQvSWFHVXJNdkF2ZUZmaEhXQXMwWlQ3Nk8yR0xLL0Y3TmIxbGhG?=
 =?utf-8?B?NERHY1dXVHFvVzIySFdvNjRLVmcxMDVOZzlhbDBrNU5kcVVscVIzakpqQ3F4?=
 =?utf-8?B?MHk1ZFpRaW1qOXlTMmtabUZ4UERwbDVZbWlwYzd4dHliV0huWVN2U0E3SSth?=
 =?utf-8?B?c1UxTllVam1YdENGak1CNERpbmdhL2lnOFF1QkphUVlZVGNBeGxxd2F6ZjZh?=
 =?utf-8?B?K0hTd1Z2VmNoekxlUUtqOEdkQW1SZkN4TlVWSkFZR1BnUlBrVUJPUy9TUDh4?=
 =?utf-8?B?dmJTYmtWYzdxR1drNWZrSTZQanc5Kytmd01KbDJNNmxGR0tZeDM3bmlrNE4v?=
 =?utf-8?B?VXljOGQ0SXBmWmp4dmdyZjU3SmZxR3FPakQ1bVFWVWlvYlp3aVVrV0lPWEJI?=
 =?utf-8?B?K0pjL0NLWktKcFFOelRoRWlvdkpURjVjL0xWQmZKLzEvRDYvUzdFQi8vbkpV?=
 =?utf-8?B?L0g1aGkyNzZsUzlvMWRtZnpuY21NUUFreWZHWW9vamxUNlo4WkhnMExCVm1T?=
 =?utf-8?B?Z3RDUEExU3VHM3V4bnFwV3RKbnJGeGt1SkEwRTIrbXhhbnJOY1ppSjF6L01r?=
 =?utf-8?B?ZmQzekhyZDV6akJDVC9xNnBZdXJVYktLZE9lWUIzNk5jNnZQQXQxRUdMNGxn?=
 =?utf-8?B?T0NRNDNHcU9KSjgzYnEzZFdldDVOVENzVEJhcnd5eVZSUnlTaFpPaWQ2UlZB?=
 =?utf-8?B?ZWh1VHEya25mYWtoemJXaVVJQVRxSU1vdkx5NXllZFRBWllRZHFXUFFZaUJP?=
 =?utf-8?B?OGJYa3lEaTZIOVFsNG51WG54WWQ1NXgvazFIeTVKRXpYUmxScncxRnQ5d0Fo?=
 =?utf-8?B?Y3Rxd0pHbHdKSENzcHRXb3ZDRzB2REduaFNsUVlIT3JZQUlYOXNxQldVYXNF?=
 =?utf-8?B?TnRzcy9DWDEyNjcvc2lzWDdwdUlYaGlVUFJjNVdNZTBwaXU1dzFSbnFBTnFp?=
 =?utf-8?B?U0ZjLzU0c09kUGttRm9sb1hUOWkvRWxXVDFoV0RKN2xrN2JORjYzdlROMnQz?=
 =?utf-8?B?TDhlWGpIVUg3NUhmMS80Ym5LNEMxK004N3U5aUQ4SS9vQXpqNm9iZGJPRTVw?=
 =?utf-8?B?ZThreGpxcG5YWnVqbC9WN0p2RUEyZ1psenJkRmlkWkhhbTVZZnpKMWQ2ZHZS?=
 =?utf-8?Q?eosV94mBGx2kCvD6GDaZTCF68TpmdTPNSu?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aEJCaTg4VExxL3NORXQ2bG9QSEJBTXduTEVybzlFcnYzWUxOMVVuM0F5ZHZh?=
 =?utf-8?B?cDV5dDE3WnovMEdnN1NvNjBLSzlNNWhvVG9EWXQ2TU93a2pOQlJUVlE1WGho?=
 =?utf-8?B?MVAvaE5hamtjaDcyQUkwckJUVHRZNSsyUC9ISlhSZVJRZGFmQk54TFh1Z3Bn?=
 =?utf-8?B?TExXUDhJd01YazJaR1UxNzBJTGF4VU8zN2dPNWt5KzBWNzJ5R2dvVEE2SklQ?=
 =?utf-8?B?VHM4WFNwY2hJbXhPazBwMC90RXJONVVHMVhLS3V3bGZYYllkL1FWN1d1aG12?=
 =?utf-8?B?K3ZHVndPUG1MQUgrNVNuOTBrS1hTbHVMS1psUVRTUk9NMFh4azlQQjF0M25i?=
 =?utf-8?B?eklVNlk4d3NLR2RqWWFHNVJTTTlZcFJxaTJ1SmlGa2x2dkVyQ1psdkM5Vjho?=
 =?utf-8?B?QVpqNE9uNGI2VFR1QmNyNUNxK0pLWEhFcER6VHBRbk9UNDVJcU0vSWF4Wmor?=
 =?utf-8?B?TGR1aGZuYUdMOEdnUkxTaDAyUXBjVWF1UWlmNVI3cGRRM2tEYjBNUnErNXFt?=
 =?utf-8?B?cFhodGJERjc2RmZqcVZuRkhsQ2o4Q0RGc2NVVVYwN3dYL2FxSU9wYitEenEr?=
 =?utf-8?B?LzJDb2JEY3BpWjRaaDJ6V0RVUllCeUp4a2k4bm5ka3hwc2pNSGNMYUpZTm1p?=
 =?utf-8?B?TzdGaS9SSUJSY211NVIrYnpXaW1mSEcwRktiZk1kS2dSNmxMZUZRQkJDNWsv?=
 =?utf-8?B?L1Y5WDkzM0JiV1NmUUcvcTViM1piczRqNG4xUTEvZFY2T0h4Sm1zU2Z5WG1u?=
 =?utf-8?B?Z2VIeEY3a0lTT05pa08yZmdRcGNRb3JUOUxiQzdCcWlpR1JRUjRpdzJKbDc0?=
 =?utf-8?B?Y2xGd3JrRkxKT2lBRGo2Uk52YnJvMzV3U29GWFpDdUkvUFYwN0gvZVM1WHgy?=
 =?utf-8?B?a3pMUHQ5Rks5ME4zdzZweWRDdkpJejZFUm4wV0EwMjZLUmhSQU1IQ0hFY1Rp?=
 =?utf-8?B?RWkzTVVhYXhRNDl5NHc4ekRtTWpjRUp3Y0lMTmkySVY5NzVua3k0NDZsMEdC?=
 =?utf-8?B?VERYWCtPemxPM3cxQnplcHNPMjdYTld3cUU1RWRISndERzJRbEpJcWF4QzEy?=
 =?utf-8?B?b2czZXNjWWVVY0FQZWlmZTVJQ2grM09VdlhhZXB2b1pXTER3bHlhdHRMaXN0?=
 =?utf-8?B?V1NSSGo5aVJabERjZld6ekQ1WndOMFdCbHdLK05pMWZDbzVTWi9PUlJYclUr?=
 =?utf-8?B?NWJIbDkzSHc5Uk50ZWlTcG5ZRUtITHRsT05jRHdVVXVXVmVvSG5VaWxIRVdL?=
 =?utf-8?B?WEs0bGtIdmp2b2FZV3lUbzIvZ2NZRUcxcjZ4TmRadnJNYk4zdXQ0T28weTJ5?=
 =?utf-8?B?UDNUaW14RlpITCtOTGhqUi9Ldk0xbHNncS9Bczd3dlpPVU96UnRyOFBQNWtU?=
 =?utf-8?B?dkJXUmVKTUs3R0E1Y1VQdkNMMmxyQWtOY216clVrQW1KeEQwY1Vmck9pRDRv?=
 =?utf-8?B?ZGV0bGYrWUl6UDBnY1g5b1Q4b0JsN1d5Y1NiSkJkcDFUTVdtV0N4QTVyY3dQ?=
 =?utf-8?B?Q2FlcVNEZjFDU255NTRibWZjelV3NHJFWDFRRUdoMHQrR0RMYTZWalpJTVIz?=
 =?utf-8?B?N3pwQkZTQ0xzTHFWMEdBV3hhcmt1bG1TdDRZb2VpckQ5ZFRTM3NZd21ZSHVR?=
 =?utf-8?B?WWtTVVBab2RPa1M0K3lqcjI4a2I1Wk9QeDd2VXlybGJ0cVdjV1JNNlQzRlNR?=
 =?utf-8?B?OU5Ob0Q5aXpwM0dyNW5oUW9FZ1BMMUdtektCVnVRTWxHMVBKS3Z3QnRHc3cv?=
 =?utf-8?B?VEtLRnYvYSsvcmoxODUxR0FMTWhXZENSQnF2RFJ0N3pSMDFVUnlRMXQ2K2ZW?=
 =?utf-8?B?OUJBL2tJcm5qcTNyd1NkaTd5QTNoR2QxdWpBT3BDZXVnRnU1YUZPY2QwY09E?=
 =?utf-8?B?SHZKdVFIRnNpMnZXeEtTa2ozeFJOR1FNMTRGbDZlNHQ0cktSNjBLT0QvZ1Ew?=
 =?utf-8?Q?n2aJbZVzlpi9x8jxAlaGO+kM1HQxYi6P?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 419f83ce-c96e-4028-f499-08deec9803a5
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 11:04:43.5132
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8506

On Thu, 2026-07-23 at 23:17 +0100, Manuel Fombuena wrote:
> On Thu, 23 Jul 2026, Lee Jones wrote:
>=20
> > > +	on =3D clamp_val(on, ST1202_MILLIS_PATTERN_DUR_MIN,
> > > ST1202_MILLIS_PATTERN_DUR_MAX);
> > > +	off =3D clamp_val(off, ST1202_MILLIS_PATTERN_DUR_MIN,
> > > ST1202_MILLIS_PATTERN_DUR_MAX);
> > > +	on =3D roundup(on, ST1202_MILLIS_PATTERN_DUR_MIN);
> > > +	off =3D roundup(off, ST1202_MILLIS_PATTERN_DUR_MIN);
> >=20
> > Should we perform the 'roundup' before 'clamp_val' to ensure that
> > rounding the value up does not push it beyond
> > 'ST1202_MILLIS_PATTERN_DUR_MAX'?

This went in a full circle. v2 swapped to roundup before clamp_val,
but then an automated review flagged integer overflow risk for extreme
inputs near ULONG_MAX, since roundup() performs an addition internally.
v3 addressed that by prepending a min_t() cap, but introduced a
redundant trailing clamp_val() that could never fire.

It turns out clamp_val() before roundup() addresses both concerns:
clamping first eliminates the overflow risk, and since
ST1202_MILLIS_PATTERN_DUR_MAX (5610) is an exact multiple of
ST1202_MILLIS_PATTERN_DUR_MIN (22), roundup() on a clamped value
cannot exceed MAX. v4 reverts to the original order with this
explanation in the commit message.
=20
--
Manuel Fombuena
