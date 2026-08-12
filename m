Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazolkn19011037.outbound.protection.outlook.com [52.103.39.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C26D3655FC
	for <linux-leds@vger.kernel.org>; Wed, 12 Aug 2026 20:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.39.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786565132; cv=fail; b=g4MV3/AhLeB+l/0il/bsyr7swZSPllFU7lyMxqVtWigb61MgMj9vuxKLLVwnCAhWrY8XmQe3Y7NgxowH9/LmG3MRVBC6pUtlbcOyPuSb+CVkcLlpTc6UUWRvsY4eU/saEEdcVzZqe/Q9mXuay5r+q/2mtzSkMtAOkUF4IF1VQf4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786565132; c=relaxed/simple;
	bh=8IM8MjNmNw2RfX5FOJcNYogLDLyyCqb5YkAwCj5OBUg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OLZyQeNwFsA+nTYWCQFTX8vPaUfyxSluqAe3RCmDg3yyJV8uOwybqpuw0pB5PWE5cP/bceSR5hQwxbD9QGwRdL3FIwIPeu5s0BN8wCr3kB3e94iKjUGx8iLoNSy0tim2GS0iXksP9LFSsgb1J+uIIMUcSBFyp/Gjv3me8gdtGJM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=qBs4MWQe; arc=fail smtp.client-ip=52.103.39.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="qBs4MWQe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=crRkejB0LBOftE2q/H0VZnSDYldatntBCQ2u+06ukPzrI4SeaWEmzV1HQtTNOm5Ait1KVwqCeyHRxLn6ZhubgM1ljO9MQoDPwyBos1X5vFPBMCFYT+XmOrk5UGpd4XS7bKD6hVx+5lSxfJja8la53ZLfYApcAWjFsk1+BaiviCL4vQzSMunrSBNgSMUpyCIBQ0J+Ab8viimGkB2GH9fWXO2bNh/aaeCTyN7DLU/1jE7G3/NCrb+HiMGmHMaTXs0DFt5o4lv+zwnd+Ni5Mx05YMTQDz8fVYH2wqSOAR+jrJj9DthwH51BbnZzSAZA0rUhmxh1JxIbsAFQTyt7SUTmMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8IM8MjNmNw2RfX5FOJcNYogLDLyyCqb5YkAwCj5OBUg=;
 b=ezvgAiXfvIsLSTXkuIKt5T4AFspOzpHa5IM8g+pVtPYpRq2BdYI5fIEnp0q3izLYyaE7mKz8zN2XLoQGXwpxMceVt7Fw0OagxkApQsbBth+j45qmS/Ha9/eIJ60C24kikJ//F2tH3LtHzjHTrJr9Ly/fz8KO6peGL7QhfRrFFHY18RnZm/R9Wkur2kbsM8cQk4IHbVg73RrJusHGOREpIxIgvtN2QOjt3VmmNHapQStuZY9yfpF9iVvUXVBAGu2dQ0TpRYc0z+fmgpC/WTIBjEeDtnUX+fmTBfduDCu55GpdqNt0DN1nDrHHQxHhA30AvtunGDTGWrowjhLnrn4JFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8IM8MjNmNw2RfX5FOJcNYogLDLyyCqb5YkAwCj5OBUg=;
 b=qBs4MWQe9+HrJ6RCXjOF/Ok4HTHCs78lHoJzWzco3I9eGbNNJiY9FTbXYY+q/jSk9pxsiRjnZhRb7d8XioGpgsStdhShuPkpM3jLEFUBAw6wCyoymbqETp1bP/KsWVGLQNF4MzTpRnP0oSGC9RgSOLVKP/MILkBKOthnJjVNG4NalQgsFX26SrfkhxBiGdO4uLujVAiZgP70/ERHSf6/RR2ug6O/Rjok61jE74O4g5uaNqRxPl9dEToE9hGxlDTkzspou80zFW+/8yfnuneAu+KHszbUKjF98XgGuZ4ti8mGmoYCinUB5c27pfdWstqdygQ60bvYmfUOXa1CuQ2UIw==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by AM0PR08MB5505.eurprd08.prod.outlook.com (2603:10a6:208:18e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Wed, 12 Aug
 2026 20:05:28 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0315.012; Wed, 12 Aug 2026
 20:05:28 +0000
Message-ID:
 <GV1PR08MB84976832749693A341CDBC65C5DC2@GV1PR08MB8497.eurprd08.prod.outlook.com>
Subject: Re: [PATCH v6 1/1] leds: st1202: Add hardware-accelerated blink
 support
From: Manuel Fombuena <fombuena@outlook.com>
To: sashiko-reviews@lists.linux.dev
Cc: lee@kernel.org, linux-leds@vger.kernel.org
Date: Wed, 12 Aug 2026 21:05:22 +0100
In-Reply-To: <20260806174250.1771E1F000E9@smtp.kernel.org>
References:
 <GV1PR08MB84977DA9A154D7186B6EA2CBC5D22@GV1PR08MB8497.eurprd08.prod.outlook.com>
	 <GV1PR08MB8497362791595D5C0197701DC5D22@GV1PR08MB8497.eurprd08.prod.outlook.com>
	 <20260806174250.1771E1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44app2) 
X-ClientProxiedBy: MA3P292CA0035.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:46::14) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <c39e4f77461bc98b943f1558e47e24cc6a6f62a4.camel@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|AM0PR08MB5505:EE_
X-MS-Office365-Filtering-Correlation-Id: ee8532f8-2de0-4a02-0a54-08def8ad0c82
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|37011999003|6090799003|23021999003|15080799012|25010399006|8022599003|19110799012|8060799015|24021099003|440099028|3412199025|3071699003|2607281247196008;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q29lR2pFZ0RUWDdaY2ZGeEJJQ2UxNVBMNzhyK0R3VmVITkRscUtCTWcvUVJ1?=
 =?utf-8?B?MUF4RlVEMnpnZnY2Rml6RHBWQVM4VDFMeXh0eUltMGk4Q3BQZ3laTFZhU2Y1?=
 =?utf-8?B?OExPU0NldXRkSlRneUlwNEkvYUxrUTM3MUZZNnN2OVJMVTNPMUhBL3gyckFX?=
 =?utf-8?B?MGo5UGxIL2JSZDZ2aVJGRngwOWI0U09DK1pZWEw4UWhLZXphNloxdGFydHpx?=
 =?utf-8?B?VmVXckdnb3RTU2R2UUFtYUFMQWdFOWE5aTE2Ukd6dkUzWFR2Wk4yWk9UV1ZK?=
 =?utf-8?B?ZHZGcS96b3hOai9KNFhvMVNZaVBzTWc1SUlFV1JUL1B1ZW5aVy9qZm1LZWNU?=
 =?utf-8?B?SWpOaCtQY21reWMrNzhSVHViMFhSN3pRWVlFai8wMmxTK3pDS2UwNG8rb2Vs?=
 =?utf-8?B?aHBBeXVjSWVnRCs1clBMV2NWK0tzQkRQYkJQMkl1bGtjeFRBUElFbzlVOWg1?=
 =?utf-8?B?L3YweWxXbmhjOCtWUmg3T2tpTUE5Z053MjNzQW5LU2pPRlc2Mld3N2FubTJV?=
 =?utf-8?B?Yld0SHp1Y3k2R0VGZzdDdHlFL0c3VWdHRUROb3BXeTkxYWJYREJnZVIyRWE2?=
 =?utf-8?B?a1ZUblcyajdxSUZONW5TRHdWc1F5Szh3WTJNUWF4MCtrdTZLNWlyTE9IbUZZ?=
 =?utf-8?B?cXdoYzBIbmtCcEVYYWVjcWlYVUNFSUNvNWRBcUVXSHF5aHZ5MDVHUHNyeGpJ?=
 =?utf-8?B?SHhZSENpY3dtTmJhVmFtQXNSWXgwaHpENFVnR1ptaUIxNkdWa0NTRmFBV0RF?=
 =?utf-8?B?QW16NDBncStzd3FIRnVqMzZaNTB1Wmc3WURQQTRmNlhFUFZXMU1iQmRRTVRX?=
 =?utf-8?B?YVBzTWNMOWdRNWo0d3o4cndIWUo4eis5TTNBQWhKejRUTFg5aloxbUFwMjVV?=
 =?utf-8?B?d2lrNUg4VXREdi8xbXlrN1hTbllySTZrWnZOVW9VbE1XQ3hraGZ2S0d3M0Nk?=
 =?utf-8?B?S3pSY3NvbGVUazJjWm5VMlhDdVVtb2ZDV0s2Yis4MDdMOXBjeEtZQ1lvSVpS?=
 =?utf-8?B?SnZkQTdHQytLODFrTHJRa1lBbFNQZURrOVhDTVI0TnQ5T1RkajFUZjlUYzVn?=
 =?utf-8?B?bXcvNnJ6a1BTZ05OVnFyZUVUdnpmMDZmUUh1QWp2b0xISnY5Yitqd09qTW5t?=
 =?utf-8?B?V3JxVWI4V1oyTzVnWlloejJGdGVkdUFoOEhiM1N6SjMrbVRoUkhXdENrbFRG?=
 =?utf-8?B?TkhNOHFXbDdPY0Qwd2pqdmtyZDlNaDcydUx2bkdWMGsrb2pUL3l0cndScy9V?=
 =?utf-8?B?dGtVa3FiYzN2aHpNUGpidlYvMUFRT0tjazlDZEdKbDRvTFUwTUxvM2RjbGNU?=
 =?utf-8?Q?T9eFOgy+en1TdNamXZDp/mqZenfLZAAFc5?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RUFJVWF4bXVRRGd5ZmFNRTB6SE1VUXc2VDloV2pFV3Z2MWlvc2JwMUpqL1Mw?=
 =?utf-8?B?R0hacEhodWxTeHlSZ20zekg1eHcraWhqRjE5d3c4OHMwaDFwZkpINVkxbXdE?=
 =?utf-8?B?cEdWSUtpT2Y3eHIyMUZLK0Znc0ZtWExxbC9QY3l1QU1ZNkgrR0JYMU9UUDZT?=
 =?utf-8?B?U1g5UmM5cDVwYmRTT3M4ckYxU2VnVU5OdG1WdEVXSy91eVBhNm56a3RGNDhF?=
 =?utf-8?B?dEUrdk1rOU9YMHExMTgrT0tqMkJGMERiMk42QzU1QkRVUlZSMUdZUHJwM2N4?=
 =?utf-8?B?MWlpWjIvZFVzeTczb0lBMVRsWlBmZThlOUVKRXNlS0dPWlZ6eUhoNXJjaFpu?=
 =?utf-8?B?bytoTExlbmFxbmIyQzh1eWg4dFd2NE9oUk1pY0k3QXF2V0pESHZINjhnM1Qy?=
 =?utf-8?B?TU91Z1g5dUM2TTV5eGVPcVd6QmI3THp6R1hsdUF6TlN5dGY4S0EwTVo4Z05F?=
 =?utf-8?B?b1grbTZRcVc4Y2c1UHhjNlBkQ09udWlqQndaZXppMGRlVHhWZHByckpJcVgx?=
 =?utf-8?B?bUJSWlBmNjZpVnhqUjc5WVRSN3JwRHIzWHBCM3IxemMvUDYzUWZWdkRtMFU0?=
 =?utf-8?B?Mnk0Z0Q0dlRVdFQycGZ5L3RKME1PQUlKRlRDN1RaT0xHcDVIc0RMSVd4aXVw?=
 =?utf-8?B?OGppV1Jqd1d5WVE1SGY1ZGRmTmJLSmdFYVFmWE1PWldXT3BsOHEvaWNNK3Q4?=
 =?utf-8?B?U2FCUTAyRGNsM1pyVGN5Y2RpbnlOY2ZXSlVvRytrUk5KMHNHSXMyaVpudkZ5?=
 =?utf-8?B?TGJVeUhFZ0lGK25aTC9DN0ZrdGV5VE1hR0VUTGhFMi9QWmFVaEFBbkQxdll0?=
 =?utf-8?B?Q0JoRk9XMDd2NlAraUZ0ODhNNjFpbyt3dEN1WWp3NXQ3eGZ3ZGMwS05WY3Ja?=
 =?utf-8?B?bUE1ZXp3d0ttQzVBbWw4UDZ4NXlSeGplUWZTeGhJKzRCTHp1V0dLSUVoZWx5?=
 =?utf-8?B?VTNZMGZaQzhybG5jVnFOWGNpRUN2TDJ3ZFZBS2grMWs5cEk4UWg2WGtCOFJo?=
 =?utf-8?B?NWNYMlBrV0ZxTVN4K1ZqZDQwY0NVRVg5UDVzWTRBWXcrdnZOR3k4K0YrSis3?=
 =?utf-8?B?V3d4UnA0b1FjQ2JoUzdlclRTSTBhMlQ3U3pCeVFYU3l2RjhMVjZ6aHlOMDBy?=
 =?utf-8?B?eVhjZ3IvMmplOS96MHFDcktUcGdEWVpmbms2NG1INnVCOWxmM0RSNUNYUkc4?=
 =?utf-8?B?RngrMmFYTEk0ZUE5ZGNsaHF3aFNXSzk2YUFnMnFGUHJDam05QWVXdkd2Y0Zj?=
 =?utf-8?B?bUlQSXZVWmdnS3ltUDA1TDlFZ3JTVjArY21nYzgzVFhuOGNORFQvZWhHUXcz?=
 =?utf-8?B?S3FFcUpFbnVHY2ovaEo4SzhSWkZEeWlKKzJTaWVSMlRFZmUxVWRvS0RuWE9r?=
 =?utf-8?B?ZG5DWEdJdi9pU045UlQxQ1p1dmFaanQ2cXpnUG9CWk1vaE9XdzMwd2VCdERE?=
 =?utf-8?B?R0dnTFZBaDNUWWlHdm00dHpJbkpwM2lLY3ppUEZtVHkxL2NVZWZTLzNGVnpi?=
 =?utf-8?B?a1Q2TDhlaTFqaVdrbEdwVFdJZDU2REN4Si9qcEd1Rkdrc29WRTc1RktnSWV5?=
 =?utf-8?B?ZFByMWVTOEt5UjJwcStEY2dPdGdjMTRFbnV1bHZpV1Vmc3BKZ1RVNkMvVDVJ?=
 =?utf-8?B?WWt6RjViZUppelZFUWowOHdtcklFNTZDS3plbGNrY2JtZW82N0R1QTZ6RUk1?=
 =?utf-8?B?bnV1OVJhRk5reXlXUWJwUHNqdzNlWnVQQzNyQXlMQjY1azNQaTIrLzJiOTA1?=
 =?utf-8?B?UXZqUjliZk1RSVhVWkNMMHVlWjRRekg0MVpCb04vTENxQ0luaFhyWGdWSCtT?=
 =?utf-8?B?RnB6cDA4bElQQ3laRERsdFZkMXFHbjkwS1RoQnhwY0R2U0FpbDZDaVg2d0pk?=
 =?utf-8?Q?KTDp8iSoN1jRa?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee8532f8-2de0-4a02-0a54-08def8ad0c82
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 20:05:27.9664
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5505

