Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazolkn19011027.outbound.protection.outlook.com [52.103.39.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AEFC3B42C6
	for <linux-leds@vger.kernel.org>; Tue, 15 Sep 2026 12:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.39.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789473617; cv=fail; b=n+323Vn1pLwXncjCY2L/x1+qfZgFDNuRYUMYg0WF+dN+D8+rqOA/jWqlFZD2OrR33IFl4/8o7ZYFkd0dmhVSiW6oiwzghLb61TV6U85KctRLOWHZ1E3Q+AwwsJ+YYSaiDv33Z1fWr0JIPoJg7FpJClpFy/KroUS0tHavlsZYeDI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789473617; c=relaxed/simple;
	bh=uTQD0RIBmt3sM5ThG8oM3a65nve61Ut47kRJ6weieZw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TK1m4h28ptefTbjbOK/k488a5IWVv4GSPjKhLB0sysTP5YW1zX+ZNeflt+psLCOnMzqGCuL8eijnAAXxMZ7y95B1LraUAiSovxS9q4hArOTDXuHQakv3tGEJdkOg03F0NzHWerfPVwQDW0uV7CyALOPwqOMPtijD0M0JuiKVSuY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=lmwrDTdI; arc=fail smtp.client-ip=52.103.39.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="lmwrDTdI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VD8QVULtDXNlMutpCAu+P1mdk6yp3uQyizw5w6E2AAIWU0gP7hdotxGBaBH+WE5ZA1XrmyOfjDLLZNUzyhwnWru0eno4tw0+CvhXMVeKjG52xID/L4Aku9ZAHGd4bx1TBt4wSSKObtwMNRLdWx/bGQOQ9md/7hEIOMCJ8R4RyWab7pRBDb/BBRGA4V2254VlyePs2Bf2XrWlGGAioNeLxgVv3T6GVTYrxZ7VZJi1muFgWX+CBlKn8fRkLaqN9HqtwA44X3V2jZMHDLCu/8T6C/v8roGzIm554+Q5W4qODIoJnqY4MWZZmb7uygK305WuQ099vkYpKh+ZsEvg2RoCLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uTQD0RIBmt3sM5ThG8oM3a65nve61Ut47kRJ6weieZw=;
 b=cGN8bYKdXvovsfoK0lOxmndATJfr3A7PBQzTxYVSuDLUgz9ZWvUk29TdJh96iv+nKSl8WQtqRzSMJun8sV9M6dsf1tOlVsnRhlE73QMOHo/1ryQfWGDb1cNMNXDJyDiasZfFgz2L0eQpWmDIRF2i7S6tBQpEaUsOB4j6q69dIEjJ6Ax+bT/Mb50xQ1aIonZNb7WYuflIYOXMTYTJcScgUoD6S7pxMQjQXTC1RL3PuP7XsHtYLoDZRjAoeHonbWNmqGTW5bP9od1XoQfOjtpVjcaoKbL+vu6xGKsiosKNvhGt2Q2HZQ7ofnX8smjdcTsZc5vWJD9nyrDn4ZpP9pBoVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uTQD0RIBmt3sM5ThG8oM3a65nve61Ut47kRJ6weieZw=;
 b=lmwrDTdI/oaQzrDDVBkoUh/MJuL3TZD16YkNKCYwOm4h6rBADAkRjDzoxdS2EFn+WfDA2FcTE1DMiB6Q36QJNDUvLOifT+5VJURLKn2dwQg1KfFqJNolv8Z/8mqpyxbo4RqJDeq22rMmk+/NVPU9CilfQN1Yv836kIHcTuX7+UDHIpqhEh/efPRJzSjRezCFeJ3jvUSxQqHs0uYn53gq5MTsgQ8vzn8OH7ez8V41g6OT90jNBVAadUzgQ01owyIl942PWZUSeRh6piAPWVO07wAESS4iEox5mKbhQ6IPLu7XC6RpfV9TAb5ITcURICsv12WcLaqV6rP86E8gL7RNrw==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by GV2PR08MB8341.eurprd08.prod.outlook.com (2603:10a6:150:bb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.8; Tue, 15 Sep
 2026 12:00:12 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0428.004; Tue, 15 Sep 2026
 12:00:12 +0000
Message-ID:
 <GV1PR08MB8497CDF35BDB812C3F442394C5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
Subject: Re: [PATCH v1 06/11] leds: st1202: Scale pattern brightness to the
 12-bit PWM range
From: Manuel Fombuena <fombuena@outlook.com>
To: sashiko-reviews@lists.linux.dev
Cc: lee@kernel.org, linux-leds@vger.kernel.org
Date: Tue, 15 Sep 2026 13:00:10 +0100
In-Reply-To: <20260912225158.CD7EB1F000FF@smtp.kernel.org>
References:
 <GV1PR08MB8497422B7A44424C4968AEC1C5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com>
	 <GV1PR08MB8497EBB43F4FFDECC7C8854CC5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com>
	 <20260912225158.CD7EB1F000FF@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44app2) 
X-ClientProxiedBy: PA7P264CA0109.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:34c::10) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <f54aae72283eda89a2cbc6a309ab2ffb0ebf11be.camel@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|GV2PR08MB8341:EE_
X-MS-Office365-Filtering-Correlation-Id: 58084a87-02ae-487c-cd66-08df1320e527
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|25010399006|51005399006|24021099003|15080799012|19110799012|5072599009|8060799015|23021999003|6090799003|37011999003|40105399003|2607281247196008|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d1ZyNFVDWVpzUjZGKysyZVB1MnVuOTlSZU9Gbk9FdWUrcVBGWEN2d2tDbUts?=
 =?utf-8?B?UUpTM2VOZ1g3a25mZm9LVGlabk5MeHM3a1NsM1BVNUJoQUZsS29tNUxOOFBJ?=
 =?utf-8?B?bmQ3UUJaZE50bEJPVTFKMGV0N3hRYjFLdzV1Wm12M0l0bTAwY1JwLzF1NDBN?=
 =?utf-8?B?SmJXRlJCNWZ2cHBDbjdCMjIrb1JCeERSZHNLVmQzWmsvdHoveUlhOHdYNlJ3?=
 =?utf-8?B?UGdMZ2g5TWVHbDFKSzJNT05nd1pYcDhqVDZHY0dRNEV0NGd0V2UvWkhWS0M0?=
 =?utf-8?B?V0hSaFp1NTRCc2twL09NZTc2NXgweGo2eXEyekFsWUxrZDREOGxhdVpzM0t6?=
 =?utf-8?B?SXlUY0MxSk56SkEzOTU1OTB3MUlNR1pLdmxDTG9oRnBkZ0RreEk5VnlFQlhz?=
 =?utf-8?B?K3lOWXE4SjVoZHByT3pxeDA1SVBmaVNqZFRLd1l1WFovU1BZaGpLellzYTBM?=
 =?utf-8?B?UUZ2UVlVVysxbEJjRWhaejVEbjkzNThuekJzc281ZFJ1emlJSUw3Q05oZDRH?=
 =?utf-8?B?dktDc0lGWHYyWUNpSTgxaHMxZk9wVWM3dGNScWhVNmlmQlI0RU9JWUc4V3d0?=
 =?utf-8?B?UDlpVE1VbUszM1JudElRRkFVOUc0cE10RnBOZUhqYitGczJpY2hxRDZGYWNY?=
 =?utf-8?B?cHJXb1dOUlc1cE4zalZ6eHovVklpL3c5Y2drL09OTEp4MUpHcjVLcWJsVFVr?=
 =?utf-8?B?QTViZ2pUOGNFZjRuVXpCT2c3eURsUWdlZy9DL2lSN004R29uZkpDQ0xzUzNo?=
 =?utf-8?B?Y2EvVGc5R1ZDaEdDRFdyNFVIcHBHM0ovcUlDc1hUZVk1dG5KNG16TWZRTk1D?=
 =?utf-8?B?bEg5dW5NeFdKbnY4aGpBbW5YWmI3Ynpacyt1dVhMcFhqWFJMZU96dVJIK21X?=
 =?utf-8?B?eW0zcFBhaGlYQnJiaE85NEFud1gwUEx5UWJnZVZnRGF2ZE93ODdMbjlIbmFt?=
 =?utf-8?B?OW1yb3FQNzFRSWNGUjRZcXdzVGk5WGM2QUkrN2REMkJSMEE5N1RaMjhsZW03?=
 =?utf-8?B?Q2RSWnRFU3owdjcwbTlwekFzcXo4bURqSVZyMHVEWlRJeE9KV0k0QlR0OVcr?=
 =?utf-8?B?WEpYTHlZTk5QR0Zpc2xPNlZLNllxbkV2SDhaU244OW5SVk9jdWt4YjEyaGpw?=
 =?utf-8?B?M2tMTkdEamNOMU9ic3lnOFphTVdxbmtPZ04xZ3FpemU4YWk4STRHaGVRU1ln?=
 =?utf-8?B?bUhZWlZ5RGlTeDJ1eWxUNUNNMmczaTB4K0x1NTN4UkxvWmtPSUFKbjI0QldV?=
 =?utf-8?B?VGtpUkxUbm50WWhoUUc2Q3hheTlveVlZVjBvZWtHRkRFSTdxMzZFRFJieHB3?=
 =?utf-8?Q?YJF0hzTZbVKCoFubkIdVEZSu6YJE90Isw+?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b09BWHJ0d2ZlSjZxM1JmNis4aXQ1NFlDRFpydlo3ZlV3QklTeXdTeGtnOFNL?=
 =?utf-8?B?eEZwYTdHVlZudlBoZndwSCtLNGhWTnR0TUZvTHVJRGFDdlNDV3kxNC9DTWlO?=
 =?utf-8?B?Z0tOa3Q4cGpYRndPNnQ4WDBlQXMvZUFwOWdIRGM0aGVGajQ4ZURKSEowbDJ4?=
 =?utf-8?B?dWQwdUI1M2RVa2MyeUdkdmNqNTB2UFBlaFJtUmN6am95V0N5UEh3L2c4NUls?=
 =?utf-8?B?ZlJxMFpLb3VJMWZGbEF6WDNYQ2FlYkw2a01ONlpTdWVVcGZ1OTM3eEgyK01z?=
 =?utf-8?B?SVk5RTI0VGRrSzNFSG9Vbm1MeTIySllhaFo2VFNRdnIxeEMvSFEwMjZPaXpl?=
 =?utf-8?B?cFhIR0VDWjNmRzJabURheVBDMmdEcERjNGU3eDB3byt5byt0bG1WYVRBMlQ5?=
 =?utf-8?B?aU13MFl2UEUyTUx4STB4Y1pGV3gxUExhTHlBMDg1bHVJN2UvOVpxWUZza0Fn?=
 =?utf-8?B?R2JMbWF5SE9pWTR4dHV2UDFCbGJtTnNKUHBQOXB5UUk5RFpXM0Q5NU10SmRo?=
 =?utf-8?B?a2l2ZEtOQnhQVGlYLzRZS1UwWmJmTFFsamR5cm5oSkRkN3dPOERSK2kxMlo4?=
 =?utf-8?B?ZjBSdFMwMUN2VUNOOE9JdkN3ZGgwQkl4NVFCTG5pNE5mSFRtbjJSVFc2WG9I?=
 =?utf-8?B?Sk9TSUFra0I5bVdGbkZPRVhzQ3loTmw4U2thUjI3eENjaWpyTzlpeXhBWTVH?=
 =?utf-8?B?RFFGNFJQSEVmTFlQN0ZaM0dFNEFJeWg0d1VFUnN5YWlyLzZydkxTTEpVU0xn?=
 =?utf-8?B?eUpqK1ZxNExVanU1dHR6RlBHV2Mrbjhrd3p2OEc0SjRQaGxTQzZacVY5QjNZ?=
 =?utf-8?B?clBEM0ZKQmh5NWpCS1FnejBGZm1hVFpLQ1N1cWNFa0NDZUs1S3RQQmFDQ3pV?=
 =?utf-8?B?OU43QmpBeEdZb0o1Wm9NKzRtekFpbU5vNnc3d3ZsckJLdktXekZHVmY4cUMw?=
 =?utf-8?B?ZGUvdW1WZ1cvTDNpK3BjTmxLLzJRYTlPRCtjQ2FZc0JuTkgyc0Qwd0l3MGdp?=
 =?utf-8?B?eHJBOURJQjkxaktjeXQ5c2l0WWlHc2ZCNVhIbmZGZFBBY2MwWklDK3dSR0hB?=
 =?utf-8?B?OW42eEZWV2xHUnRNYnhxYjViSStPdkVud2dQWktnTlFxWVRYU2EvOUs5eXpl?=
 =?utf-8?B?WHAvSHJPcGU5VXVIbE0ySTVTSFVnSnE2ZzErdW8wemFlUXhFc0VOYjRCaWY0?=
 =?utf-8?B?b3NKYkkxQ2FqbUI5UFRyZFZDV3VDQklrcjBuZGsvSHZ2RiszSkFNdWpCSGl1?=
 =?utf-8?B?bUY4cThUMFhNamQ3dE9JV3Q2TnpUM3NFNXdmR2FDM0hNdnJ0OFFkeS81N04y?=
 =?utf-8?B?U00yc0pIYS9PMDRTR3Bqb1FkTkxoSWdoeXJtOEZVWkNJeWxlcVVFdzFnMllI?=
 =?utf-8?B?UWdMK3hOOVNCOElEOXBlaGJod2ZiQW5PZ3JLWkFUQXh2ck5RWVJDdWJhaFYy?=
 =?utf-8?B?ZEF5Z0U4c1RjMk5SRnZma1h5a1ora2pBQWxUTWFDL3FvaytpSE5kS0JKOXJy?=
 =?utf-8?B?enRzdlJBYXRUSU1rT3BxM0lka0ZSV3hCZnhPd2EyaFd2b09XYUZSWHpvZXdN?=
 =?utf-8?B?Qm5QdWpJazNaQlltWHk5SWVSdWx0TnQ1Zkk4NTVpS2pNY1VGLzl0UXhWSHV2?=
 =?utf-8?B?Wi9Za2RueWUrYVFZdEhSTjVnaWQyVS9aQnFsRGdKS2RVL3RtTnprWDluMTZW?=
 =?utf-8?B?NDQ0ckVleFoyUGNRYVJLUE9aekhhWERVbHhrRURaQzJZRzdCbFJrRDlmTlk5?=
 =?utf-8?B?aklwTkNBaDIyelNkeUNXd0NrMk8zUUNZakdCa2tLUVQ5TFN2WW9KSGN1VnYz?=
 =?utf-8?B?dzdReUh6aHR2N0pFcE93QjhkSkRHdGxDMXRUdGtiSCtVTlF1TS82QkxncWUy?=
 =?utf-8?B?cEFBdTZVanNma0E2ZkZ1dDE5bkZHTURIVE0zT2FZRlZMWEYwOElDUGZ5UURV?=
 =?utf-8?Q?3vlHG03ZnlKJvqDsrKAnrtDqBuzCgE6H?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58084a87-02ae-487c-cd66-08df1320e527
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 12:00:11.9940
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8341

On Sat, 2026-09-12 at 22:51 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider:
>=20
> New issues:
> - [Medium] Race condition when starting the hardware pattern
> sequencer: the base current (ILED_REG0) is written after the sequence
> is enabled.
>=20
> Pre-existing issues:
> - [High] The hardware pattern durations and execution sequencer are
> globally shared, but the driver allows per-LED independent
> configurations, causing destructive interference.
> --
>=20

The comment about the channel current being written after the sequencer
starts will be fixed in v2. The current is programmed before the
sequencer is started again.

The sequencer and its duration registers are shared by all channels.
This is a hardware limitation, set aside in the cover letter as outside
the scope of this series.

--=20
Manuel Fombuena
