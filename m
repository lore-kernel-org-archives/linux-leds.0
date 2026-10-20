Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.26
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792507252;
	b=NTzHldL3CJoy0UzuSe06JDc61AYHJ6RDu67l59gs5whuk2btzPhr9yIXkyPqbAhZRU9v
	 PXeL41r/PW97/5NBgr2DTxiu0idyGooja3LnFJgiGTBato8Z2+u0rtMp1VyGwrxekSM5h
	 OyXGJvBIIL1COljLhLB6sJOjgNejiDAaR8RZzGVYmI7Fvl2AD+xnOQJ/T/V8VwU4ilm/c
	 fshTFmZUisygiBcCV0D5dDPZpseZXYLN4GRIjAGOelQK/7FpztdpuETehcjz/DemYNpfs
	 DedGP4O6qXQNtkz4Evb00fisQNVMFvJkhbXbwsXmefCB6UwHneJI/8ZMEwpngY27v6Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792507252;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 user-agent:x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-atpmessageproperties:x-ms-exchange-senderadcheck:
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
	bh=6tXzOIWKpwSMB/ik8wRuxSKFmpXc+AF2435oKIxNVD0=;
	b=fkQD4vwT8PhMy3OzUkohQtd402fPks5x1UaOWvJVZ+DQ4G73uAh3/gbmPUlpwu1wLI3S
	 RSWFo7C66mBGliaOiZIePy7Ag8ueTVf876pp2uZkckgh9ORnYKsOLLnzsY2AqoY7tWJYb
	 6p3ray73vUEEa03kz5akTTnzkJBElJ9MF2Jx0zGqCqv+cX8tSczzpzjGGUTIT1k9cu4Hy
	 dBfE2C4VriaaVVjqrr6yHgyxLLtzNDLjz/itEPrR8hyzEOG8MNhl2INlLO9L87nveXWhu
	 dgVtwUFw2FbRcfR5wtnJB9Id7WZ0G343RstS6KIgQ2f2W/fp1Cj3FofyMjbbSzR9LMw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siemens.com;
	spf=pass smtp.mailfrom=siemens.com;
	dkim=pass header.d=siemens.com header.i=@siemens.com header.a=rsa-sha256 header.s=selector2 header.b=lUMVlm5L;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.26
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011026.outbound.protection.outlook.com [40.107.130.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA30606A31D
	for <linux-leds@vger.kernel.org>; Tue, 20 Oct 2026 14:40:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEA30606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=siemens.com header.i=@siemens.com header.a=rsa-sha256 header.s=selector2 header.b=lUMVlm5L
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VscRdPzU+zZwl+s+eTmxSlZzSofxOf+vpU+eni8dLj14SWutml4+ulR6VMfYFqpjx4ZaLqb1pwERbTKlFkSN7X0wuYrEWv9U+vL7QvXZ6jEVPZNzjyju/1Vcid9hrVKoO2hpbb0QhM/Chf6WdMz1+ssPYlHGU5MDZVGus1Yqew1ag/wu7oNFDQHtf3xUHr0+1NEN+3W5zCTRc3w539cvBw9YoTlc3U/zIZqLThLK6e3geWk+Ds/8ixcVgwmxJfJUhC9JMrVPunuiq4IiGGX1ps8d+ZbTxqMICQLk/9m7E4JDkxhDoGRaZdquTvfnwJ9V66uDH1JDnXLfNQX1+ZBNUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6tXzOIWKpwSMB/ik8wRuxSKFmpXc+AF2435oKIxNVD0=;
 b=aIlJ0vcdmC1pEszFw68q/B26P9KIDYJnR5SEJwPPDPlaExrAjT3Kjo939cUFFDbwn0t/Wla/QL0CqLOGQulsyZKTj9wyUr+r8CRluxuF2oYBCnAaj3/vaTJosJSZu7W3XZyiB2eR62iIWjsta5herX1JDbX4sfX4gI44TVVs6/CNJ3pwwhkP52UxgyOwjYil9y32QwlDUOUhsmHecMUp8Dne82Xrwz63iTn4Ikh94b5GtA0oj1Uj72pjLDfu0IWmo1+VRhUIedBnRAmz3abFxGYh6p2CghGg80qNIiEGKdArYrNJTik/3myafYdJ5+kDl6m98ViIemhSrKK5xqIQvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6tXzOIWKpwSMB/ik8wRuxSKFmpXc+AF2435oKIxNVD0=;
 b=lUMVlm5LFussGctIyZ6N751Q+Nw7o2Q7me4X55z7bA1gphHv6OUlh6wwswnabAIgpsvy+INtXupdt5nfMoMxVDmVtK4RU+DKVgAOFfmXj0+4XXOGDViCNpYdhFLBoe+AJE/+WJik1ns2Xtb1S3g/flsNmcNpxZ18M+UOcMFwrs/l6ZbxfseZixPMnNrIiqaTs8e9ICTnNgDW/9vtyv0JRzNxxcOtcYeub5CNVs7IyB9GQmEMGIVLXiGkMcop2OcyEXJAprzND/Ct/dUFHA3gCitg3D2dgIv6kRS50oO+ioHcPMw8YTQ1CgV2GxS0QoLu6MbEGxIDXLaoyFj16Jvk6Q==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by GV4PR10MB026424.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:411::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Tue, 20 Oct
 2026 14:40:48 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9126:d21d:31c4:1b9f]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9126:d21d:31c4:1b9f%3]) with mapi id 15.21.0546.012; Tue, 20 Oct 2026
 14:40:48 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>,
	"linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
