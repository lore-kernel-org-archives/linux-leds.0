Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A33E56A;
	Fri, 24 Jul 2026 00:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.139.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784851402; cv=fail; b=WqnNQfm1HedXuv8lJPi9Jo3ED86QRTFEqCDZSI4BSGXqo7wnyY6esYK3zuUBflUDhy+847JMk1YTXJCeYjGj6o804XEjgVo7p67inA93GeLRawuGrl2DTL8wbVQrGPXIgWQTBSZZRA4TS/m0Pgz1nOvsj7or0cVnR8+D5yKjpT4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784851402; c=relaxed/simple;
	bh=2Yvtw1Vwho4cRIQgQroILV0s79rAVwRQAht1gEm5ORo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=OH3M/Jy6ELqc6iIRl2/xYbd+X92jATIZkuR32EyxFoEFa8Iz5erVOEjhbZoL57kCFmyPThLog/pNQ/xk6zjuZ53g2hoKwUwIhYkGR6F8J/33dmtLewhe4bqKi2ezqZEAMU/PlPTf6zQ0U5dtcUnVqo22znosMMNMoFntpBEi5w4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=pOkAXP9P; arc=fail smtp.client-ip=148.163.139.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="pOkAXP9P"
Received: from pps.filterd (m0375854.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NMJx3N1249682;
	Thu, 23 Jul 2026 20:03:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=+YxfM
	FtCITh6UULmsPiBeH9ZPlKq23Zf3EJ3rUTnhAA=; b=pOkAXP9PJcxGPgcbDxzq0
	xKtEJCHP5Rbp+TYf14eh915+sNzYPp99Ilkr7oXHIf/SqxFexHUflTdWAaXgNj3H
	IHOkA9wbwCfythQprQm0lseeyUI4UO/p/t/mFH5Q4MjbWfWFuJYgJvkEQAHw8Kpx
	rkTqBFY7MK85ElybZbZhmp8h3N53xcoDW8F3GyMfSyBzu7en7DswucCNUZCDLYDH
	sNYZclj0bX9/AVR9cXQA+cQKwjbkoT3WbOPZVjSTFFIQN/mdMFjRGqSnOdNGvehk
	t4qecebYgP5f3xj4wnnb33FGz5MBGnE2MPN4CnqWJiR1pmKDq6PoyinULRnWxvzB
	w==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010048.outbound.protection.outlook.com [52.101.56.48])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4fkunj07wh-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 23 Jul 2026 20:03:05 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kZjr5yxPH9BwPRYcHIUjq22zSttOofsC51smz0RpWe3ikSGAJrZa8cho1Xt3/+pw7yLHgtRahoJlFgkdV9xjrWrPfQNG3rD1JVnY/P+F4epqQf6P8Ve4ABbEPSjppyFed+BgaMlKyJn+/bIcYcn4ULjr9VTZ3YjwD/qIljhEHYvaQ4Yu3LnWdCDgjMNvaJ5CRhFDQ78jd4TTr+Z32+iiJ+YkMP5WEQD03QPDj+DltfgqRMvmd1OZNaeaUvnungpwadmoghuhdP0aP46whU+OnTMnv5vkyW4TzG4KgY9wf/yThD1WZ3yOhINcm5XYuEtrgi4ODkcenkkInvT3i5qwKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+YxfMFtCITh6UULmsPiBeH9ZPlKq23Zf3EJ3rUTnhAA=;
 b=ec9iuwnADrzjfJly4c+SvIAzjn049xIuB6dhrWHqALoYfeD0HJCxGwlTJRiYYMa/gXENHKti1nMMNYgp8/O2oSeU/uxOyhNbuqYJI+Fd84HzcTHOOSmdj1NQlgFt14GHrqop13RyWmlrtspo+PSdqiwfdpi+HJH3MqsGYE3fU1PeqgvA/9nAxWLljuypMoiG8gNT7DsfLl8eZHgFGM8kzWSZmVnfvBgMvKaO4JGoT58S3DaU75kd2RxIQYwo9E+fGhIIlzfkFNHKu9rmPfMU/Ay6LCV25cCF5yopT0tZC+VxHJj3twbjj4Yb7G2qR9eDHYHVN43fOoGSAPaIroI2vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from BN8PR03MB4977.namprd03.prod.outlook.com (2603:10b6:408:de::11)
 by DS0PR03MB8319.namprd03.prod.outlook.com (2603:10b6:8:297::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Fri, 24 Jul
 2026 00:03:03 +0000
Received: from BN8PR03MB4977.namprd03.prod.outlook.com
 ([fe80::4d86:70cf:8006:e219]) by BN8PR03MB4977.namprd03.prod.outlook.com
 ([fe80::4d86:70cf:8006:e219%4]) with mapi id 15.21.0245.010; Fri, 24 Jul 2026
 00:03:03 +0000
From: "Roleda, Jan carlo" <Jancarlo.Roleda@analog.com>
To: =?iso-8859-1?Q?Uwe_Kleine_K=F6nig?= <u.kleine-koenig@baylibre.com>
CC: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "linux-leds@vger.kernel.org"
	<linux-leds@vger.kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: RE: [PATCH v7 2/2] leds: ltc3208: Add driver for LTC3208 Multidisplay
 LED Driver
Thread-Topic: [PATCH v7 2/2] leds: ltc3208: Add driver for LTC3208
 Multidisplay LED Driver
Thread-Index: AQHdDqd6X68+iu/GPkGM5ITU5Y/EhLZwSUGAgAuX8kA=
Date: Fri, 24 Jul 2026 00:03:03 +0000
Message-ID:
 <BN8PR03MB49770B8628FD152B1E86FE0296CF2@BN8PR03MB4977.namprd03.prod.outlook.com>
References: <20260708-upstream-ltc3208-v7-0-aed7f7bd461c@analog.com>
 <20260708-upstream-ltc3208-v7-2-aed7f7bd461c@analog.com>
 <aljweARVNZ7PvgSY@monoceros>
In-Reply-To: <aljweARVNZ7PvgSY@monoceros>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN8PR03MB4977:EE_|DS0PR03MB8319:EE_
x-ms-office365-filtering-correlation-id: 3b9c1efe-b6f8-4cc6-b443-08dee916ee7a
x-ld-processed: eaa689b4-8f87-40e0-9c6f-7228de4d754a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|38070700021|22082099003|18002099003|10067099003|4143699003|11063799006|56012099006;
x-microsoft-antispam-message-info:
 dWmpjlBlyR2V3a25us5HXFrnfUXUZAXg7F7Z20dSO0H1z7C87zeIX06BX2OLiDUmKk1poYpB1/O9jqSQ+xPNpf/UBg0f6oLhPjlBgYYW5yKFaxceLhHQ+jsMHNgu68ybyqMsroO1Jgfs7Px9h3SF1kS2WBZyMPOFIt0SPeowoDIUlCs1Gpcx/mfEthBtL6gI8cBcS1HwfYwMmCDpAeC/aTROeR2750YY5gIwxBfR6rwnPjjH+b4UQUkqajG5ynCHBpHKa9yt3Xri8AkloqSvaciapyOnS+zBtrGxCyAe9yczOqqPkRsMMEo3OjrRyGKYBZQK9car0zvLC0ZyXjNxEbJ2dSDkJMxyCayB/ygq42iJoZNcK8UmsIR6t+Fnjw2ggB7w7dFIpNbWVcD0V1mNFyRlpyd7/IMgvc7p362BMe3J/gNqAGKMYmWyhlPCedSAe5pmDcX0w8RB0z4DGvsDQWxelv2+wEe3ORXNZMhYF1mJx3MuZafFxWrlLjE8a0yR5wJv9bJixcQU38HwjI1MDCvL8RnaGTDiKO7Q6zMAw8xYpd0rKJZt1Wb/1P0L7Uz8map+v8nq8QD/3d+GbuIiMHx1RDy/KqonDZOMYsxoBTNPhTIRr6ObJccKU2fap+jP+8Rgd4A3oh5Bb5x6sZb0Vdw+g3vwQKyUg72W3RyR1AgMVzaMY0WvSnCxgVHlv0LWRjwq2b1ol7V/bRYay92LuX3tB1RCqsHE1iijAxWd5yI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR03MB4977.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(38070700021)(22082099003)(18002099003)(10067099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?VCIRemop0B2K2UKGNQThT5GU85184Wt3nU1ODKk42N+leUHnvouqHX/Oz8?=
 =?iso-8859-1?Q?96Oil/FCgWdwKsYCnc6F3qCt6X9Rr7cBmWd1vvZgSoc55Wiql0SYN2P6MH?=
 =?iso-8859-1?Q?SN76GXx9vOpiKb6f2Y6DwkJCAsJ/whuJedYuQNh56NOroUf/OLAIWr02SI?=
 =?iso-8859-1?Q?WNMLGCt+s2/2Bo9GSmyVcKOXFiVbGkT5dDQ5eqyy3O9K5iV7um1b4t2wix?=
 =?iso-8859-1?Q?e4rOe/mHmjn261ib5pw+a6G66HOun2aMvLFfe2H9ax2CyUwiFQNocZQOMs?=
 =?iso-8859-1?Q?yBUM475rAyOhhJt2r+anJ1MChJlAbCqqAuxf9c7mJFc1tGf8I/3vog5TT3?=
 =?iso-8859-1?Q?WGcXjMjJRB+/qjoTnl/Fjm9GpRT5qT49aGy22WPKXBB6q408J0qD9tzdQb?=
 =?iso-8859-1?Q?0bCOHTruhkTahler7t1NPnZrnxfp2Q+SnYRw/Y4QSRdOe3nqUUrrrUOhHw?=
 =?iso-8859-1?Q?igm4NPvmqNYPdE81pP9Aox/yWlXtlXDNEnoO9X9KMLCRRH2WFi8AEYhLjC?=
 =?iso-8859-1?Q?UHS4s++h/JANVbWt+MoTIqhxRAUONbIndjBh8lFa6GE8iIK6yk2Q+zoZzQ?=
 =?iso-8859-1?Q?+GkGqwjBn+xftfjg419hVQweFzrLfFuhOpe74GKXpTv2YHf/uBfrXbHUGJ?=
 =?iso-8859-1?Q?HeDjW/1wlYKR2/SfBo11jmzAQm5+HgnkliuPyJKm1+7RyfF0hKAEAjoTVH?=
 =?iso-8859-1?Q?Xi30i9YgND54hlrhJcyj/eqxl2lnk5GgjwO1DBa2A726KYVvjzYM4PnUYZ?=
 =?iso-8859-1?Q?t6daL/GZZyEUSc1a2vudcNk1TfkGC1KOdqXfTHKjdqPknJQyIcM4mapqm6?=
 =?iso-8859-1?Q?xqLVYdamSyRJnyqc9AJv3eHfy6I34kH/Br/W3fwI68gSQWSu1eca1s1Wg9?=
 =?iso-8859-1?Q?990T7IfMT3ak+VsTak6CePVi6P987pStXd5vamm0vmMioQQMhjbeDVdsX6?=
 =?iso-8859-1?Q?XstNS15WwHZugGT/+4vfyPCcLxSdoaVBcHJCc9kKQUhHjtu7j4Cat9Xnqq?=
 =?iso-8859-1?Q?7XfzSCeIpYw9JNq1IheFGTKBNfJO3Gjjz27fmgkHE37kYaSbKgDkma7BPT?=
 =?iso-8859-1?Q?urdseaqVE8yyuFgazaZxKg6PvFilqJg5uDlqKb5aFCPbhMnMrBSW2dmpYp?=
 =?iso-8859-1?Q?iWmC8XDwrk8zTGckw68C3NiQEFRcnrocaXqsqCNuBj/I1ZgUD7ogA152Xm?=
 =?iso-8859-1?Q?6YB+lk77nu7LZXAdNjkLDBzVkAirsOab3nq07nuY/973ccwlgfyiV3iA+T?=
 =?iso-8859-1?Q?zbceFmV/g8I0qU/645gUuT/x+4Dye+rEFt0kCArpg+VMn+tVr3cCSml9n2?=
 =?iso-8859-1?Q?qKGQ8gMFXGT3027qOBmMkOKvXR06HVofKy0lk0Fozcss7MKuTdUWehm9Fz?=
 =?iso-8859-1?Q?6fe23StWij4xxCbyvxMaW58Ryi/MYGC4TxYNHUszLbzp5samGJs5qjWmDn?=
 =?iso-8859-1?Q?bZg/Vyi81ANVQZ6/Kk7/apjSjCowDVu9zKnBROk3bdRvQ9x//T7hLIVFO3?=
 =?iso-8859-1?Q?7Bs56bg5DYkxOFWbSZ1H8tOeQdbFJOS0ncma/NPDgZ9o8ieaNhHwtOI2xZ?=
 =?iso-8859-1?Q?Q3t/lbGXBDi8jj7KyGiABSaBPaKIKGcSF9CkzzI3xfnN8Q+9I+A6MHSxTe?=
 =?iso-8859-1?Q?YQ3FZOr33LKpp1BLG8rG6kaXZ40O1xK6VxyUa+lKT4EUV6zR5eeQ0noX42?=
 =?iso-8859-1?Q?w2ljLVIyp0EWLXp4xJWGk71dIow1L2UVCuFrl389QhjiDlpQ+q8vInoFxz?=
 =?iso-8859-1?Q?yuAFP9lIyPWyhtyGGbNa4TLrjjIsD4yz4WP4B3nJuRr9CFGWb8BIVMO/YQ?=
 =?iso-8859-1?Q?sDcx+azySQ=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	oILNGuUwaCBSQjO/wszXBf2F+RuvTcyiKnQXR41zwS2KFVCghyzEiDDDbwVSaGewgT3pshcpSrQpSyolShn/1NcFhEA/dSdQ4DtFkEWUJ+veFh+BAxcW/X6YshUmFup5tDWwX/42lQLEchN2Acyay5BsVd/ZeyzgmMCt+Dtbmr7j87FUYuodJf7fJf9/zIIRWNrQh8l6T0TRQdfd23KMqiMdJtra7+9/ELd+DEDadqh63TC2IgD9pjhJ7h0gMW+U8C0wgt42dKeF7+WVZlx+nkWOOFQOdvMGmS5Lr/7plVncqZotii5TJxlH5ss1X5eYDkyPJ3Vuhh1gI8P1P7PnGg==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR03MB4977.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b9c1efe-b6f8-4cc6-b443-08dee916ee7a
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2026 00:03:03.2239
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HhJSa//b8SyH3Gwrg/f985ty9/M1WSdZQnh+7Mi7riIDnhKoMYqotoI0QlzElImcLdCTP5vQOW6TvX9NIITvU2kVzHdHCYoenxNNLdu6B4c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB8319
X-Proofpoint-ORIG-GUID: 6ojdr_m3tizHDEr5d-e6a4zIKRH3HZH_
X-Proofpoint-GUID: 6ojdr_m3tizHDEr5d-e6a4zIKRH3HZH_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDIzMiBTYWx0ZWRfX8XgsKWeWNneL
 es0C8Eb6sk3tilJfpwG42vuUepf9vGLWLZG/Cf/FJMtJSPSSg3EFJY6d2LtkA7gQhqEDqJ9ZTh1
 XOCF+uFL6OP51TnmO3pje9wn9bjcuDrzer2McIqu832OeeRgJ+Vdunrmfc1xBfnliIpatjAchas
 1qX8ybhGcRHjIuULCqoQPT4zKuoFQnLD3hJi16aRCM32ELOnLP53qb2IVSo0bRose0CtoAtN58K
 Yl3QSHT5QDiaZfNb4P8OA9dv7T0fL74YbKsGxZN5nV578xA8xfddRbjGy2OTh5h+MLzlhSyXawf
 fTOwyql8yksF1qvKqQYrnh1az7s9FwZr/PNafIocrget+MA2gVCRc+Z0zDdiDjVNVTokNkFSds6
 mYFwiZ/uMHCFPh0fkf+5npknoKL64xZcQsUhjZ89yyxaL3ZYG5ORy97Z71fxmebh1Lcd+7Gn2LT
 Qcs98CHXSgAqCsMCCMg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDIzMiBTYWx0ZWRfXxnTpQ4yq3IZ1
 yo9/SbX2K1qSKMFcuf0vKFS+UvNCTJ+ykIBQjtP4kGXp3rX3jQOPzVmCruroMozRGNGE7Rjxaom
 jHbunjeed6S+Z2aCwu9mTaXFP+q4NREyLiKWbTg/tyFr3OAiwDEe
X-Authority-Analysis: v=2.4 cv=TqTWQjXh c=1 sm=1 tr=0 ts=6a62abb9 cx=c_pps
 a=TQumU+mCWarTt0EIZfG+ng==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=iZSIUCweCk2Oy3QsdGPA:22 a=IpJZQVW2AAAA:8 a=gAnH3GRIAAAA:8 a=VwQbUJbxAAAA:8
 a=gKHlflU1-kAaRK41rqoA:9 a=wPNLvfGTeEIA:10 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_07,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 adultscore=0 phishscore=0
 suspectscore=0 clxscore=1011 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230232

Hello Uwe,

Thank you for the review.

> -----Original Message-----
> From: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>
> Sent: Thursday, July 16, 2026 10:56 PM
> To: Roleda, Jan carlo <Jancarlo.Roleda@analog.com>
> Cc: Lee Jones <lee@kernel.org>; Pavel Machek <pavel@kernel.org>; Rob
> Herring <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; Cono=
r
> Dooley <conor+dt@kernel.org>; linux-kernel@vger.kernel.org; linux-
> leds@vger.kernel.org; devicetree@vger.kernel.org
> Subject: Re: [PATCH v7 2/2] leds: ltc3208: Add driver for LTC3208 Multidi=
splay
> LED Driver
>=20
> [External]
>=20
> Hello,
>=20
> On Wed, Jul 08, 2026 at 03:00:07PM +0800, Jan Carlo Roleda wrote:
> > +#include <linux/bitfield.h>
> > +#include <linux/errno.h>
> > +#include <linux/i2c.h>
> > +#include <linux/leds.h>
> > +#include <linux/mod_devicetable.h>
>=20
> Please don't include this header. The the device-id structs you use are a=
vailable
> via <linux/i2c.h> already.
>=20

Noted, Thank you for the information!

> > +#include <linux/module.h>
> > +#include <linux/property.h>
> > +#include <linux/regmap.h>
> > +#include <linux/types.h>
> > [...]
> > +static const struct reg_default ltc3208_reg_defaults[LTC3208_REG_G_OPT=
]
> =3D {
> > +	{LTC3208_REG_A_GRNRED, 0},
> > +	{LTC3208_REG_B_AUXBLU, 0},
> > +	{LTC3208_REG_C_MAIN, 0},
> > +	{LTC3208_REG_D_SUB, 0},
> > +	{LTC3208_REG_E_AUX_SELECT, 0},
> > +	{LTC3208_REG_F_CAM, 0},
> > +	{LTC3208_REG_G_OPT, 0}
>=20
> Space after opening { and before } please.
>=20

Noted on these changes.

> > +};
> > [...]
> > +	device_for_each_child_node_scoped(&client->dev, child) {
> > +		struct ltc3208_led *led;
> > +		struct led_init_data init_data =3D {};
>=20
> s/{}/{ }/ is the more usual option.
>=20
> > +		u32 chan;
>=20
> Best regards
> Uwe

I will combine these suggestions with those of Lee Jones in the next patch.

Regards,
Carlo

