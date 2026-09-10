Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A789353A77;
	Thu, 10 Sep 2026 22:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.139.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789080687; cv=fail; b=C2RsfVWdfyGKni3MCl/bdYWhn4AF+ppk6LYXMRg7kcf57T2cl1g4LKHSPTgRCsJs6GNN7mCeBucDpqjym79WOtkzxEabgPMj9yFE/SMVGpxlYJwR9SEHrnalqGeVJQN9/zOotNuN2IGor+rWQbse64ODvS+I3AYMtgpScm1D8JY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789080687; c=relaxed/simple;
	bh=v7KTL+GhEoPaI/dMLPI85Zx1habDgWjBWfcz6WmoO1k=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=u7LHOvTh3EvN5V4x0hW2D3ZRV54KaWyg+54UEaIsPg6crnYqwv6oQRnn9HcWbr3fwvKbAKz61QT4ZWSUpE2IzU2zj4vxyWMl8PYgZo31Rcz3hPPSCrHAae9LXYfEXLXjuGEaEsFU7Xyu1CBICR+2Ki4V09IOtfBFNJ4xCsJVh/M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=HKjVGuMS; arc=fail smtp.client-ip=148.163.139.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="HKjVGuMS"
Received: from pps.filterd (m0375854.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ALTkXI2021794;
	Thu, 10 Sep 2026 18:51:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=v7KTL
	+GhEoPaI/dMLPI85Zx1habDgWjBWfcz6WmoO1k=; b=HKjVGuMSOfPnHROAZ1eBq
	BUdjLbFAjQ/MWIvz9nX5BDOIJap5sIVV92zXQDfLCkTiJjXuFEpbw4MmQS6o5ULa
	6cD8Kywo4sJYSORVLFcl7930nWlOHIcSbiM/osvccIDCOiTWmd3yYpFWQdl1m+Y5
	w/87B7W2oC3FFUysvdphOODSkbt61srf9wgH9IRUoywyjzBGalabfJQAorS0Y7PR
	sBjfkCbF6QNwrlivtajBgAtcCuXxmb9XloJJQ7vrOvpjt18TKD96dSWP4obeIJ8u
	aRiyyseHjhc9VAyDGHfI7LJW7R1ZeXSycroftlv4bp5m/oe+fQarWqDRTfWvRze8
	w==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010032.outbound.protection.outlook.com [52.101.85.32])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4gkcxbd4du-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 10 Sep 2026 18:51:07 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S+0RTCVXK87ytcxr/z/gT+PNMJSxi7B8Zd86+X4+L0uHJVmny7/mx01cqClBbD54jusYMHJqbsgB8BlkDl0sJsYsRwy43UFIRZmw8uvgwpEUuaj5GPifCwIeve4j0rbfw3P1AyhrKrVSGr0u/cdHVZ63ykzoKrUeQSHsIlzAf0SnbOYNrsnpbZUy45a01VaC+di+pI8DA7DrpXLTjPcG5yOYjBa059SYcbdC8PJVeVZog1pIAKuYWnYXvE/GVSVGXNh46DMdNeL57+kNW8Rb8GJat+zLoQEYdpv6KlTiFmiSkrgUQxHYpV5vVVHrv0wI+ad59pYKV3kRIbWkq7yCOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v7KTL+GhEoPaI/dMLPI85Zx1habDgWjBWfcz6WmoO1k=;
 b=Oq/5nioW/oun/Y7yCpZQ4UZrZEgU9a9JNThgC0oyY8DVYXv47oaBspIVAfUk3hA5v//3f6XCuZ765mwrFnfJ0JmZuj2Xnhbd2++mYFYLx+5x+P59G++ulUzAK6lggB8k+hL10kcccncdEB6ypuo82UOamCXSm08fku1mOaSnReU5UkGyNb/47gn07Upf12I/tLk79sRrWZXStec5sRrqDS5D+F7Gxpgkr2ce7DtB4QQy4jiR4fHqKQmQNRdBpgg9D597YLQCvdZEiT+CU1YBBYw7a2f9b+egG5Ze0C9A+nvoFbm28jhbRmz/5Go3w3CY81TrIHGaZ1Gj/jq7IH8XMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from BN8PR03MB4977.namprd03.prod.outlook.com (2603:10b6:408:de::11)
 by SA2PR03MB5914.namprd03.prod.outlook.com (2603:10b6:806:113::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 22:51:05 +0000
Received: from BN8PR03MB4977.namprd03.prod.outlook.com
 ([fe80::4d86:70cf:8006:e219]) by BN8PR03MB4977.namprd03.prod.outlook.com
 ([fe80::4d86:70cf:8006:e219%4]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 22:51:04 +0000
From: "Roleda, Jan carlo" <Jancarlo.Roleda@analog.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "linux-leds@vger.kernel.org"
	<linux-leds@vger.kernel.org>,
        "lee@kernel.org" <lee@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: RE: [PATCH v11 2/2] leds: ltc3208: Add driver for LTC3208
 Multidisplay LED Driver
Thread-Topic: [PATCH v11 2/2] leds: ltc3208: Add driver for LTC3208
 Multidisplay LED Driver
Thread-Index: AQHdOzV0K7UxIu/o3k6RBurEys8v4La79swAgAx/BCA=
Date: Thu, 10 Sep 2026 22:51:04 +0000
Message-ID:
 <BN8PR03MB4977920BAE1E5FB0D3D61CBF96BF2@BN8PR03MB4977.namprd03.prod.outlook.com>
References: <20260903-upstream-ltc3208-v11-0-28f5f0fd364e@analog.com>
 <20260903-upstream-ltc3208-v11-2-28f5f0fd364e@analog.com>
 <20260902235602.8112F1F000E9@smtp.kernel.org>
In-Reply-To: <20260902235602.8112F1F000E9@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN8PR03MB4977:EE_|SA2PR03MB5914:EE_
x-ms-office365-filtering-correlation-id: 267cb4a1-fc35-423b-8de7-08df0f8dfe98
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|10067099003|4133799003|22082099003|18002099003|11063799006|56012099006|4143699003|38070700021;
x-microsoft-antispam-message-info:
 gzoFKmZMkKgriRN+1sa89KqanJGiGplT8I/9Hei3bdi1vHwBziwz53YTN+6mxb3cBOXMXT/H7XReJ+wbykLJqRY46VtdSC5glvYQIdeoJXPilhiQpNHoJZDx7LgZxgTHCMjw3OJ9TibaJN178kjk1OWOO5GoKNMgJxMpl31ZMr9pqCN62roUiXvMuYO252PNGRS8cxlYY7acbTXbuoCAori52vSZ7GVhhk+IF1iJPA5kQjGxblkdZVj9Jb5pPcUG14C1i8lKtcO3DoQsWO+DWMgHIguAfw4n1haCKur0RvCHl5SzLXGOLLiGCt/1BB33VupkWEpVt93qRrlmliAEk/w5AEIOlu/OAPwk8lp023cH+qtpwmDgWGWcSqWHa/JTFGMMW6d/b9vK3uaJO+/5+ga8uSp7GzQXWFDDWfvA3EkK4Z9tewoDL0GlT82YbETuMo47sXQxZJXxr05nzvcGeVvNh/6XxKRJOj7djZdQ4Lr8Hm4T1ywLF9OhuGvweHihRVZALKKo2x2gKi8w1Ry5ukBTXKamp7FNq65N2Rf+iZYZUURKsa8ZmV5tsjOv4PFNtHAu+TUkfeTwB/StTY4PkuOY+NKx88q7HxehE26mdGq4F3y2EpNzyzXCk6CD97oe6j8bUilp574Wnx/4naonEvVcZoeliAl5qgiTRP6A4YM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR03MB4977.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(10067099003)(4133799003)(22082099003)(18002099003)(11063799006)(56012099006)(4143699003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WEl6RXlrcGpudHNBUC95NGdxeGxieEVPQW4zVFh5dkZwbzJGQWtJWVUwYW1k?=
 =?utf-8?B?NmhkaHZqSU1SYVRKc29tNDByL0NDOGtMVFVKUGxsNWx1ZVh0bXRaMEJkeUZ4?=
 =?utf-8?B?Y3Uvd3ZRdUpJSEtWZ2J2Z2dSVklOYXdtMlo4Y1NKaUxZNE9vRk42c25sK2h2?=
 =?utf-8?B?eFUwNmZSK3RVQmtXdHg3VGkvTFRSY2xlMklCMXc5b1kzSXhacEs0aFBJaFlN?=
 =?utf-8?B?L1pSZEF4UEhaNHFwZXovK3o5dSt2R1dxeStOQVR2USs3UDdIeXdObzN3Z1VK?=
 =?utf-8?B?TktPc1FsbFZyeGZWZFlNYWdLTDdVdW9TRXNlMVkxTzlTczlDKzFIM0ZGcHIy?=
 =?utf-8?B?T29KYXRUcmZSNEE4bWVVb3NISGtzSjQ2NmZObU5ucFVPaXJjeEJaNWlTRUph?=
 =?utf-8?B?MmNBVFFCeE14VEMxRFNPSjlrekNBUEVUeE9xMVU4TjlHVUxzUER2YVZ6MXdo?=
 =?utf-8?B?cWxNVkwrRTFmVG93aHkvcmJ4U0hxN0E3VW9mQ1FqS2EwSVdBWVlKTmJ5ZnMy?=
 =?utf-8?B?dXV3REx0amYxczJzM2VmbVg2VVF6d0lWc09qMkFtMHlMb3pBOGQwamNxaVdD?=
 =?utf-8?B?RkZZaGpKTUJ6LzJCQ2I3MUw2QzFHQnNRY2dQaUt1a0t6ZEVDMDhWZUVXR3Nt?=
 =?utf-8?B?Zytmc3AwMWRUM3pmWVJ6RG9rd3Y1SGQzQzVqV09SSHUrdHNyWnBoMnYrU2Q5?=
 =?utf-8?B?emhvcTVzZ2JzRXgwRE5rRk1YS1FHbWVYRHVDQjE5UFFGei83cDd5MTdkWWJT?=
 =?utf-8?B?MzRBYWRWbHp3V3Q1eDJGbisybzE5OTgzS2tBZjdzSnQzU2xiMXp3MU5tUkQr?=
 =?utf-8?B?T3JHcHpxTnZnRFZ2NzhpSGpkWnNZRXdOUTdCU0FIOGh6amx0R01WQ2ZFTVdZ?=
 =?utf-8?B?a1VJam4wL05Pc2UxL3pNRVhBNTdUakZUejNlY0MrYjU3b09FeGhaUzZDTU9C?=
 =?utf-8?B?SjU1T3ZiTW1aWjBiaUFyR3AvMjhnNW9jdjVoeUdtTlZjWlVGVFdGYXdwTzMv?=
 =?utf-8?B?UDRGb2QwR0wvUFlwdFJ1Y3VOL1dPd0prMjFWVjA1cnhROUZNM2hxS0Q0bnB2?=
 =?utf-8?B?L2MxZ3FWOGJKT3c1UndBeStlQkZaSThOejFLVmo4ai8xcTd3UlQ5N3l4bC8w?=
 =?utf-8?B?RzJqQTd1S0k5bytFcjJWazlGZE80Uml5amJneEQ4K3BtdE54bVhFTFRyT3Fx?=
 =?utf-8?B?ZDdwRi90QUN4SGxlZFQxUGdDMWh5QURMMFViUXNrOEYxRy94aDBRaVN1TUs3?=
 =?utf-8?B?dDJ2ZmdtY2RYaEFWOS9za2RvTUVOZWhTSkthTVlsWC9ncmdtSDFMdVptWHlD?=
 =?utf-8?B?SDBORTRsakI4ZHQydTFIc3Jub3dYUHpaY2UrcHdGNk1yeDhqcGduZlhHV0kv?=
 =?utf-8?B?SU9uRUpYeDYxbHIzYk9CeFYwdFFDNW9HUFBhRmw3K2ZrUENvTEIrUXR4b0VR?=
 =?utf-8?B?a0dhNW9IYk41dGpvSTkxNGdMeHZzVmVKYXNPdjdoaTUyVGIyZHAwSDVzUFZO?=
 =?utf-8?B?dlI2UHdRVVAzdVBnRVBvK0lUbm5KZDVrRm9Xc1VCZ3drdloyM3hjcHk3SG1Q?=
 =?utf-8?B?RlFWMTRHWTlQR1AvTFNQTk5XSVBldVc1S2NrajdkV2RHUU8xbUh0S1ZFS1lO?=
 =?utf-8?B?SmJDVlJFdyszN2VIKzlFc3VsM3p2UWFRTk1GYnBhUVBodFBXWWJxKzFDaE5T?=
 =?utf-8?B?UktBdllnMEZaUTUvUVdnUUFTMGVVNDRCQXBqY01pZnJJNlBVd201NU5wYklT?=
 =?utf-8?B?V0t0aXF5NVBFcHV1cFpCZ0wyMksrc0luNG9FcG5OSi9IbHVWbFBxNjkxZ1dG?=
 =?utf-8?B?N2pZN1BNbFRWRUpQTyttTE9teWpxb01qZW5lNnVrbGNoNE8yKzUxU1hxckxN?=
 =?utf-8?B?bThDT2hTd2tST3hhVnRlbnhhRzZ0RGxrU2o1NjNjMmI5cmhRSUxCcS9NdnJK?=
 =?utf-8?B?QXFXR1pVMHlRRkVaKzBGbXZzZkpDcDNMQWVsaEwrRXdMbmlBb2ZxUnpWNHJx?=
 =?utf-8?B?YnhsS3UvK0FCaHduNEk1TWJKVHRIVVdJT2EwTjNwd3d6N1h0SjB2eXAwSkxX?=
 =?utf-8?B?Q3FqejZaR3hJL3NLNytYNVNrdllGNFZZV3NFRGd1c0J6Uys4RGZDcXlhak9U?=
 =?utf-8?B?d1VKVWtkR0IvRlcxU0x1ZW0rbmFpYVV1MWRqNWxTUjhhWWtpYnNzVU82eEk5?=
 =?utf-8?B?OTVFVmF6elFZVkZDUVVHcUx1akpYcTI2YktGMDN3dkQwc0ZUQ3JsVERTTUtP?=
 =?utf-8?B?ekgzYmYyRm1ETG9jK0t0eUNUS05xamhaZ0s5SVpPZDJ4MnpibjYyQUlrZU95?=
 =?utf-8?B?N0JITGYyaEU4TUpVVnlHVFhTMkZZYWMwR3FzcUpjVEZuRmkxRTdudz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	RqOax90aqihnRgpClFd9c4jALwBt/X4N59jFLQMBijoe+F6aDlc04B/jAbq7XmvTbvOsH8DvPL2dl0BjuESVsPjn4+pF8NR3o9xGW/oG53fN626r/oGTIJiACJTCodFxf29o/mF6Hn/PeDETGQRKHKoIqNQKi7G9OaTtzJkqM1+hEhdVZevbhSIy/p7FMK21slbF1/B2cYwQONdcOWYtVhRaSDlYX6PNZau6fbnH1vAF9MlK/fn3/PpKnmX1ZKUunkH1Rd+PljbJtQSOkn5mveNmuuluh7jOiyJD8rPesChAk3tlaPbE2fAM/BEg5JBlhTcVCRigYsFSoGFWT+gGfA==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR03MB4977.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 267cb4a1-fc35-423b-8de7-08df0f8dfe98
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2026 22:51:04.5571
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LA88GpR1zuaumW5kEX8+cgl+BivdxRBR3wTxjP5/LHhbjP7DUM5e4uJ/JPsr5CdFd1e5O6bL7FfFNx7RlKaLOxvnY6dDeiB6MFxGbUm/nNs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5914
X-Authority-Analysis: v=2.4 cv=MNL1C8Zl c=1 sm=1 tr=0 ts=6aa3345b cx=c_pps
 a=XSpaKd7YU/jha2kVJ1iHgQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=iZSIUCweCk2Oy3QsdGPA:22 a=uherdBYGAAAA:8 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8
 a=gAnH3GRIAAAA:8 a=aTkRXCj_rFEhl5k61bsA:9 a=QEXdDO2ut3YA:10
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDI4NyBTYWx0ZWRfXw6c2L5RD/TDr
 Pyih5LaFHxT/viqs7uFWJ6FSLchBQ6N+YbW96gB4GBtR/b2W+EqTMwq24LVdxDfKCT4xnRAPzjJ
 cWDK4tvlJ9DQbPQYl+07rAwLlao6iG+uhgnp778RumO5CI07UJNGn4llELnbuqEYBPIepEqPpaF
 6giRrJlVJU26L3GoTjeYaoQKnzbLIqfwHljvkUIkyyS3ktLnJkW9RN64lZR4Arkh7EGso42VwN4
 5QQSRSlz81xDvcFy2vqSbm9aWkVkppDg5IOSxiUOY1u6E9OHPI3V4gnGO4fPxnjwZ4noSRraVqo
 6CN37BWby8mv8hkx3VtL30X2Jvv3Wv2c3B1qAyhJeTMxuBWbUJBH8Tr/e5sRHRVUwPADeqPiO7q
 fG584MC05YivZf1/vJRH0LV2bwnesvKrNV+OvXPZJdd3v22QT/cJsavJ4zUmLSWkIOzyykf+hw2
 KJ0ZBhtWz1AFRbMoEdQ==
X-Proofpoint-ORIG-GUID: U-vxMaQod1mGpPMby6lLRg7I8oamD_gf
X-Proofpoint-GUID: U-vxMaQod1mGpPMby6lLRg7I8oamD_gf
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDI4NyBTYWx0ZWRfXwGQPoxhdPItZ
 I/C1bkrCuOm5GNkyO5bbjq2DdgX1uF/ddypQqCGjki3HZF8+r5cwo5h7yH9JSl5ITMuiC0l2MrR
 T2mVA4FAkkcRkJXiFhn3pYERTrnUTdpHlSEln2bQVUq6pOVSfXIz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_07,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100287

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBzYXNoaWtvLWJvdEBrZXJuZWwu
b3JnIDxzYXNoaWtvLWJvdEBrZXJuZWwub3JnPg0KPiBTZW50OiBUaHVyc2RheSwgU2VwdGVtYmVy
IDMsIDIwMjYgNzo1NiBBTQ0KPiBUbzogUm9sZWRhLCBKYW4gY2FybG8gPEphbmNhcmxvLlJvbGVk
YUBhbmFsb2cuY29tPg0KPiBDYzogY29ub3IrZHRAa2VybmVsLm9yZzsgbGludXgtbGVkc0B2Z2Vy
Lmtlcm5lbC5vcmc7IGxlZUBrZXJuZWwub3JnOw0KPiByb2JoQGtlcm5lbC5vcmc7IGRldmljZXRy
ZWVAdmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjExIDIvMl0gbGVkczog
bHRjMzIwODogQWRkIGRyaXZlciBmb3IgTFRDMzIwOA0KPiBNdWx0aWRpc3BsYXkgTEVEIERyaXZl
cg0KPiANCj4gW0V4dGVybmFsXQ0KPiANCj4gVGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlv
biEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQgMSBwb3RlbnRpYWwgaXNzdWUocykNCj4gdG8gY29u
c2lkZXI6DQo+IC0gW0xvd10gSW5jb3JyZWN0IGFzc2lnbm1lbnQgb2YgbnVtX3JlZ19kZWZhdWx0
cyB1c2luZyBhIHJlZ2lzdGVyIGFkZHJlc3MNCj4gbWFjcm8gaW5zdGVhZCBvZiBBUlJBWV9TSVpF
Lg0KPiAtLQ0KPiANCj4gY29tbWl0IDEzZmE0MmJlYzk5ZTRmOWNlNDY2OWU0YTZhN2M2ZjEyODA3
ZWUzYTQNCj4gQXV0aG9yOiBKYW4gQ2FybG8gUm9sZWRhIDxqYW5jYXJsby5yb2xlZGFAYW5hbG9n
LmNvbT4NCj4gDQo+IGxlZHM6IGx0YzMyMDg6IEFkZCBkcml2ZXIgZm9yIExUQzMyMDggTXVsdGlk
aXNwbGF5IExFRCBEcml2ZXINCj4gDQo+IFRoaXMgY29tbWl0IGludHJvZHVjZXMgYSBuZXcga2Vy
bmVsIGRyaXZlciBmb3IgdGhlIEFuYWxvZyBEZXZpY2VzIExUQzMyMDgNCj4gTXVsdGktZGlzcGxh
eSBMRUQgZHJpdmVyLiBJdCBjb25maWd1cmVzIHRoZSBkZXZpY2UgdmlhIEkyQyBhbmQgc3VwcG9y
dHMgdXAgdG8gNw0KPiBkaXN0aW5jdCBMRUQgY2hhbm5lbHMgd2l0aCBjb25maWd1cmFibGUgY3Vy
cmVudCBsZXZlbHMuDQo+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2xlZHMvbGVkcy1sdGMz
MjA4LmMgYi9kcml2ZXJzL2xlZHMvbGVkcy1sdGMzMjA4LmMNCj4gPiBuZXcgZmlsZSBtb2RlIDEw
MDY0NA0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9kcml2ZXJzL2xlZHMvbGVkcy1sdGMz
MjA4LmMNCj4gDQo+IFsgLi4uIF0NCj4gDQo+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgcmVnbWFw
X2NvbmZpZyBsdGMzMjA4X3JlZ21hcF9jZmcgPSB7DQo+ID4gKwkucmVnX2JpdHMgPSA4LA0KPiA+
ICsJLnZhbF9iaXRzID0gOCwNCj4gPiArCS5tYXhfcmVnaXN0ZXIgPSBMVEMzMjA4X1JFR19HX09Q
VCwNCj4gPiArCS5jYWNoZV90eXBlID0gUkVHQ0FDSEVfRkxBVF9TLA0KPiA+ICsJLnJlZ19kZWZh
dWx0cyA9IGx0YzMyMDhfcmVnX2RlZmF1bHRzLA0KPiA+ICsJLm51bV9yZWdfZGVmYXVsdHMgPSBM
VEMzMjA4X1JFR19HX09QVCwNCj4gDQo+IFtTZXZlcml0eTogTG93XQ0KPiBEb2VzIHRoaXMgY29k
ZSBpbnRlbnRpb25hbGx5IHVzZSBhIHJlZ2lzdGVyIGFkZHJlc3MgbWFjcm8gZm9yIHRoZSBhcnJh
eSBsZW5ndGgNCj4gaW5zdGVhZCBvZiBBUlJBWV9TSVpFKGx0YzMyMDhfcmVnX2RlZmF1bHRzKT8N
Cj4gDQo+IEJlY2F1c2UgTFRDMzIwOF9SRUdfR19PUFQgaGFwcGVucyB0byBldmFsdWF0ZSB0byA3
LCBpdCBjb2luY2lkZW50YWxseQ0KPiBtYXRjaGVzIHRoZSBleGFjdCBudW1iZXIgb2YgZWxlbWVu
dHMgaW4gdGhlIGx0YzMyMDhfcmVnX2RlZmF1bHRzIGFycmF5Lg0KPiBIb3dldmVyLCB1c2luZyBh
IHJlZ2lzdGVyIGFkZHJlc3MgbWFjcm8gdG8gc3BlY2lmeSBhbiBhcnJheSBsZW5ndGggY3JlYXRl
cyBhDQo+IGJyaXR0bGUgc2VtYW50aWMgZGVwZW5kZW5jeS4gSWYgZWxlbWVudHMgYXJlIHJlbW92
ZWQgZnJvbSB0aGUgYXJyYXksIG9yIGlmIGENCj4gcmVnaXN0ZXIgd2l0aCBhIGRpZmZlcmVudCBh
ZGRyZXNzIGlzIGFkZGVkIGluIHRoZSBmdXR1cmUsIHRoaXMgd2lsbCByZXN1bHQgaW4gYW4NCj4g
aW5jb3JyZWN0IHNpemUgYmVpbmcgcGFzc2VkIHRvIHRoZSByZWdtYXAgY29yZS4NCj4gDQoNClRo
aXMgaXMgaW5kZWVkIHRoZSB3YXkgaXQgd2FzIHVzZWQgaW4gdGhlIHJlZ21hcF9jZmcsIGFzIHRo
ZSBlbmQgb2YgdGhlIHJlZ2lzdGVyIGxpc3QgaXMgTFRDMzIwOF9SRUdfR19PUFQgKDB4MDcpIHdo
aWNoIG1hdGNoZXMJIHRoZSB0b3RhbCByZWdpc3RlciBjb3VudC4NCg0KSSB3aWxsIGFkZCBhIG5l
dyBtYWNybyB0byBkZWZpbmUgdGhlIG51bWJlciBvZiByZWdpc3RlcnMgYXZhaWxhYmxlIG9uIHRo
ZSBkZXZpY2UgdG8gYXZvaWQgdGhpcyBkZXBlbmRlbmN5Lg0KDQo+IC0tDQo+IFNhc2hpa28gQUkg
cmV2aWV3IMK3DQo+IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL3Nhc2hpa28u
ZGV2LyovcGF0Y2hzZXQvMjAyNjA5MDMtDQo+IHVwc3RyZWFtLWx0YzMyMDgtdjExLTAtDQo+IDI4
ZjVmMGZkMzY0ZUBhbmFsb2cuY29tP3BhcnQ9Ml9fO0l3ISFBM05pOENTMHkyWSE2TGlmaG0wT2h4
T2lZZl9kaw0KPiAwLXpkcm5RUEl1OVdOVUdROUJ2VTR5REprQmFIVUMxR1hiNFlmSGtId3pfQ3ha
T1YtDQo+IFBnY3lJTm5EUDh3YkNQUVdGN0kzdkdjZyQNCg0KUmVnYXJkcywNCkNhcmxvDQo=
