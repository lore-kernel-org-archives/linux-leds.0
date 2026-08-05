Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1535B2248B3;
	Wed,  5 Aug 2026 03:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.139.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785900539; cv=fail; b=MSvYPUhb7GUY23CvyATYIcwe/HNFsEly6udl4vSmgBncAWma6RN9518mKn5+IAygOVVq9fcE4T1pLAKN+9gYu8K2dPj2S8iC+9NZRQmbERTtsibnyUlz4j2rfSMBwDwoY0/Ng/mUyUolBmwJF5stzQXvB2KuJHGGZSLwvREvjF8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785900539; c=relaxed/simple;
	bh=Zrp89ARw2pmccmOUgrhvETRu5WB21GQwvv9ZsvTCe5c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ihoLpvIzWSdwoihqxqiYL9hChV6NsIFNvn0z9BI1CrzW5EWk5G8rVrNw3kf7tIBIvRN0meGv+yTfTTGerGRoCxD+oTAaPE0bpjyNiwqtsetA8jpgVfUXI9ak7RvmUsgQePHQa1jE+jWS4UoW/alNMTLJ//yZPmtxu8Lh6fjplzo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=lcP+NIiN; arc=fail smtp.client-ip=148.163.139.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="lcP+NIiN"
Received: from pps.filterd (m0375854.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6752dXkP569476;
	Tue, 4 Aug 2026 23:28:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=Zrp89
	ARw2pmccmOUgrhvETRu5WB21GQwvv9ZsvTCe5c=; b=lcP+NIiN0ji3N8m5QcH5w
	TTEZjHzs45ZW6ACWL81MJJHmtyJmLL71vs96wvK8LE6ZpxEUt0D0V1AEWdamlq7C
	rKESaYvTaWFY0cd46+swcXlq22fs+QjJweMIiLabKnTeTBOkxCvHveOlbp6OjCqQ
	vxo3knyff022kXw+HUwSfebFD6ydRK4ay9CCTZlspm17bt5KjZCgoprLECKoCL/A
	LBI6ZNlRTDbhGoebI0Idwv2McJEsUqJQVNC3EIlW6SeTuKm7R1w/0/Y0DKxXGXNa
	Zj2F6NYRhXfSvMHeAmc5DjbWD+EsXu0tbOQXl4qfu+nl+xQG0YVGMlBbsgVkh19B
	w==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012027.outbound.protection.outlook.com [40.107.209.27])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4fu91254qq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 04 Aug 2026 23:28:43 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ovak32OhNAE492Wz3ARuAeZUv/7M4iTrt+q5y6d0sdidnAslOmMxU0TPmyUD0m1DpkWWDiPXhf6PhEMwTLpwmmMFvpOsv1PESW6RkypQK5RgMLkBEWOvj9wF8n7weCFS9YFywJOsaRoPkXrdv++mrzP4uwkRHMXRxSwsnm6tVKFV0VpcHaYR5sUorFs6Y0s4u/Wa0GmpnKLeXOHJAmy1Dmd7lG49WnwDycv+FfDrs4u3kXAC6vae4js1mrswBoERNJ82w/8W9eZqT9SCmb2N5olN9xzHpn1GL0+g3CBhYnmzOz2UirTB2bbQob9sfUQgCceFF5ei1OxT7Iwg0ayiZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zrp89ARw2pmccmOUgrhvETRu5WB21GQwvv9ZsvTCe5c=;
 b=ufcDtEKvBGesWABqD7B0eFhNVQbVa3Mj7yrwJ2qLatZ64tTby7o+6W/p9O58n2QibrNLrJG2Jt32mSk0OId1FlK0nvvjYAbdNsi3RCjdLlpJIKtlB3GAeUkynDtGKOD6hMo1iA0q3UZ0coAAO7bhCHEW2XeCbnTOXWKxNJuRjhU/P2xjAQ8TSIeR4+lP95qXmF+4mMXddkq0ehiFi/+tA5p+RToRu5Fk1hD7UDIDqEYum3G4SfI0ogSl3ljFpIWHS7lvLSnATogMMUvcot/Nwy0/hOSppNocM7RT9zQBHIMCw9Dearjekd3tXS+rBRhfzShylsl5g8Bl3Jv60+58uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from BN8PR03MB4977.namprd03.prod.outlook.com (2603:10b6:408:de::11)
 by BY1PR03MB7970.namprd03.prod.outlook.com (2603:10b6:a03:5b5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Wed, 5 Aug
 2026 03:28:39 +0000
Received: from BN8PR03MB4977.namprd03.prod.outlook.com
 ([fe80::4d86:70cf:8006:e219]) by BN8PR03MB4977.namprd03.prod.outlook.com
 ([fe80::4d86:70cf:8006:e219%4]) with mapi id 15.21.0270.017; Wed, 5 Aug 2026
 03:28:39 +0000
From: "Roleda, Jan carlo" <Jancarlo.Roleda@analog.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "lee@kernel.org" <lee@kernel.org>,
        "linux-leds@vger.kernel.org"
	<linux-leds@vger.kernel.org>,
        "robh@kernel.org" <robh@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: RE: [PATCH v8 1/2] dt-bindings: leds: Document LTC3208 Multidisplay
 LED Driver
Thread-Topic: [PATCH v8 1/2] dt-bindings: leds: Document LTC3208 Multidisplay
 LED Driver
Thread-Index: AQHdH7AIbHqSwKtD8EeN6UUGDIijAraFIkaAgAmzF8A=
Date: Wed, 5 Aug 2026 03:28:39 +0000
Message-ID:
 <BN8PR03MB49779218D9F6F14E5A90084D96D32@BN8PR03MB4977.namprd03.prod.outlook.com>
References: <20260730-upstream-ltc3208-v8-0-6bdcc35e65d7@analog.com>
 <20260730-upstream-ltc3208-v8-1-6bdcc35e65d7@analog.com>
 <20260729232022.4A8481F000E9@smtp.kernel.org>
In-Reply-To: <20260729232022.4A8481F000E9@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN8PR03MB4977:EE_|BY1PR03MB7970:EE_
x-ms-office365-filtering-correlation-id: ab779065-5b1f-4fbe-2d2d-08def2a1a45d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|4133799003|4143699003|3023799007|38070700021|11063799006|56012099006|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 o1X9rY6VH8WtjFgas8yP01jsv+m9Pyzlccq6544rFMVfIiw0fmtaPzogy40SHCCcCM2wh5ORGKtqNzGc47qW96Yz3p1+VixS+vzjpZ2o7hHCdUZUE4XGyP+oXFzMfVfmcb4+rsA2I+FsmZ/d0PEKCp+DudvihnkLgOIkGHU9krhtLyvxSINmNpR7UrMOS3HmnmgEkv8jJreb/TF2CNfW6cqxuK5CD2X8xPNS8WT8NMyV/8Nbq+U8sAv/UILwvEP0fosDsEvaINnNw+pI5NTgEJWgwGvWgFvAAaLixKQ/BprD1l/M+uHvWXpcjB3/tXDNWdq0Q8NoBqGpt6nhDYLGlmGCiBKI8kgxO/Ehd7AyL2RiYP3bsskbwhr6mP/uvk3yzBAl746Nr2RUBav92LyMo18EN4MFY2YxCb4ADWmROF40PoqPpBYo7WYW9wzOf2Ci5adVJzPzwsAq8TMffLoC87WdoVjvqVipmGxBBo3hO5yixOmcA/eA3nfmZyFMdgP2C/lA/kzSNajdteucumv97hCzdjY94th7hD85cDii6FgZp50Q2bLEjKjfQPLl6wdCQlqN7JwdpKHn19ZptAiDkwAKIt/AI4Wid0BJS7DDyBcP/XMcbhMP1AKz93B7lnYAOZCt1pHO5aJmtT9s4PTaVv6DTIxbfeN6ZknpFost0Tc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR03MB4977.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(4133799003)(4143699003)(3023799007)(38070700021)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aHVxMmtLVndDQWdMbUswdjdTNHB0QzdQNkc2M1dEd1FXSitRd1h1N0JLNVZU?=
 =?utf-8?B?eTJkNEVvWVhPZkhVOFNKeW4vaHJFTm9rNzRwUTFRSExMV21UNkM2Tm5MV0g2?=
 =?utf-8?B?bStPbnQzR3htYS9GN2lGMWVuTVFPbzV1ck1sV0JYQWVzYWpvZjdHTFk1aG1i?=
 =?utf-8?B?cG9GY25uT1ZTZXdVRFJ6Sm1hRGdhalVrR0FPRXFtTjFEb05tYXdoUHBZZHF4?=
 =?utf-8?B?YkwxeWNEOGlJWll2SE1nUG5maHV4Q2VpSnhRdFhMdnkyUkZQam9jU0Rua3I2?=
 =?utf-8?B?SUNzZXdVbUNGcUllVzJ6cERMOVBBd2pXRGpDUVpFRUNlQ0VYMXBxWWNMM3Nl?=
 =?utf-8?B?MXhCdGE3dUR2cXUyaFpGL3d6dkgwNnVyMHlSRU0xR3kvTmtaUlhBd0VoNEZu?=
 =?utf-8?B?dllNY2RRV2tHaUdaOG9Rd25aRGRkcGdvMHcyeUJ3SVpRdjl1S2F1cTVYOXVC?=
 =?utf-8?B?akEwV0NTRjI3ZUN5QUNlTi9QYjBFSlhkdGJXL0VNRDlqcU5tRXd2Z3IvQ0Qx?=
 =?utf-8?B?OVhVdXhlY1ZKVnVjajBjWVg1aGdmMkI4ZlVQN05LSFlKYjdzQXRFeEcvelBt?=
 =?utf-8?B?bXlNV2NnNzhMT2Zjb3E2OWJMSXlUUTZmNGt0L2xvdEZPZ2dlYkQ2eGsxdmtY?=
 =?utf-8?B?NUNNKzI1WlMvaEJEL2YzUm9nVzhtekNVWXVEL0o0NzVDSVZtWTR3ZGFrWEpn?=
 =?utf-8?B?VFc4NCs2TkZVVU1JV0gxOTliZy9pZDZyTm5kZ2UyRkxuVzd4Q0VmV1M5ZWJp?=
 =?utf-8?B?R0lJUkRJSE05Q0tKSEg2VHZkbDlsckhTVDlxTzMwQTl1ZWR0VWFqZktiVXRH?=
 =?utf-8?B?WExRaGJnRlcxZVJXSWxTOXB6eStlYWh2MTUybGE2N25lUFlRVzQ5OWNaTGtX?=
 =?utf-8?B?QmhFcDdnRHVxR0JVb0ZhQU0rcFJDUWxRQnlrTHh2Y05CMGFRelU3R0JHOFVF?=
 =?utf-8?B?b2ZSQWQ4VXpWT1grcFZDWDNKVENmNDlvS1poSDU3dDdBbnYyQkQ1dm9HQW5R?=
 =?utf-8?B?OEVickE2UkQybXVJdExwVXdqYU5iRm8zdzZ5VzZtQ3B6M0NwNlBXaEFEMkZ2?=
 =?utf-8?B?US9OTXAwbndMWE43VEMwanNYNUx0VVJicWo1OGlDc0lNQkFjNW5waG9KT2to?=
 =?utf-8?B?aEp2WXlnN1VsQWwzWTBiZnQ2LzU0c09DWFhFdEhUZnZUOEhqbFRxMGFQWTdu?=
 =?utf-8?B?SExzL1ZrSFZoVDdlV0dpQXpRY2RzbjVCTVVjd0N4eDJpRndjNmdEWkNtNzZv?=
 =?utf-8?B?eUJyWjhnWkJhL0k0c0dqaG5tcFFGdEV0UnFxWUNudi9WcjdsMTBwNVRGZlFE?=
 =?utf-8?B?MENhN09BMWcvWUdOR20wS1I1SE1pT0U0cjZNTmllU0lEUjhmeXNCSHJxLy8r?=
 =?utf-8?B?bVRKdnEveTdDTm8zTzE1WWo1Y1ZUcEZyYVdFMzhTcXdnQ0FDSkM0ZVVTdjN0?=
 =?utf-8?B?NERjY2UyZ3BTbm1tK0Nzb2ZGMlpGVStrT2tiY3dLK0Yxa3B1dHoralpvWmFi?=
 =?utf-8?B?NU85RnZFZUNKMklpdFB0a2pnRXZkU0NsTVRNU3RFOEVtYWhXUEhoUEoyR3Q3?=
 =?utf-8?B?dkFhTG5iSDVqMjIxMU5Pc0tCY20rM2p5ejQ0MHJnb01sYUZlQ2UrYUthYUg1?=
 =?utf-8?B?REJVZGhYYzZ1ZytLUGVCRGRpc1ZDWlB4eVYyQlVwemVPa0lka1VQUUJpcnda?=
 =?utf-8?B?dWpkdXFlbFNNZEZnTlJzM2NCdjRKbVRMMldUMGJhdFBFZ3NjV1NObXlZY3ox?=
 =?utf-8?B?Q3lRaHNybUo0UHBOZ3NPU3VKMldRaTBIekgxcm5zQ3RKa0lYUjE1dUxOWHMw?=
 =?utf-8?B?bU9pVEVVZDhML0VtbXNkRjE1NkFPd3FsbVJiNnVTRFZuTnowVy9PSEE0UzVk?=
 =?utf-8?B?RS91RXgwUTVHaVRLZE1IZUtsQlliZVhSRVNKU1F6N2tyNHByTllzNDlXYUZk?=
 =?utf-8?B?RTVKK0hPNndaWTU5dVBKbDRYUG5LSVBCVVFPSCswVmwzRmdkWDN3dWFIQ2ZZ?=
 =?utf-8?B?dG5mZUZpN0paaEoySW9GZXFyd3haUGZsMS95czA5TnFLSG1XY0g0YU84NVVj?=
 =?utf-8?B?eXF2cXVMaDB6ZW9mY1FyYWQxalNWbkJXWTRzd1Jkb2ZrZml4T045K1UxNkoy?=
 =?utf-8?B?akpGK0IxNFYwRmhuMFM0cFF0c2NiVVFFcVNHQW1DelNHbElyRVhCNkczRFpQ?=
 =?utf-8?B?VzM4SEJLN09Ybnd1OGtEbWFBMVJuUFBKSXNsbWdZbXZBWUFDNVV0NnpBeW1M?=
 =?utf-8?B?WlQxQTBXcGF4SFZUd2ZUQVdETlpsSXlOM0JXcldHUTEwWGtqYmRzVHhIY3Uz?=
 =?utf-8?B?V1BCd2hVYWVoek9pVEtaZE1aTkZ2NlhySm9zdTVzc0RuOHNGQXFodz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	TWnHDvc7By02MyCnS7yQfjSLiupYcaUoQ1AhVfsx0sPYYH15ia+6Zyx11OPwKug+kFZ7GEkBeIpR+RQhNbp4ykinNp17m6BrHY0EOTb96/hfTbKSPQDHHH9N1grzlG78D+aAGSrKipUsT03f1SWQTJ9fTOPb1J/LtaXs1iRgJPDYoiAK9HM0FHcKGHLP1OguWoA9kGVKCScWy1fosp95arZ311KwQjMov1bgTQ+pJNYQKTBJeyTFqM8pUw1C/tFfpYgzBfBJsOGpJa5GvNboLfNo1f2dieKA4tgXY1QlaqB87ZF4na8+VugLEhMj/1mb/beP1TiT8iDNx47YFud6hw==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR03MB4977.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab779065-5b1f-4fbe-2d2d-08def2a1a45d
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2026 03:28:39.3865
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JbJzvOTL0jeMgIr1f00YASvtVKXJNabYG2cx7tYExTZM8zLru6TQBUePfMxuW/ESYR/AOBt5GOTTYnFuKyV5+/m5pqiKmyW2OF6qoni1JWI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR03MB7970
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDAyMyBTYWx0ZWRfX+V+kMNfpj+B5
 r24Q8RrjILvN5vPOB2NsfQaOybRNqLB9KTnEiYqa7u8jpqb+nZW8J/yNOuuUJoBlAtPEmg4CZyN
 zzjc+j+vef4G2g8WW+jZjtRW4lF41KwoiKXi0v9PUSSPSB7OjhKHoYXSPSF4Py4R4AjQUsCvZEX
 qeYD/wZ+5hkeMwlTddJBfMzN2Q+EN7LsDU1TGWvlxZSRHovJbXIZPRnfOh34tRyBgIp0M0pkyAK
 oTrJoWQQY+E/4DVECwzBSCzB7RQiffwQwGnWl7ymPRYOIBpXa2CY85NRuGFdkS4H1YQ75LnKw2y
 NFDKl0FHz+aAib/tDb/8DRI31K2ryv0L+7ztXs61ye4JM03jDuwMo3eNnkT2OYCPZp/1dnb+Jm0
 +IUQjypG2rubHNyKNV1O7QaQF+MKYliqDuUKq+QyOHugHmMJNG7et2phsDoonlvE27RmUYV4aCI
 ERvOFMs5925Zyg81VHg==
X-Proofpoint-ORIG-GUID: O8AZ8uRIi2V5sr9NgWKhKbXOqm5h3qG6
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDAyMyBTYWx0ZWRfX/Ge4aVIjLos+
 1LbH+rEGGo5tKCOhLa0nlNqO3BkNAW2iTeBhPgxieivbB9u0bWlKBPNDMFji2A8X/qYE2hwWCqi
 xuzCzB/TE6ayEu99dGcd6GZIdQcau5lN56sDc7Kn7aN7rsMJvJVa
X-Proofpoint-GUID: O8AZ8uRIi2V5sr9NgWKhKbXOqm5h3qG6
X-Authority-Analysis: v=2.4 cv=L7ktheT8 c=1 sm=1 tr=0 ts=6a72adeb cx=c_pps
 a=HiuaN0cSM6iMs60el9to+g==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=iZSIUCweCk2Oy3QsdGPA:22 a=uherdBYGAAAA:8 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8
 a=gAnH3GRIAAAA:8 a=6oXuB6Wwyu6WC8842QcA:9 a=QEXdDO2ut3YA:10
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_01,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1011 suspectscore=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608050023

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBzYXNoaWtvLWJvdEBrZXJuZWwu
b3JnIDxzYXNoaWtvLWJvdEBrZXJuZWwub3JnPg0KPiBTZW50OiBUaHVyc2RheSwgSnVseSAzMCwg
MjAyNiA3OjIwIEFNDQo+IFRvOiBSb2xlZGEsIEphbiBjYXJsbyA8SmFuY2FybG8uUm9sZWRhQGFu
YWxvZy5jb20+DQo+IENjOiBsZWVAa2VybmVsLm9yZzsgbGludXgtbGVkc0B2Z2VyLmtlcm5lbC5v
cmc7IHJvYmhAa2VybmVsLm9yZzsNCj4gY29ub3IrZHRAa2VybmVsLm9yZzsgZGV2aWNldHJlZUB2
Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2OCAxLzJdIGR0LWJpbmRpbmdz
OiBsZWRzOiBEb2N1bWVudCBMVEMzMjA4IE11bHRpZGlzcGxheQ0KPiBMRUQgRHJpdmVyDQo+IA0K
PiBbRXh0ZXJuYWxdDQo+IA0KPiBUaGFuayB5b3UgZm9yIHlvdXIgY29udHJpYnV0aW9uISBTYXNo
aWtvIEFJIHJldmlldyBmb3VuZCAxIHBvdGVudGlhbCBpc3N1ZShzKQ0KPiB0byBjb25zaWRlcjoN
Cj4gLSBbTG93XSBUaGUgc2NoZW1hIG9taXRzIGAjYWRkcmVzcy1jZWxsc2AgYW5kIGAjc2l6ZS1j
ZWxsc2AgZnJvbSB0aGUgdG9wLWxldmVsDQo+IGByZXF1aXJlZGAgbGlzdCwgd2hpY2ggYWxsb3dz
IHN0cnVjdHVyYWxseSBpbmNvbXBsZXRlIGRldmljZSB0cmVlIG5vZGVzIHRvDQo+IHNpbGVudGx5
IHBhc3MgdmFsaWRhdGlvbi4NCj4gLS0NCj4gDQo+IC0tLSBQYXRjaCBbMV06IFtQQVRDSCB2OCAx
LzJdIGR0LWJpbmRpbmdzOiBsZWRzOiBEb2N1bWVudCBMVEMzMjA4IE11bHRpZGlzcGxheQ0KPiBM
RUQgRHJpdmVyIC0tLSBjb21taXQgNDBmNTdlNmM1NWM5MDY5OTU5ZTIxYzRlZDgzMmMzNTNhMzQ3
MmYwYQ0KPiBBdXRob3I6IEphbiBDYXJsbyBSb2xlZGEgPGphbmNhcmxvLnJvbGVkYUBhbmFsb2cu
Y29tPg0KPiANCj4gZHQtYmluZGluZ3M6IGxlZHM6IERvY3VtZW50IExUQzMyMDggTXVsdGlkaXNw
bGF5IExFRCBEcml2ZXINCj4gDQo+IFRoaXMgY29tbWl0IGFkZHMgRGV2aWNldHJlZSBEb2N1bWVu
dGF0aW9uIGZvciB0aGUgTFRDMzIwOCBNdWx0aWRpc3BsYXkNCj4gTEVEIERyaXZlci4NCj4gDQo+
ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9sZWRzL2Fk
aSxsdGMzMjA4LnlhbWwNCj4gPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9s
ZWRzL2FkaSxsdGMzMjA4LnlhbWwNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4
IDAwMDAwMDAwMDAwMDAuLjBhMDFlMDdlMGFiNzANCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysr
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2xlZHMvYWRpLGx0YzMyMDgueWFt
bA0KPiANCj4gWyAuLi4gXQ0KPiANCj4gPiArcGF0dGVyblByb3BlcnRpZXM6DQo+ID4gKyAgIl5s
ZWRAWzAtN10kIjoNCj4gPiArICAgIHR5cGU6IG9iamVjdA0KPiA+ICsgICAgJHJlZjogL3NjaGVt
YXMvbGVkcy9jb21tb24ueWFtbCMNCj4gPiArICAgIHVuZXZhbHVhdGVkUHJvcGVydGllczogZmFs
c2UNCj4gPiArICAgIHByb3BlcnRpZXM6DQo+ID4gKyAgICAgIHJlZzoNCj4gPiArICAgICAgICBk
ZXNjcmlwdGlvbjoNCj4gPiArICAgICAgICAgIExFRCBDaGFubmVsIE51bWJlci4gZWFjaCBjaGFu
bmVsIG1hcHMgdG8gYSBzcGVjaWZpYyBjaGFubmVsIGdyb3VwDQo+IHVzZWQNCj4gPiArICAgICAg
ICAgIHRvIGNvbmZpZ3VyZSB0aGUgYnJpZ2h0bmVzcyBsZXZlbCBvZiB0aGUgb3V0cHV0IHBpbnMg
Y29ycmVzcG9uZGluZyB0bw0KPiA+ICsgICAgICAgICAgdGhlIGNoYW5uZWwuDQo+ID4gKyAgICAg
ICAgZW51bToNCj4gPiArICAgICAgICAgIC0gMCAjIE1haW4gQ2hhbm5lbCAoOC1iaXQgYnJpZ2h0
bmVzcykNCj4gPiArICAgICAgICAgIC0gMSAjIFN1YiBDaGFubmVsICg4LWJpdCBicmlnaHRuZXNz
KQ0KPiA+ICsgICAgICAgICAgLSAyICMgQVVYIENoYW5uZWwgKDQtYml0IGJyaWdodG5lc3MpDQo+
ID4gKyAgICAgICAgICAtIDMgIyBDYW1lcmEgQ2hhbm5lbCwgTG93LXNpZGUgYnl0ZSAoNC1iaXQg
YnJpZ2h0bmVzcykNCj4gPiArICAgICAgICAgIC0gNCAjIENhbWVyYSBDaGFubmVsLCBIaWdoLXNp
ZGUgYnl0ZSAoNC1iaXQgYnJpZ2h0bmVzcykNCj4gPiArICAgICAgICAgIC0gNSAjIFJlZCBDaGFu
bmVsICg0LWJpdCBicmlnaHRuZXNzKQ0KPiA+ICsgICAgICAgICAgLSA2ICMgQmx1ZSBDaGFubmVs
ICg0LWJpdCBicmlnaHRuZXNzKQ0KPiA+ICsgICAgICAgICAgLSA3ICMgR3JlZW4gQ2hhbm5lbCAo
NC1iaXQgYnJpZ2h0bmVzcykNCj4gPiArICAgIHJlcXVpcmVkOg0KPiA+ICsgICAgICAtIHJlZw0K
PiA+ICsNCj4gPiArcmVxdWlyZWQ6DQo+ID4gKyAgLSBjb21wYXRpYmxlDQo+ID4gKyAgLSByZWcN
Cj4gDQo+IFtTZXZlcml0eTogTG93XQ0KPiBTaG91bGQgI2FkZHJlc3MtY2VsbHMgYW5kICNzaXpl
LWNlbGxzIGJlIGluY2x1ZGVkIGluIHRoaXMgdG9wLWxldmVsIHJlcXVpcmVkDQo+IGxpc3Q/DQo+
IA0KPiBUaGUgc2NoZW1hIGRlZmluZXMgY2hpbGQgTEVEIG5vZGVzIGluIHBhdHRlcm5Qcm9wZXJ0
aWVzIHRoYXQgc3RyaWN0bHkgcmVxdWlyZQ0KPiBhIHJlZyBwcm9wZXJ0eS4gVGhpcyBtZWFucyB0
aGUgcGFyZW50IGNvbnRyb2xsZXIgbm9kZSBtdXN0IGVzdGFibGlzaCBhbg0KPiBhZGRyZXNzIHNw
YWNlIGZvciB0aGVtLg0KPiANCj4gSWYgI2FkZHJlc3MtY2VsbHMgYW5kICNzaXplLWNlbGxzIGFy
ZSBvbWl0dGVkIGZyb20gdGhlIHJlcXVpcmVkIGxpc3QsIGEgZGV2aWNlDQo+IHRyZWUgYXV0aG9y
IGNvdWxkIGNvbmZpZ3VyZSB0aGUgbm9kZSB3aXRoIGxlZEBYIGNoaWxkIG5vZGVzIGJ1dCBmb3Jn
ZXQgdG8gc2V0DQo+IHRoZSBhZGRyZXNzaW5nIGNlbGxzLCBhbmQgdGhlIHN0cnVjdHVyYWxseSBp
bmNvbXBsZXRlIGRldmljZSB0cmVlIG5vZGVzIGNvdWxkDQo+IHNpbGVudGx5IHBhc3Mgc2NoZW1h
IHZhbGlkYXRpb24uDQo+IA0KDQpOb3RlZC4gV2lsbCBpbmNsdWRlIHRoZW0gaW50byB0aGUgcmVx
dWlyZWQgbGlzdDoNCg0KcmVxdWlyZWQ6DQogIC0gY29tcGF0aWJsZQ0KICAtIHJlZw0KICAtICIj
YWRkcmVzcy1jZWxscyINCiAgLSAiI3NpemUtY2VsbHMiDQoNCj4gLS0NCj4gU2FzaGlrbyBBSSBy
ZXZpZXcgwrcNCj4gaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vc2FzaGlrby5k
ZXYvKi9wYXRjaHNldC8yMDI2MDczMC0NCj4gdXBzdHJlYW0tbHRjMzIwOC12OC0wLQ0KPiA2YmRj
YzM1ZTY1ZDdAYW5hbG9nLmNvbT9wYXJ0PTFfXztJdyEhQTNOaThDUzB5MlkhNlpSUk9pSFc0SDFS
dHYtDQo+IERUcnZUZzlBaFk0Z1JOSjVGTTd4REpnRFBoa0lfVlpvMkNFTFJlUXZEWWtoUzZqdkNX
c1ZVZU9OSU02a0Q4DQo+IGVxUEY5bkNNVWpKOHckDQoNClJlZ2FyZHMsDQpDYXJsbw0K
