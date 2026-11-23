Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.36
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795437372;
	b=gaxCuHU+K8sLFSBxgW23G1dKgmoiF0c8pZVD8EZ00D78Yi23ERwJu6yEtIII6Mqw7OVW
	 hyflLD5wTt6NaJqQMBbipKM8x/Ja93qw3PkeTSbexloNrO90UtCrr4/4w1xbD1q15ukvu
	 7JHGUB1ImmTmgdZ8bGg4/MPvOjTT0jN9wBqfuajybQE+jwhVs5EeA977/zXLEM4uXfGwx
	 gH9/rI/hYvqr9JyjFZHgtIYytJH/kt3yHZvLDTas5LJPfjjvCGoUWr2lUDypo9nzVLkcj
	 k/Kvd9cHsrmAjqx42S64HD9nnVq6MRUFzRrY2l5g0eFUuV9s9Up7vLEwtBHptF5ZJ0A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437372;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=YrNRlfhHaQJ0yq71K5dw/GxGP3wATlqR2LjkRNUMiV4=;
	b=vB+K9lG8FY8gkpp8Ya33uiwjBzyN83u9UsdD0M7LdrVaeySJ8/bnyGHGrzTNldLWiPJB
	 7eO8mhPSsHs1RIXzaZ2+sycEC5SVUjuPBB6Y5gPFG7xPM7bUqKb+IP+HHyeL8f66xN5m2
	 8t3jys9Wn6jfmdMVmDB6vBEOjvAHIUOwdcH8mt0/xkQV88PiPDhlsHuG09Vbz2Ydafl8m
	 Gf8o98EG2Na9y/HQsX1CI3hluDhOu2QCRoVGLf/YQR9U6Qq+7uhJ7jLp3x05sv37X5Xoz
	 1BIwyx2BvCFM0q6QKpljWB4wh9Sa38XpHdJZ+X/9WtL5eFqF6EL0L3xZUd4sRN05X+Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=axis.com;
	spf=pass smtp.mailfrom=axis.com;
	dkim=pass header.d=axis.com header.i=@axis.com header.a=rsa-sha256 header.s=selector1 header.b=qRrSjYls;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.36
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013036.outbound.protection.outlook.com [52.101.72.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9582606A330;
	Mon, 23 Nov 2026 12:36:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9582606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=axis.com header.i=@axis.com header.a=rsa-sha256 header.s=selector1 header.b=qRrSjYls
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sCcG2Pk/gMrrszcaQocPF+2uYL7N0oXbri4eI2qizD9eDWpm7dZ43Iq7QIuFAXMFjOpm4bDiBrtTSyGUgaDfyk8yvS2ITVMLccMAgeTWGrLQ6yaSB0mzukEsyIQU534tKubY/wU7Kc2qpocxTbHjH5/TlPCmexcXgxYFyPxkxFcZyN01FP0n7nD0DDjtlZWW5pRUF7QRFLP7nFcP0I1BLiHeGY+FXpVhX6JMJF+h8hrQ7S+7WhUXLxIIm+QnByqHbqDwLHna1wkpCMeTVYFzmwrIogWJFvdoFq+XZvFjqJBYRxod+9cZZaWYMmHJK39vCXnK7ZpPEiYB189V17iWDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YrNRlfhHaQJ0yq71K5dw/GxGP3wATlqR2LjkRNUMiV4=;
 b=GwXkt98nHSAY4jpkEbvZAQGk6u74pKWln6XCN+Gvsol6WJxqaq5i+H8KIvK7bzuRz8wx257pxyVIzyZDN/vIXt3bWwBNoVi6blVFQO7S94LvgYPR18IzDxHQwy/ipH4wZWbkc9UKYQuQwcg9GNUGo2wI8ZxZTST1HPnaeAhPZVY6DAUZkWSHm5jRJ2RsxONnGTaXmxjVk4OCegUN9/ireMvp56+mutYnuqlB6HtWAGL2mS/JlUFSo8es9lmS9LYWSqGNBQllrNcz2OAVekHg91EPDsMCexoTj85URcEfNqhCBLP3Nl+nyKmubCl2LOR0DNkg/o43bJwFXSyBMzwt0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YrNRlfhHaQJ0yq71K5dw/GxGP3wATlqR2LjkRNUMiV4=;
 b=qRrSjYlsgOAB6AaPz6apf2eJXG0TzL4X0TuTJRzZpKDyI2+kl4Ht1DEUi66yc7OK7OyIDDXTr7KagphG8VwErpK8PpivbzTJR8KERD0+iCnoVPhlf7jxUknToSzVbghuTCKqQ4OQ6f85tAphf17vthBFQ3AeSJLmRPH8hkGqswg=
Received: from MI9PR02MB105101.eurprd02.prod.outlook.com (2603:10a6:290:c2::7)
 by DBAPR02MB6470.eurprd02.prod.outlook.com (2603:10a6:10:194::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Mon, 23 Nov
 2026 12:36:08 +0000
Received: from MI9PR02MB105101.eurprd02.prod.outlook.com
 ([fe80::f9b9:80ec:3b7b:b78c]) by MI9PR02MB105101.eurprd02.prod.outlook.com
 ([fe80::f9b9:80ec:3b7b:b78c%4]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 12:36:07 +0000
From: Tobias Johansson <Tobias.Johansson@axis.com>
To: "lee@kernel.org" <lee@kernel.org>, Tobias Johansson
	<Tobias.Johansson@axis.com>
CC: "pavel@kernel.org" <pavel@kernel.org>, "linux-leds@vger.kernel.org"
	<linux-leds@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Kernel <Kernel@axis.com>
Subject: Re: [PATCH] leds: lp50xx: Read default intensity from devicetree
Thread-Topic: [PATCH] leds: lp50xx: Read default intensity from devicetree
Thread-Index: AQHdcEoVLWveDNBko0+c6hFWkPlQW7c1Nr8AgAZ3FwA=
Date: Mon, 23 Nov 2026 12:36:07 +0000
Message-ID: <4d98d460cc5db453139e6dc2953988ca6282a06f.camel@axis.com>
References:
 <20261109-b4-leds-lp50xx-default-intensity-v1-1-0a04a3533df6@axis.com>
	 <179442102947.44545.9103121805533352120@kernel.org>
In-Reply-To: <179442102947.44545.9103121805533352120@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MI9PR02MB105101:EE_|DBAPR02MB6470:EE_
x-ms-office365-filtering-correlation-id: cc4448ba-4cdb-43fe-a131-08df495e5889
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|38070700021|10067099003|4143699003|11063799006|56012099006|261009223027099003|261022075727099003|261026140227099003|261022105027099003|261028144727099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 MH5eqe5J6hTJBHvQ5ayTt1Oihh3oJqDPm/Ra8hRb6NEiFUWU1wa8+OMD2smCcXyZYnaPr73g1Ep9tB4UcIc3bPOaIMm0L0kR+rp41Tom/zuhNP5jH5cKhfiW4gMaN940stMyr/vSkU0QjZO3RfRANfpgpre2fd8AHdlDNINvmBq4pHhXOWX07qrudHyk57+DyPLmwDqcmkpfSq3BF3TOSh5J3MF6iC202642fsJI7mW9Zsjm5cS5awRqsyweaR/Jk/PqkpHaaJ9ZIzIcDUESLo6+5HOMyAndj1n94ht7u7iqB7ZCdwZLlow4sxm1+BuSIZYK/W/UQdiuCn0V70+93uakIf2ioNL8nv3bslRa0krXZSa31QV/6Uq5snLHgym+WLW5ZUQ2L2fc11u2TnVSbbumuFzj/L97MUeUWilSLooLBJR6wgVKL4L3O76WgJ9tGJnw4ZTO9NSQRanzfCxGdN8vuAwF4wjsQUEYzsx6D3MLptlUmL84eZZLMyEF9U0kEqQ4b3kRrna1GiKptLopjACFuO4J1EnSswRh0orkJ8iVA5D4G87mqcIWo4EAVrYqGjOkB7wMKs2/8Pyfd7kOA52RKUaS8OFnETdNkOkUlHoz2SygTdjvG9TzD1fWT+Xegu9YyxDZZROdcIBMh45VXrhkBMn7705zNj5rLQFxxB4/TTLuZBHgpvLNyw9hHK3ZBTq295j8JxaREYZpmEcfFT4qm2dT65l81j6UlNbR75s=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI9PR02MB105101.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(38070700021)(10067099003)(4143699003)(11063799006)(56012099006)(261009223027099003)(261022075727099003)(261026140227099003)(261022105027099003)(261028144727099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aFdZMmVpMVVTSCtHL21RbUJOMzJ6Y1VrMDc0RE5TakNHTURqdmdSeDBvaDRa?=
 =?utf-8?B?TFVHN3JRQXFVanpkV2dLTXN6Um5UQTY4NDBNMW5SN2ZYR2puQzUxb3paYlFG?=
 =?utf-8?B?TkRPSHloU0t2VHJlc1h2d05nZHFqekU2SFlUVW1yK0FYVmhRUzFITTE0Kzd2?=
 =?utf-8?B?WEtTUXRyMG5SNmd2eWVPbklLRlNYN09YOW9kZWhmK1F6YzRyRHVsM05DWDNM?=
 =?utf-8?B?OXNXUEZOajBFaW1NSS9ncmJ3OG0zVlEwM1NlUE1vc1BtNXFCakRXc29tenZr?=
 =?utf-8?B?cmVnTHJ2aHdyenhpZ2w4UXRxZGlSaGt3WnZyZTNQelNFbnNjZW5YUEFnTzVI?=
 =?utf-8?B?WFJzNVpkdENBRDV2R3RUSDIzZzN2V091RmVJVFh0c3ptQngwcWlDY1Rwd09p?=
 =?utf-8?B?cnVXWHR1UGNNOWxiMHNIUXJEVVhCalNsTW44UmpneC9wMnhudnJENTkybENk?=
 =?utf-8?B?NWkxeGVha2c2Mlp4MzdWYy9mS0EwQ0MvVXhaVVZnZkJKTDl3QlBsMVROZHBF?=
 =?utf-8?B?ZmlpbFFWV3BUbCtOOVNBeDd1cnhyZlFkSGt6S3ErOGVoYk16S0UybWhuNHA0?=
 =?utf-8?B?bFBKYjhoSG9VT2F3b0ozQTNOcWVweTl3ZnVhUDNvenk5OVcxc21NMmN4bE5R?=
 =?utf-8?B?ckt6ZDVTNkdGeHh1RWpUWlkxZlFrM0pHMU1Lajh6ZFVaQ3hPQ1lVVS9YR3E4?=
 =?utf-8?B?Zy9ydlRSajdUTko4VDVtVzhndmhSY2tiTzE1WG1pQ3QxT0NsMHg4VnNZeW1R?=
 =?utf-8?B?VjVRMDZEUUo3QUVZc2ozdmk5WFM4VExIZWpNN1dCbU9tTUUvWlY5Q2c2bTEy?=
 =?utf-8?B?NlRiZ2xCTGJKdFlLYkhLQnRYMkh6YldGc0RhRlp5bkd1QnN3NUdpUkcxNXJa?=
 =?utf-8?B?WC9Uam1EeEsvVlRrZzVHS2wzMHhIbjBWRWlNNC9MM2h4L3d6NFp3T3VpeGN6?=
 =?utf-8?B?U1ljLytyMFdHdUtBTmlzWE1kZnEvaXlwV2Nudzh0WWFCRVBJRkNWRXJhcU5C?=
 =?utf-8?B?akFwTWhHV0xGT0dTWlNmZ2t1eFJqZ3RGeURvZ1pJZ3h5NDAyeTh4dUx2N2tj?=
 =?utf-8?B?dHJpOVRORkM4YUVsTHkxbzJobFBzRHh6TFlJNzhLanRBbVE3ditIaitiRzd3?=
 =?utf-8?B?UDMvZ29KRzVabEpSME5xWXJFNjFGNHRBOEpINkhybUpGanlVYTQ4N1JxQjRD?=
 =?utf-8?B?RjY4UGhXUzJHUzU3L0RORTN6bWU4bVg0K3hZTGV5Zm1ScXpQT1VGNkNEU0Ux?=
 =?utf-8?B?dXE5TElVQ29TdDU5N0hmZHJjWFdIeUtWS3VRVVN5NWlWcDZDMGt4aXNNbWEy?=
 =?utf-8?B?K2Nqb3JuUEhpbW5haytHb1g4eElBQkFhdURTa2lzZmw2blEyejlZVnYwTVVz?=
 =?utf-8?B?TmtXSnc3WU5NMUhyL0lINVVvQmxoa0ZPNjJKdFJiREQ1aVRxbytaMFB0NW5a?=
 =?utf-8?B?SmpWdzlIZC9xVCtjcUszcm1RV21JZlA2eWlxdXFkTlNFR3l1K2JpaEovZjZD?=
 =?utf-8?B?S3ZIYldtMTQ1c1hDdWRYdUV5bTVQRnlJUzhEVGJoR1hGWWlGb1N2dk1FTWR6?=
 =?utf-8?B?TURkY1pSS29lUXNZNU5aM0x3RnR0NFMwQmM3cGtNMnQwV1NpZFJiUkZxdnN6?=
 =?utf-8?B?ZDVEYXlyK09yTkVTWG5SbDRDTEVtRzlqU0FBcnlQTnNLWno0Zm9hNWJoYnIv?=
 =?utf-8?B?VXlCNi9URmpvQUFlRmg3RDU2bCswYnFaQWNPd1lkTENTT20yTzNMZ1RwRm10?=
 =?utf-8?B?TnFYVlI1YTg1WHRlTy9sVmwxWHp6cGpJSUR5b1IwZ2tXcGE1aE16SEd3K0pL?=
 =?utf-8?B?YkJyZmp2VFVlcFltT2JITkVPMjAyV2hiNXVvV3VualRneE44c2lSckNXeUdL?=
 =?utf-8?B?QTNTZDZqSi9zeDNQcjNoMUVqZFM3Nm9TcUlMRVVzTHVrdVhMSHpsNU1nUERJ?=
 =?utf-8?B?UEs1STJHRWgzNU55QU1GTWpwdUVteGNxb2VvcG1NRkg5ZHp0THBTUlFaWGVE?=
 =?utf-8?B?NTE5TVBZVUJlQnN3bXpMeEFDUUduNFRmRXhpcXpTYWlxV1hJOWJQQ3RNSENN?=
 =?utf-8?B?aFExekkvaXM1Y2dUNU9FOCtYZzNINVhXTGt1NTQxWmRTbzFhUFBTUzUxc1pT?=
 =?utf-8?B?Wk5xQ0JobHA4OENOUDY5NDFlWFJBaWhkTFVhR0k0SE1RVjdXN0JyY29sOS9W?=
 =?utf-8?B?K3JDZkpVYTM3enpXbmt1cE1LRjJWT3JseVV5UjNNdXE5cWp6bHhqN1gwazBj?=
 =?utf-8?B?L0w5UHNMZkFLcG5uSDQ0U1U0aFMvNHQwOUFOQ09YRHFzaWZFZHdmREdTMlN0?=
 =?utf-8?B?NVlQbFVrMU96QTZvUzRVeldYd0UxdEgzL1pxbCtSa1BHZnFuRFB3QT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <27C267FEA2972349BE0DA1F26C85EB91@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MI9PR02MB105101.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc4448ba-4cdb-43fe-a131-08df495e5889
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2026 12:36:07.1054
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M/Ko1h2ENqVXtZU3lYA2tjXHAH9j/j/6DawaYiIsmkSrKkya1LMUf74Pty2mPZcUawLj02YaibHeSj7fJN/bAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR02MB6470

T24gVGh1LCAyMDI2LTExLTE5IGF0IDA5OjUyICswMDAwLCBMZWUgSm9uZXMgd3JvdGU6DQo+IE9u
IE1vbiwgMDkgTm92IDIwMjYsIFRvYmlhcyBKb2hhbnNzb24gd3JvdGU6DQo+IA0KPiBQbGVhc2Ug
cmV2aWV3LCBleHBsYWluIG9yIGZpeCB0aGUgU2FzaGlrbyByZXZpZXcocykuDQo+IA0KDQpUaGUg
aXNzdWUgU2FzaGlrbyBmbGFnZ2VkIGlzIGEgcmVhbCBwcmUtZXhpc3RpbmcgYnVnOiBudW1fY29s
b3JzIGlzDQppbmNyZW1lbnRlZCBmb3IgZXZlcnkgY2hpbGQgbm9kZSwgc28gYSBkZXZpY2V0cmVl
IHdpdGggbW9yZSB0aGFuIHRocmVlDQpzdWItTEVEIG5vZGVzIHJldXNpbmcgdmFsaWQgcmVnIGlu
ZGljZXMgbWFrZXMgbnVtX2NvbG9ycyBleGNlZWQgdGhlDQpzdWJsZWRfaW5mbyBhbGxvY2F0aW9u
LiBJIGNhbiBmaXggdGhpcyBieSByZWplY3RpbmcgTEVEIG5vZGVzIHdpdGggbW9yZQ0KdGhhbiBM
UDUwWFhfTEVEU19QRVJfTU9EVUxFIGNoaWxkcmVuLg0KDQo+ID4gKwkJCWZ3bm9kZV9wcm9wZXJ0
eV9yZWFkX3UzMihsZWRfbm9kZSwNCj4gPiAiZGVmYXVsdC1pbnRlbnNpdHkiLA0KPiA+ICsJCQkJ
CQkNCj4gPiAmbWNfbGVkX2luZm9bbXVsdGlfaW5kZXhdLmludGVuc2l0eSk7DQo+IA0KPiAobXVs
dGlfaW5kZXggPj0gTFA1MFhYX0xFRFNfUEVSX01PRFVMRSkgb25seSB0ZXN0cyBmb3IgdmFsdWVz
IHRvbw0KPiBsYXJnZS4NCj4gDQo+IFdoYXQgaGFwcGVucyBpZiBgbXVsdGlfaW5kZXhgIGlzIDwg
MD/CoCBPT0I/DQo+IA0KDQpZZXMsIGdvb2QgY2F0Y2guIG11bHRpX2luZGV4IGlzIHJlYWQgd2l0
aCBmd25vZGVfcHJvcGVydHlfcmVhZF91MzIoKQ0KaW50byBhIHNpZ25lZCBpbnQsIHNvIHZhbHVl
cyB3aXRoIHRoZSBoaWdoIGJpdCBzZXQgYmVjb21lIG5lZ2F0aXZlIGFuZA0KYnlwYXNzIHRoZSB1
cHBlci1ib3VuZCBjaGVjaywgY2F1c2luZyBhbiBPT0Igd3JpdGUuIEkgY2FuIGNoYW5nZQ0KbXVs
dGlfaW5kZXggdG8gdTMyIHNvIHRoZSBleGlzdGluZyBjaGVjayBjb3ZlcnMgaXQuDQoNClNpbmNl
IGJvdGggaXNzdWVzIGFyZSBwcmUtZXhpc3RpbmcgYW5kIGNhdXNlZCBieSBtYWxmb3JtZWQgZGV2
aWNldHJlZXMsDQpJIGNhbiBzZW5kIHVwIGEgbmV3IHBhdGNoIHNlcmllcyB0byBmaXggdGhlc2Ug
dHdvIGlzc3VlcyBob3BlZnVsbHkNCnNvbWV0aW1lIHRoaXMgd2Vlay4NCj4gDQoNClRoYW5rcywN
ClRvYmlhcw0K