On Thu, 2026-08-06 at 17:42 +0000, sashiko-bot@kernel.org wrote:

> New issues:
> - [High] Hardware blinking destructively overwrites the PWM state of
> all other active LEDs, forcing them permanently off.

This is an inherent hardware constraint. The LED1202 uses a single
global pattern sequencer with shared timing registers, making it
impossible for two channels to run independent blink configurations
simultaneously. When blink_set() is called, the shared timing is
reconfigured for the requested delays and other channels' PWM slots are
set to LED_OFF so they remain dark rather than outputting unintended
values. This behaviour is described in the commit message.

> - [Medium] Hardware blink forces maximum brightness, ignoring user-
> configured brightness.

led_cdev->blink_brightness is set inside led_set_software_blink(), which
is the fallback path taken when blink_set() is absent or returns non-
zero. Since st1202_blink_set() returns 0 on success,
led_set_software_blink() is never reached and blink_brightness is not
updated by the core before our callback is invoked. Using it would risk
reading 0 or a stale value from a previous software blink, causing the
LED to blink invisibly. U8_MAX is intentional.

> Pre-existing issues:
> - [High] The driver improperly assigns a sleeping function to the
> led_cdev->brightness_set callback, causing a 'sleeping in atomic' bug.
> - [High] A dangling fwnode pointer is stored in `led->fwnode` due to a
> dropped reference count, leading to a UAF upon dereference.

The two pre-existing issues are already tracked for a follow-up
submission.

--=20
Manuel Fombuena
