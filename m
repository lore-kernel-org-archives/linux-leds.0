Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazolkn19011029.outbound.protection.outlook.com [52.103.33.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53723B95FF
	for <linux-leds@vger.kernel.org>; Tue, 15 Sep 2026 12:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.33.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789473629; cv=fail; b=DJszjcG1LTlPlbuWZ9wtsHEDN9MArOVO0p9j/QoTkeUOW+omoHLKjFmXd4MEI2sYlfMy/xqgwVmPuLMygIq/01MF0SvN3czYi7IwgQOxjWkHm3TeI9vWgaDj8iywUat5QU2z7RUGCQE3aTvu9tLnrJ15/KmZcqquWoBTJ8F0NMQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789473629; c=relaxed/simple;
	bh=YhQlEAeb1b8iOajcZYWJBkJygmLA/oNfb64ej1zOYvg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tdK1hGItkbnRACm7a+Mxj7fB5DUc5gnmsQIs+ppFQNcPOlGD4Smy1tQv/VZVdYzFvI+V3HTSSThfZHi8aI1885XWbFVGH+3S1koSVaVZ9R5pnuERbRUX4jB5vLEfjQhGcRcWBNpBVSuyLvqY6c4gBCI9ADzLqDFU+TJ6EBJ9eBM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=u+IY+FUn; arc=fail smtp.client-ip=52.103.33.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="u+IY+FUn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wbb/QGstgKLN5fuZwesvvhPvg3z3mUOy2CMUHw27F8Nft3863diMvXSEQleJKKQazfmglxZillQtY5bhJZuQZVCUtxf/HvuuOmzMF1BbMuiBpIDa35BRJOH7JHzd6xam0a4wOF89+GiDAX+VAOoZ3Nx1iN+zcDgR0eiqvqcen7BThai3k9jfMkOpZNycxpro+wIxoUarEBIj3l92dc7QO8gZ+asjcJlag5GWvPfrdK3I+JpFzosaCcmEWuzPXjaVywJ8UxMINzkd9mPfcDf8PofWfbuKdzUsr2RJEfKEODlBXAZkEF9sS7MX0JNglGFz6NcKrkvmcs2Eki+M8po1mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YhQlEAeb1b8iOajcZYWJBkJygmLA/oNfb64ej1zOYvg=;
 b=GWVgyRMXuLFhED3tfA3Bew7BGW19qbO6oYiTYGzizOQAYMRbpLMOr+Aq+n8zygN/HLdOj3Xat/Qzajhc2WGDezPYOlp5vkduyFYnOQRKaEH7SOtGQpq7BMXrBKIH1BkWpsbaS4VRzI/DXnoAsPyov3oxyLJ/634TJ0b0XpjrQlhz8ncYSDruw6jXuqyZ8j0J1yl3SVV8cNYN2AsvRcyGEdTfVCgfKmoPtAk1PWyzddFfMjDYNTfH5zLA9Z9PMON30sUz7GlU+ZjC7kU9HqUly3uNoZcVISHoYn6xH9BOgX+CwpYj8v3F4vOBQmLdLILbbET68xOU96dO5nlb4nqD7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YhQlEAeb1b8iOajcZYWJBkJygmLA/oNfb64ej1zOYvg=;
 b=u+IY+FUnWRWXknYz9Cx2dum9NxJeVHmp3h38xRmeiL05pmZVzzlxUuGRwYjue7WEIR/n/bjfhCyhthvPyappizxj8v/0mEJkpQTRcq5X3nK+T+6awxO6Ov6Fw0rp5P60dLYFXeL+NpWMULLZklf6op5Hvj2C5PWNRCcoovL9ZDOMsWQMwWinMO6LcV4Jidk0Tl/LhkQrCke4EZ3IbqBdFFY2fxW6RhFpHtgd9TvfWRmLhFqrQmTUy/4fByxuiM0GpFmQXCGAV9hrl4yNqk150X9BpVrgxImIbcT+DDTIutT2paNN4hGDlbpr5YXIjhJ7lX8ZHBmdpgaSrVn10FzW6Q==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by GV2PR08MB8341.eurprd08.prod.outlook.com (2603:10a6:150:bb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.8; Tue, 15 Sep
 2026 12:00:22 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0428.004; Tue, 15 Sep 2026
 12:00:22 +0000
Message-ID:
 <GV1PR08MB8497EC93A5621644F0630075C5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
Subject: Re: [PATCH v1 07/11] leds: st1202: Program the channel current for
 hardware patterns
From: Manuel Fombuena <fombuena@outlook.com>
To: sashiko-reviews@lists.linux.dev
Cc: lee@kernel.org, linux-leds@vger.kernel.org
Date: Tue, 15 Sep 2026 13:00:20 +0100
In-Reply-To: <20260912224935.3C2EA1F000FF@smtp.kernel.org>
References:
 <GV1PR08MB8497422B7A44424C4968AEC1C5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com>
	 <GV1PR08MB8497746317561206D7C20DAEC5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com>
	 <20260912224935.3C2EA1F000FF@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44app2) 
X-ClientProxiedBy: LO4P265CA0251.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:350::19) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <545b18135597d260e71f403fe558a4d92182b9ed.camel@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|GV2PR08MB8341:EE_
X-MS-Office365-Filtering-Correlation-Id: b09659d8-9848-4b1b-55d8-08df1320eb34
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|25010399006|51005399006|24021099003|15080799012|19110799012|5072599009|8060799015|23021999003|6090799003|37011999003|40105399003|2607281247196008|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YXJ0VmZ3NmdmY3V1eHdKM09oRXpPQlcyblpzMGtUWjJjZzhheUhydU5xSlZk?=
 =?utf-8?B?VkNDTXZGZUEzbFJTekRvZ2hOY3h1SzhSK002MTBZVWhKMTd0TkxrUlZIenJE?=
 =?utf-8?B?N0EwbnRIM2VVMjg4MkVkMlozRTlkOThrTXRBd1JFOS9zdmJPTGRKbmhpOHpC?=
 =?utf-8?B?dlZNQnZqOUUvVVFodmZpVGhLUTdWcVVOZXlPdmN3TURWZ0pQYzVSMEZKRlpR?=
 =?utf-8?B?VVptUXZvUnB6Y3cwR0N5V0pZM3MwTGlGd0xIcnpvekFaNGlhL2xJSEliNkln?=
 =?utf-8?B?aElJdjZuNnBaUmdaSFFXY1FpYjJ4bXcySmttSkRTNlhpOXlTQnE2dlFuSm1Y?=
 =?utf-8?B?MzNLbDFVMDJmd2hnWDRhclVmMWEwUG1WSE14NU14QW1IWnQ3VHdrSEhDYkQw?=
 =?utf-8?B?UHdteTZlR2QyQmpyN1Y4Y3hFNU5hZHhGZUx3SlQ4b0htVjF5TE1oeFlkUyts?=
 =?utf-8?B?emd4cnFCOVBoalR0RDUwUmh3S25VTjZONHNjbXFuZjFMZ3dDdnB2ODJQYXBB?=
 =?utf-8?B?d215VCtVc0w1Smtyakt2R29zbzdjWWVQRFZVZmpqcS9HQWRNbzdJcy9wdlBY?=
 =?utf-8?B?SDlEWTdJd201QWdPVGZhcmQxQ1dBek1pQjlEUTBjNnVEcFNpcm00WkpwYndy?=
 =?utf-8?B?eEV2dHdRVkhZbitKUWVLQWpuL0VCUW9pY05oSFZhcW5tL25UQTBTVWoxYzRH?=
 =?utf-8?B?M0l1MmZIbVFoTjJJd2hHSTYyNmthQVMxTVZ5dFVYd0lWaEtIUjc0N0NTdjUz?=
 =?utf-8?B?WklyWHg1eWpRMm9zQW9YMUpNcUxNVjZCVzk1VXpjTFdoREYvdVptYmpMVGxt?=
 =?utf-8?B?Vi9XbXluQWlEaytkZ2FaWmhLdFhROXU4VFE0UUVTSEN4VUZGelhRTFhLNGU5?=
 =?utf-8?B?NElrMTdNN1laeVlTbGdGdStaaEV4T3h2bVhUUFFWS0x1bElMZStXejljN3dl?=
 =?utf-8?B?RFJ0NHR0eTN1ZUxvdG9NeUpmSXVUS0piU0JCSktlRHRZUTNHdHZTVkMwanJN?=
 =?utf-8?B?Y1IxVzB1OGVsdnZJYndod3VqeG5pUWJJTnRmZDBHWEIyam8yenBRSlBxcXRv?=
 =?utf-8?B?NzBMMlVyeFBoN1FCcm1BRVNJQTQvelJmUm1PeDE2eU95ZnRMM3hEQm13dW1B?=
 =?utf-8?B?QmJtSlN5SzV1b3N3TURKS2JHR291UkxLbHlBdFR6UXUyb2J6WC9jL2MzWElx?=
 =?utf-8?B?RDNXYWo5N0FNSlRBbkx0RVA1bmxQREVpdWk2ckZjalJCMzVEenkyWDI5L2Zw?=
 =?utf-8?B?V2ppRVI1MDlWNWhISi9JTUFQczRMOGpCOC9GRW5LUWVOYUs1R2dBVmc4d3hh?=
 =?utf-8?Q?wQCkUZWHmZjb9RDugKOFltWtspm7IpqkkU?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WjZaUDd1VDhIbk5ZampkZFNuSkt0SUVCcnhCRUNjYVg0cGxqdjA2Yi9ETlJx?=
 =?utf-8?B?VEZIZWNzTTZURkdSQ1QwZlhFcG5KRmdBUG1JRnpMbEZXRVRnOVdQWHpBZFo0?=
 =?utf-8?B?dTBBNlFPbXdPR3F2bXVhbXY2Q3RDeHJ0OXFFNHZON25tRHdxN2JmWHN0bG80?=
 =?utf-8?B?cncvR2FrYVNBMEVqWW1uRnI3VzZXYnY4SjB0Q3MrQWpoTFYyQlJoc21ramdE?=
 =?utf-8?B?TE5HMHB2VGo5eU44eUhQc1EwS2J6RW81UFZsTVdLL0NBeG16OTlGVk43NjZt?=
 =?utf-8?B?bk1EUW5pMSs5eldGVzY4cmhYanlkdUlCSk1OcEs5azlmL3NOQUVWWkpWRzNj?=
 =?utf-8?B?SmcrekJ5RDQ0QWpjUGxUSlNOVzlaOUNOdFBZd0ZmWmp2SGd6QjNURW8zb0V4?=
 =?utf-8?B?Z2dIcUlYVEgya0MyV0R5aHRZQW0wcWhTMWRabnJSS3QwcC9RNkZLd2Z5a3RR?=
 =?utf-8?B?Ny8zYXd2YnNPeS9DYjNBcVJIeC8xNzNud2MzZ0ljOGJFYWMzTzhQZDdYRElK?=
 =?utf-8?B?SlBLTzgwYVh1c2RqZWlKNDE3QVFvVEYxbWlHYklqZ3Q3TVRzNjc3SEErK3Mz?=
 =?utf-8?B?NThaVUE2V1lXcTB5Qm5lOXFSZm1XYUsvTllwQjFOK1hKanFrbFltUHc4WFdC?=
 =?utf-8?B?S1lBK1hXaWszU3lIalFZNFJSUkFpb0NhbitGbUM0dVhkeDlJWllwUnkvaXdP?=
 =?utf-8?B?SXZsS2NKQlNYc0FwRENqV08yaG5mRmtqMEFVMVdVcE43c1NZa1JDbGJzRlVn?=
 =?utf-8?B?dGZxc3BOcDh1cWhYd0l0S3FNNEZ2ZzJWRFRoQldsSU42b3ZZTi82UDNrSk9w?=
 =?utf-8?B?QnpIU3dYU2ExYnVMUi9WcjZmejBiOUxKaXAxZ292THM4eW5QcWJTZmRRdGVI?=
 =?utf-8?B?ZUxiblJONmVqV2V4MmJ4MlBZWjRVYjF5ZGxMa2xTZ0dxNkZ6N1A2TVlYejho?=
 =?utf-8?B?c2p6VWpsemxiMy9YSGVjOXVrSTRpQlg4eCswOTBCbFBpa01CQmw5VkcwZWhy?=
 =?utf-8?B?Z0hMYmcrcFlaTXV5QUVKZ1Q3VHIyRWRJQ21DR0hLVWY2TDVhK1lXalh2UEtR?=
 =?utf-8?B?aDg5YW5mTjE3eG90d2g4NDVkTEt1STkzTFZ1YzhCeDhRZ0Q1ZFNiR2RDMGpr?=
 =?utf-8?B?bW9DQldKcWJpY3B6K2tLaXQzUjVTMENGWEFUNEtmTGZJVDJZQldzMWRqdUMx?=
 =?utf-8?B?OTdSNlVHVFBYQWFWZElpcTNzTXpyMEhuQnhQS051SkRxTHNod3RzVjdWVlVH?=
 =?utf-8?B?TVBvN0VibWJQVWQyaE1sL2dKTGlFTWZ4eVR0cjhpY0I2ZE1jZ2tMZFg0U0Zs?=
 =?utf-8?B?K0UvOU9qSEw4WnJBNlFFTUg0U0g2RkFKNER5ZEJwQ0ZCaXpGeElVZWRFTElr?=
 =?utf-8?B?dnB5dzFXd1JlOXU5c3JKa24ycURjYkk5QTYzMGVjekFZTUl4R213YVZBbEJj?=
 =?utf-8?B?RGRERkJ6blU3OEZ2Q1poU25iRjNrRE1kenlBQXBuYnlpYmJaYitvK1lYcXMy?=
 =?utf-8?B?aGxudFp2aW5Bc3FEenVQRGVVM3ZWU2t0dk0wQXExY0JZSG1BNXhPakVzRmIw?=
 =?utf-8?B?RzRHeFlCaUlnUU9kRG9TWEpyY0JpcWI0a205cUk5bEcramRUdnJIV2RmcWRv?=
 =?utf-8?B?N1pKa2lTaGs1RnlSRFJzZ01jQnVPc0hkUXV5K29kTTBMSDk0eEp6U04reDlQ?=
 =?utf-8?B?NHQ3cW5Lalpyc0pNYXl6VXBJd3JIS2grVkJwQmJXS2pEVnk3UW1IcHhBemhB?=
 =?utf-8?B?dEZmZzBVei8zanhqT0dxSDhGN2F0WGRuUkRScVhJNUs2ZXdlbWVQWWtKSTU4?=
 =?utf-8?B?RG45Mnl4RXdNU3R1Q0VmQ1p1S1RBOVlOd3pPbzVsM3hLUERseExSZ0pzd0Nv?=
 =?utf-8?B?UWFrRXlkYi9qRk9vUllHWWd3Z2gyTEhHd09xektDbVczeUhDZUlCZHJTZ3hR?=
 =?utf-8?Q?ckrv7TLksBrUHtktTdt4MWr6Gn6z6urX?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b09659d8-9848-4b1b-55d8-08df1320eb34
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 12:00:22.2617
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8341

On Sat, 2026-09-12 at 22:49 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider:
>=20
> Pre-existing issues:
> - [High] `st1202_led_pattern_clear` and `st1202_led_pattern_set`
> manage the global sequencer state and shared duration registers on a
> per-channel basis, corrupting other active patterns.
> --
>=20

The sequencer and its duration registers are shared by all channels.
This is a hardware limitation, set aside in the cover letter as outside
the scope of this series.

--=20
Manuel Fombuena
