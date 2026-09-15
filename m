Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazolkn19012008.outbound.protection.outlook.com [52.103.32.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698A84A2E19
	for <linux-leds@vger.kernel.org>; Tue, 15 Sep 2026 11:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.32.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789473522; cv=fail; b=R/bFLj6MReT1UjaeoHMRyF6Ohbd6Y+oVHkm+GlJbk0g8iYDmSk2eG2LCW+e7deiK0OfFfcBW58xSnlcHD4iR8OFQZE+4Trs0o+kM9smnjdMUtF2wQjD3vNgABk8mCALdp73LkSIYywu+1os7Lj7jBjqpst6S56nwOIY3auiW/9U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789473522; c=relaxed/simple;
	bh=rTwp46ItWzWXMskD4o02J55p9reEv3u/Kj4M6pP2I0k=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dfWc1Dlnb4iNAkPHnrrdwX9uXREHCRXC2ZgLAUjmjNzEonhpRUmmMpMIEl49bQWSp5sz410NtDiWFBmKZm80MatPf5BIg+CJspUQjp1ucAw7rxcGE/1PnKBhwaxaHDDmGG5TR8LzPk+RtBbKp4lhSRAwkveeYN8O01dOc8wnLpg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=T2k3JBTC; arc=fail smtp.client-ip=52.103.32.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="T2k3JBTC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fSOJsGvuxGx2/modQ0OeK4PTqt27lf7HQn5YWkNjbOtiRdJPGLK/28RaP/gO35VbmRBnKajMmp20RBYxTrIi8VfMQXx3aJDw7oL2dTwARdZJzEy0oeRVWy96IfsUg2HNUHYDKD90OcqehNDpXASYgNxl57zqni6wXpBfTIPZbXnYkt1jrwdAzbCRXc1PfFBxbcJIHkYPPbNwJptubpJbOV/E5ooSHtWP/5DagS+Cw8i+lGObKNAV/Za+LRvYEzO3U0QsEzkMYC/Kh3hcjVDJ86jBtHak49vDbTSFaRqns+fgj7XSD+0j/z8QcLQKh1Qyrcux/y5jzFQuik6ziUBK2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rTwp46ItWzWXMskD4o02J55p9reEv3u/Kj4M6pP2I0k=;
 b=HZzOHrjOC2uCaGkSeHDxDMlgNFAJw7KPg68pusKhjt7KFSMQ65L1A8D98ZnJ/3fLMm9cocQ1nJBFluSpjNoj1W5KmULobKgHGqXzgtpKOG5K1/OBD2eNQEJvUZYfEaDUmMxhIaOVMlayso2JUG5XnZfboXt4nCL7gUaPwPKrHlCnWS77lfY6kCHc/F4OKOlqi7JRCwdAvl0cm+3an1rasBu61CFP/oKPv6UoXLdQc+voIeJDxcotidVH4+iogDCACb7WqG2+eZDVPXRW+PIwayRHww8KRHb8gdKUAm56ZVEu+zA8lx7yGBNTtDpGwtA3Rjhegn0wcpl8E4/3raL2CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rTwp46ItWzWXMskD4o02J55p9reEv3u/Kj4M6pP2I0k=;
 b=T2k3JBTCAOsF4QT8mM+5GtApBywwTnTQwYExopVh2rrW1LizwerMTQ88yH+HxJZWQ4yugKsAIieIPKNRdkUaF8IJdxHCnNNkVxHqQhbUDoECFnqDzJXLoxQnPZOKF7rU+Gid9j7VZp8JQ8rRzVMCL4FGauV86ZhNLOO8WxDNLNaNUQRdTV9/vJN+zhrC+3dOCCPhjz1SaM0StHci1iAAwCAEbBzALKQiqxYNsJhKR8OMY9xM5l4DRJJ3DdO1BWM9odGaU/yrxIlr412Lpd77Yx52ynnT+endC9DjyKTTa7efIL5Nv3M2T0jR9n1YgMpVOxRNp48fKGx22/bzI1YMaA==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by GV2PR08MB8341.eurprd08.prod.outlook.com (2603:10a6:150:bb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.8; Tue, 15 Sep
 2026 11:58:38 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0428.004; Tue, 15 Sep 2026
 11:58:38 +0000
Message-ID:
 <GV1PR08MB849752E9D5B0FFCFA24BD7F6C5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
Subject: Re: [PATCH v1 01/11] leds: st1202: Correct the name of the
 prescaler conversion helper
From: Manuel Fombuena <fombuena@outlook.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-leds@vger.kernel.org, lee@kernel.org
Date: Tue, 15 Sep 2026 12:58:36 +0100
In-Reply-To: <20260912225107.509BD1F00893@smtp.kernel.org>
References:
 <GV1PR08MB8497422B7A44424C4968AEC1C5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com>
	 <GV1PR08MB84975AC922A0F9308A5A45F1C5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com>
	 <20260912225107.509BD1F00893@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44app2) 
X-ClientProxiedBy: FR2P281CA0149.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::10) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <36197459ae600ea98602ce3eed710cb823f36eec.camel@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|GV2PR08MB8341:EE_
X-MS-Office365-Filtering-Correlation-Id: 0deddd1c-e835-4ec9-6426-08df1320ad21
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|25010399006|51005399006|24021099003|15080799012|19110799012|5072599009|8060799015|23021999003|6090799003|37011999003|40105399003|2607281247196008|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dUFaaVJoWlBwczgrU3lTZ3BqaUNWb0dCL2wzN3Q2UVVTbmswSVo4aXBJT1cr?=
 =?utf-8?B?Wm5VbGtLYjlLTC9VVjhjeE9Fd05nZ2tEUDZCQWhxWitaNGt4OG5hUkxYWnBS?=
 =?utf-8?B?bkw2WCtqSjNkNEQrTXlpMjhqMUJaL0JvOFlzaUZ2WkY2MStXd3Y4Q21RZTBZ?=
 =?utf-8?B?RStuUElBN285dXYrK0NVbDY0c3FtZmVTUVJxeldFRk9ZQis1NHlpcVZJWU5K?=
 =?utf-8?B?K1ZmVEM2aFRBbDdYdkhPbEgxYXhyeTRiMm1aQ2xyc1F2Rnh6NC9Xc0VjRjFZ?=
 =?utf-8?B?K1A5TVRMQ05odlZDNFF5MklEaFhtTXlIclNpcUVRZFZlQThaWmk4MGtLQlJH?=
 =?utf-8?B?emdJRnp2T21PVXJNLzVSWmVJOU15KzRqVGRHNWUyaGw0Y2ZERnI4WEUrelRC?=
 =?utf-8?B?WE5Hb21hQk00bE9ncGtjL1hSOExraUUvamI4U051SEdVVThkTitPSGRYa3VR?=
 =?utf-8?B?dTk1WlV4T0cvK0tNNWRFWWt2OXFTODdsbk9iL2s1TkN4M08yclhMNlJ3OHI1?=
 =?utf-8?B?Wlk4TDNKMUNPL01IQm1CTzJPbXVkMlpheDZRNUgrWDVVVHkvWm5sL1ZENUVK?=
 =?utf-8?B?VzhXczFpRGJyNm40QU14N0tPK2Q1OU1RZ2ZUQWFPYnRLUWxzeTA1RkEvN0Vn?=
 =?utf-8?B?ZEdReXhzTFJKZXp6cFp3NWlJYkZNWjl3Vm16TnduUncxUXREV29kSTROWXFm?=
 =?utf-8?B?bVVZODZkT0VqWGpzQmlwcWJmYUVIMjJQbmtPMkVTcGZlZ2lBQmJnRmN3YkxX?=
 =?utf-8?B?L2ZUWm05L29yYmZIWEtXUGxyeUpVVU9TbndkY0FhQy9SZitRRDFmSlF5aEFR?=
 =?utf-8?B?b2tvNVlSRlVnTi9ZTEZEc0NFZlV6U0RKdk5iaittVmZGTFpLZnFCQzlPeXRZ?=
 =?utf-8?B?TUtYWDh2UFFZUGZaQUtwVE5lNnZBTmFLNG5ZMm16am5NaW1zUmZKc3YrMlU3?=
 =?utf-8?B?dHZWUGJ0eGZZbXdDVW5Lc1JGVnp3bDhyd0NnQmdlcmIzamVTSFpoZFVleURG?=
 =?utf-8?B?aHpPc1dsbi9GWWVkVFg2YjljakZvQmFycG5VTmRGbHZTaFN4dG5TczNrd1VS?=
 =?utf-8?B?eC8wN0JIbkUzcWdrbEp1Qks1dDBRRXVoZTVNUTFERFlMc1l1dlVyNkJSeWFK?=
 =?utf-8?B?ckpYTEFGTXRKMTJ0ZWhHVnRlSmZ6RUJsVHdWT1JxTE8vbVZ4UnhXTy9IVFA0?=
 =?utf-8?B?bWlINnllOFJBOXAybUVyS1ZUejBIR2FleE9aUmVDVHZXdklyR2NHQ0RCdHhC?=
 =?utf-8?B?NXRYWDJveXUzeTU0YzhSZkFmU0lZNUcvZ1MxTXkySERnVU1pOVplRmZNaURT?=
 =?utf-8?Q?xA/AFokV+FQFqYckFFVdVEDOoT5CSEs6nC?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z1VtRTFGWEV2cHc2MGZZZE9xaGlMMHNYRGtkZVhLdGhsRGR1V21DRDVIT3Jk?=
 =?utf-8?B?TjlESGM0Zld3MDU3Z0RyZ29nY1hQSHdBTXE1NDlML1Y5OVEyQXl3dXc2dzFI?=
 =?utf-8?B?VG1IaUQ3ejNiNGh2L0piSjUyZkQzTHM5ZXRpUEN5eG1VR21rQm44NzVoNFQ2?=
 =?utf-8?B?RU9PWCtjb1JrTHVzZGFwZlFxY242OGVxaXlnWHRwQmF3NWwycnlNQlJKT3JC?=
 =?utf-8?B?UnF6N1JPUzY3SlJRMVNzaFBQNXFjNXMrSDJFZTJRU01LaGpyem9KVFVEU3Rs?=
 =?utf-8?B?cHIydzdNTVVkVjNIWlgxSE85Q2IwWHVXdjUrUTVJWFp1blgrbG5ETzE4RU1S?=
 =?utf-8?B?citOeWsrUm9sVGFPWWpQcXZaV2JiR2YzS2tzem8zVTN1c1lRSHJCckN3dVNO?=
 =?utf-8?B?N2hKNFpjQzd0bWg3cDlLTHNCYUJYeTlhbFAvQWhZNGRUVTM4WW9nMkd0Nktn?=
 =?utf-8?B?Q1lDZVNLdnRPeXUvdVlWRjZtbmhnZlAzSnhsc0JSTHpSTFVJT3hWbHdUalAw?=
 =?utf-8?B?WkFKZ3piR3ZNNmdyM3JDU2tJMkNwcDdkV0lUR21wS2dpSFJHZFNzeXVOV01D?=
 =?utf-8?B?Rkh0QndwMUsrVUdWeWJpeVNLSmxoWU5FdHZaWmNER0RPVTk4b0dSRnp1cSty?=
 =?utf-8?B?ZVN0Mm5ES0Zwd2pUY3I3SFY4cTdqbWFmS0gvL2NQUTRkL1d4WjNCRnc0V2FW?=
 =?utf-8?B?QjNWb2hRa0VidWNrSEx3MHRtR0tQb1lWZWhoTHBpaUh5ckZwN0FDVUhjWnpF?=
 =?utf-8?B?QjlWRmVaQlhvQ0VnYVZTQ3duV3NJcThFOXZhUXo1VkFlaWhOaFBvcm1BKy9h?=
 =?utf-8?B?MVpWOGFqTmRJWkZhck1BREN5K0RpQXE1REljZ1VSYU5JYUNSUW41L1dYdmMw?=
 =?utf-8?B?WGxkREhabmh6QTR5L1RMcy9nbVB4QWo5NUxSQzlmb3BIOFBVTmNJMXJBUC9n?=
 =?utf-8?B?UWNLRVJaSzkwWWhWVU5WaUpQY3NyMnMvMzZSVUpiaVA2alVxREJJajlMQzdG?=
 =?utf-8?B?U01iVHVQNmg2RzIydWJKZmM1Rm03dFhPRExDc0NHcnRYaFgwWm5SQkxqN2Vl?=
 =?utf-8?B?c1gwRzdzV0JYUjNOMG1LSnN6NkszNmE4SlZ5WTlHd2UyYU1CeGRRdUc5dEJJ?=
 =?utf-8?B?YllBY0tEcnRiVXZGVmt0Z1JpLzdsUjU5NExlb1U0UlFPeCtKYXJJdWtoZ3F1?=
 =?utf-8?B?VmRQR0ZXR0dyVVZnU1FxTWNQYkVGSmpWbGJOZFh3bHVVa2lYWTJOQnd2b0Fr?=
 =?utf-8?B?N0t0UzlQS2FTVVBoYWRrd2orOHlXMmpPeGp0NHpWM3NBYWRUM0hScjJ1SCtD?=
 =?utf-8?B?Znd6VEFhTEVuU29IZHZZc3k1L1laQm1pZW9IRnQxL0FwZjZxenB5T3NEY1Z1?=
 =?utf-8?B?UCtvNVZsOHR0TUpRa3gzamlwbmNlWTFKOHA1UXJXajRwdDJ3SWFrMDJjMDRI?=
 =?utf-8?B?a0syVnBOZWtVYXAwRG56RWhvKzJyNkpBR0hjZGRQN1BuWFZ6WFFOaEpQN3JE?=
 =?utf-8?B?VGdlaXAwYmxIZm1PVnZ6T2dwdkM4WTFyVUpFdERKeDF5Q3E5allGbmNMTEl3?=
 =?utf-8?B?MlVScVFyMzZpdGpRRWdSbVo5NjA3S1hSbnZ5cWpFNkJDQWsxZnFoZlVUb2FN?=
 =?utf-8?B?NmpxZTQrMG0rVFNiRUNJTW4yelZ0dmVKd2pVTS9BOTdhK2RZN3FYV1YxR0hp?=
 =?utf-8?B?SDBkNm5QZllGRkcycFMydGJtcGgrZlpmYVpTMWM1MUdRcWRQVzNCaXRvdHZt?=
 =?utf-8?B?UEV1eXJ1NVZyT3AvbjNlN05sTThiSGxhbWJYY2VQNW0wcnR6K2hUTEk5bDV2?=
 =?utf-8?B?OE16bERZMmZSQzVzMHhJTUwwNDFPMXhma2dKMVQ2bFI0YklFNXA1V3ZPUmlT?=
 =?utf-8?B?T3Y1N0RNMStYVnprQlU1UlczMHBlZFlyaHdsSTdtamwzWWFKcitWQWZNYnBZ?=
 =?utf-8?Q?uWwYLz4qyPkr7t/Ik8pOJX/QBGoJxF9J?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0deddd1c-e835-4ec9-6426-08df1320ad21
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 11:58:38.4415
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8341

On Sat, 2026-09-12 at 22:51 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider:
>=20
> Pre-existing issues:
> - [High] st1202_blink_set clobbers the state of all other active LEDs
> on the same chip, unintentionally turning them off.
> --
>=20

The st1202_blink_set() comment is about intended behaviour, as answered
during the blink support review and described in commit 35cbd34a6a05
("leds: st1202: Add hardware-accelerated blink support"). Once a blink
takes over the shared sequencer, other channels cannot keep their own
timing, so they are kept dark rather than outputting unintended values.

--=20
Manuel Fombuena
