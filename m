Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010043.outbound.protection.outlook.com [52.101.69.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6227A47989C;
	Mon, 28 Sep 2026 08:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790584079; cv=fail; b=D2QJ3+/kVtoMpn46fDjJRFwAR5J+EIR9MoT/b3DZ2M7T7zdgYnXhgapi1thOoZ3G2+LScI85mZAjMlSg6p2A6S8IkEz1XDWQyf78oRRQmW2LAZ6DocLdg5sOf49m9RqqKoKTXpOeouc3ko0GiYM6ldONIANVTlRM5l9JmUXR6GU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790584079; c=relaxed/simple;
	bh=sGKMS+l+JBpatu79u8JiHPnLs7c0UGdMVUPG0J+mhhc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MbzEtanqFN9YPsPWNvwwPw84y/tWquDOBx4A5ha0XrVAAZGL0hjP64yixDzRGi9rGniHIG8v1BWdeU3kvMNteBPckj1V2K/k0+0QIZbocBtGI1rPKSGPx7b8lgRuwJWruYhEEngYTY0OQoC53u7y5zc0gJY9g+SI0z/EpjqmGok=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b=HOhj8D/p; arc=fail smtp.client-ip=52.101.69.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b="HOhj8D/p"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HWLBPE6N2KxFhh1Fta3xW+/X6Y4V2wiuIhd+dYoaGlFG3w+QJzCow6Glh0KtnUMvJGjGoT7TG0azKypxs/VCj+qJOAX/LWYAtQJunlwcdZSwlBXAxUJquH/WU1g5GMON5LAY8XwRxCXeCAKT7j5hYBbuFqqFemfoxtjT8E7UwilK/xpoux0LnQOwhyAaN9LxVRbPnYiRVKZ1ntCiGlqerwUlVR6i8RH2B9/Mvmiaot1W8baRUi1quPsoBM9fQ6Y2FzjmB0fbmRZX7l7sMs4QadIIqBmpotkwq2wawyadd4jr/SmDQTKBTns2rbhxDhzw6e6kVdUhhPr+DLDRsIgLUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sGKMS+l+JBpatu79u8JiHPnLs7c0UGdMVUPG0J+mhhc=;
 b=vVf2chMO7ZD3JFJk66cXg3l3uMXC20ZFKKRKne51kc7iKaJs1miysQvNP+gP4lo0AxrEfkjyoSVYdQWOZKHp6n5K9dnxPuHs3YrF+r8jU//0E5vgyY4+G5d+SOsi3EUqXmr0W4IMZ3SgGhoOLuup8lKGZsGpQ01ClO0RVAuLhl4utUtITiZh966j5dKLGe2oWlhYQuNqyzBX4AXDBKtzsSndg7WWPfJQ+NkxlN+5kcpe7qy9LzKPthA0tSlwm0g6n57BuN01DwvSjAEPN64Qt65jm/IF74H29DcijYqLSay/vi+C0tdqpiUgY64elVM7mar9ZuRuSE6fse6mfcWM2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sGKMS+l+JBpatu79u8JiHPnLs7c0UGdMVUPG0J+mhhc=;
 b=HOhj8D/pv/qcnUe0pT2kktXPlXqWZyvMALoyB07OUTdYKp4YfwoqshteyoU6BfOtG/2VjRiTdSHl8ELYK/FUykC7ahxzL5tkS8z7JSzG8Og56VPIAFMfvrfQHBwJ0h23uBtqEiqCN334TsuxANoh7VgCCLD94r4GHFrYmQOo5G3VCwXVxyduQ/F0Zdvsq6MTZkzeuK9l5MrmzjS2wEXaSqe97QAEAd8BVAF1LYwnRH7DqqxabEwuswqlZxsNMErcKaeNGouBjnUz70OEsrDGmwHPcnGKaYK0Zz9WyRH13Y0JF8/Z+8lUT4RHuXlmn7INRQSnOuPWGqkvI4bTPBwglg==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by PAWSPRMB0037.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:366::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 08:27:55 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9126:d21d:31c4:1b9f]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9126:d21d:31c4:1b9f%3]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 08:27:55 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "andrew@lunn.ch" <andrew@lunn.ch>