CC: "lee@kernel.org" <lee@kernel.org>
Subject: Re: [PATCH v5 4/4] leds: trigger: netdev: Serialize mode/interval
 stores with trigger lock
Thread-Topic: [PATCH v5 4/4] leds: trigger: netdev: Serialize mode/interval
 stores with trigger lock
Thread-Index: AQHdYJEYffqzxivP4UqyLefsmTNHULcGZHKAgAAcaIA=
Date: Tue, 20 Oct 2026 14:40:48 +0000
Message-ID: <bcabe7eaf6efdf59b7378fed3533ccc2d44382b1.camel@siemens.com>
References: <20261020124651.1987272-1-alexander.sverdlin@siemens.com>
	 <20261020124651.1987272-5-alexander.sverdlin@siemens.com>
	 <sashiko-outbox-178980@kernel.org>
In-Reply-To: <sashiko-outbox-178980@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.58.3 (3.58.3-2.fc43) 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|GV4PR10MB026424:EE_
x-ms-office365-filtering-correlation-id: 3c541207-063b-4437-7b66-08df2eb821c1
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|38070700021|56012099006|260925021911599003|260925022911599003|260925021311599003|11063799006|4143699003|261009220027099003|261009221227099003|261009223027099003|261009223327099003|261009221727099003|10067099003|18002099003|22082099003|55112099003|6133799003;
x-microsoft-antispam-message-info:
 +U6zlXLWXIH8ul+h2VQVKRX3kKGVRlw/YjpJNuKcFo0W9b1SPIXGCtoYNoh8NCgA3kjn1WjZC+HrZrV2YNVmr0/Vr2WLc29soHbEkkp7oXaGXBjpx8vrbuo3GpHscE7yre26tvFNejMsKsH8bhJ71bUuOwdupQu08GE7+paxMJ0Q0R7JnvXYsmZSOw45JZsjydV3HqusCuksEYMKCHq6IM24HoN1qtA9sSK0PArHlmKMevLX6+PMoCJSravNh2jWTa2iBEWuie73YJBRtLkuy25Aun7oq5Im53TlknegAaTYJngsQJs/yGL+9ztpDqc5gYuIcK5SdlkN9EgXf1pCELv7xANWiTpYLOLjmkEO5m1b36SRRF5mY7MjtiK+CYJvr7CWnJml9ntTQzWwlEWl1jdJHDLvQRory14m0J2Xv+mvWHdS7wPfSJCSHXv+gYMAD/acyZ1quqe9JPDfQt+TnJvrfTWq70djaYM2pGfmNsp9SD1YqWktwkJUmS3s3SSpd8L1RvakU1SwNTK7o+BcxWdt/GBwKGtpVtQpkBa+lH8F5mNpDiI6XQmMeKCPktD8SIQoQRQWdER4ktsYvi+hrQecmGK8A9meiauCsAwJfn+QWnXraidDqU4dWsGGCqEHpWSP74Nkc/0gSO/J1MMEjtzj1bnq+Yiz86V5WJka4Wk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(38070700021)(56012099006)(260925021911599003)(260925022911599003)(260925021311599003)(11063799006)(4143699003)(261009220027099003)(261009221227099003)(261009223027099003)(261009223327099003)(261009221727099003)(10067099003)(18002099003)(22082099003)(55112099003)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OFk0b1NoMzVTZGRKRXlFSXVaanhzVmZ6cmJjdjZNb3dLakJoVWpZWU51NGRC?=
 =?utf-8?B?T0ttdlUxZktsMitzMHpUbm5iNFpLMTFTY1oxaS91ejNNL1I3WWJ3OURIVHNa?=
 =?utf-8?B?bGNwZ2JJT0NHdjlCWXBtYUVJRkpSWjM3S0pvMlVmeHp4elEva2dRVm9jWWRP?=
 =?utf-8?B?b1F5OXB0dS9EVXI1V2gya01pZmIxSjIrMGlURWRHcVAydm9pdU5nazIrNVlk?=
 =?utf-8?B?c0hqZjdpbDRaNjcxYkZpOEFiVUU4KzR3NEthYVZhNUhIbXJKN1Jxc2pqblU2?=
 =?utf-8?B?clkvN3VOZ0UvRTFuMlJkTHFRNkorTmhnQUVVSzZ1YWJ4L2pIVU13NDAwUC9w?=
 =?utf-8?B?eUc1dzYzNWFwbXplVkhkRzc1YkJwY0Z5cVVBMmtOTnVOMWh5enh5cDZBOElM?=
 =?utf-8?B?UHJ2NmF2UTJRYnFYQk41eXNuVnpPWmtHVjE0c242UnJHRVIrRHc2RTYrakRv?=
 =?utf-8?B?ZXBuUjNYMFI5dThkS2pqdm9CcDVTNHowZ0Y0NUlLSVAzU2dhb212TUlzazR4?=
 =?utf-8?B?YkQ3ZkZiZDJhOCs5cVA3YUFLaE8zUzBLQTZhNUtIc2hsUTgxbGRMTG9tb3NY?=
 =?utf-8?B?RHhBUldOaWxEWFdJWGt5MThFRmpway9FUng2Q3dnWlJVRk5uQVlMeFBPZnNH?=
 =?utf-8?B?QWVuTGgvZTlMUXIybHhKV1RIVkNiYnRUcUhHUFpzVWJUY2tpVlpvQUluTTl1?=
 =?utf-8?B?dXRZbmx6SlRHYVp6WXRQK1FnelBRZ09sR2d1VWo0TVp6eXVZQXBSOHc0eWVo?=
 =?utf-8?B?ZGwycE9mQ1hoMUZqbDcwLzFyMldJT0RZaXFWa0h3elFNcXJvNy9uL2dLTWwx?=
 =?utf-8?B?M25tN0JEME5WMGprQTBPMWNVaDFWR0hDT2k3U25oQ21vZ2ROZVdDL2hnSW9H?=
 =?utf-8?B?d3FTQmQybGcyeXFDWXIwUC90WGVWcHdnYmtzdUpwL2s0cmhXaEYrZ00xdzQr?=
 =?utf-8?B?aTdwVkpxMWE0dEl0aEVIcmtwanozbzB2ejdsWldaMUNHYzFkRkdXNzRWOWZS?=
 =?utf-8?B?QW1hNE03aVVSUnc5WjFmY0dFSnNneXZ1a3UxSFlvdVdxd1R6M2g1TmUxUUxr?=
 =?utf-8?B?ZVBDTzRSSmhRYWduU2hZVWN6WFVmbUZ6QjI1UjFaZW9SK3hEUHdEa0ROQzFp?=
 =?utf-8?B?SDU1NjRFOSt6ZVkyYXEvYWFwZWlocXVRNnN2elhjUzFWT0V2UGJ4OWZiOWs1?=
 =?utf-8?B?alUwTUZ5YUw3cHNFUVF0aWd1Z0NPM2szcHhyYVFJdHZYZDQ4K2l5TUhlQWt3?=
 =?utf-8?B?VnN4RUc1NzZ2bFZUUzg0TW03SGhJbmp3ZVpDVzJ3b2ZWWU1Fbk8zSTB2UkZx?=
 =?utf-8?B?c0s4VlNrN0FEQkV0RlZueVFrYkc5UVBzUmJYSzVwM0FST0IyMmZxcFZkUjRl?=
 =?utf-8?B?VjRReFltMmpUQkpPSXoybjlicXpXZmg3dVQ2ZEQzejhCRytoazl0bDh5SHk5?=
 =?utf-8?B?WGg1bzhMNnR5dmlCNGZ6c2xySXNQc1F6U01DRFVPOTh5a2R1Zy9QbjFQRjlL?=
 =?utf-8?B?OVZmOVFCUW5rRVk0S0NEUDlmMXh0UjdrYkN6c1FiYWVsZTg3WU5qZkhaQXhD?=
 =?utf-8?B?TFZOWDdra2gyNExFZWxsY3daRnE1Y21jQTErT1hOa1RRclZtN21MODhBS0VK?=
 =?utf-8?B?bENTU1FwZjMybzRibVFWT1ZIbU9Rd20ydnZ1TW9rU0JTanlXYy9LZHFpM1NM?=
 =?utf-8?B?cFhXV08vOGdpZ3dFOGtzYmxlbkJyL2RBSC9OSjhxbmhJRXliQm9mQ0ZZaWE0?=
 =?utf-8?B?UHJZclNpbkhDM2krTzYzODNGTThpditsUFpQYnNTTXBzMi9ha2p1amVVZmtZ?=
 =?utf-8?B?QWxEVWFFQ0IrbTFDNmJIclFKYWJXRHNBSlY2RjVNMU1ndEMwM0FXSzlJczRi?=
 =?utf-8?B?ekRaUE9LNnRGYnFFdGpPd0dHdkFVMnUxMy9XOUJ5NVg1NDFVcFkydWI0bmpM?=
 =?utf-8?B?RXQ2QWRFSWdxMEhvVHdXNHlhRDZhR05KQzkvaWpwRFJGMlBwNVlXcmo2SXkz?=
 =?utf-8?B?LzN3S2gxMXEzWXVRbHZSRG9KZFFlUThkc205RkdvUXhoMWgzV0JwUmxWWWs4?=
 =?utf-8?B?YUlBclg0UkRVUWtSVUYrMFd6TFh2S0YrMEVKbWJsanlBTzBrVk4vVTcrSWc0?=
 =?utf-8?B?STFCZEd6MDF5Q0NZRC94WjlpVTQ5M1czdzBjNko0aGo4RUJmRHNOa0ZZRWhU?=
 =?utf-8?B?czBCZXNNMVpLdlcrNlVESzdtdWh1MUpyamVVRmxlOFlNSVBFRnJtWWx6T1kx?=
 =?utf-8?B?M3BRZkxXbGlMeWwzclMzcm9BayswbmhaUk1abEtmNk9mcGFWNkx6a2xzemt5?=
 =?utf-8?B?SDZoV1RxNmZwR2creEZJNFBlU2lEejhtRlE4WkdyV09WMit6dEU3ZEt4ZDJQ?=
 =?utf-8?Q?rg+AyCMb5uvF11jI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <417863182EF7D54BA089CA9832E198D9@EURPRD10.PROD.OUTLOOK.COM>
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
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c541207-063b-4437-7b66-08df2eb821c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2026 14:40:48.5003
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2dz/mkP5pSapd8Nd9dtg2EDdyvKqalFRmbxexNWT0ETS3C8Eyw917ewskJyZyqcIwP+1/2YxcjrNSu4urDr8lG+ESazezyEAgr6Gf2bZADM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR10MB026424

