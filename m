Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazolkn19013081.outbound.protection.outlook.com [52.103.51.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336C93E9F7B;
	Fri, 14 Aug 2026 08:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.51.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786696901; cv=fail; b=QdQgiLQTGR/HJTzaBBcXXr52yWsYgTFsI9PzWeY3XeGjMCtL991kzay5DTRnttFQ3CnYocNC5MAjgOGHJf0Ayf2pyioOohObbJtkQrNOwtrSHjPTB1hD2A3Uj5D9JZpmD5qJyprS+P7O5WMsHrEPwDs9ESgEg+mmemu9B51yqBI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786696901; c=relaxed/simple;
	bh=5x1ofjEXb8IQdCWfarqMfI7QiqTCVcuaT72mH5YV1QY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RpgKWFBkLrmdHIXijPlMUTFEH4x9CRgInAHGqpdtZ9bILF1DRtvH2lECtWsk7lgC86+Qs+cPBXSjE/HpYUVm8oq8iOj7I46SHJ0Q7FGnjbjJNVUEto1+mdlBS0UTHHqKNQUzdusAZukY1P4vFiPP9M+fIlLpR7kOi1DYMpyRGp4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=K9A9ngpu; arc=fail smtp.client-ip=52.103.51.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="K9A9ngpu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KQWd70k7JhpeycUyS0viKElt1wtxVnWgn64g7xO3xipHWjUqOJKRYiOwd0rP66FGY9kb1Dwnq/JDIm17PW8/tiYnz2YHCWXmoQ0j7IxXW46Xfbey1ZDm1s8tIDfL4qwYZJx+6b8ddPAp9J9HYN0WvXbe0X3MKciYd6YX2ZLsiRd70MtHzPvraKReFiRtIfCgAq4A1IOKac4wUQmF+4uwnehsPoxN8/nuIEZSxhP/jjbkVB2ptwBUSt6bNqZoKuTyKwbS3Fmb15g/DYcsFUIpGWWRFiZ09bIsJVbFVXVcNU0e/+NSRKTjKorNFj6JKz2lBN+JWWm/1Zu6LpqO0kSHGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gjo//Ukd+W106WDfubpVTHaOF9GwI2xLV3f83TKMWkQ=;
 b=itiQkzoqVlfuv+To6PAxHRDN94wf9z/k8vZyKQxPksCB6boBG6dsJkZ6PKiSxOoUaiScqWXGwGJ+1j0Cv9qX+sjXDnv3pcX8CYCMvl5C+xD5XlH+M9ASzwI1LLlWXIU3x8qocAyQt0Sg/XJwUagd9upAZowojCWCYjqgnFnNhPhJ6ZOOQfnTVPRTKKxx8B9/of9XnQY4qIMv9x1KZy26XnS3sqwY15NpHduOtg4ts6xg68OHRDr0CO8XyObW/E4N5RPwNx8XRCa0fNv1XGn/lTSO0CX/R+5PuRK7mHiIHjdCx5VFsJz1FpN4evsqIcz8jbtiuH2wLwHyAgO9dDhDBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gjo//Ukd+W106WDfubpVTHaOF9GwI2xLV3f83TKMWkQ=;
 b=K9A9ngpu/xam/vNyxUgdiU0SpINbIB0CoZwwYwGUZtbj4VAlZSZ1a6pBVqRVIiPZCdggUQGbostjyJQIJmpisPM+1jTkFK35hPmRNXwUKUoUMxt6Qp/wzCXjJqpwlMAKILZ997vZ2/bMW+V74jw5CLJjfsXHoSImU9WZ0uMkyTG2qE/uPP8CpoVbSh7ARn+v1kbfhcKehPTbo6Ffohn/nwzoj+JKF4rA7ZQTM3BtZ3dQZWRKrKkNnQ8SAnq6nRTuY/f55AExsfVpRPo4f4mF19bj+vmoMo/M3a/EZqMc9I6o9dgwwVwe1UzNwZ+xvS4YSRjo+3haxNuX11IxAvOpmg==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by DBBPR08MB10591.eurprd08.prod.outlook.com (2603:10a6:10:52b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.16; Fri, 14 Aug
 2026 08:41:31 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 08:41:31 +0000
Message-ID:
 <GV1PR08MB8497866A2EA40E0744E1E9A7C5DA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
Subject: Re: [PATCH v6 1/1] leds: st1202: Add hardware-accelerated blink
 support
From: Manuel Fombuena <fombuena@outlook.com>
To: Lee Jones <lee@kernel.org>
Cc: pavel@kernel.org, vicentiu.galanopulo@remote-tech.co.uk, 
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Fri, 14 Aug 2026 09:41:28 +0100
In-Reply-To: <20260813121601.GB1820248@google.com>
References:
 <GV1PR08MB84977DA9A154D7186B6EA2CBC5D22@GV1PR08MB8497.eurprd08.prod.outlook.com>
	 <GV1PR08MB8497362791595D5C0197701DC5D22@GV1PR08MB8497.eurprd08.prod.outlook.com>
	 <20260813121601.GB1820248@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44app2) 
X-ClientProxiedBy: MA3P292CA0030.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:46::13) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <60d2e3f56564d19cbc6d6b1111a4d59f6883c423.camel@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|DBBPR08MB10591:EE_
X-MS-Office365-Filtering-Correlation-Id: 8db2baca-1dcd-4b74-b77d-08def9dfd678
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799012|51005399006|8060799015|19110799012|41001999006|37011999003|23021999003|24021099003|6090799003|5072599009|25010399006|40105399003|2607281247196008|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dXhXdHlldzB6TkI5Tk1PTGQ2K3hrS0pheEdxUnNzWkptTHUrVEUyQXU0ZUlL?=
 =?utf-8?B?S3JvWVduV2RHSDcwM2phUDczY0ptUmU3aVd2S3hFU3M3dWVmb0EvSnFZS0JE?=
 =?utf-8?B?cURITXVRa0Y3MjVabWhDcTdlbGhHbkJ0UlhxVG8rbmErZ1NIUytONjFVSVBh?=
 =?utf-8?B?M01icW1kRzFnT25MTHptUDJzRjV3VXVYNWowT25nQk9VMG5LWjRrQS9TbWxk?=
 =?utf-8?B?d2RZaHFKWWxxUjFpdnFDR0hXdkg2NW9xa28wTEVhUURTN2xQcFhYYU5scmdm?=
 =?utf-8?B?alRZK1RhNmRIUDM1SUkvTkNRSzdhbmowS1loekd0WDNMTFU5SytRVVkxaDkx?=
 =?utf-8?B?NDZaOUdmTGtobVI0eDA3ckpJSkhOeXZrMGFEVDM1cVViU2I1TWVtcDVjMTdx?=
 =?utf-8?B?a09LdnYxOG51ZmxKa05ZTmt4a2pXWnBIaG1Oc0lSV1BvYTUrYnhodVNQRFFq?=
 =?utf-8?B?YmZZaVkzZ25oSGZTTE9jZ0JrMTVYMmQzK1RFbU11dGdHelA5WFNDM3l4R1hz?=
 =?utf-8?B?UFRPei9tZ3NJV09zZXhzalpTYys2U09GZVh1TE9jYkUvaHhSUFVFNlNkK2p0?=
 =?utf-8?B?OGt4SXJRYndJNjVSRWk2V0hMRDlVSVA3d3pYcTFTUC9GbHR5ZGtNbVVIWUl3?=
 =?utf-8?B?Q29aanhhM3pSZHJxaGhlRU90M0tIZlhpRkpVeENWdlF4bDFVRTNxakFRdkoz?=
 =?utf-8?B?cjNTMmRaUzNxcVQrdFVwZ3Y0WDZ3OU9BTFhQQlYxUkJzc3hJQnNTa1JDNk5k?=
 =?utf-8?B?VnBOSkMwaXpmSkVtMGdsamExSk81TlNvZlNLWkVZbzc5TzU5YzN6MHpnVXBG?=
 =?utf-8?B?T21TSFdNVCtNU205MGpnTzV5Y3h5WUFGQnhoaFFDRmczZExWSzd6UWM5L2Ey?=
 =?utf-8?B?dGFwMXpMNlMwbHJFRjNHRnc4Tlg4N1E0Vy9RN29wU1lPUDJadW1xL2hmMjI0?=
 =?utf-8?B?NDlnOXkwMGJYNDNNL0xBdUZHK0gwVU5PQXJsWDNjZGdQWkhvNVBmd2duQ1ZV?=
 =?utf-8?B?RVNsMWxycnJ1elhBbHJYK09PN0pIMEMxNGtrY0NsOE9CREtBTThzRzdZdTRS?=
 =?utf-8?B?SU1SckZXLzV0VXkvWkxvUUlkdVQwNjB1Q3h2MGN1ZzNDTk9aQXRTUjlsWXFp?=
 =?utf-8?B?Q0dzeHY1YW80S1lHRUEveUJwUjFManJjRDYwS3BaQ2ErTThhcDZxR3V1Nkxa?=
 =?utf-8?B?UUpoNmRxOGFyanczZ3lKWnF6RktocVJyRW1TREJ2bUtOMDhUT0VxVGZQcDM3?=
 =?utf-8?B?UEhBeVNRSjZVd0xOMjJBY0tMWWU3VjlFZUtFMURYbWJxMjc1SU9ZRGMyRG82?=
 =?utf-8?B?MGZhdnJleVIyVDBOb3QrSkJkdGlGdVhJNFVDMnRWSW1LS05yTHkzQjJLMFFn?=
 =?utf-8?Q?mKkmL7CYXbA4OaC9obBekpE0n5nvT+9U=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cUN2Tnl0QzdKMzRrOG0vNEh1c1lia3JjL0NORlhTNE9WSW1XajFsVWsyV3gw?=
 =?utf-8?B?MGJoY0RKaFRwTmF2dGZyQ2R5bnNkbWtnZitVamVsNExhYWdkVlRNWGk1N0xY?=
 =?utf-8?B?bG4vak85ZDVNT3RCck90eC85aWJZcDlPUU1HWGRGRWpaeEg2MnhtRTRITHdn?=
 =?utf-8?B?cDlTRDAxUU12eVdmVlllZU15MCs0WXVXTk9GVkZ5ZFp0TVY5OE91cU1EcjBW?=
 =?utf-8?B?aHpvZXpiUHNxTy9lMXZ1NkNOVVhBY0dxZGhFK3kzUVJtOW5uajdGaS9pR3Rs?=
 =?utf-8?B?dHlaVEFlVzF0M1JPYjJIUHorN2VnREV3M0NhYnN6T3VZNHpuVXFHbzRtSi9z?=
 =?utf-8?B?TDlxSDgwNmRjRGRKekJsdXFsU0RBa1d3WXRMT0s0LzcrMkJhcVp6U29ZZXhR?=
 =?utf-8?B?aWo3YmxSb05hU1pMZ1VQR09QVzQzQTFTL0V1VHRjNEtza05zdjBLZGF5azRq?=
 =?utf-8?B?bXI0bkVmb3g1T2NuUFZwU1VOU1VBTUc0K1B5cXlZVHNqR1NhdC9IMitROFAw?=
 =?utf-8?B?QTJZWXhrMnRUK011eWt1b0p3cGprUm9jZkJobnNMK0RjT2FBeFltQ0NjRFZF?=
 =?utf-8?B?dktKaDBDczd0TW8wZDdkOVNuNStRZnNHM0dBamdmMDY0V2J3ekZZODFzQSs3?=
 =?utf-8?B?VmNTckdYWWNhTWlwZ1ArNE9SdmNubUFyaFk0eUM1dTVQZE1lUDZuT3VDelQv?=
 =?utf-8?B?a2o1cTV5TlByWGM1YTlCMFRHcHJkQmVmOEUyUk42TWIzTzQ1ajgwYlFFT3hl?=
 =?utf-8?B?ZnNxRVB5a1MrcDFVTlNLWHlzU093ZER3dGJhM21aQTllSGpMbWd5SVJQbGFO?=
 =?utf-8?B?RHVIM0hzV0xzL043SHpNWjkrS1RIdGlqV2w4cXN2WnNPdVRHRllhcU52eEdp?=
 =?utf-8?B?bVlucjlCb0JOaVF3NXorb3RIM3ovL3QrK3lFSmc3ZURGNEZLbjEzZk5ROUt0?=
 =?utf-8?B?WTkrUXJjakc2OGVadTJKOHgwNkhtbGJwdEZXanRrSGxnSGpOTWc2NXFvTzJR?=
 =?utf-8?B?TjREanp4b0hQdHhwaUl3L0JPa2hkL2QxUnRvYzMzZWZwVlU3ZXFmQ0dwekVG?=
 =?utf-8?B?bDNhaXZRYStiTk8xVzVWeUtSMEVLNWY2VWpZOVFjbktjQWRRbDFTTkRWQzJN?=
 =?utf-8?B?MUtIcTAzK1FWcjJNTHJGVFFUenJPcnNMNkRJMytpZ2NIek84UXhYTzRzMVZD?=
 =?utf-8?B?emgvaG85WXl5Y1RaRmlmSHVuVmdpZEdtNkpuM3lGMndPUU0xSkJBTlgvalRw?=
 =?utf-8?B?Um9SWEFteFkxbStSKzN5VDV2RjNMMWlXQndlL3h0VllrV0plUW11SEdtcGJq?=
 =?utf-8?B?SFByZ3lZTDRBeEw1WG5zdlBMR1R3bVNIbUE4blJQcnBkOGlXVGZ5bkJpb0JF?=
 =?utf-8?B?aGVsWnhlNXkxaWxqbUIrSU1wYmhUZkxTVUQ2VjZiVnptTm9CZjI4ZkRhUGNF?=
 =?utf-8?B?dGQvWTg2TXNhczI5cnB6TkZDVGtRRVhqUFR1Mk9UUUpXSkxTR2V4dEQ1ZFJT?=
 =?utf-8?B?VzFVNHNxTXpEVE9VakIvTm1MWnllZ3JBcFMrdDVvZUFydEZobVU2aWkvZkdF?=
 =?utf-8?B?NWpMcWFZdC9yLzM5Z1pJcFp3Vm4rb2RvdzBNS2UwNnFTbVFlWWNtejcwWm9a?=
 =?utf-8?B?KzRtTkJHTUtJQ0tCZDFnVkpHY3dzZ2JlY0RCTHhQOXdteUFmQ1ZHbUpuTHFY?=
 =?utf-8?B?Ynp1Ti9vV01PeHZOekhoUm9ray9NaVNMckhmSjVaNkllSHNGb2pjOUVjajAw?=
 =?utf-8?B?NGlzeWJhZWZWdkZ4QS9va3ozcWh4a3oyTkVsQ3NzU3NzaGN2ZnlJdFFVUWcy?=
 =?utf-8?B?ODUxT3ZheVpOVDZrSDVsNUdoQ1N4alB4aWlBTVN0TG4rVHZjYTBoTXBzeElp?=
 =?utf-8?Q?1+bbIG5PplXV7?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8db2baca-1dcd-4b74-b77d-08def9dfd678
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 08:41:31.0293
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB10591