CC: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/4] leds: trigger: netdev: Access net_dev under
 trigger_data->lock in the worker
Thread-Topic: [PATCH v2 2/4] leds: trigger: netdev: Access net_dev under
 trigger_data->lock in the worker
Thread-Index: AQHdSawzYplAgfi+ZUG5MAamGbtuJ7bij8+AgAEjXAA=
Date: Mon, 28 Sep 2026 08:27:55 +0000
Message-ID: <b0aa399f262c3e39e5803436d6dc1bc8fd70b8ee.camel@siemens.com>
References: <20260921093249.3481413-1-alexander.sverdlin@siemens.com>
	 <20260921093249.3481413-3-alexander.sverdlin@siemens.com>
	 <c8b59891-9eac-47f8-97c7-f4ee9f835970@lunn.ch>
In-Reply-To: <c8b59891-9eac-47f8-97c7-f4ee9f835970@lunn.ch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.58.3 (3.58.3-1.fc43) 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|PAWSPRMB0037:EE_
x-ms-office365-filtering-correlation-id: dc7af67a-94ed-4c3b-060b-08df1d3a653b
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|38070700021|4143699003|6133799003|10067099003|56012099006|11063799006|18002099003|22082099003|55112099003;
x-microsoft-antispam-message-info:
 k+iguIaT18cOEyM5rOTqD0pTbQt2UoLolDdr3c0rquPjpKhVn8u9qkQHqFGtdogKHw01VJ4qv2EPubppKPtHwiY+FkehxXcvlFSmx/9lBEpW8Odi99pYbWUYLwGg8GJ33HuLxOVvE7qmeAfRqI2X6qx1TOmgK5DM9FpwfgJP4iqhfBSmbZWA64wOojKzhn0ArZYG/L2DPpAmbXTpFxIls+KEX3t/qdpWs6/B+ihrATqF0zGh+GqZRjZMX8K+AL91IpTsVzf0+oa2ZS74xKrQ3ExRk3DQd4qSK9Iu4sobmIjoNeQH9W3uIPGiC12q5ORG541WSws4E03ZBIhy3i9xt+HwhM4PhXTeH4S1d3G+i7Z0vzhcMhQU3AeA7k9Vn5Le/gX7h8hcrvXF9g9n2seuy8fUo6wuhNxg2usJ/szjAKEBkJ/KZ1qnjPAU6/P4JF6nzx5Hf7DysWtCWOX5bQcUQYq2Qw/OZc178NMIhvMIkBENRLCp1gr8O8pUBFajCh3+Czvb9jkjK1ZlZIeP2sauaS0yTnAoa2Rp/JTCHJ2TrFjWhS+iCn1Pa+4Cb0BOBdMRgH4SqZqg71vXEG8rbSnrI8acX2Nb24X2OAlt7hPmfKZayRLiFLczd7OPVdnXz/OnLEpCqYCrfxGP5DocAWlmXzgLFmkVcd1ylU1XW7U4Vj0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(38070700021)(4143699003)(6133799003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003)(55112099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?d1FGdmZWTk5rR3dvQWpRSzRwUURHL3lJZE4ycmVpMnVwTm1vOVZtRnVvZVU0?=
 =?utf-8?B?NGhpeWtOSVcwMzdpVm1nay9HUCtOdVpFV1ZzZ2t5M0N3NVRZTFFDZU0xekdR?=
 =?utf-8?B?UVhIN1FaRnBQTW9ueFdNV0hCNFZYdCtOWERacThiZ25BMlVEeVdoUmM4bWRI?=
 =?utf-8?B?SkRLcEY2RVhnRWZ3d3BrMFliS0JPMGgwaEMxYytKdVdIY3pQd1d6UkFEV1lj?=
 =?utf-8?B?bW4wUzZHYzZkVjRPWHVPbWdKYy96T25LeCt2Q1VtQS8zdDNjMEhPUHNQV3di?=
 =?utf-8?B?NFhJVTNydkpWVXMrcFNWa2J3WmdrRGk4UjhhcU1vY1FGdG5KVlNtY20ydXNp?=
 =?utf-8?B?SHdUMm9yMzhTVEVBK1VZNTFnN1FIaGVMYy9wRWQrWXdocEZOZ3V6czlRRVNJ?=
 =?utf-8?B?TytITHR0VE9xNDkwd2FKQmtyQUp4OSt5eFpSMHhja2FHZzA4MkJUR0dpUFl2?=
 =?utf-8?B?dWtBZVUxNVdwVXdodHNBZGdkbFFNUG5zeWRuVlpDWHNJdmp6VEpuN1hhL3JR?=
 =?utf-8?B?NGk1RUVRdUxkdkt6Zmt0V3RvMG5FUGJ1ZExjRW5MelJRVkFLSHF4bnRmRm1r?=
 =?utf-8?B?MWFhZFNXaE1Fb3FBTS9LV0ZKSzR5cUVnd3prcDljMURnRVZDeFNRRTkxc2pR?=
 =?utf-8?B?VlRxOU5xNytxWnFsZko4UENVenBPcWFJVnhUdHk2VncyemllWEEvTFJyOVNM?=
 =?utf-8?B?U2RXcnU1bm5vSXgvSmhrRDNKVDZ0a09sOWlyVlJZcElnS2xMQ2VjNHcyV1Zw?=
 =?utf-8?B?OEJnUzZGTHRaQ1pUeVd0enA3Z0thcmRSWmd3a3RKMWpyeE44cEtlcUVNUnVP?=
 =?utf-8?B?b29PTmxYL0NoQitQR00yaHRoZkk2eDJoZURWdk04Y2lPUld5L1UvQWc0Rjdr?=
 =?utf-8?B?eEUvMWFKdHFZZGJGQlNuc2pQOTJtbEpPRGE5cm50NE5RZlEzcjVQd3hodHBI?=
 =?utf-8?B?OTF2TnVpa0twNDdSQ3QweGRkWThYS0J0KzVMOWpzTUp4M3pYQTNkcm9rcDlM?=
 =?utf-8?B?YU50S3hrSWs0enFMOEJ0Nzk4SUQyRUlCMTRYL2FVaVdzb09DUzVHNWJmVWpP?=
 =?utf-8?B?Y2NaWHlDd3Bqa0JNcmc1dzNSdjh3M1NEcy9heEREK3g3TlJZVWViTWlaa1Y2?=
 =?utf-8?B?UmxlMDgvTHRQMnBjZmd3b0k2UEtPQnJ6ajZGTlY5ODducGdzbWJiYlloejRW?=
 =?utf-8?B?VHRTWW5CRGRPNlc3U1U3cHJrblVSRWp0TDVNNU9ldzdCMWhuYnBpUFVQcUtH?=
 =?utf-8?B?Q2Z1aEFwMUFTTUJlZU42T3A3TnUxWlhIWUt3R3Mwb2ZtTnVXSHFEbUgwQjRr?=
 =?utf-8?B?VDhrOTlKYlBJWk9rT0g5OXdzUk0xcS9RZDhKUlhnNlNBTUEvV0lFTkZYVHdC?=
 =?utf-8?B?NWtKSWw3cnk3VkwzN295RWVOaUVRQWtnWlJaMDQrS3RLc2tqc1JHeDVFNWp3?=
 =?utf-8?B?ZFJpa1IwdG0yU1JoeGN0SWdpLzNVMEJQVERpcENIUWphUzBoYUJVeStLeDY3?=
 =?utf-8?B?d2xvM1dIaG5NN0E0WVRiaGhyNnM3bVV2WUR5a3dLNGxzYVo3L3M3ditjUXF0?=
 =?utf-8?B?SHh0Mmp5WlhrVG9CQTd0U054em5Ba1MrQ21FdlFjdmN6WEwwK2RTWHdzQ3dB?=
 =?utf-8?B?OGlIdk1aQTNvdFloSmIyWkZpMWlZNWlQSE9VYzRMUkZjMUpiVTl6anF6aE1O?=
 =?utf-8?B?aW1LOUVxR2FOOUdpTDdXeHNienFkUjFkTEpUaVljZGxiREI0SllFVFN6M0Rl?=
 =?utf-8?B?dFd2TkZCTUtsbTZDOHhhOVN3dEJUbTNRMndHeXBQaEFEVFhVT3FlZVNuc1RE?=
 =?utf-8?B?Z0FucTJhYlF1T0x0MDRDbloraTBoL3ZaSjJlbDJYYjI1VUROaTlyUjQrWFJB?=
 =?utf-8?B?eXA0aC9DSFF1aXVJcEtaN25wUlRQVzJxZHdQa29xZjZxS3VjbjdvU2xDZStF?=
 =?utf-8?B?amxwS3ROSDFHVlZqQnAzOVlyM2xiUm4rT0VOS2FTT0JWc0lDZUJFVEdVWVZV?=
 =?utf-8?B?aEF6TmdqSDRXS0FyQWd2U2wrQ3BIeHQ3aHp6cjMveTRDVnRNOE1rZ1lpZFRW?=
 =?utf-8?B?UlRmVm52MVd4SnBpczAzYk11a29aOXpnQzV6dUk3RlpybFhzbTYza1Q3YVBa?=
 =?utf-8?B?TExVL1FwNjNhUnhiREVUNUdpMGJlRkwrOHRjVDY5TWpWeXVMRmZlOWtjc3RB?=
 =?utf-8?B?VG5pT0xseVliaXRCamYrUUxSN0pmTE4zakI4Tm1uWEZNK1IwT202Z09TVkpL?=
 =?utf-8?B?ejh0UHU1YS9KQ3pjMUVISUVKeWhBNmJvVXg0QnVkUk5jSnBJWkVGazZDbCtE?=
 =?utf-8?B?MU51bDh2WjM2c1B2L0IrL29RSGJrQVN3S3BLVGozVGVka3VITEFJWkhaZytV?=
 =?utf-8?Q?t/fK+JqqZqCZlAy0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DE757A4BE906A54E8AB3440573750B8B@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: dc7af67a-94ed-4c3b-060b-08df1d3a653b
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2026 08:27:55.3368
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZEX7yW4dFm/w28JIKs8b3l4WrUP3TjxiWp9MJOZ1OTflsMV+Fm5sRnHpc4x3lct2/OMrQ6gCTIrTyeWj60U3ytmBHMgyc2a1qe6JO1xiOUU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWSPRMB0037

SGkgQW5kcmV3IQ0KDQpPbiBTdW4sIDIwMjYtMDktMjcgYXQgMTc6MDUgKzAyMDAsIEFuZHJldyBM
dW5uIHdyb3RlOg0KPiA+ICsJZ3VhcmQobXV0ZXgpKCZ0cmlnZ2VyX2RhdGEtPmxvY2spOw0KPiA+
ICsNCj4gDQo+IGh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvZG9jL2h0bWwvbGF0ZXN0L3Byb2Nlc3Mv
bWFpbnRhaW5lci1uZXRkZXYuaHRtbA0KPiANCj4gVGhlcmUgaXMgYSBkaXNsaWtlIGZvciB0aGUg
bWFnaWNhbGx5IGd1YXJkKCkgY29uc3RydWN0Lg0KDQpBQ0sNCg0KcHctYm90OiBjcg0KDQotLSAN
CkFsZXhhbmRlciBTdmVyZGxpbg0KU2llbWVucyBBRw0Kd3d3LnNpZW1lbnMuY29tDQo=