SGkgYWxsLA0KDQpPbiBUdWUsIDIwMjYtMTAtMjAgYXQgMTI6NTkgKzAwMDAsIHNhc2hpa28tYm90
QGtlcm5lbC5vcmcgd3JvdGU6DQo+IFRoYW5rIHlvdSBmb3IgeW91ciBjb250cmlidXRpb24hIFNh
c2hpa28gQUkgcmV2aWV3IGZvdW5kIDIgcG90ZW50aWFsIGlzc3VlKHMpIHRvIGNvbnNpZGVyOg0K
PiAtIFtNZWRpdW1dIGxlZHM6IHRyaWdnZXI6IG5ldGRldjogdW5sb2NrZWQgaHdfY29udHJvbCBj
aGVjayBpbiBpbnRlcnZhbF9zdG9yZSgpDQo+IC0gW01lZGl1bV0gbGVkczogdHJpZ2dlcjogbmV0
ZGV2OiBtaXNzaW5nIGNhcnJpZXJfbGlua191cCBjaGVjayBpbiBuZXRkZXZfdHJpZ19zd19ibGlu
aygpDQoNCkFDSywgYm90aCBmaW5kaW5ncyB3aWxsIGJlIGZpeGVkIGluIHY2Lg0KDQo+IC0tDQo+
IA0KPiBjb21taXQgZmE2MTg4MzJmYThlOTY3ZDAxM2Y4N2MwODBjZGVkN2QwYjE1NTgyNw0KPiBB
dXRob3I6IEFsZXhhbmRlciBTdmVyZGxpbiA8YWxleGFuZGVyLnN2ZXJkbGluQHNpZW1lbnMuY29t
Pg0KPiANCj4gbGVkczogdHJpZ2dlcjogbmV0ZGV2OiBTZXJpYWxpemUgbW9kZS9pbnRlcnZhbCBz
dG9yZXMgd2l0aCB0cmlnZ2VyIGxvY2sNCj4gDQo+IFRoaXMgY29tbWl0IHNlcmlhbGl6ZXMgc3lz
ZnMgbW9kZSBhbmQgaW50ZXJ2YWwgYXR0cmlidXRlIHN0b3JlcyBpbiB0aGUNCj4gbmV0ZGV2IExF
RCB0cmlnZ2VyIHVzaW5nIHRyaWdnZXJfZGF0YS0+bG9jaywgc3dpdGNoZXMgdG8gYXN5bmNocm9u
b3VzDQo+IHdvcmsgY2FuY2VsbGF0aW9uIHRvIGF2b2lkIGRlYWRsb2NraW5nIHdpdGggbmV0ZGV2
X3RyaWdfd29yaygpLCBhbmQgYWRkcw0KPiBhIG5ldGRldl90cmlnX3N3X2JsaW5rKCkgaGVscGVy
IHRvIGdhdGUgc29mdHdhcmUgYWN0aXZpdHkgcG9sbGluZy4NCj4gDQo+ID4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvbGVkcy90cmlnZ2VyL2xlZHRyaWctbmV0ZGV2LmMgYi9kcml2ZXJzL2xlZHMvdHJp
Z2dlci9sZWR0cmlnLW5ldGRldi5jDQo+ID4gaW5kZXggYmY5YTVlYzI0NWE0My4uNjg1OTc4MzQy
MmY1ZCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2xlZHMvdHJpZ2dlci9sZWR0cmlnLW5ldGRl
di5jDQo+ID4gKysrIGIvZHJpdmVycy9sZWRzL3RyaWdnZXIvbGVkdHJpZy1uZXRkZXYuYw0KPiA+
IEBAIC04MSw2ICs4MSwxNiBAQCBzdHJ1Y3QgbGVkX25ldGRldl9kYXRhIHsNCj4gPiAgDQo+ID4g
IHN0YXRpYyBjb25zdCBzdHJ1Y3QgYXR0cmlidXRlX2dyb3VwIG5ldGRldl90cmlnX2xpbmtfc3Bl
ZWRfYXR0cnNfZ3JvdXA7DQo+ID4gIA0KPiA+ICsvKiBUcnVlIHdoaWxlIHRoZSBzb2Z0d2FyZSBh
Y3Rpdml0eSB3b3JrZXIgc2hvdWxkIGtlZXAgcG9sbGluZyBhbmQgYmxpbmtpbmcuICovDQo+ID4g
K3N0YXRpYyBib29sIG5ldGRldl90cmlnX3N3X2JsaW5rKHN0cnVjdCBsZWRfbmV0ZGV2X2RhdGEg
KnRyaWdnZXJfZGF0YSkNCj4gPiArew0KPiA+ICsJcmV0dXJuIHRyaWdnZXJfZGF0YS0+bmV0X2Rl
diAmJiAhdHJpZ2dlcl9kYXRhLT5od19jb250cm9sICYmDQo+ID4gKwkgICAgICAgKHRlc3RfYml0
KFRSSUdHRVJfTkVUREVWX1RYLCAmdHJpZ2dlcl9kYXRhLT5tb2RlKSB8fA0KPiA+ICsJCXRlc3Rf
Yml0KFRSSUdHRVJfTkVUREVWX1JYLCAmdHJpZ2dlcl9kYXRhLT5tb2RlKSB8fA0KPiA+ICsJCXRl
c3RfYml0KFRSSUdHRVJfTkVUREVWX1RYX0VSUiwgJnRyaWdnZXJfZGF0YS0+bW9kZSkgfHwNCj4g
PiArCQl0ZXN0X2JpdChUUklHR0VSX05FVERFVl9SWF9FUlIsICZ0cmlnZ2VyX2RhdGEtPm1vZGUp
KTsNCj4gPiArfQ0KPiANCj4gW1NldmVyaXR5OiBNZWRpdW1dDQo+IFNob3VsZCBuZXRkZXZfdHJp
Z19zd19ibGluaygpIGFsc28gY2hlY2sgdHJpZ2dlcl9kYXRhLT5jYXJyaWVyX2xpbmtfdXA/DQo+
IA0KPiBJbiBzZXRfYmFzZWxpbmVfc3RhdGUoKSwgdHJpZ2dlcl9kYXRhLT53b3JrIGlzIG9ubHkg
c2NoZWR1bGVkIHdoZW4NCj4gdHJpZ2dlcl9kYXRhLT5jYXJyaWVyX2xpbmtfdXAgaXMgdHJ1ZSwg
YW5kIGl0IGlzIG5vdCBjYW5jZWxsZWQgd2hlbg0KPiBjYXJyaWVyX2xpbmtfdXAgaXMgZmFsc2U6
DQo+IA0KPiBkcml2ZXJzL2xlZHMvdHJpZ2dlci9sZWR0cmlnLW5ldGRldi5jOnNldF9iYXNlbGlu
ZV9zdGF0ZSgpIHsNCj4gCWlmICghdHJpZ2dlcl9kYXRhLT5jYXJyaWVyX2xpbmtfdXApIHsNCj4g
CQlsZWRfc2V0X2JyaWdodG5lc3MobGVkX2NkZXYsIExFRF9PRkYpOw0KPiAJfSBlbHNlIHsNCj4g
CQkuLi4NCj4gCQlpZiAobmV0ZGV2X3RyaWdfc3dfYmxpbmsodHJpZ2dlcl9kYXRhKSkNCj4gCQkJ
c2NoZWR1bGVfZGVsYXllZF93b3JrKCZ0cmlnZ2VyX2RhdGEtPndvcmssIDApOw0KPiAJfQ0KPiB9
DQo+IA0KPiBCb3RoIG5ldGRldl90cmlnX25vdGlmeSgpIGFuZCBzZXRfZGV2aWNlX25hbWUoKSBj
YWxsDQo+IGNhbmNlbF9kZWxheWVkX3dvcmtfc3luYygmdHJpZ2dlcl9kYXRhLT53b3JrKSBiZWZv
cmUgYWNxdWlyaW5nDQo+IHRyaWdnZXJfZGF0YS0+bG9jazoNCj4gDQo+IGRyaXZlcnMvbGVkcy90
cmlnZ2VyL2xlZHRyaWctbmV0ZGV2LmM6bmV0ZGV2X3RyaWdfbm90aWZ5KCkgew0KPiAJY2FuY2Vs
X2RlbGF5ZWRfd29ya19zeW5jKCZ0cmlnZ2VyX2RhdGEtPndvcmspOw0KPiANCj4gCW11dGV4X2xv
Y2soJnRyaWdnZXJfZGF0YS0+bG9jayk7DQo+IA0KPiAJdHJpZ2dlcl9kYXRhLT5jYXJyaWVyX2xp
bmtfdXAgPSBmYWxzZTsNCj4gCS4uLg0KPiAJc2V0X2Jhc2VsaW5lX3N0YXRlKHRyaWdnZXJfZGF0
YSk7DQo+IA0KPiAJbXV0ZXhfdW5sb2NrKCZ0cmlnZ2VyX2RhdGEtPmxvY2spOw0KPiB9DQo+IA0K
PiBJZiBhIGNvbmN1cnJlbnQgbmV0ZGV2X2xlZF9hdHRyX3N0b3JlKCkgb3IgaW50ZXJ2YWxfc3Rv
cmUoKSBhY3F1aXJlcw0KPiB0cmlnZ2VyX2RhdGEtPmxvY2sgaW4gdGhlIHdpbmRvdyBiZXR3ZWVu
IGNhbmNlbF9kZWxheWVkX3dvcmtfc3luYygpIGFuZA0KPiBtdXRleF9sb2NrKCZ0cmlnZ2VyX2Rh
dGEtPmxvY2spIHdoaWxlIGNhcnJpZXJfbGlua191cCBpcyBzdGlsbCB0cnVlLA0KPiBzZXRfYmFz
ZWxpbmVfc3RhdGUoKSB3aWxsIHJlLWFybSB0cmlnZ2VyX2RhdGEtPndvcmsuDQo+IA0KPiBXaGVu
IG5ldGRldl90cmlnX25vdGlmeSgpIG9yIHNldF9kZXZpY2VfbmFtZSgpIHRoZW4gYWNxdWlyZXMN
Cj4gdHJpZ2dlcl9kYXRhLT5sb2NrLCBpdCBzZXRzIGNhcnJpZXJfbGlua191cCA9IGZhbHNlIGFu
ZCBzZXRzIHRoZSBMRUQgdG8NCj4gTEVEX09GRiB3aXRob3V0IGNhbmNlbGxpbmcgdGhlIG5ld2x5
IHNjaGVkdWxlZCB3b3JrLiBXaGVuIG5ldGRldl90cmlnX3dvcmsoKQ0KPiBydW5zLCBuZXRkZXZf
dHJpZ19zd19ibGluaygpIHJldHVybnMgdHJ1ZSBkZXNwaXRlIGNhcnJpZXJfbGlua191cCBiZWlu
Zw0KPiBmYWxzZSwgYWxsb3dpbmcgdGhlIHdvcmtlciB0byBrZWVwIHBvbGxpbmcsIGJsaW5raW5n
IHZpYQ0KPiBsZWRfYmxpbmtfc2V0X29uZXNob3QoKSwgYW5kIHJlc2NoZWR1bGluZyBpdHNlbGYg
d2hpbGUgdGhlIGxpbmsgaXMgZG93bg0KPiAoYW5kIGxlYXZpbmcgdGhlIExFRCBvbiB3aGVuIGFu
eSBsaW5rIG9yIGR1cGxleCBtb2RlIGJpdCBzZXRzIGludmVydCA9IDEpLg0KPiANCj4gWyAuLi4g
XQ0KPiANCj4gPiBAQCAtNTAzLDEwICs1MjAsMTQgQEAgc3RhdGljIHNzaXplX3QgaW50ZXJ2YWxf
c3RvcmUoc3RydWN0IGRldmljZSAqZGV2LA0KPiA+ICANCj4gPiAgCS8qIGltcG9zZSBzb21lIGJh
c2ljIGJvdW5kcyBvbiB0aGUgdGltZXIgaW50ZXJ2YWwgKi8NCj4gPiAgCWlmICh2YWx1ZSA+PSA1
ICYmIHZhbHVlIDw9IDEwMDAwKSB7DQo+ID4gLQkJY2FuY2VsX2RlbGF5ZWRfd29ya19zeW5jKCZ0
cmlnZ2VyX2RhdGEtPndvcmspOw0KPiA+ICsJCW11dGV4X2xvY2soJnRyaWdnZXJfZGF0YS0+bG9j
ayk7DQo+ID4gKw0KPiA+ICsJCWNhbmNlbF9kZWxheWVkX3dvcmsoJnRyaWdnZXJfZGF0YS0+d29y
ayk7DQo+ID4gIA0KPiA+ICAJCWF0b21pY19zZXQoJnRyaWdnZXJfZGF0YS0+aW50ZXJ2YWwsIG1z
ZWNzX3RvX2ppZmZpZXModmFsdWUpKTsNCj4gPiAgCQlzZXRfYmFzZWxpbmVfc3RhdGUodHJpZ2dl
cl9kYXRhKTsJLyogcmVzZXRzIHRpbWVyICovDQo+ID4gKw0KPiA+ICsJCW11dGV4X3VubG9jaygm
dHJpZ2dlcl9kYXRhLT5sb2NrKTsNCj4gPiAgCX0NCj4gPiAgDQo+ID4gIAlyZXR1cm4gc2l6ZTsN
Cj4gDQo+IFtTZXZlcml0eTogTWVkaXVtXQ0KPiBDYW4gaW50ZXJ2YWxfc3RvcmUoKSByYWNlIHdp
dGggY29uY3VycmVudCB0cmlnZ2VyX2RhdGEtPmh3X2NvbnRyb2wgdXBkYXRlcz8NCj4gDQo+IEF0
IHRoZSBzdGFydCBvZiBpbnRlcnZhbF9zdG9yZSgpLCB0cmlnZ2VyX2RhdGEtPmh3X2NvbnRyb2wg
aXMgY2hlY2tlZA0KPiBiZWZvcmUgYWNxdWlyaW5nIHRyaWdnZXJfZGF0YS0+bG9jazoNCj4gDQo+
IGRyaXZlcnMvbGVkcy90cmlnZ2VyL2xlZHRyaWctbmV0ZGV2LmM6aW50ZXJ2YWxfc3RvcmUoKSB7
DQo+IAlpZiAodHJpZ2dlcl9kYXRhLT5od19jb250cm9sKQ0KPiAJCXJldHVybiAtRUlOVkFMOw0K
PiAJLi4uDQo+IAlpZiAodmFsdWUgPj0gNSAmJiB2YWx1ZSA8PSAxMDAwMCkgew0KPiAJCW11dGV4
X2xvY2soJnRyaWdnZXJfZGF0YS0+bG9jayk7DQo+IH0NCj4gDQo+IElmIHRyaWdnZXJfZGF0YS0+
aHdfY29udHJvbCBpcyBmYWxzZSBkdXJpbmcgdGhhdCB1bmxvY2tlZCBjaGVjaywgYQ0KPiBjb25j
dXJyZW50IG5ldGRldl9sZWRfYXR0cl9zdG9yZSgpIG9yIG5ldGRldl90cmlnX25vdGlmeSgpIChv
biBORVRERVZfVVApDQo+IGNhbiBhY3F1aXJlIHRyaWdnZXJfZGF0YS0+bG9jayBmaXJzdCwgc2Vl
IHRoZSBkZWZhdWx0IGludGVydmFsIGluDQo+IGNhbl9od19jb250cm9sKCksIGFuZCBzZXQgdHJp
Z2dlcl9kYXRhLT5od19jb250cm9sID0gdHJ1ZS4NCj4gDQo+IFdoZW4gaW50ZXJ2YWxfc3RvcmUo
KSB0aGVuIGFjcXVpcmVzIHRyaWdnZXJfZGF0YS0+bG9jaywgaXQgZG9lcyBub3QNCj4gcmUtY2hl
Y2sgdHJpZ2dlcl9kYXRhLT5od19jb250cm9sIGJlZm9yZSB1cGRhdGluZyB0cmlnZ2VyX2RhdGEt
PmludGVydmFsDQo+IGFuZCBjYWxsaW5nIHNldF9iYXNlbGluZV9zdGF0ZSgpLiBEb2Vzbid0IHRo
aXMgYWxsb3cgdHJpZ2dlcl9kYXRhLT5pbnRlcnZhbA0KPiB0byBiZSBjaGFuZ2VkIHRvIGEgbm9u
LWRlZmF1bHQgdmFsdWUgd2hpbGUgaHdfY29udHJvbCBpcyBhY3RpdmUsIGNhdXNpbmcNCj4gc3Vi
c2VxdWVudCBjYW5faHdfY29udHJvbCgpIGNoZWNrcyB0byB1bmV4cGVjdGVkbHkgZHJvcCBvdXQg
b2YgaGFyZHdhcmUNCj4gb2ZmbG9hZD8NCj4gDQo+IFsgLi4uIF0NCj4gDQo+ID4gDQo+ID4gYmFz
ZS1jb21taXQ6IDNkMjI5Y2U4OTg2MmI4ZTgyZDcxYTllMTFkNmY4NDBjYTI3MmE2ZDYNCg0KLS0g
DQpBbGV4YW5kZXIgU3ZlcmRsaW4NClNpZW1lbnMgQUcNCnd3dy5zaWVtZW5zLmNvbQ0K
