Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazolkn19013078.outbound.protection.outlook.com [52.103.51.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A453890F8
	for <linux-leds@vger.kernel.org>; Tue, 15 Sep 2026 13:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.51.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789478634; cv=fail; b=cX/o+5tpPGxQary9dag66CS6khL8tY9g8EuDjvL7y5FRVVhohNQCU9VOXyNuY/z4GYfuXHgOHC6gtpw/fVsHe+iA3rUbbbSDecGjCcbldTTr6lYuLztJTw6qdz+vEpmtg5t4VpBDjpAh5HeidGfiZKO9cBcCLeMAWMqv5DgQO+A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789478634; c=relaxed/simple;
	bh=bdQWeaCJF9MjtWgp9BZiIYFoCE4JNFY+CFkoAAoDsx8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PxajOXHiGXUfSO7QGkMSu3BKVOXj3vS64s542apB324/+bokmpJ5JtnyOBGpFP/ZLO+TPj5/cvEsv+kwMBe1nGpD5eurgAm+PRcbPI7+jnUFJX18QaTM0cR4nqWa23AJbWeMoIc9rVvWt4Cg5CjL9fjBmKRlOu3gyYR9uN2Otmg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=ndL7oa6k; arc=fail smtp.client-ip=52.103.51.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="ndL7oa6k"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cB3GgUTjQfUczJzd9IqeFaAEXLXjaWJ35nAYKA7D9gwRPzxFfx5taG6clzDboFAL/l7FFtCJByBnSnVJDdx2U2DdXuho7obf4+dO9JC2Z3+TZpcCP4s1H3eaWstFhNNbYDBs3Cp4XdoMtFVjq0wX/6kuDGlgHXtYxhHeohwF9KkRBo2MW1jNRrndb9KdKPAGWXm3YoPBksdxp1QDRguB9NeK+XSJr+lMZLz0wGpO1EliO9z9dtm8xuqJUYV0ydyS4cEP1GhnxtdneKF+oGhMRKt5Bl7GwiJ0dwzUVx9fM3bKxh+anPzYUWZo7UZtk6LQVnmdp+pyM49CL12ChFO5Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bdQWeaCJF9MjtWgp9BZiIYFoCE4JNFY+CFkoAAoDsx8=;
 b=WOwEVFnP/FVOV5E9F6Klolu6QPMehWv+EkWtPftsXyqu+G+9JCYeNIP7CL5E+Fya2cne9Pbk5ArZouHkqc3k8MdlzLJd3ypDrGDyd0RoJEuzL1dKUjJas7tT/XSNefA31N6uQG5pUH5LhQr3UmjhEUTsjp8ctXu9hoTMjw6JUBs3JDjtaey1IEPoMQu3EdzmEIMa5zgyn1I7AK9NKIvMB99a+Y/yqNPFvJz/8h5U5f4mLp8LizriLK00TcJTrGjaWFSRZHyHiUx0IdNteTqQBgvqQxqvfdXENduY6M6ZxOHfa+xw26tTTYeqmzxfk1kas5riD/QANsSxyQ0fPDPRZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bdQWeaCJF9MjtWgp9BZiIYFoCE4JNFY+CFkoAAoDsx8=;
 b=ndL7oa6kUVrjGiKLNgeXFst6BEIQho1353BtVNcf69EaSuW38bdGk4UBtpAwAvSHcaTDSaDJujJdau0OwoEUjCIN1FuoyP4Xs6oZfdUQ23VlXihc8tw/HtTV2Nx2GyZS6Cpa1or9QDyPrXHgD9h9C5S4g/wNYGW5UBu3L7gLCMpm2QUzbCAO1czKVrkd4BYjYWJTdMxSha2x9ZASbTu5/4j03ggVaz8oEwxr+16SFnLL8X2Q3S0lPRpPUZYeHHk9kIihnFko6h4qoYqJmPgwVRaG2U/LsW15jPjXD00x5s/rvYsulwAdzAeHhwoYIEqgTBJd2q6c8cGMcysyhgnOPw==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by VI0PR08MB10538.eurprd08.prod.outlook.com (2603:10a6:800:205::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Tue, 15 Sep
 2026 13:23:49 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0428.004; Tue, 15 Sep 2026
 13:23:49 +0000
Message-ID:
 <GV1PR08MB84978AC826CBE85D38E402D0C5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
Subject: Re: [PATCH v2 12/13] leds: st1202: Cap the channel current in
 st1202_led_set()
From: Manuel Fombuena <fombuena@outlook.com>
To: sashiko-reviews@lists.linux.dev
Cc: lee@kernel.org, linux-leds@vger.kernel.org
Date: Tue, 15 Sep 2026 14:23:48 +0100
In-Reply-To: <20260915130622.B253F1F00893@smtp.kernel.org>
References:
 <GV1PR08MB8497668D389D43F680D2CE3CC5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
	 <GV1PR08MB8497C60D1D2921DD0384926FC5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
	 <20260915130622.B253F1F00893@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44app2) 
X-ClientProxiedBy: PA7P264CA0294.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:370::18) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <a93b40137ce840de75ff5f7f605dc1ce2364e4e7.camel@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|VI0PR08MB10538:EE_
X-MS-Office365-Filtering-Correlation-Id: b0e3114b-d3b2-431a-d45f-08df132c9404
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|23021999003|25010399006|15080799012|37011999003|19110799012|8060799015|51005399006|6090799003|16051099003|5072599009|24021099003|40105399003|2607281247196008|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WXEyZTB3STZ4WWhhcXBBTjBMVXkzNE5pc0phWUN2dG5DZkxjRnoySEI4QlF2?=
 =?utf-8?B?K0ZYaC9RZjJpQ0F6a0F3cjRFc3YyYVcyQmRTRVhuUDRSUldhVXQzd3FLQ1Jq?=
 =?utf-8?B?aUtzdmNOa0wzWE80V01ZbFFNdnUwS3NHVmxLcWpyZW1hNFZxZWcrUVd5cE04?=
 =?utf-8?B?dTRJRzVoclNQT2kzbENwQUxZTlAxdDI0QUNLTkJFSHhYaGFRd3BDR1RRTnUv?=
 =?utf-8?B?a0FndDFJeDV0MHJYMjZZdWRWd1Iza2ZUcStiYTRieWJidW51N3ZHU2NQenRv?=
 =?utf-8?B?Z0RaanlrcTQreGt3enB1Qk1uMU02NEtySUl6RkgyUm1KOW5vdG9HVW5pRkJX?=
 =?utf-8?B?VytjTk9ETzN1ZVR1YUJQd0NUOWpkNHhEVEt3YVBOd0dDRHBPWmdUTm9hYkZX?=
 =?utf-8?B?bW1naU5wQ204Y01NOE5UcDBuaE5FL1ZjaU5VYjZVQzl5TzV5bHh6SFdUU1V0?=
 =?utf-8?B?Yjl0SkUwSmlyWGJqbHZPczdNNllOcVBVeE4xVk5zbmY4NVhVclFXdVA4dTVv?=
 =?utf-8?B?bGd6a0M3MlR3Nm40c1ZaNWFPZVBhRnRIQkVuUUs3TzJudVROQ3VKcmN0OXgy?=
 =?utf-8?B?am0yRW1VbDM4TFJZa0xFSE9sQnFCd0VmRG9aYlI2V0JnRzJmNVZ4RDQ3aDBF?=
 =?utf-8?B?czkrR1Vkd1pEV01uR1NkWFhOaTZCcHp3TzJEOTJaRlBwZTZ4K0dvUnNHZW9P?=
 =?utf-8?B?VUFIOCsyY0xBVC85SzdSaitnZG9GOVJtZGNUMXViSlNmTzdQeC91b3Y1bWFI?=
 =?utf-8?B?M1ZxVVlJdWFoZDdnWjJFQzFiamtJOWRNME9FV21UNHh0alFjWCtLb3ZTVkxK?=
 =?utf-8?B?T1p6RnBXazJKem11c3lkNEtJMk5PL3g3aC9TYWJyb1FnMlYyNkxrNW5ueFFD?=
 =?utf-8?B?ME1CZDl5bVVad0svWm95TnRGWmEyemZoT1ZLcVRpRU8zNmIrbThQdTY0M3ht?=
 =?utf-8?B?SlpaTXp4ZTRYdXVZbkpOT29mV3dwYkVBbTlsSHg5NzFUTU1LUThDNzM4TGV1?=
 =?utf-8?B?Z1ZJN2NISjd6S0VhNDlrdk1aOFk4ZmV5ajhnczVtY2lGU3VXMnZwb1dDeVBO?=
 =?utf-8?B?VHpwYkp3R3FlaDQ4TkpQeEtaZmw2U2VQSkFLZHFyS09uUVBPZEZZYVBvb0pR?=
 =?utf-8?B?ZjJiZmR2elppOTBHZlBtMDF0Zkg2Z0JYakEvV2wyeURTRU1WdHM1bFJ6RkUr?=
 =?utf-8?B?OVBMZW1QSU9aMUZ4WXNVZVBoekN0U2YvVktjd2ZQYU9iRGZpbTdDaHBXK1VT?=
 =?utf-8?B?a1dtTWxEYmhJZHNhSTFqVVdWYWtmWnMxL3VLN0pHTjJGYTEzYzlsTk1HZ1Ey?=
 =?utf-8?B?N00zNzlPM05OYkc0Qi9FNUtQc2pCb01OdFVIZ0phR0FwWkZqS0hYRVlXdmpu?=
 =?utf-8?B?SWxXS1h3SGRqSEE9PQ==?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SHE0dEdHNnlNSVd4VWFySHhLTUxkN2k2Z1NIbCthdTlIUC8zVllnZkx0MFVP?=
 =?utf-8?B?dE1WNnI0eTdyTnBTVW42eTNhV09nN1Z4RDN0UlJHYXNMS1pGTDQ4SU1WYUpW?=
 =?utf-8?B?Z2xCTEpnd1BEZExHUk1GdW55RXlOdVY3bWVDRmdXOWxEanYzT2k1dFZQT3Fq?=
 =?utf-8?B?ek9nN3hGbmFaRnNFNXpZbEhoamkzWjcwODkyZGJhWWxzVmNObFVEOFRLVjBk?=
 =?utf-8?B?MHV1YzVMUTdmbVQzK3paOG1rRTBjZXpNRnhyTDBnY2J2OXo5czVNOEtvWE5J?=
 =?utf-8?B?QU83SHRnZzNCVEF6MFJsKzZUdmVKOFdPSUh2Vnp5QnA1Z2UyN0ZscTJFejl2?=
 =?utf-8?B?T29xRFJsNkdIM3U5Q0ViaVB4OHY4MjBsL01VUmtkcmgyMWhjK3RVNXdKQWhF?=
 =?utf-8?B?dTZhTm1sVVdXQVdwZC9GWTBuTmRaMjd3bG5NaHZKWHpQR2hKZHRYYUJMc3JP?=
 =?utf-8?B?QXcrU3dTMVhBVGZxei95bXlta0xwbEtCdVQwN3E5bHBTd3FDZFdUcVd3YW1W?=
 =?utf-8?B?WUNON0VyOUtsS0tQMDZYckc2RTA2V0NzUlhWQ0FiR1NFY3NXNDVsOVFqY3FQ?=
 =?utf-8?B?YUdRQlRSemcweDA4Ty85UUJXK2wwVDRvekt0b1JzNHRheFJlWTQ4T2krV3Zx?=
 =?utf-8?B?cFZIdEp0WVM1MXJaaXlMczZZVnFzOThwdS9ZSjkwbkFRaHJ5YlQzemt3MjZZ?=
 =?utf-8?B?WUVBR0tYS0JKYWJXc3dFeVVMTXdqdTJxQXhDS3Z4MVQ4eUQxL3Z6WThNQWlD?=
 =?utf-8?B?VE4wbmtLN3BMUnpxS0tQZ1dFd1pJNm16ZTdqOG82RHJoSFBCeUpCYUNMYk81?=
 =?utf-8?B?djI3NUNERXdzQ2J4RVJIU05VajVQYkpPN2VYNXBZZFM2WnltWkU3QzlIa0hm?=
 =?utf-8?B?cGtPOE9tWWtNTndQRHZMbG44dlRUT0lPOWY3OUttNEl1MVZKSHFnTW5CZDFx?=
 =?utf-8?B?bTFLSGNnSldGMEpsdGFvSC9YRmdYQUUydDlnVkZua1hzU2RuQ2EwbVA0bUJX?=
 =?utf-8?B?bkU0ZkdkN1A4M1N1ZFRneXh5OHkyNzBTSlZpRWlVMnFURTJSaWdiQ000OXpU?=
 =?utf-8?B?cnNDaEdLb3o4UG54NHEzdVM1Nll5RTRWb29Vc1prNGFkWTh6SXo4VXF4NTVm?=
 =?utf-8?B?QlJjNk5Ob1hmSXZPM2Q4RHF6SjdjSzF0UW5SaVB1YjVWU1NpSGhpRW8yNUNE?=
 =?utf-8?B?SUhnQ1FCRmsrVU5ZcW1rS0o1MFNBaWlnUGhqTndyUjdYb25ySWtMMVp6SzJQ?=
 =?utf-8?B?dFRGYXJOQ1lkQWs0MWQxWVRsZktsaE5TVkhKc1N1aXVuM0w2ZDRIWUdNM1Ro?=
 =?utf-8?B?RWtqL2p6Q3hJVWJ4SW9EYUxNRTM0b3NJVmw2aXQzc3E4NUdnRHBkVVNTZmZh?=
 =?utf-8?B?bVo2WkFCdXZveWxCU1pEdiszMjRoSWdmUkJlOGdhZ2krMkRpVmoycDhqOXdW?=
 =?utf-8?B?Yys4OE1hZS83cmw2bm8yM2dHcWZOeWQwQzMrWG1oakUvTnpFeEtObVkvVWor?=
 =?utf-8?B?SGFSMVM2RlZ3VE9YcjN4c2NoZWRKUFlKK1lsemVuQkg3cm5YVVF6d1A1YTVS?=
 =?utf-8?B?cTZYRmljbVVjWkVRczRKV1VZUlZSN01UM3BoZlRiTVhVTGFSekovNUxuWUJU?=
 =?utf-8?B?WE9jOUdON3ZrOFZJVlhDS3VpRndBcC9hN1c3WkJCdDdQSFF4azdXMGkzOERr?=
 =?utf-8?B?a0JjRUlic2l6T0FWdlU0S01RWS9UQjZjOTVYVi9CZkNyWjduUkR5TDFZMVFr?=
 =?utf-8?B?NFJjeElmUlRtdlJrUzUxbjlUcVY3OURhWE5za3I3bERMSVBKTTBIQVUwL05h?=
 =?utf-8?B?eDlvV2x3OTkyUmN2eUVXRExCc285RGpmZm9qNjBZT0c3bFErdE9OTEpXS2Iz?=
 =?utf-8?B?bVl6dC9YbWRoMjNFQW8xelZSU1ZUTG05YVRlaWJaa0U5RnZEcnJJSERBazFm?=
 =?utf-8?Q?txHOYLJA0FsOy9zKwf2G78LTihjOOjD0?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0e3114b-d3b2-431a-d45f-08df132c9404
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 13:23:49.7488
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10538

On Tue, 2026-09-15 at 13:06 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider:
> - [Medium] leds: broken brightness scaling and saturation when max-
> brightness > 255
> --
>=20

A max-brightness above 255 asks for more than the 8-bit current register
can hold. The driver treats max-brightness as a ceiling, as the
brightness, pattern and blink paths already do, so values above 255
saturate at full current rather than being scaled. This is documented
in leds-st1202.rst by patch 6. The pattern path and the brightness
readback follow the same rule.

--=20
Manuel Fombuena
