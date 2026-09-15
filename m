Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazolkn19013083.outbound.protection.outlook.com [52.103.33.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C29D83B3BE7
	for <linux-leds@vger.kernel.org>; Tue, 15 Sep 2026 12:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.33.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789473638; cv=fail; b=JH7uOo8Kq2teyxfeiYAdNe34TCActyuxM7Q7fT/zZHv+yDOZhqkgJpcIjqFvjm0N6s72Nf7yGOsqhWqHpJCuUIEyJ32eEyzQF+rj8Gdn8/TC+geIzS8Wk0NPpD7WzpAQqDAZBWW4x11xhVSoMhuIEeFUBY7tOWix6EZIhxXK2dI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789473638; c=relaxed/simple;
	bh=VmznKcYGivVnvX6/lZyka0NqFEyh5+Z7PasSN+r6YGA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DzkXSK2s9fBfj7ooSPHwtM+OPK3/uSnUQLqjraCUJMDZ1/Tc83puNq4OlIQspGs3lKj39krMRf3wgpkQwQTJn7PDo9/K6ZslaEpQlV7xfXESx658Z3Mvu1idhgrW85VBhotv8Afh+y+m6gIMlwxrX92QNiNMt130zUGGeVvG+O0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=IeJtlzRE; arc=fail smtp.client-ip=52.103.33.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="IeJtlzRE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vxbuUqqcqNZKpNDGBOGHyJhyZbuBjG3yPMbksQbTpnrdCUybwhds4ZYoswRy/MjliRrMd2dmpgBvws049ISnSh3WyUutbmrMKfq2bWRvuCEol2vtvBLeAHysSv/88AsYyaQ6aGEqjtASnW9bwnFowp4A6UXaR2MVMaTU2mbzzo2Vw1KpBLed1EeDQBL9HAFeFS/uvLzisNv5PPlDJjJDX56InsVOkP48CJgM3TWGEyPvcRiqYpIabAsXzHgd4+ksUahxcFkaGW2T/udPCLAH6tXswYWuYKERnS0P8+pX3jz7IDBV1Es03GsZ3sdqBhDGysJBqYuMZaPBBm8OY2rgOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VmznKcYGivVnvX6/lZyka0NqFEyh5+Z7PasSN+r6YGA=;
 b=Kzs/f4sD698VH28mGFncav4VpCmXbUpHYmQ7xp1inYj1Qq5Hb2h+9LgtfeB0hpySqI45M0OKSFZ0ESv1uJRckcPxr9cR395xNwJqiqEN2jTzq/Qc86OSEDP/vPN8Qu3OwI9fKde3EXlnhUnF+ckL3CoND7OYi44CJKY7ddpRif8fug+asbUErFJrczCbhCZIE3ZJDiki2sH1TOzhHNp+J6VjXC3ChMmTZYPsPj+8q0cgw0feLFzInvaZamVxWHPg54OuJYqiiB+jR9ULjf5GgqMwmCyGbDG1CdKUvKi9GNxwRsmQYxNy+ylNaSD1/NLRUcVmd3jow5Ie5oXHbIXZvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VmznKcYGivVnvX6/lZyka0NqFEyh5+Z7PasSN+r6YGA=;
 b=IeJtlzRElnkLDvoaFnHIH1OFdi37pvexVPtaio11w0LvEN86P8uLkE2iTTqgtbg2S+yYZWtABpOkkNpRGa3zvKrVRXTeGVnFsDlyR6DtR/vryJhkfP5KKB4Zy2QMmE4wJvyEWZS9Gj9HE0IHKiGLkTqX5RSGtK1BYeTMzKAYSUw+Y/ipQ64zFGrPiT0Q3dfwuU3CrVfMHv6IFpBS3Y+RBROUW7gjAqCNBfsH1WmivlF2ifBcqqUaoqXRdlEEWt18cKwMiDelN7QWGUnLzzkIXGw6k9orCIPIzwaNB47kMECTc8vPMXjBSp2BsIR5qpDzbvMMpeve7dOg88utSoxw/g==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by GV2PR08MB8341.eurprd08.prod.outlook.com (2603:10a6:150:bb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.8; Tue, 15 Sep
 2026 12:00:30 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0428.004; Tue, 15 Sep 2026
 12:00:30 +0000
Message-ID:
 <GV1PR08MB8497FE3E16C37A9703D99E0EC5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
Subject: Re: [PATCH v1 10/11] leds: st1202: Clear unused pattern slots in
 blink_set()
From: Manuel Fombuena <fombuena@outlook.com>
To: sashiko-reviews@lists.linux.dev
Cc: lee@kernel.org, linux-leds@vger.kernel.org
Date: Tue, 15 Sep 2026 13:00:28 +0100
In-Reply-To: <20260912225128.11EB91F000FF@smtp.kernel.org>
References:
 <GV1PR08MB8497422B7A44424C4968AEC1C5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com>
	 <GV1PR08MB8497E28C8864E97AF8C6F08DC5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com>
	 <20260912225128.11EB91F000FF@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44app2) 
X-ClientProxiedBy: LO4P265CA0293.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:38f::11) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <ddef216333b0650d851ff61e3949bfa5dc30afd0.camel@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|GV2PR08MB8341:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c4c498d-8bf3-4eaf-ee6d-08df1320efeb
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|25010399006|51005399006|24021099003|15080799012|19110799012|5072599009|8060799015|23021999003|6090799003|37011999003|40105399003|2607281247196008|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Mjlzd3I2V2pBV0dicDh5b1NXT1MrNzd5SXpZVGhxRlBlN1NMZ2FlUFRGaUx0?=
 =?utf-8?B?T1BaVlc4Mm5ZTjFLcHdDalpYME5UQWdmUnU1bm41ZG5rdzdwRC9XSnFIK0hw?=
 =?utf-8?B?NENLMDdkeW5BTGlZMFFYWXFFZkVlVlUwdFNlV3VVK1VJTmx2WURsMnh5U2N0?=
 =?utf-8?B?WUJjTUFSSVpvbys5ZkVRYURyVitpM1hGNjNDSXJ4TGtKRVpsSndkY1phTnhl?=
 =?utf-8?B?T1R5ci9xN2NuOW8vUjJDeEZWdVo0QjJvZEhadXBKbWtOeUdkZy95UlNvcmk3?=
 =?utf-8?B?ZytSZ2pRR1JBOWExU2pMa2xZMm9hWG96TW1Bdk9DWGRwQjlUT3BiMkhLWElL?=
 =?utf-8?B?YUhHWmhIQllTVEQ2TDRyKyt5UGdpSmxyV29UaUFnY3IwbkJIR0Y2SVRuVHJP?=
 =?utf-8?B?bEhZcmV1WUwvSFFyQ1ZLRTZLRzlnbTJqRW5QOUIvQnFpQmNPL3l3V3Axa3F4?=
 =?utf-8?B?aDZoRUhLTnZaS3gyRDd4VTZ4QjhWc2R2ZmlwZHBrb0ZIVjc1U0QrZzlxd2cv?=
 =?utf-8?B?RXl2eTZ1UjlaaDdzUXp0QmQ1S2ZFdm5XTWhSdkJPekVnM3BRc0c2c2JiR3R0?=
 =?utf-8?B?a0lpbWVjUHk4Q3ZZQXdOQVg2M3IrY2g0ZmJ6aVhQc05TbGhWUE1OaTJuTVJu?=
 =?utf-8?B?RU1xN1pFNTNWK0lJa3E4NUpDeUxPUWpXMWpnUTRlbW42K0N2NDBnR3hsR2JI?=
 =?utf-8?B?ZzU2M1QxOGtjMWRqSU83TGVCSDBnUWlNM0xwNW5VenNQWmwvNGttL0diUW5I?=
 =?utf-8?B?V1gwQnl3YVg3NTJ6S3lHQmM5SWtob2Nxb1FPUW93SkJ1NEZjcWhKYTd5c0ln?=
 =?utf-8?B?dnpwcjBXd1M2NG1DKzFVRTRCQmlZRmdlcHBCczN0WDNuUm4yOXVuK1dHb2FI?=
 =?utf-8?B?OUg1UDVxTndJVktXeDk3MnZYb1Z4U3NMSmJSM0orVEs0RklIVG1qSHZVcHJC?=
 =?utf-8?B?K1FOWFppMWxCbTE3ZEhhSm9KZVlxNXh6QWhYd3orS1Q3aHUvNWxScEtuWkpw?=
 =?utf-8?B?bjlIa1lpcUk4THMvb0FXMmNhN04rV3liOCtOOW93THZ6V3NWbzVDWk4xUlhq?=
 =?utf-8?B?NkdOOWFkNGljUUFxeENTWVR4THdoV0J0amE3SGVIQ04wS0lCNHY0WFg2VDhm?=
 =?utf-8?B?S2FpaXcwSHcxR2l1THdNclRaL2dGTHVlTDZ5eVRNWng5OUhSWkNVbmVpUFBo?=
 =?utf-8?B?SlpzaktEbjVNRnpGdGhoOFdTMm9MY3YyaVdNUWdoWE5EVlZsdDhMWEUzU1RF?=
 =?utf-8?B?UjdIUUpjTXRsOXUwVzlzMkZ3dlVyN0RUOUUxOGM0UGJEVGhha3ZHOEdMOS9v?=
 =?utf-8?Q?ApvhhShKcGzAcQok80YYCIpGXHuED/P+1u?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ME5jQ0RVZzNvOGl4TUpWRzNyVlhPZVJJZVhhZmFqWmhsckI5c1VDL0NqOGp4?=
 =?utf-8?B?eUpSbFcwTXlIQlNjMUcxS0o3ZUVGYlNpTHo1cHJ2V1A3ZTZ4VjllWnpMR0Nq?=
 =?utf-8?B?OWlkSWFZSnVWMFY2M21SSHF3cFdLWDBhZ1VKdG1CT2kxOEpERmh1ZFZkQTZR?=
 =?utf-8?B?azdoNEk1U042VDlKQW5xeGkrN0pEcW5DK3VvNHBkWCtnMm5pRFVScU5HN1p0?=
 =?utf-8?B?T3hxWUxLM0lndSt1VlIrSU03cVd4WFFjTTUxMkJHSXowT1FFTm5JbHpCeW9y?=
 =?utf-8?B?akpPT254RGkrc1Q5WVkwdXN0K1E0VVJ6UGRDd3FUR3hCSFdoS2c3azZMd3Zo?=
 =?utf-8?B?eHdKUUhQK0krOU1CcVNqaEcxYkd6UklBV2VVY1Y5ckV3T1hoVGQwZFZxaDRD?=
 =?utf-8?B?YUdnUWtLUXJXZ2ZJQnVJbWZzL1JtM2NPcUtISmcwbVR1aVJIN2UwOWVWaVYz?=
 =?utf-8?B?V1d0bjRPbDR1OHpYL0I4SFJHTUNxVGVTWTM5eWJqdmloSHpCZmcrMzllZ2pC?=
 =?utf-8?B?Wk94UkFVN1kvdjNNc3ZRbFkxczM1M1dlTXFYZVoxNkZjRndqQ3pUWnZ5Qy9l?=
 =?utf-8?B?K05jMXN6cU9XNVdsdndyd2dvei9KR1R6aTBPbE8zNE4wSHQ5SnpWV3RNZi9q?=
 =?utf-8?B?ZCtKUWt2Zm9FUHl1N1AwU0NTNUtCcFFML2dKczEvYnlMbE5PaTVsNnowOFNF?=
 =?utf-8?B?WjdhOTBZRThnc01RQW5ZOU54LzlZS3F3VXFPS1UzSnV4MjdyL0I4emZMZmpW?=
 =?utf-8?B?T3prNjlqcU1ybnhjcEl2N05QTVN2aHZyaTYyQWRnRm1Kc2QxWDkrbWM0M25P?=
 =?utf-8?B?K011Q0JFVEVtNjhHL284TlkxNHJrTUJCcXQzSllWdVkraDF0ZERMV2wvKzRU?=
 =?utf-8?B?aVpXV2s3VWlyNDZlUEFvTzF4eDNNaGs3TVBoeXJOL0RkT2VmVEdMMG54UEd0?=
 =?utf-8?B?U1VNbFJtV2dmMTBDZUV1b2dIUDFOQXpIZkFaOFo2NXVSSHp1YUhGOERaRXNn?=
 =?utf-8?B?eStlY1crTkhaVEdhWUgwYnIzbGFmKzg3U0ZFbkFwMDZoSUJuemdid2NoQW43?=
 =?utf-8?B?cERhY2lURzJXZ1VNd0RYK0NuTEhsVjJyUzV4Sm1NVENFNHZYb0kza25kZTZU?=
 =?utf-8?B?d2JkenRtaHkrS0JGRENHNnZGZDdzYWlOcTh4ZjRPczZyWEY1MmNVSStnYVVo?=
 =?utf-8?B?aWpmUFc1bU5pd2k1T3dKbDBKT2lpSmcvNWp0MXZ4ZWF4TmR1TFFlNUcrMzdJ?=
 =?utf-8?B?REZmRjlQWlR4ZDllMzA3NW8yWVZWNkFJNUtVNzBXQXYxQW5laUJxOEpvSFUw?=
 =?utf-8?B?MTZuWWYwaWExYjlVa1NjWEU0UU1tWW9odlJGY3RJMVdUUldxN3ZtZkRGSC85?=
 =?utf-8?B?cHhvWE1ncDA4VSt5Vm4yczFtOW9iSGorTDE1QUtNZ3RyUVpISGFFdjNtMmVE?=
 =?utf-8?B?WjJCRWt5dzQ3cTZwSFF6blBrWHV4SkVZcnpqS0tqUHZXQW1WZmkyZS85S2hY?=
 =?utf-8?B?cXl5b29DRHh4cDc2OC9nbm9uZ25hZ3o2UldHaU5SNVdVZk5aVDJXc0RBMktk?=
 =?utf-8?B?eE1tdlBFUWJPSVN0M21YVWNRd2piS0hudGFqSFN2aHZkczdMTGQrSGxETi90?=
 =?utf-8?B?Q3AyQ1prZGZNWU5BYjR1ajZlZWhNd3FRcE5adkhxb0FOakVzaTgrazJxNVVP?=
 =?utf-8?B?eWhtYmZQZWtiV0I2anJTNWlhczZlc2M0VVc1amFNNW0wNHZjTzdqajllS1Bm?=
 =?utf-8?B?bC9hMEZwTUQ5QThXL1JqMHZRREh2bTdHbDFlYUh4TGZUdWFrQlc3dVo0ek9m?=
 =?utf-8?B?dTRJSGdpejZFdTZoTGtpcmFETEU1WThRRmw3SkMzRENZZnVobmVyMG45SmE4?=
 =?utf-8?B?bTBDd0grTWc4VXJDeXpwLzVERjVtUjNtVkpsMWhPOEFrL0tHdlNhMDRMSVpu?=
 =?utf-8?Q?kg257X4P86ORF1JqwwATXmuXbR1sHxsa?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c4c498d-8bf3-4eaf-ee6d-08df1320efeb
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 12:00:29.9090
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
> Pre-existing issues:
> - [High] st1202_blink_set() incorrectly zeroes out PWM slots for other
> active channels, breaking solid-on LEDs and causing cross-channel
> interference.
> - [High] st1202_led_pattern_clear() and st1202_blink_set()
> destructively clear shared global sequencer duration registers,
> halting hardware patterns on other channels.
> --
>=20

The st1202_blink_set() comment about other channels is about intended
behaviour, as answered during the blink support review and described in
commit 35cbd34a6a05 ("leds: st1202: Add hardware-accelerated blink
support").

The sequencer and its duration registers are shared by all channels.
This is a hardware limitation, set aside in the cover letter as outside
the scope of this series.

--=20
Manuel Fombuena
