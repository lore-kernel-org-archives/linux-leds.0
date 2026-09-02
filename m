Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232BD2E0B71;
	Wed,  2 Sep 2026 23:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.139.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788392210; cv=fail; b=jdH9DoJfxlGQ5PjQwGGSBMFekihjuXUHqafKBrZA4oLkDIIRiINb5+Qf7zdZrTeuTe7HjUe/b3KDQ7m+Omtidq4pho/tjJf7sbFg070NchReMYZR+wZZOP7LQw+lGZJWNu+j04x37D2kGx6cQT3bc6sFBzy2u6H8/A9b9q4HpUE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788392210; c=relaxed/simple;
	bh=tJH0+PLXbvvggxK/ybYuTLu9hiBolftDb5zP/DsqrSk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pURt/CkiUapezQHCTSRtiEbi0VO/DSXVRa+EjjomO+bIuA9LbpgbVSbB+P/VpxefhaeFO8KGaMqZF8C5u/k2CSfX/Thew88fK7G/T1ah+q1rbeYqtx04OFCdUdCBxNCojlDmPt+PhmFzjp115xF1Xa7kI+oxSwywMSfPRjh9Ego=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=Nsod6rpl; arc=fail smtp.client-ip=148.163.139.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="Nsod6rpl"
Received: from pps.filterd (m0516786.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682NKfIT3342582;
	Wed, 2 Sep 2026 19:36:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=D85Tu
	2nYo5DUqgfJXD6FDXuinemGFWeUIgvQ9p3D20g=; b=Nsod6rplG0r7yu5gYCKVJ
	MABY+XdVHdo+eufjeAizUK6UkTZae4LVd/iKTdlBhWvys2mx5dDazKPIbhp6bMWT
	ebhrSrjjMESwsBuF8Lxxl2H4veJ+BbNjcd+ZWtD6B7KfFiZcgCpGa5Ineu7PM5Q9
	Gh8wYfx1NJ70JOSRpyJKVpc3+Pwsy0Ab1LllzNFesPShuNqDZQIibIdZqRiBZJgx
	ndBArphDoaGlZrvNydOcLetcBBWwTiOXd1iqoE6SRFvAOCl2hFRrtlK1s1FzTtnr
	5OPEw7Pycw+fPt9hHazNy32TyEoVRYM3djWWiZrLQDm5uDH342VOGbEdkl4j2eOz
	g==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011013.outbound.protection.outlook.com [40.107.208.13])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4gedfg3fga-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 02 Sep 2026 19:36:31 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ViiXRInoM7ANIrjB9ntQIJTBFDjifmfMqsjwHgBq+ESmQl95SsblDKi54nD1TXYYELC9/yHFaVBya3wt7/7TQSELKdcewBeGADxpEqB5Qi1HLlnEO+YJRMfsiZJ3aBs3VQ7w9UmJ7h5mSvl7SzuWKAxt0iju0Y9N2xTybwOHMPYYqlLY1K7sZO0u8qFXNPAraZDxg2ILiYvR43ioLE6WOGA9XTUkWkNVcf0iBajqq8G9VOndqOcAzD+NM4b5Qsx5/0HlN9IpaJniNxDEvZV/V9WyGRBxogfnf6BTH11ERda120H8twJxAzIgePcRpaBFFGrajGOb62DW1sZWWqirIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D85Tu2nYo5DUqgfJXD6FDXuinemGFWeUIgvQ9p3D20g=;
 b=GcvAEyyCQBwellTTdLpNS+D6tT0QvMzOWqRpOdoRSXxfE1fOzNH72RwwZ6T5GGm0CB5B+udcds/ZA51WPBOwoIxI0lmzdzgg33E3ClEk2pOgKPvNDnHdCuEcpTloyuHpi3EzWyIhUd32dPDGme9keHMogc42+sVSUJbpKZrt/7538nrnenVPtIIQBaXZJYAfRqgDnKlQJipQXLsRqEaW9ArUIbfOdb61JfV42bvBnjGn5+F4PU95DSXEixecllYb46HG2/23ohrbqSYdhs40K6qq7H2wfd0drmlRQvrJcCGG5LBQebVf2UgRFLVO79wf1eKVqC7WkT6c8nph0Ty0Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from BN8PR03MB4977.namprd03.prod.outlook.com (2603:10b6:408:de::11)
 by DS2PR03MB8444.namprd03.prod.outlook.com (2603:10b6:8:331::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 23:36:28 +0000
Received: from BN8PR03MB4977.namprd03.prod.outlook.com
 ([fe80::4d86:70cf:8006:e219]) by BN8PR03MB4977.namprd03.prod.outlook.com
 ([fe80::4d86:70cf:8006:e219%4]) with mapi id 15.21.0382.007; Wed, 2 Sep 2026
 23:36:28 +0000
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
Subject: RE: [PATCH v10 2/2] leds: ltc3208: Add driver for LTC3208
 Multidisplay LED Driver
Thread-Topic: [PATCH v10 2/2] leds: ltc3208: Add driver for LTC3208
 Multidisplay LED Driver
Thread-Index: AQHdLdmHsfUjyijkMk6R6v29LubcJra7h2iAgACERFA=
Date: Wed, 2 Sep 2026 23:36:28 +0000
Message-ID:
 <BN8PR03MB497751A352D986DF5602C4BC96B72@BN8PR03MB4977.namprd03.prod.outlook.com>
References: <20260817-upstream-ltc3208-v10-0-e1f9564b1e86@analog.com>
 <20260817-upstream-ltc3208-v10-2-e1f9564b1e86@analog.com>
 <20260902154143.GD2082450@google.com>
In-Reply-To: <20260902154143.GD2082450@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN8PR03MB4977:EE_|DS2PR03MB8444:EE_
x-ms-office365-filtering-correlation-id: 5684ff91-077d-4663-3c21-08df094b02c1
x-ld-processed: eaa689b4-8f87-40e0-9c6f-7228de4d754a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|38070700021|6133799003|3023799007|10067099003|56012099006|11063799006|18002099003|22082099003|4143699003;
x-microsoft-antispam-message-info:
 TPOQA2Un5HL8r434t7Vu3XXlYQoC4YEOy7A/aOP3d9/oFyZolt8nG8R3pTqmVLCRyA3tEXD2qBQKzRRrbEtjumU1bGCiHQmxvks/bEKSHEajjsa+OAQus4pfzYlmu6ChBIpVqlwN4wkJsc9vUuulZl+tuyRCXA25UjK/s90i4CvEvDwSuiqUhTdVkbIuRZhJTIo1m8I0ubQ5leVkeXmKZxp/rW3PjQKk0Djwx7qVb4VP4bs8iyV+RQb4sP3y3sw3OYZ22f2FvD6FZIVHFZiOHJ/g1zNuafCcSkbly0Wm7tym8GF1HKaA15xYhHFp+JTd9F7YjY93t6bGZ5tWAHaQd45rSfnq+Zcr9Ilaiv0YELfs5p5Vn9vvBHQkXoK0b9N9uxK16/wyj0I8k+Qh2TWmA1e37cgh8lL9qot6NQR8wh4Xbk5R89GLZCuTBuHoHsuXqZVa6dCKUfD7JDz2O0fkik4+0wn0AWx6VSYhSeuVzQcC2B/OndQCFybKFaMs71x0c2L3LW2ObZYR52YaQx3RPxbUK7zIDdseFxvHXR2vr1sDY1tXuBqkGPR9P8rKMKgJ5m8pBHc4lD1phzsxjrFJbol5ASHHXUDHwuJ7xld+U+haP9JL0+06YEFIr4f14+GbfW9EVMShd4rzFXTOwAafcAOzNI27vm8IZb1Yy2cs7lwKVHjxRfNA3AZsfioODXOhHSks87AXCdAtiyhAGTB6E7zSpZcYXXKRHZeZDL1TBJM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR03MB4977.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(38070700021)(6133799003)(3023799007)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?A1vzS3Rce4t+np4en9lQpQ65lnwz5vNvNpboVbOb3jvXmLrY+cFPORf0K5?=
 =?iso-8859-1?Q?UOF0IuZfHwJ99krIjEhMLCX/4PeM1YS8waybr5pzJF2csnAIdM3ct/J5ft?=
 =?iso-8859-1?Q?ZX9aLkFk4EaDFeGw1fMnzXmkIX7GSqR03YLCfWX79LJ3f4pITFtduuWua7?=
 =?iso-8859-1?Q?qj0X5BG6F8gUXImZF0/RvHy5NNeBmgsUK/5qxhNmohEzyo5A8GQgmuDwIU?=
 =?iso-8859-1?Q?C9zx9Pa5Xj1fOdJKhqX3izXeYVZzH+VA5htIXwU4nylPyrcwnE7BVV//GC?=
 =?iso-8859-1?Q?nEc+WqUeu9atWaNZN3+7BQvKWOrlI+i1GF2x3qlXxN06n0jgE92VEPSTJ8?=
 =?iso-8859-1?Q?MnFYTtQpoqblchvRCatUgJEeQBQ+GcfBrDdilTeMpMVyjGtL9iNDlOTQ4b?=
 =?iso-8859-1?Q?Rwl4mtYKCi6+R/WOKswQZATKEQtEu/w5dJZ0WG3fWWnP80iOy4EJd+QXWD?=
 =?iso-8859-1?Q?ruOMutEXn09gSzYK6wET7tOEo+0UUTF5a18XAeyjLdxpzAKR8a9KYQLl0e?=
 =?iso-8859-1?Q?H3ixk/YHvi6kuk1KSf/lLN8ZaKU1oa14hKJDcRsbuBRFJ1iM7R+9Qm4pbU?=
 =?iso-8859-1?Q?HTHyI4VISVIMi3o71K9oEJbImdcfrOAwd6XkVeE0hYftJvg23n6pNHmpWl?=
 =?iso-8859-1?Q?L8q5SbfGbjbClxTUzI22wTXlXNCtyW1BHrNj1iZTK3ICEbjGUw3NJn7CRd?=
 =?iso-8859-1?Q?jKQNPWQXz0OJvWUg3RaBMHsXjBYMuq9JxLkiO0oX5yz4cMT7YxSMEtcSCa?=
 =?iso-8859-1?Q?mO50polOwZAsyjPjhdN2ES74ZaBRO88gSuhBf3iVAPwGYySHlGERqgR/ff?=
 =?iso-8859-1?Q?kxk9OVIqFLL0DYNGotRi1e84xpe4qlyxcQ85XAoklUexDVxiOXMUbrPk3y?=
 =?iso-8859-1?Q?40m6N3WfmoY7diX+xoqq/volGabiZpvl/q2IXxxWoIrqqtk6gS//qh64ki?=
 =?iso-8859-1?Q?uFzrCuYeTlrxJ7Im9+ji5o2j8Th+/8rYkN+ZxfRt9uhkHkUhq/jY2CR6h0?=
 =?iso-8859-1?Q?qiBvfzGSS0Dfu1obc4ScJfkL+KgOUWGeMnhbGyvJp8SN0kBQmz8DN6OkTX?=
 =?iso-8859-1?Q?lB+bEHjac859xzHwty89ZfIpihINUGMc0IxKPUig3tjwKpoPYlYIzXF9hX?=
 =?iso-8859-1?Q?Y0UhuRSEGc33/5pAZ6YHd+xNsL3vvCxkawC2ouoWwu7cna3Og+NFT1gnVz?=
 =?iso-8859-1?Q?qFHgL45bWbJ7d55Us6zkV4gUut4qPShT+tUx1rzAKgxQg2wcVmT/hCIY+X?=
 =?iso-8859-1?Q?Cd3oJ05XDeuz0p3ZYceGgLH4LtuLuvBvXdBJWebtRQNams9g+T+uJhwYwX?=
 =?iso-8859-1?Q?h0Rwug9lV4u1eY2znSXW4tyXqCCHhfylyMN1TaiOVAGEEFSHQfFtChTNZt?=
 =?iso-8859-1?Q?/DOPQpowFd0ZuwiOxtXt8JMnhOcaxmxFGFRrSa6qwkq0lkjoAqlmvy2Yah?=
 =?iso-8859-1?Q?91RaaKGdQsY31HMXKc/4/TVeWkq58IwDIx0Mm+UnKxMAGAhZ/afV974F9W?=
 =?iso-8859-1?Q?3ZY5a7gHQEFLB/Snww7c9MY47iNtuACnyrBxw6enOGoQGnneT6FCUyrn3E?=
 =?iso-8859-1?Q?LMvhC68Emt/KLYF0HeVAgETt+YZtgJFr3N8BM0a/ZRUJOrMk18mnZU1Cy+?=
 =?iso-8859-1?Q?70V9n6CuYFFmlmAa7iMmZkvDsEwwFQQUQsQCFZ4L7rGL63dXpx5Mcr9HjM?=
 =?iso-8859-1?Q?d2RteKKGUpqYTSAb6X2kVb9DUiyboI5jizf+KtqO22EvZ4H1oC4ryUm6w2?=
 =?iso-8859-1?Q?etRko87UjL57YyhUP5+ykqQkJNAqJYQK9JxSpHYo38QFMscfcYFRsouA2z?=
 =?iso-8859-1?Q?LIoGwvX64Q=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	yOOyyxvTw7wbApSVa+YUDuazPJy9DSNzVe7g30u/VdJoboQYRnkratgraFXostD5hkBb2ioKCCctc8HjuV6la2vtTwQ6xw6MqwLuxL8NjyPrNkuHJpZXp5XQ6+M16uMJdDnLAawR23nWzFtyNYjZY3vwj8+imUth9SNtnptzPJ3kLXASOPhwOYq8oEm4B7oGEukelH17VcitAFn/1EdD+ty+dFfpi2q9iwTy+xqUtmsKFtc1+cRzbohzch/qCyeK/eqtw6wKaXzEBeYqrtSTq+NLP0okzheFcPdNtPbQ0Ll7H91y/rCd+WUtpAjVbZwccPo8lhgAai3z+7/J4FL7Zw==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR03MB4977.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5684ff91-077d-4663-3c21-08df094b02c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2026 23:36:28.2903
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zmWj69pKS7AwnPMmU6BqRiTjIEhMic2cLFuJayR0lyKRNQ7uhs6oA30TYpy/CQ0eINFHLuHSSHCrtkSKkjuA08OiuGwbH7FukKLJhdUrBw0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR03MB8444
X-Authority-Analysis: v=2.4 cv=AdWB2XXG c=1 sm=1 tr=0 ts=6a98b2ff cx=c_pps
 a=ERW18fiFji9WgYXv9zI75g==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=ZQxX5BWu6Z8IJBb2zLX7:22 a=gAnH3GRIAAAA:8 a=VwQbUJbxAAAA:8 a=IpJZQVW2AAAA:8
 a=Y8AIaCuJgiJgwwZprE8A:9 a=wPNLvfGTeEIA:10 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-ORIG-GUID: lJH9twuCSKNV73zlXalwBkdgwkZz8iZt
X-Proofpoint-GUID: lJH9twuCSKNV73zlXalwBkdgwkZz8iZt
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDIwOSBTYWx0ZWRfX7u4cNjc4Cr4g
 R6f8TKB4Sp1sVfN9js3EiGwOIsVO/a6LXLR2x70iXXtYiLaEut3ZiRD0jGNsFHWmJYTQJRK8Y0K
 Bgj8jBga3ePDFbFU9hx+ZcmCjhrsvtN6hlmv0ZoNPWRApXvEl8yh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDIwOSBTYWx0ZWRfXw1D7hfdHQk62
 XaAfJHNDxy9VdNdiSGrsqxl/D/n6dmVJrneTqtJJp/pQdvp3UGoAM87yJmxocaz58dC4DG4nsJY
 tW1fHi8cHM/B56r0BdYDEuF/6aUM+JWYDZvXSNepZU7ccGLW3s4LghB80S4z5iUDQx1Zs3WCBKS
 bN0cVrIGL5ERPDDtVOnRq5S11cSIHQC9nnltR9fxizA13BboBXiJttHyehqh+YwRgLKM/eS3hp4
 yQugcAesUkM8biKtE7waXBRpo62nsTA1dmDXZfwUcBzgHaRN7lwjHBgmSacEJWLbBAa/8lYmh5O
 HpFdXIf6e3TILZ3Hw0Ix7VaRTQwMd1xLj0ALlXbB817CVPwYDpznXUp8bKGWhrsypEenD3kaRnO
 r4nxGCFF7Gnw0X5BLxOEXwpkyTIewxTo20JyGSyIO52ZmeLMZWTaYZBjf3lbHGqKpOugffdx2hj
 zvBpTj5i1R3B/HWuOeg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_06,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 spamscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020209

Hello Jones, sorry for missing your previous comments on the formatting.

I will fix them and send another patch shortly.

Regards,
Carlo

> -----Original Message-----
> From: Lee Jones <lee@kernel.org>
> Sent: Wednesday, September 2, 2026 11:42 PM
> To: Roleda, Jan carlo <Jancarlo.Roleda@analog.com>
> Cc: Pavel Machek <pavel@kernel.org>; Rob Herring <robh@kernel.org>;
> Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley
> <conor+dt@kernel.org>; linux-kernel@vger.kernel.org; linux-
> leds@vger.kernel.org; devicetree@vger.kernel.org; Uwe Kleine K=F6nig
> <u.kleine-koenig@baylibre.com>
> Subject: Re: [PATCH v10 2/2] leds: ltc3208: Add driver for LTC3208 Multid=
isplay
> LED Driver
>=20
> [External]
>=20
> On Mon, 17 Aug 2026, Jan Carlo Roleda wrote:
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
> >  drivers/leds/leds-ltc3208.c | 231
> > ++++++++++++++++++++++++++++++++++++++++++++
> >  4 files changed, 245 insertions(+)
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
> > new file mode 100644 index 000000000000..c366eb1dd145
> > --- /dev/null
> > +++ b/drivers/leds/leds-ltc3208.c
> > @@ -0,0 +1,231 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * LED driver for Analog Devices LTC3208 Multi-Display Driver
> > + *
> > + * Copyright 2026 Analog Devices Inc.
> > + *
> > + * Author: Jan Carlo Roleda <jancarlo.roleda@analog.com>
> > + *
> > + */
> > +#include <linux/bitfield.h>
> > +#include <linux/bitmap.h>
> > +#include <linux/errno.h>
> > +#include <linux/i2c.h>
> > +#include <linux/leds.h>
> > +#include <linux/module.h>
> > +#include <linux/property.h>
> > +#include <linux/regmap.h>
> > +#include <linux/types.h>
> > +
> > +/* Registers */
> > +#define LTC3208_REG_A_GRNRED_CURRENT	0x1	/* Green and
> Red current DAC */
> > +#define LTC3208_REG_B_AUXBLU_CURRENT	0x2	/* AUX and Blue
> current DAC */
> > +#define LTC3208_REG_C_MAIN_CURRENT	0x3	/* Main current DAC
> */
> > +#define LTC3208_REG_D_SUB_CURRENT	0x4	/* Sub current DAC */
> > +#define LTC3208_REG_E_AUX_SELECT	0x5	/* AUX DAC Select */
> > +#define  LTC3208_AUX1_MASK		GENMASK(1, 0)
> > +#define  LTC3208_AUX2_MASK		GENMASK(3, 2)
> > +#define  LTC3208_AUX3_MASK		GENMASK(5, 4)
> > +#define  LTC3208_AUX4_MASK		GENMASK(7, 6)
> > +#define LTC3208_REG_F_CAM_CURRENT	0x6	/* CAM (High and
> Low) current DAC */
> > +#define LTC3208_REG_G_OPT		0x7	/* Device Options */
> > +#define  LTC3208_OPT_CPO_MASK		GENMASK(7, 6)
> > +#define  LTC3208_OPT_DIS_RGBDROP	BIT(3)
> > +#define  LTC3208_OPT_DIS_CAMHILO	BIT(2)
> > +#define  LTC3208_OPT_EN_RGBS		BIT(1)
> > +
> > +#define LTC3208_MAX_BRIGHTNESS_4BIT	0xF
> > +#define LTC3208_MAX_BRIGHTNESS_8BIT	0xFF
> > +
> > +#define LTC3208_NUM_AUX_LEDS		4	/* Number of
> configurable aux channels */
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
> > +	"adi,aux1-channel",
> > +	"adi,aux2-channel",
> > +	"adi,aux3-channel",
> > +	"adi,aux4-channel"
> > +};
> > +
> > +static const char *const ltc3208_aux_opt[] =3D { "aux", "main", "sub",
> > +"cam" };
> > +
> > +struct ltc3208_led {
> > +	struct led_classdev cdev;
> > +	struct regmap_field *rfield;
> > +};
> > +
> > +static const struct reg_default ltc3208_reg_defaults[] =3D {
> > +	{ LTC3208_REG_A_GRNRED_CURRENT, 0 },
> > +	{ LTC3208_REG_B_AUXBLU_CURRENT, 0 },
> > +	{ LTC3208_REG_C_MAIN_CURRENT, 0 },
> > +	{ LTC3208_REG_D_SUB_CURRENT, 0 },
> > +	{ LTC3208_REG_E_AUX_SELECT, 0 },
> > +	{ LTC3208_REG_F_CAM_CURRENT, 0 },
> > +	{ LTC3208_REG_G_OPT, 0 }
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
> > +	[LTC3208_CHAN_MAIN]  =3D
> REG_FIELD(LTC3208_REG_C_MAIN_CURRENT, 0, 7),
> > +	[LTC3208_CHAN_SUB]   =3D REG_FIELD(LTC3208_REG_D_SUB_CURRENT,
> 0, 7),
> > +	[LTC3208_CHAN_BLUE]  =3D
> REG_FIELD(LTC3208_REG_B_AUXBLU_CURRENT, 0, 3),
> > +	[LTC3208_CHAN_AUX]   =3D
> REG_FIELD(LTC3208_REG_B_AUXBLU_CURRENT, 4, 7),
> > +	[LTC3208_CHAN_CAML]  =3D
> REG_FIELD(LTC3208_REG_F_CAM_CURRENT, 0, 3),
> > +	[LTC3208_CHAN_CAMH]  =3D
> REG_FIELD(LTC3208_REG_F_CAM_CURRENT, 4, 7),
> > +	[LTC3208_CHAN_RED]   =3D
> REG_FIELD(LTC3208_REG_A_GRNRED_CURRENT, 0, 3),
> > +	[LTC3208_CHAN_GREEN] =3D
> REG_FIELD(LTC3208_REG_A_GRNRED_CURRENT, 4,
> > +7), };
> > +
> > +static int ltc3208_led_set_brightness(struct led_classdev *led_cdev,
> > +enum led_brightness brightness) {
> > +	struct ltc3208_led *led =3D container_of(led_cdev, struct ltc3208_led=
,
> cdev);
> > +	u8 current_level =3D brightness;
> > +
> > +	return regmap_field_write(led->rfield, current_level); }
> > +
> > +static int ltc3208_probe(struct i2c_client *client) {
> > +	enum ltc3208_aux_channel
> aux_channels[LTC3208_NUM_AUX_LEDS];
> > +	DECLARE_BITMAP(registered_chans, LTC3208_CHAN_N_COUNT) =3D { };
> > +	struct regmap *regmap;
> > +	bool disable_rgb_aux4_dropout_signal;
> > +	bool disable_camhl_pin;
> > +	bool set_sub_control_pin;
> > +	int ret;
> > +	u8 dev_options;
> > +
> > +	regmap =3D devm_regmap_init_i2c(client, &ltc3208_regmap_cfg);
> > +	if (IS_ERR(regmap))
> > +		return dev_err_probe(&client->dev, PTR_ERR(regmap),
> "Failed to
> > +initialize regmap");
> > +
> > +	regcache_mark_dirty(regmap);
> > +	ret =3D regcache_sync(regmap);
> > +	if (ret)
> > +		return dev_err_probe(&client->dev, ret, "Failed to sync
> register
> > +cache");
> > +
> > +	disable_camhl_pin =3D device_property_read_bool(&client->dev,
> > +"adi,disable-camhl-pin");
>=20
> '\n'
>=20
> > +	set_sub_control_pin =3D device_property_read_bool(&client->dev,
> > +"adi,cfg-enrgbs-pin");
>=20
> '\n'
>=20
> > +	disable_rgb_aux4_dropout_signal =3D
> > +		device_property_read_bool(&client->dev,
> > +"adi,disable-rgb-aux4-dropout");
> > +
> > +	dev_options =3D FIELD_PREP(LTC3208_OPT_EN_RGBS,
> set_sub_control_pin) |
> > +		      FIELD_PREP(LTC3208_OPT_DIS_CAMHILO,
> disable_camhl_pin) |
> > +		      FIELD_PREP(LTC3208_OPT_CPO_MASK, 0) |
> > +		      FIELD_PREP(LTC3208_OPT_DIS_RGBDROP,
> > +disable_rgb_aux4_dropout_signal);
> > +
> > +	ret =3D regmap_write(regmap, LTC3208_REG_G_OPT, dev_options);
> > +	if (ret)
> > +		return dev_err_probe(&client->dev, ret, "Failed to set device
> > +options register");
> > +
> > +	/* Initialize aux channel configurations */
> > +	for (int i =3D 0; i < LTC3208_NUM_AUX_LEDS; i++) {
> > +		/* default value (AUX) if property is not present in dt */
>=20
> You missed my review comments here.
>=20
> > +		if (!device_property_present(&client->dev,
> ltc3208_dt_aux_channels[i])) {
> > +			aux_channels[i] =3D LTC3208_AUX_CHAN_AUX;
> > +			continue;
> > +		}
> > +
> > +		ret =3D device_property_match_property_string(&client->dev,
> > +
> ltc3208_dt_aux_channels[i],
> > +							    ltc3208_aux_opt,
> LTC3208_NUM_AUX_LEDS);
> > +		if (ret < 0)
> > +			return dev_err_probe(&client->dev, ret, "Error
> reading AUX Channel
> > +%d", i);
> > +
> > +		aux_channels[i] =3D ret;
> > +	}
> > +
> > +	dev_options =3D FIELD_PREP(LTC3208_AUX1_MASK, aux_channels[0]) |
> > +		      FIELD_PREP(LTC3208_AUX2_MASK, aux_channels[1]) |
> > +		      FIELD_PREP(LTC3208_AUX3_MASK, aux_channels[2]) |
> > +		      FIELD_PREP(LTC3208_AUX4_MASK, aux_channels[3]);
> > +
> > +	ret =3D regmap_write(regmap, LTC3208_REG_E_AUX_SELECT,
> dev_options);
> > +	if (ret)
> > +		return dev_err_probe(&client->dev, ret, "Error writing to aux
> > +channel register");
> > +
> > +	device_for_each_child_node_scoped(&client->dev, child) {
> > +		struct ltc3208_led *led;
> > +		struct led_init_data init_data =3D { };
> > +		u32 chan;
> > +
> > +		ret =3D fwnode_property_read_u32(child, "reg", &chan);
> > +		if (ret)
> > +			return dev_err_probe(&client->dev, ret,
> > +					     "Failed to get register value of
> LED");
> > +		if (chan >=3D LTC3208_CHAN_N_COUNT)
> > +			return dev_err_probe(&client->dev, -EINVAL, "%u is
> an invalid LED ID",
> > +					     chan);
> > +		if (test_and_set_bit(chan, registered_chans))
> > +			return dev_err_probe(&client->dev, -EINVAL, "%u is
> already registered",
> > +					     chan);
> > +
> > +		led =3D devm_kzalloc(&client->dev, sizeof(*led), GFP_KERNEL);
> > +		if (!led)
> > +			return -ENOMEM;
> > +
> > +		led->rfield =3D devm_regmap_field_alloc(&client->dev, regmap,
> > +
> ltc3208_led_reg_field[chan]);
> > +		if (IS_ERR(led->rfield))
> > +			return dev_err_probe(&client->dev, PTR_ERR(led-
> >rfield),
> > +					     "Cannot allocate regmap field");
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
> >cdev, &init_data);
> > +		if (ret)
> > +			return dev_err_probe(&client->dev, ret, "Failed to
> register LED %u", chan);
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
> > +static struct i2c_driver ltc3208_driver =3D {
> > +	.driver =3D {
> > +		.name =3D "ltc3208",
> > +		.of_match_table =3D ltc3208_match_table,
> > +	},
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
