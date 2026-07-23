Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2270940F759;
	Thu, 23 Jul 2026 23:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784850806; cv=fail; b=I47oD+XZgCiAD+RenDwWxRxjX8c/kgWk3P0ZYWTpjjR+7kobth+7uYOrNb4SorbdvCJdWgoFyR52/1tha2smsyn7C31+19sC+EbVmpbWNieuTX5UTWokjIuXIu9d3J1x9drlbO9aOUOZUbIm70SXSHly8H0jzfR06npTF1FkvZM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784850806; c=relaxed/simple;
	bh=caXPo6Uw7/LhuDgkTTsuQoRZeO4Dav0R/4HOrA5nBlg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ShKF9mA03ZuONeQv57FM8GZiKloCEDmucjzBODJGZjco31fJ+L8zWiTvk3gjBVw6zMLh11voXDRRKyfg/yTDW83Pb3WOEN1fH4S4L13JkvuWwRWnmcW4toKFK0Nxt8R9mOQK8lUVuENYZNCSAqWkM9p1YvQ6hxFRMYn+B+JgXZc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=Ewxx60Tk; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="Ewxx60Tk"
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NLdv2A3272985;
	Thu, 23 Jul 2026 19:53:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=9KyuR
	q0LLMUTGsmZAVoN3PkwIw+EeS8si07XjvDqraY=; b=Ewxx60TkoSqgevSzggkO6
	cjzyYwL3fvvgGejIby1JXbPnoL2wYSEHyEgLCfKVDQ+PJ9dw0liy5dPHxVNX6PvO
	k6fRmsaVkgAvnhi4srJy7zCXpspDITuCf25lAdzNSIYmo+Mx58OLiJWSd5W6vyTu
	2D09zrhOD1ZNmMcy4aksRBFO8x53D65tLBbjtzNdyXgYYr4RsNqWnXy9UGc+cei6
	JNjAZsWP0ZGGKal4WtvQDBCt4jgGfdlUoXuBPIuPjv2nyAa/+csiXtf12bjZHTxC
	Bd0ENALykOu6OC0+FIQnqH6AfUpZ2sNrYfzM7ujlAhmlpOL/x/UgIBW4ZjLWR9pU
	Q==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011007.outbound.protection.outlook.com [40.93.194.7])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4fj6v4w7sa-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 23 Jul 2026 19:53:21 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AIejgjJpoAkCX2RDmMhkQv2UULrzpfy4npYcu/pendlYxM9HbR5IDhx4SptcsHB0fE+JEJz9dtu1KNYnGhbTNuKFUeOjxuO7EF+kHYbttQQf5R+nHwA2eoYNK74Qd+4eVrikHuZUv+4QueJrIt+HI5uEiaf864xBSTQPljo5E6s9kZ1p3rD+bYiUQ8OkzMDB4n2mMouWmDPAt+T01xosD3/eSrmBG9MDBTSIhvzeh49iLwWrHLTz/E+f9h4MTQVSHc4HDrmk8nVgejCZjRV/hd/pJnERRGwHBqKpuXBMMT9kVm8qKPr1rev9EwA9fQSgo4rBUZzqNt89aK5y7WNt1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9KyuRq0LLMUTGsmZAVoN3PkwIw+EeS8si07XjvDqraY=;
 b=PJoS6NQiXWtLxxru2Ok2nv0yQFfVPihJ/AoZAZbUePMJSV1dgDDMG++4ewvO6ZFaJeVcLWNkMofdEgK+bDEZKDqNZLJi74GbkMEZhfZm6BALt8xIBXrDbXsEAOLUmDW0ifwcTgbqMo1FKjNjnN4TzlpL/jJcaKgKJ/PFCPtMGB9ktWJU3EKktaCyJXHgkaWk7Da9PQkt9RBtXSWfdKrIWOmBEHXSXHpgFM/5NXVZj+Ng8dNBrZYmQ48yVXMxCxkiS4m6nB3TdBXWO2GK/F/TtArOU3G1Y1k7Y1E29KFZh0A0fw3BVCfD7LOx3TbMNnv5lHeS3Xuxa//mvSnpA8GQKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from BN8PR03MB4977.namprd03.prod.outlook.com (2603:10b6:408:de::11)
 by PH0PR03MB5816.namprd03.prod.outlook.com (2603:10b6:510:34::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Thu, 23 Jul
 2026 23:53:18 +0000
Received: from BN8PR03MB4977.namprd03.prod.outlook.com
 ([fe80::4d86:70cf:8006:e219]) by BN8PR03MB4977.namprd03.prod.outlook.com
 ([fe80::4d86:70cf:8006:e219%4]) with mapi id 15.21.0245.010; Thu, 23 Jul 2026
 23:53:15 +0000
From: "Roleda, Jan carlo" <Jancarlo.Roleda@analog.com>
To: Lee Jones <lee@kernel.org>
CC: Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        =?iso-8859-1?Q?Uwe_Kleine_K=F6nig?= <u.kleine-koenig@baylibre.com>
Subject: RE: [PATCH v7 2/2] leds: ltc3208: Add driver for LTC3208 Multidisplay
 LED Driver
Thread-Topic: [PATCH v7 2/2] leds: ltc3208: Add driver for LTC3208
 Multidisplay LED Driver
Thread-Index: AQHdDqd6X68+iu/GPkGM5ITU5Y/EhLZwQIKAgAr4eiA=
Date: Thu, 23 Jul 2026 23:53:14 +0000
Message-ID:
 <BN8PR03MB4977FE33016E8AB0C5B58FEB96C02@BN8PR03MB4977.namprd03.prod.outlook.com>
References: <20260708-upstream-ltc3208-v7-0-aed7f7bd461c@analog.com>
 <20260708-upstream-ltc3208-v7-2-aed7f7bd461c@analog.com>
 <20260716142511.GL1260374@google.com>
In-Reply-To: <20260716142511.GL1260374@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN8PR03MB4977:EE_|PH0PR03MB5816:EE_
x-ms-office365-filtering-correlation-id: 107ab3fe-9962-46c3-dbe9-08dee9158fdd
x-ld-processed: eaa689b4-8f87-40e0-9c6f-7228de4d754a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|3023799007|38070700021|6133799003|10067099003|4143699003|11063799006|56012099006|18002099003|22082099003;
x-microsoft-antispam-message-info:
 sjCfhIjHAuI/R4PJ9LwtpxtcHvTlJW3T+MwdAq7ZGRM+jlO7COyutemzwsBfiMKyT3QVnLLU3ZCYFH14xeJgRvvsQvP0f6Zp9HJgqKTAJVPMM7WdDmATFdbMmIKwRFiXn1YEvcee6HrPDjIKIc4C52h7eAYJd9trsC0bRNhIgOO25LgunrQ9duoGKnSQ0ze6x9LrVVSjy2b+USQyHlEU7weaoCIbz+BI5D9nZl2W/JqDTb0GZ+szzs5EGPiSVmmCn6a8woONis7LINLDoxi6cs1Fwm2Y8FSrBf7TYKylPFTERFMlJqP9a+x0ZA7Ns3WcdaEv2TmmH3KOJj+wDITSdhm0u4lZ+35wGvpu3pcvac5T5MZL+u9wulcnInj7J3vHAWA1p5zbTtUYb28UEOIV8mRcfW0XD6uUcde2vXKJagdxlRM8W8Tzu1rVq5MQJ1ut2k2rYW81Qxzc9Cfs7WCttC8urUj+so9k5RUvlnlDwugVyO4QkLLahQ4HQHs35v3reyP5eFc1v3oBtYsfmYX4JcKDjV9UBoHm0u9udmlGbiEC5tYsKK0SfoOV3pG87UGlQmqcqsaqGL84DmRysonRaEZq55GXN+wuqbF+6lnDsOtd5wFBgTSFYSWsbiyoqbhRVj2V1gb1OqVknIZi3J7YvfW08QRg1KvAyOea6LaQiFz+sYwNzCwi+aEhKmqRn+pvWinLxJjE85LU0LRHZFZgi5q+5YE+9wrMecTT1e+c+jE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR03MB4977.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(3023799007)(38070700021)(6133799003)(10067099003)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?mUKAVtRqdBI5p5lZtDpb+Sprfkl1DxuRzRJa8wdi2PIWkvxadFBQAYnElc?=
 =?iso-8859-1?Q?Gtyd62fCMGn43PBwUMa67CEkeDr//3h7rI6LxUY7+qaEJlCdHJvxYD0rys?=
 =?iso-8859-1?Q?xt8fa1QHpEzl79+Yukkud2BFfX0KTLypQgiZXpMqHmzjqp3PGGOwGrEK9O?=
 =?iso-8859-1?Q?+khJ8GXPab1pK0O6zR8RLXZzD5m/tuOF8O9Un8lkkrKxMuUBum2W1ujyOc?=
 =?iso-8859-1?Q?mBYm2eKLJxFsz/7JINMM7ah4wVNcBEyHhlKjvd6jyhvAl53Yg4iGQ6sOrA?=
 =?iso-8859-1?Q?2/yhg0QCmlzf5dED03WxCqSZK9oFKGU0ZuwtWfwAA19d4IV+nNLG6jIWaJ?=
 =?iso-8859-1?Q?UwAZOjWmQPFiJbRc02UXxwUFK214itqholQiv/Upiaw0hs/Iv2vFL31lhD?=
 =?iso-8859-1?Q?H3KNW/Y/3HZ6dOErD4JN3XmUhi4FqcQ4nrnnNf7M75vvB1nrSEyRDM2wx+?=
 =?iso-8859-1?Q?9c6ykEE70O5ZH7DbjD7I/U25gJAyzSqsVYsE+F9njKsKQlNOCTENY18hf/?=
 =?iso-8859-1?Q?UKoy5pPK1jqyQfHhpb+pG1e7rx0JBhgNkkdVo1gTYVpfKn8hNkpofeoooe?=
 =?iso-8859-1?Q?MPKmIFAL8DZWOsOwvKnOIFggRsLz0DlvyBR/U4pzeR8xORe5eLsQXCORI5?=
 =?iso-8859-1?Q?e7wxwIVQlJ0E8IDiDFyOD6Z8LHmvGwZagKeAtmATDJ2fo/rMx6DlObo71S?=
 =?iso-8859-1?Q?hN67rsKvSj04TVUMI8WLkB8wZfwc/CbBVFAG3mde1Gnq6sRrx5eYPYOiQz?=
 =?iso-8859-1?Q?9G4X0+hidTMarlrPsKpXvewejpnopxpsdbzVGObDiDJ63SLjL+ctlTnhs4?=
 =?iso-8859-1?Q?LRz/hwG/WCjqmyt128dMthWR6gU09s6G3+l3QoQAfEOuWIwHVNITsL8170?=
 =?iso-8859-1?Q?hePWTYHk8GsoZcKO956o0qmgv4XpOGRUlcF66m9aFvJ463oIW+orcLLwQZ?=
 =?iso-8859-1?Q?F7loafTef728T/VWJcdnfkORFDHh9mQua42L8O5IBBapBDlVpm+XFMi40F?=
 =?iso-8859-1?Q?IbKhfELIAptPk6zoJblesL3X4C1KBbl1fWOmMenw5lhILz2T3NVYI2Ef3I?=
 =?iso-8859-1?Q?rpHSEEDGyvkmum2sJtTOGq0co8X7DmVTZMrHM5GnozDmEV50bWf6IDuOxw?=
 =?iso-8859-1?Q?wuhRNaMOroU4LKWYQH5t77agJ0a7qMrwwJURnM94sCRufXC1ZCZv7lEPwr?=
 =?iso-8859-1?Q?H8T7tjdw6VtxXSjGSvro8UneguyBhZc7n8v8jUoL7gqhYJe65MIoBd37Pw?=
 =?iso-8859-1?Q?UHsiHsFtASIQqc5/M4b/EegbPTa1tC1Afi6NGPUi5s6GDyQn3M0sCNxfcC?=
 =?iso-8859-1?Q?gXHOjj0JyyHAOT3Vt8Pt3DfBtemQwvZT4U2S9IGyv38kbciGgycgA64G5t?=
 =?iso-8859-1?Q?GuejP7zy6x0a/bYZVSgdtKqFkSMByviUJqCIKeot6JSFwWDAY5W6r4g10n?=
 =?iso-8859-1?Q?VgSGKXSQV+ox9YEfUGq/kiVnMLgT71crhu3NrgRoW3j+g9hX24c+sxTAxs?=
 =?iso-8859-1?Q?u0EQl23raLdpvQh0JSgI49XXjcQvyGrYJZ0IIRlFKLNSSp311E/U0KXdEe?=
 =?iso-8859-1?Q?oRmkFMrfOqvepatmje6By+iCjof5xskjBRkWuVNIH0fNWaF9K7QqC1tez5?=
 =?iso-8859-1?Q?nUUfkqeBKrLlQCMdVsDMUOmT2QbxgrupNPiiAL3JIpK+0AuNBzgSn6towW?=
 =?iso-8859-1?Q?oR1nCG4zK5YCdsE9gYSegJEtuoEtga4fTrJGZ47SLShIisWeOC5w2n07rO?=
 =?iso-8859-1?Q?wQF0K3PDFL1XEnPvRnCOyYM8JKPmZckNfaiY6YILvWfz3mV10aY0aFvrcz?=
 =?iso-8859-1?Q?MeqrFwu28w=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	QWJmxhNg4CR7ZDShwayWaO5Vv+DoHNvHX3btaIzy9UnONqyC84PnFgzJgSC2D6FXtcGDuEBWVzJV4cmtECWuFsiOjDl/IaGZxSXMNfUAuNIIDZZi+jGd+8RwKG7mzT3QEAFMs3ndOXRWNNvbMnbKJuS8G8/K2VPaANezr4iYm6cLRd4kijW3Pw4EyRWVfoFjN/zmHsmRdX2FsHSUg/8CMQCDGhQ0N10y3uYJXvduG6ZUxrjdmYLn/irv4dNfzDBXWP0xCA9LLNy/+WdwfrcjD+d7lVb9h2XJYPmvNOjTm4KURf2XZ3pXvsrjte8v9ylaA4E2//mk/TwMes5ZytClrw==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR03MB4977.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 107ab3fe-9962-46c3-dbe9-08dee9158fdd
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2026 23:53:15.0350
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FQBaW84Xn5S10H8LiYpEQNbAehBLPGSM+7P7CPckJkQLRsN235cV4teXBnT5U11LNlH0xHImxVmQip9hAQq6IRgVSznzmlj55O0ak9jqWmc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5816
X-Authority-Analysis: v=2.4 cv=DYknbPtW c=1 sm=1 tr=0 ts=6a62a971 cx=c_pps
 a=4hG4CnY/eg4LDOVkUp5rMg==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=uXIjobp8t2wMuQ0fPvqm:22 a=gAnH3GRIAAAA:8 a=VwQbUJbxAAAA:8 a=IpJZQVW2AAAA:8
 a=UvRXZeYJ_0LVbeUuRF4A:9 a=wPNLvfGTeEIA:10 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-ORIG-GUID: Rixf5DXg5uKx1ISb76-bYK01y6uS86RK
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDIzMSBTYWx0ZWRfX2umB1CDwShpl
 QtkcyomTR1UBeOYhjqli1KZtSUouugJ3GLkTJ0KdC2gHK0ocjqpJAOLKc4rQWqwEAEZwAa7eCoR
 HFFk2I3HkfZt/jgsyqEmSW3OGqx5jrKuSnGVPBmvAx//FZ0CVfdr
X-Proofpoint-GUID: Rixf5DXg5uKx1ISb76-bYK01y6uS86RK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDIzMSBTYWx0ZWRfX95LAKY0Cpn23
 i3JLOI9++Roavcx0S5NxFA2VvTMopfw7nyLgWlkXtuel/bXZ3Ou7kUEm7ev+hSqVrv45CNlECwe
 1sV0IaA7rss/KkuKz36EcyFY3Hyma3PioFcgnmMTxiuSokRns6ZUam0KQ/OjBNb1RuwnIbr1AbN
 N4yIZ9+/EvSLM5HJYTLWaZ7zP+fI8M0AxzV4gYcIBGbzmsW04SnJxJKIg4vf1ExCDS4c2YQzC3S
 O+K/b55ByZiZZaQ6qGNtNxF0wa/MK9JYUGag8LH6JSWFbFDwzLNhlIIIoUSX+JUWv3lUU16DXw9
 1YR1KNuXnvT5dyw5W7b4oTCkWrntPgICvpi+/pribvTWeVDS2YBlwAw77HpBAREHfKZwtvK3c5w
 z+D2C2q8q3QNXNUx2yr+xZOxEaXBWSdu2klfsbDNhbLCvVGpkBfWkaER9CzTfzxu3M2cXb6mEbP
 vFVVU7IucT4s1ehphtw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_07,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230231

Hello Jones,

Thanks for the comprehensive review.

> -----Original Message-----
> From: Lee Jones <lee@kernel.org>
> Sent: Thursday, July 16, 2026 10:25 PM
> To: Roleda, Jan carlo <Jancarlo.Roleda@analog.com>
> Cc: Pavel Machek <pavel@kernel.org>; Rob Herring <robh@kernel.org>;
> Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley
> <conor+dt@kernel.org>; linux-kernel@vger.kernel.org; linux-
> leds@vger.kernel.org; devicetree@vger.kernel.org; Uwe Kleine K=F6nig
> <u.kleine-koenig@baylibre.com>
> Subject: Re: [PATCH v7 2/2] leds: ltc3208: Add driver for LTC3208 Multidi=
splay
> LED Driver
>=20
> [External]
>=20
> On Wed, 08 Jul 2026, Jan Carlo Roleda wrote:
>=20
> > Kernel driver implementation for LTC3208 Multidisplay LED Driver.
> >
> > The LTC3208 is a Multi-display LED driver, designed to control up to
> > 7 distinct LED channels (MAIN, SUB, AUX, CAMHI, CAMLO, RED, GREEN,
> > BLUE), each configurable with its own current level that is equally
> > set to its respective output current source pins for external LEDs.
> >
> > It is programmed via the I2C serial interface.
> > MAIN and SUB support 8-bit current level resolution, while AUX,
> > CAMHI/LO, RED, GREEN, and BLUE support 4-bit levels.
> >
> > The AUX LED channel can be configured to mirror the CAM, SUB, and MAIN
> > channel current levels, or as its own independent AUX channel.
> >
> > The CAM LED channel is configured as 2 separate CAMHI and CAMLO
> > register sub-channels, which current is selected via the CAMHL pin, or
> > set to CAMHI register only via setting the S_CAMHILO bit high in regist=
er G
> (0x7).
> >
> > Signed-off-by: Jan Carlo Roleda <jancarlo.roleda@analog.com>
> > ---
> >  MAINTAINERS                 |   1 +
> >  drivers/leds/Kconfig        |  12 +++
> >  drivers/leds/Makefile       |   1 +
> >  drivers/leds/leds-ltc3208.c | 251
> > ++++++++++++++++++++++++++++++++++++++++++++
> >  4 files changed, 265 insertions(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS index
> > 2fd6ffdaaf04..e3b59485ecb3 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -15229,6 +15229,7 @@ L:	linux-leds@vger.kernel.org
> >  S:	Maintained
> >  W:	https://ez.analog.com/linux-software-drivers
> >  F:	Documentation/devicetree/bindings/leds/adi,ltc3208.yaml
> > +F:	drivers/leds/leds-ltc3208.c
> >
> >  LTC4282 HARDWARE MONITOR DRIVER
> >  M:	Nuno Sa <nuno.sa@analog.com>
> > diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig index
> > f4a0a3c8c870..d917ce3b72f4 100644
> > --- a/drivers/leds/Kconfig
> > +++ b/drivers/leds/Kconfig
> > @@ -1028,6 +1028,18 @@ config LEDS_ACER_A500
> >  	  This option enables support for the Power Button LED of
> >  	  Acer Iconia Tab A500.
> >
> > +config LEDS_LTC3208
> > +	tristate "LED Driver for Analog Devices LTC3208"
> > +	depends on LEDS_CLASS && I2C
> > +	select REGMAP_I2C
> > +	help
> > +	  Say Y to enable the LTC3208 LED driver.
> > +	  This enables the LED device LTC3208, a 7-channel, 17-current source
> > +	  multidisplay high-current LED driver, configured via I2C.
> > +
> > +	  To compile this driver as a module, choose M here: the module will
> > +	  be called ltc3208.
> > +
> >  source "drivers/leds/blink/Kconfig"
> >
> >  comment "Flash and Torch LED drivers"
> > diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile index
> > 7db3768912ca..0148b87e16ba 100644
> > --- a/drivers/leds/Makefile
> > +++ b/drivers/leds/Makefile
> > @@ -61,6 +61,7 @@ obj-$(CONFIG_LEDS_LP8788)		+=3D leds-
> lp8788.o
> >  obj-$(CONFIG_LEDS_LP8860)		+=3D leds-lp8860.o
> >  obj-$(CONFIG_LEDS_LP8864)		+=3D leds-lp8864.o
> >  obj-$(CONFIG_LEDS_LT3593)		+=3D leds-lt3593.o
> > +obj-$(CONFIG_LEDS_LTC3208)		+=3D leds-ltc3208.o
> >  obj-$(CONFIG_LEDS_MAX5970)		+=3D leds-max5970.o
> >  obj-$(CONFIG_LEDS_MAX77650)		+=3D leds-max77650.o
> >  obj-$(CONFIG_LEDS_MAX77705)		+=3D leds-max77705.o
> > diff --git a/drivers/leds/leds-ltc3208.c b/drivers/leds/leds-ltc3208.c
> > new file mode 100644 index 000000000000..484690e3763c
> > --- /dev/null
> > +++ b/drivers/leds/leds-ltc3208.c
> > @@ -0,0 +1,251 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * LED driver for Analog Devices LTC3208 Multi-Display Driver
> > + *
> > + * Copyright 2026 Analog Devices Inc.
> > + *
> > + * Author: Jan Carlo Roleda <jancarlo.roleda@analog.com>  */
> >
> >  Nit: \n here.
> >
> > +#include <linux/bitfield.h>
> > +#include <linux/errno.h>
> > +#include <linux/i2c.h>
> > +#include <linux/leds.h>
> > +#include <linux/mod_devicetable.h>
> > +#include <linux/module.h>
> > +#include <linux/property.h>
> > +#include <linux/regmap.h>
> > +#include <linux/types.h>
> > +
> > +/* Registers */
> > +#define LTC3208_REG_A_GRNRED 0x1 /* Green and Red current DAC*/
>=20
> Are these the registers from the datasheet?
>=20

Yes, these are specified in the datasheet.

> > +#define LTC3208_REG_B_AUXBLU 0x2 /* AUX and Blue current DAC*/
>=20
> You're missing a space at the end of some of these comments.
>=20

Noted.

> > +#define LTC3208_REG_C_MAIN 0x3 /* Main current DAC */ #define
> > +LTC3208_REG_D_SUB 0x4 /* Sub current DAC */ #define
> > +LTC3208_REG_E_AUX_SELECT 0x5 /* AUX DAC Select */ #define
> > +LTC3208_AUX1_MASK GENMASK(1, 0) #define  LTC3208_AUX2_MASK
> GENMASK(3,
> > +2) #define  LTC3208_AUX3_MASK GENMASK(5, 4) #define
> > +LTC3208_AUX4_MASK GENMASK(7, 6) #define LTC3208_REG_F_CAM 0x6 /*
> CAM
> > +(High and Low) current DAC*/ #define LTC3208_REG_G_OPT 0x7 /* Device
> > +Options */ #define  LTC3208_OPT_CPO_MASK GENMASK(7, 6) #define
> > +LTC3208_OPT_DIS_RGBDROP BIT(3) #define  LTC3208_OPT_DIS_CAMHILO
> > +BIT(2) #define  LTC3208_OPT_EN_RGBS BIT(1)
> > +
> > +#define LTC3208_MAX_BRIGHTNESS_4BIT 0xF #define
> > +LTC3208_MAX_BRIGHTNESS_8BIT 0xFF
> > +
> > +#define LTC3208_NUM_LED_GRPS 8
> > +#define LTC3208_NUM_AUX_LEDS 4
> > +
> > +#define LTC3208_NUM_AUX_OPT 4
> > +#define LTC3208_MAX_CPO_OPT 3
>=20
>  The values above are mostly unreadable.
>=20
>  Can you tab all of the values above so that they line-up.
> > +
> > +enum ltc3208_aux_channel {
> > +	LTC3208_AUX_CHAN_AUX =3D 0,
> > +	LTC3208_AUX_CHAN_MAIN,
> > +	LTC3208_AUX_CHAN_SUB,
> > +	LTC3208_AUX_CHAN_CAM
> > +};
> > +
> > +enum ltc3208_channel {
> > +	LTC3208_CHAN_MAIN =3D 0,
> > +	LTC3208_CHAN_SUB,
> > +	LTC3208_CHAN_AUX,
> > +	LTC3208_CHAN_CAML,
> > +	LTC3208_CHAN_CAMH,
> > +	LTC3208_CHAN_RED,
> > +	LTC3208_CHAN_BLUE,
> > +	LTC3208_CHAN_GREEN,
> > +	LTC3208_CHAN_N_COUNT,
> > +};
> > +
> > +static const char *const ltc3208_dt_aux_channels[] =3D {
> > +"adi,aux1-channel",
>=20
>  Why would you start the list at the end of the line like this?
>=20
>  Please move it down as you do with ltc3208_led, etc.
>=20

Noted. Will adjust it to be:

static const char *const ltc3208_dt_aux_channels[] =3D {
	"adi,aux1-channel",
	"adi,aux2-channel",
	"adi,aux3-channel",
	"adi,aux4-channel"
};

> > +						       "adi,aux2-channel",
> > +						       "adi,aux3-channel",
> > +						       "adi,aux4-channel" };
> > +
> > +static const char *const ltc3208_aux_opt[] =3D { "aux", "main", "sub",
> > +"cam" };
>=20
>  This is okay.
>=20
> > +struct ltc3208_led {
> > +	struct led_classdev cdev;
> > +	struct i2c_client *client;
>=20
> Where is client used?
>=20

I hadn't realized that it wasn't used anymore by the device, since regmap_f=
ield had replaced its role.
I will remove this from the struct.

> > +	struct regmap_field *rfield;
> > +};
> > +
> > +struct ltc3208 {
>=20
>  I'm struggling to see the point in this.
>=20

I wasn't sure how to approach this, as I mistakenly assumed that there need=
ed to be only a single instance containing the runtime data of the device.

I will replace this by allocating memory for each LED directly instead:

// in LED initialization loop
led =3D devm_kzalloc(&client->dev, sizeof(*led), GFP_KERNEL);

Please let me know if there is a more appropriate approach for this.

> > +	struct ltc3208_led leds[LTC3208_NUM_LED_GRPS]; };
> > +
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
> Spaces before and after the } and { respectively.
>=20
> Doesn't checkpatch.pl tell you about this stuff?
>=20

Sorry about that.
I'll make sure to always pass this through checkpatch first.

> > +};
> > +
> > +static const struct regmap_config ltc3208_regmap_cfg =3D {
> > +	.reg_bits =3D 8,
> > +	.val_bits =3D 8,
> > +	.max_register =3D LTC3208_REG_G_OPT,
> > +	.cache_type =3D REGCACHE_FLAT_S,
> > +	.reg_defaults =3D ltc3208_reg_defaults,
> > +	.num_reg_defaults =3D LTC3208_REG_G_OPT, };
> > +
> > +static const struct reg_field
> ltc3208_led_reg_field[LTC3208_CHAN_N_COUNT] =3D {
> > +	[LTC3208_CHAN_MAIN] =3D  REG_FIELD(LTC3208_REG_C_MAIN, 0, 7),
> > +	[LTC3208_CHAN_SUB] =3D   REG_FIELD(LTC3208_REG_D_SUB, 0, 7),
> > +	[LTC3208_CHAN_BLUE] =3D  REG_FIELD(LTC3208_REG_B_AUXBLU, 0, 3),
> > +	[LTC3208_CHAN_AUX] =3D   REG_FIELD(LTC3208_REG_B_AUXBLU, 4, 7),
> > +	[LTC3208_CHAN_CAML] =3D  REG_FIELD(LTC3208_REG_F_CAM, 0, 3),
> > +	[LTC3208_CHAN_CAMH] =3D  REG_FIELD(LTC3208_REG_F_CAM, 4, 7),
> > +	[LTC3208_CHAN_RED] =3D   REG_FIELD(LTC3208_REG_A_GRNRED, 0, 3),
> > +	[LTC3208_CHAN_GREEN] =3D REG_FIELD(LTC3208_REG_A_GRNRED, 4,
> 7),
>=20
> If you're going to insist on lining these up, I'd start with the =3D.
>=20

Noted.

> > +};
> > +
> > +static int ltc3208_led_set_brightness(struct led_classdev *led_cdev,
> > +				      enum led_brightness brightness) {
> > +	struct ltc3208_led *led =3D
> > +		container_of(led_cdev, struct ltc3208_led, cdev);
> > +	u8 current_level =3D brightness;
> > +
> > +	return regmap_field_write(led->rfield, current_level); }
> > +
> > +static int ltc3208_probe(struct i2c_client *client) {
> > +	enum ltc3208_aux_channel
> aux_channels[LTC3208_NUM_AUX_LEDS];
> > +	struct ltc3208 *ddata;
> > +	struct regmap *regmap;
> > +	bool disable_rgb_aux4_dropout_signal;
> > +	bool disable_camhl_pin;
> > +	bool set_sub_control_pin;
> > +	int ret;
> > +	u8 reg_val;
>=20
> Something more descriptive like 'options'?
>=20

Noted. Will replace reg_val with dev_options.

> > +
> > +	regmap =3D devm_regmap_init_i2c(client, &ltc3208_regmap_cfg);
> > +	if (IS_ERR(regmap))
> > +		return dev_err_probe(&client->dev, PTR_ERR(regmap),
> > +				     "Failed to initialize regmap\n");
> > +
> > +	ddata =3D devm_kzalloc(&client->dev, sizeof(*ddata), GFP_KERNEL);
> > +	if (!ddata)
> > +		return -ENOMEM;
> > +
> > +	disable_camhl_pin =3D device_property_read_bool(&client->dev,
> > +						      "adi,disable-camhl-pin");
>=20
> You can use 100-chars everywhere.  Does this help to prevent the ugly wra=
p?
>=20

Will update the lines that can fit 100-chars.

> > +	set_sub_control_pin =3D
> > +		device_property_read_bool(&client->dev, "adi,cfg-enrgbs-
> pin");
>=20
> If you _must_ wrap, do it after the ','.
>=20
> > +	disable_rgb_aux4_dropout_signal =3D
>=20
> As above.
>=20

Noted.

> > +				device_property_read_bool(&client->dev,
> > +						"adi,disable-rgb-aux4-
> dropout");
> > +
> > +	reg_val =3D FIELD_PREP(LTC3208_OPT_EN_RGBS, set_sub_control_pin) |
> > +		  FIELD_PREP(LTC3208_OPT_DIS_CAMHILO,
> disable_camhl_pin) |
> > +		  FIELD_PREP(LTC3208_OPT_CPO_MASK, 0) |
> > +		  FIELD_PREP(LTC3208_OPT_DIS_RGBDROP,
> > +			     disable_rgb_aux4_dropout_signal);
> > +
> > +	ret =3D regmap_write(regmap, LTC3208_REG_G_OPT, reg_val);
> > +	if (ret)
> > +		return dev_err_probe(&client->dev, ret,
> > +				     "error writing to options register\n");
>=20
> This isn't very user friendly.
>=20
> "Failed to set <soemething> options"
>=20
> > +
> > +	/* Initialize aux channel configurations */
> > +	for (int i =3D 0; i < LTC3208_NUM_AUX_LEDS; i++) {
> > +		ret =3D device_property_match_property_string(
> > +			&client->dev, ltc3208_dt_aux_channels[i],
> > +			ltc3208_aux_opt, LTC3208_NUM_AUX_OPT);
> > +		/* Fallback to default value (AUX) if not found */
> > +		if (ret =3D=3D -ENODATA || ret =3D=3D -EINVAL)
> > +			aux_channels[i] =3D LTC3208_AUX_CHAN_AUX;
> > +		else if (ret < 0)
> > +			return dev_err_probe(&client->dev, ret,
> > +					     "Error reading AUX Channel %d", i);
>=20
> New line?
>=20
> This whole block is a readability nightmare, please re-format.
>=20

Noted. Will look into a way to refactor this.

> > +		else if (ret >=3D 0)
> > +			aux_channels[i] =3D ret;
> > +	}
> > +
> > +	reg_val =3D FIELD_PREP(LTC3208_AUX1_MASK, aux_channels[0]) |
> > +		  FIELD_PREP(LTC3208_AUX2_MASK, aux_channels[1]) |
> > +		  FIELD_PREP(LTC3208_AUX3_MASK, aux_channels[2]) |
> > +		  FIELD_PREP(LTC3208_AUX4_MASK, aux_channels[3]);
> > +
> > +	ret =3D regmap_write(regmap, LTC3208_REG_E_AUX_SELECT, reg_val);
> > +	if (ret)
> > +		return dev_err_probe(&client->dev, ret,
> > +			"error writing to aux channel register.\n");
>=20
> Full-stops are not required in error messages.
>=20
> Again, make it more user friendly please.
>=20
> > +
> > +	device_for_each_child_node_scoped(&client->dev, child) {
> > +		struct ltc3208_led *led;
> > +		struct led_init_data init_data =3D {};
> > +		u32 chan;
> > +
> > +		ret =3D fwnode_property_read_u32(child, "reg", &chan);
> > +		if (ret)
> > +			return dev_err_probe(&client->dev, ret,
> > +					    "Failed to get reg value of LED\n");
> > +		else if (chan >=3D LTC3208_NUM_LED_GRPS)
>=20
> No need for the else.
>=20
> > +			return dev_err_probe(&client->dev, -EINVAL,
> > +					     "%u is an invalid LED ID\n", chan);
> > +		else if (ddata->leds[chan].client)
>=20
> Here too.
>=20
> > +			return dev_err_probe(&client->dev, -EINVAL,
> > +					"%u is already registered\n", chan);
> > +
> > +		led =3D &ddata->leds[chan];
> > +
> > +		led->rfield =3D devm_regmap_field_alloc(&client->dev, regmap,
> > +						ltc3208_led_reg_field[chan]);
> > +		if (IS_ERR(led->rfield))
> > +			return dev_err_probe(&client->dev, PTR_ERR(led-
> >rfield),
> > +					     "cannot allocate regmap field\n");
>=20
> '\n' here.
>=20

Noted on these comments. Will update the error messages.

> > +		led->client =3D client;
> > +		led->cdev.brightness_set_blocking =3D
> ltc3208_led_set_brightness;
> > +		led->cdev.max_brightness =3D
> LTC3208_MAX_BRIGHTNESS_4BIT;
> > +
> > +		if (chan =3D=3D LTC3208_CHAN_MAIN || chan =3D=3D
> LTC3208_CHAN_SUB)
> > +			led->cdev.max_brightness =3D
> LTC3208_MAX_BRIGHTNESS_8BIT;
> > +
> > +		init_data.fwnode =3D child;
> > +
> > +		ret =3D devm_led_classdev_register_ext(&client->dev, &led-
> >cdev,
> > +						     &init_data);
> > +		if (ret)
> > +			return dev_err_probe(&client->dev, ret,
> > +					     "LED %u Register failed.\n", chan);
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct of_device_id ltc3208_match_table[] =3D {
> > +	{ .compatible =3D "adi,ltc3208" },
> > +	{ }
> > +};
> > +MODULE_DEVICE_TABLE(of, ltc3208_match_table);
> > +
> > +static const struct i2c_device_id ltc3208_idtable[] =3D {
> > +	{ .name =3D "ltc3208" },
> > +	{ }
> > +};
> > +MODULE_DEVICE_TABLE(i2c, ltc3208_idtable);
>=20
> My memory is fuzzy on this, but I don't think you need i2c_device_id stru=
cts if
> the elements aren't numbered.
>=20

Noted. Will review this section.

> > +static struct i2c_driver ltc3208_driver =3D {
> > +	.driver =3D {
> > +		.name =3D "ltc3208",
> > +		.of_match_table =3D ltc3208_match_table,
> > +	},
> > +	.id_table =3D ltc3208_idtable,
> > +	.probe =3D ltc3208_probe,
> > +};
> > +module_i2c_driver(ltc3208_driver);
> > +
> > +MODULE_LICENSE("GPL");
> > +MODULE_AUTHOR("Jan Carlo Roleda <jancarlo.roleda@analog.com>");
> > +MODULE_DESCRIPTION("LTC3208 LED Driver");
> >
> > --
> > 2.43.0
> >
>=20
> --
> Lee Jones

I will review these comments and try to submit another patch by July 29.

Thank you again!

Regards,
Carlo