On Thu, 2026-08-13 at 13:16 +0100, Lee Jones wrote:
> On Thu, 06 Aug 2026, Manuel Fombuena wrote:
>=20

> > +	for (int i =3D 0; i < ST1202_MAX_LEDS; i++) {
>=20
> Nit: Would it be nicer to use a better named variable, like 'led' or
> 'chan'?

'led' is already in scope as the target channel. Using 'chan' in v7.

> > +		if (!chip->leds[i].is_active || i =3D=3D led->led_num)
> > +			continue;
>=20
> Nit: It's kinder on the eye if you separate these blocks.
>=20
> > +		ret =3D st1202_pwm_pattern_write(chip, i, 0,
> > LED_OFF);
> > +		if (ret)
> > +			return ret;
>=20
> '\n'
>=20
> > +		ret =3D st1202_pwm_pattern_write(chip, i, 1,
> > LED_OFF);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	ret =3D st1202_pwm_pattern_write(chip, led->led_num, 0,
> > ST1202_PATTERN_PWM_FULL);
> > +	if (ret)
> > +		return ret;
>=20
> '\n'
>=20
> > +	ret =3D st1202_pwm_pattern_write(chip, led->led_num, 1,
> > LED_OFF);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D st1202_duration_pattern_write(chip, 0, on);
> > +	if (ret)
> > +		return ret;
>=20
> '\n'

All fixed in v7.
> >=20
> > +
> > +	ret =3D st1202_write_reg(chip, ST1202_CONFIG_REG,
> > +				ST1202_CONFIG_REG_PATSR |
> > ST1202_CONFIG_REG_PATS |
> > +				ST1202_CONFIG_REG_SHFT);
>=20
> I'm assuming that this alignment is a patch artefact?

The continuation is indented with four tabs (32 columns at 8-wide),
which aligns with the first argument of st1202_write_reg(). The
alignment is correct in the source; the patch email renders tabs
differently.

--=20
Manuel Fombuena
