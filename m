Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84DCD41B8F3;
	Fri, 14 Aug 2026 07:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786694093; cv=fail; b=KQe1HamqOQBEDaXujTRR4kR4qKmoaL834Ubunc8AKARsRrfPgS7gOxF4DN572uU9QVvoYZ/1gLwARt47ENuQ6YiGTc+j3K+y53y5t7NKmMt0asKFLuzSBSItL9fKYbf7eKIMyqRTXPJcTA4O+FvfHiccncJb5OUp0FUho6I5OVk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786694093; c=relaxed/simple;
	bh=QApC5lAugpJZfXpA20Fc87MoyMdiTPBrcotKjTFEOxY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=E7VcxPY0UhsK83XA5TSp832sVG6CYNizWHgCPFTRf0onrX40w0C0TSwpxBvRv32tbFKdSCEdoKs/TGoDzR0S3/LH8/ejUCrhrdmrs5jgEnbHkOEh5UrRLh5JlDsexl9Of8RYuBU5LGXxxZMUxeS1fAMUbQ4Q2fne2vP77fRNAuE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=BOG8TEJo; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="BOG8TEJo"
Received: from pps.filterd (m0516787.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67E7eM36147960;
	Fri, 14 Aug 2026 03:54:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=POOW8
	U6JkR50TgIqxDpLs9qjVawAoltt25SVCIHLGwQ=; b=BOG8TEJoWGq130Anmb6tz
	BgBGQT7AX/KpHUKDN5WcNd9MlSAcCYpM7Vd51bXQUCJ50Ni/Ty7frNh8a5dFq7Kz
	gcY3wUyUbLAvId6hklXQ3oVm2OsSXQsxiMLFX9PC8JikG/WJLKhLTU53/7/+Aa2U
	v7ItYCZdAtIdhj/tEsF0wCuu6sZhk6tqbrWU4jOH7bRyh2QNpweMBa3B3yEmebM7
	rvVt8kJzSf9vtNV+TGC/i9rpNltE8zUvAMhnfrjbAcNXfil+AgINJzvXR3xcDFpj
	UHE0RMGQUimospoS+QIEZ15+O4DzMqbF36h4yKlp9/Y4gRF0R9OWUCwErtYXuBX5
	A==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012047.outbound.protection.outlook.com [52.101.48.47])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4g1fm5m3ar-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 14 Aug 2026 03:54:47 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rlh/0hjaYZ4CIvzVjUBw69EdAD/yVFBx0+UD+It4O2P8yRBTPBH5bzBfuMun2TOHsMPPx06ZAl/BbSh1dZJHpr+zaQzXkw+sUD5XCI3baurLE5k7KVJAsuOUOKPjKdxUvM2i9p+jjmDoeDaiyGbhcHSh9eVBqgloqQkqbpBpvCtSPy4qBnquKp9pzenZVThe4oxONCeg/KWWGmcj2fmXBxkB6iZGcoO9khs7Im+TBhLAPHPMxc5HAb9w4CY7BLUeBGLOn8WK7d01aQ/JEIa9dBJCreytzaXexUtGKZM0RD7plfTtNDR+jhufE9+krxXIOqN+/MkhBQijTYXkaISFsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=POOW8U6JkR50TgIqxDpLs9qjVawAoltt25SVCIHLGwQ=;
 b=dr8mZgpWrK7KtY+T0L6ctVfWHAvCXlyQrnQcOFl8d1gxaEB/KBQ7aZr6Q1+Kz/eZA+Cjj9FPIohGslAKta5v9QSsX79ssII8RubgJ1XUlJjzXovdK6AR7RiWphVNW+hY+yr6lEvA8SScEA6yUY0GBR9iW07tnimHtXm5RGtDXIIRCP6wXpGwtmoHajjJgjL4OxENQRICXLnfhHUG3kk4WKh1gA4vPjaCXYdpeFXEiTTecpN3Djvyrng3nZi9E0/2jMFtFPnjACqWNYxc9xN0qMpKJj0Xg0wwquKvOpLm9VPJxAGdFbp9bfg9a36G0AGblIUq7h/XXovXwtAoeG22lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from BN8PR03MB4977.namprd03.prod.outlook.com (2603:10b6:408:de::11)
 by DS0PR03MB7728.namprd03.prod.outlook.com (2603:10b6:8:202::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Fri, 14 Aug
 2026 07:54:44 +0000
Received: from BN8PR03MB4977.namprd03.prod.outlook.com
 ([fe80::4d86:70cf:8006:e219]) by BN8PR03MB4977.namprd03.prod.outlook.com
 ([fe80::4d86:70cf:8006:e219%4]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 07:54:41 +0000
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
Subject: RE: [PATCH v9 2/2] leds: ltc3208: Add driver for LTC3208 Multidisplay
 LED Driver
Thread-Topic: [PATCH v9 2/2] leds: ltc3208: Add driver for LTC3208
 Multidisplay LED Driver
Thread-Index: AQHdJUhEB8YowY2v6EWKmvSg3aAitbaaVEKAgALgLiA=
Date: Fri, 14 Aug 2026 07:54:41 +0000
Message-ID:
 <BN8PR03MB49773EF9DEF1550CAD95ACB396DA2@BN8PR03MB4977.namprd03.prod.outlook.com>
References: <20260806-upstream-ltc3208-v9-0-c746e872c193@analog.com>
 <20260806-upstream-ltc3208-v9-2-c746e872c193@analog.com>
 <20260812114045.GK1072730@google.com>
In-Reply-To: <20260812114045.GK1072730@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN8PR03MB4977:EE_|DS0PR03MB7728:EE_
x-ms-office365-filtering-correlation-id: fb4f28ac-77dc-4cb9-7fce-08def9d94c68
x-ld-processed: eaa689b4-8f87-40e0-9c6f-7228de4d754a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|18002099003|22082099003|11063799006|4143699003|3023799007|5023799004|38070700021|10067099003|56012099006|6133799003;
x-microsoft-antispam-message-info:
 Aw1MciTm043iI8rQTlKMLvx7YkHqUZXckRF0fTVp+d7nBXjuE58sFqzsohqjcTI5TPZtXKGTpizfH/BjmdEGhatNWjh5vSOfYtd/A3GJrBL3PU22/Nu/mSgXnW1bMAw5wVgV7wwZ9S7Y+uev+wvFtwQbdEubrCvoqvQhu3Kg7P1wm+JrBA2p+imP68ye9oQvB7iORtKRokELDfb6AdqHgctLUdK3LTXckB4CchlsP0TI/QN0OXB+deZO2zjTLYnb30CvWzCAcWpM14SOEZ7dlRMPVbYEYRz+zAzTlrrJT1A6xILfdaRZUzjCEXV25dQ6DhNpOLU2/zyBBtT7gsn0Omk7YZbykZGyyk5aFkGkOFlrvJoqiySWl2x/qvyztKgWpgykULbW0xI8Pu2QQdfJawxmhIcEaJeM0BGTj1NMyAJ8TyXkALmRpDOEn66Urevhag6boe/HjTluDaVYbgk9kZtFkg4P2QyxyK37zdhk4CJvXLfvlsjfncSxq5IVBhwdHKvjrIlNg1s2v7NOkdn5XvwsXV1dGVpzLdmaO549Eto7WXgH28Z8CqWeTxs4NBfbXrzJGx+B80ZiHBzh4T/2FUAmVc7otp/JfobbA5HU5WscY6PJLtpGfSf9LecXywVk2614LSY630X6mHUh+EJ+AwakMKW75dceWSpiNOsm5IbJ6h/XJOdC0fP83dmhYIdZJNDFrM3lZFgTrqytEC4hKUwygIscxI0URKXsM1hN4AA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR03MB4977.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(18002099003)(22082099003)(11063799006)(4143699003)(3023799007)(5023799004)(38070700021)(10067099003)(56012099006)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?QCw8R6YkIV3YW+3YGj/qRL/hrXe+6hladp+D4F7cioCc2sZ7GtVZYKJZk7?=
 =?iso-8859-1?Q?K8zJUzvlgqe5XZXW4ACEWgTcRKT2XvgQBsEPLdtadeo9J0m+18KaGc25Uz?=
 =?iso-8859-1?Q?d/DZ/Gq4LxPgNny8KuhN+V4bDirgDp4gdriNIvEBNITtcugOJfHybnQ4rJ?=
 =?iso-8859-1?Q?xGjOitRrNWd5V5H+7wFDMwcE7aQKtd4UVru4a/VcSIf/f5EW/ZdQ/TdV/L?=
 =?iso-8859-1?Q?12raW+iwr+TQWZY1LiPcb+QQw8/8dPam8N0hGkh3lGnniudSus+TdocDem?=
 =?iso-8859-1?Q?ucyxwNf4ot3IGOSrsshWvJqT+CAO3Y/Gmm4JATipSoKnX2VK4X0F/fuwka?=
 =?iso-8859-1?Q?1MFA9qcxVzcfz8WIYDLFByPReOxKhJG2FOYcZ29vSRo1nmgC1SjF1lMtja?=
 =?iso-8859-1?Q?CMjo8Wr+1zmqL0qjGJwqvrOsy7w9kMsM3NoOKBtBai7yRuO8XYAkE65FO2?=
 =?iso-8859-1?Q?9SH0gCa8VHbfNeqnyE9JJqOiiiz1mGaYTZTKNwqRnmW6oPC3KNhLr6/CsW?=
 =?iso-8859-1?Q?IQRR7ZHYJS/JFpxNUMI328YZyyhg4aS2Sl9kvnvTs9IAEOPbhGtPMqg4mG?=
 =?iso-8859-1?Q?Hm9KsgxdQ+LlQEeIsQtPGsxKUadOi1hALtCrPo72Uq3SVZcLsjMc9mOnjW?=
 =?iso-8859-1?Q?v/OCvprwxbkKeStVRuaO+Gvw9jJze3i3laBRoFYO1q2gFtbo0wic55/GcD?=
 =?iso-8859-1?Q?NodelO7STtTWHYu6NNdPU7d63dXxP7INYLNgUn6ioyodtjX83lboXCqEVh?=
 =?iso-8859-1?Q?qjo+A6ttdcqF3SqVbdcFUxskgfnKl+//+W2faSzpjB5qOnUHyL2DQ2gI0O?=
 =?iso-8859-1?Q?BnqgomaUOd/1Fa5wLSxfBjFk8QtZ1IQ96HfW2OM/brNfTtTfN1Jm2QmaY4?=
 =?iso-8859-1?Q?MxBYRc1dTyqljL3Q6Dh56+oAKWYXBd47Zg0680IfZ60a6ZZ5MPkfytj1J6?=
 =?iso-8859-1?Q?Wif3thI/Bdzl7qFsj7dTLAVj6gyqU2DW2AZ9Qmkpgy1LfQ+Y8/q3FeaMx7?=
 =?iso-8859-1?Q?VvxUGuFsOez6JnCYhdBxTfkaGP96bU08CAb8izRd0pw/6uceeSyF01jNXP?=
 =?iso-8859-1?Q?2Bveu6BFtqQ0ldFubT1CBpZJ/r+oblufyOIhjvsGi8hUUZfEA3XI2iAV2i?=
 =?iso-8859-1?Q?LZQAGzyV/di2i7EKj0XF/v8x6ZlS2dEFUM0jpe5oPGuk97rH+rL+0ZYbls?=
 =?iso-8859-1?Q?G4Kunb3Gh2u4FNYrnvcwUhaZmR8pvITMhurqooLsloIA5Qr8Nb9ASz5QhX?=
 =?iso-8859-1?Q?feZpfYvoO2OhSbhe7hPRLhJ9+85qr60Rsd1zrZdIxgUsxdovIcIpV7L/So?=
 =?iso-8859-1?Q?bqV+BNoNqdxEmUg3tchOFjwxIVIGqSsE9uNADZfX3a4qnXDPOSxdR+4S/v?=
 =?iso-8859-1?Q?fFbjqahKurjAFrzTvCJQNUnpghuS4lB/l5FJWet+JyoIGAyGniysrhWztl?=
 =?iso-8859-1?Q?F5KBnBZT4NxE4ZCN9nMrxuuMv7b5qU7lHVjS6sLQgA90V85zYy9QeKqFjE?=
 =?iso-8859-1?Q?+GrWuDmAd8Hi65oKwbDXdt+K0zT0cwqBkb65zREseHsF0lNzdfqNmGIloB?=
 =?iso-8859-1?Q?7lNmYWPKSnwxtnT1wKF1u5QGe15JuFvUtF5KTnmCQyBIMYv3PijdG0nuMa?=
 =?iso-8859-1?Q?WmHE5l1NLOcrzn3NBCWBKyhhoLl9dxEYUSTVgFZy4oES9rOEJRqIBlzGo7?=
 =?iso-8859-1?Q?uMiYodOfGPKbOf2/CBaglKMPL2SNzYtgmLCnwCCcJMNNf5YrjmYykEHQB7?=
 =?iso-8859-1?Q?7AvGJTJWU0WfqqnTlInN7VZr56w+6gQOflNkStTh0bLNQY20qynwQdfhyO?=
 =?iso-8859-1?Q?wdJvCb54Yw=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	Y1ZjJ7xKVEvR0TFt6BYbLHK6XKm+9pYn1DT8T2opd8ueWrcItTWch8E6hQ5n7CKVFp7PAIK8IiVYO0mjIyMvPLZdAy72URf3uMPO28OL7E2sOdA8+7ho+MlGAM6taRPAkNxTBExuV2gTOd9EdbhuzYa8tiKVmqKcKRZWRDcbtsltMbm2gVjrHK2ojU1bGen9EjoxSHlyHkolfXmc2UtWoHHReZYNt4AtJKy9X7jtdDA/a6MEcs4EPPpidXqZiKtUR2eoziH9uuvy6j4x88WDRKi9ilvRjEMVKfnErsGHx/npxbjcdJvqtngG0lLrWfBQM86ogIy6nOvDD5/T0hP9ew==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR03MB4977.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb4f28ac-77dc-4cb9-7fce-08def9d94c68
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2026 07:54:41.8228
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YVXdYqGfjMq5Sc0aSMifRtTgHq1wO0GYy7r2KqqqpvEMTpAL9gtYVrA4KA8p9mV/23C5uBINVLi7hdtITpiVO4/uD0uvksTi+0mniEmX3DY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB7728
X-Proofpoint-GUID: Gx3FuFBgMCBYAOuAl7t25v7v9RnFJWJ7
X-Authority-Analysis: v=2.4 cv=bMwm5v+Z c=1 sm=1 tr=0 ts=6a7ec9c7 cx=c_pps
 a=nAh4yJc8K/mwxcjpRfPwJQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=OmVn7CZJonkx5R5zMQLL:22 a=gAnH3GRIAAAA:8 a=VwQbUJbxAAAA:8 a=IpJZQVW2AAAA:8
 a=_ecSgicd_tHa3CVhPD0A:9 a=wPNLvfGTeEIA:10 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA2MSBTYWx0ZWRfX9V76ihuWRg8+
 oJ+RoiBsk3S2Einj7l1JcrW+tYH6wCo6tGeWFfzligq6qrLRE/l1hIbd3di5zp9FEQPDG0tigEc
 FS8IX04Ge94/S3puShkJ5Ua+gIcH4d1nIAAEIvFrTOJSisrJMiSO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA2MSBTYWx0ZWRfXzU4sESiqJmqV
 I/f2ziyxvydCRWf4wdutsLi1mCDEUPUNuvz3uEHfn8Hikm7YeOOZZqcMXZnln4O2EG+OP+kjxPR
 8x76uKFeWKwO5RdbqpytyX80yglb/w7ukbDMEkH9QZSNUmupz2AvfyweRZiXWCucDNgfCLJ0U+U
 E3u7iqAL7vaqEb2z45C3Sz76ZlztEJ1PDYZTeavI5JoRX0/lvyl7xnCuqST7bG8JTbu6phkMP4z
 S2kBXu6LNRpa9hKrGFykwr3IgEunTccKq2wny6gayUEtENIIG/VKUB8fLOw22DP2VT2GVTL9Oyp
 OCA8ZXMud8NlMz9k5ALT/3ILLnJoklwiNcrwf9oau06eDCKb3xk9fjMjWNUkrc4IT3a0AWEABn0
 CP3AMuovH97Mv1nMFHBdg8euqiYP2m2/JTNC9yfoiPFNMoy5qM1yIW1PbV/hyevb9WZl1V+XOSh
 7vzGz/QcGG6ZUsew5hw==
X-Proofpoint-ORIG-GUID: Gx3FuFBgMCBYAOuAl7t25v7v9RnFJWJ7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_03,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608140061

Hello Jones.

Thank you again for the review.

> -----Original Message-----
> From: Lee Jones <lee@kernel.org>
> Sent: Wednesday, August 12, 2026 7:41 PM
> To: Roleda, Jan carlo <Jancarlo.Roleda@analog.com>
> Cc: Pavel Machek <pavel@kernel.org>; Rob Herring <robh@kernel.org>;
> Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley
> <conor+dt@kernel.org>; linux-kernel@vger.kernel.org; linux-
> leds@vger.kernel.org; devicetree@vger.kernel.org; Uwe Kleine K=F6nig
> <u.kleine-koenig@baylibre.com>
> Subject: Re: [PATCH v9 2/2] leds: ltc3208: Add driver for LTC3208 Multidi=
splay
> LED Driver
>=20
> [External]
>=20
> On Thu, 06 Aug 2026, Jan Carlo Roleda wrote:
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
>=20
> multi-display ?
>=20

This is how the device is described in the datasheet;
It refers to it capable of driving multiple LED channels, thus "multi-displ=
ay".

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
> > new file mode 100644 index 000000000000..25b49e24ca08
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
>=20
> Remove this line.
>=20

Noted.

> > + */
> > +
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
> > +#define LTC3208_REG_A_GRNRED		0x1 /* Green and Red current
> DAC */
>=20
> I'm not agasint the comments, but can we tab them out beyond the values.
>=20

Noted.

> > +#define LTC3208_REG_B_AUXBLU		0x2 /* AUX and Blue current
> DAC */
> > +#define LTC3208_REG_C_MAIN		0x3 /* Main current DAC */
>=20
> Is this the nomenclature used in the datasheet or can me improve them?
>=20

The registers are labelled from A-G in the datasheet, the phrase after each=
 register
for A-D refers to the target LED channel current setting of each register's=
 fields.

I can update these registers to be more descriptive by appending a "_CURREN=
T":

LTC3208_REG_A_GRNRED_CURRENT
LTC3208_REG_B_AUXBLU_CURRENT
LTC3208_REG_C_MAIN_CURRENT
LTC3208_REG_D_SUB_CURRENT

> > +#define LTC3208_REG_D_SUB		0x4 /* Sub current DAC */
> > +#define LTC3208_REG_E_AUX_SELECT	0x5 /* AUX DAC Select */
> > +#define  LTC3208_AUX1_MASK		GENMASK(1, 0)
> > +#define  LTC3208_AUX2_MASK		GENMASK(3, 2)
> > +#define  LTC3208_AUX3_MASK		GENMASK(5, 4)
> > +#define  LTC3208_AUX4_MASK		GENMASK(7, 6)
> > +#define LTC3208_REG_F_CAM		0x6 /* CAM (High and Low)
> current DAC */
> > +#define LTC3208_REG_G_OPT		0x7 /* Device Options */
> > +#define  LTC3208_OPT_CPO_MASK		GENMASK(7, 6)
> > +#define  LTC3208_OPT_DIS_RGBDROP	BIT(3)
> > +#define  LTC3208_OPT_DIS_CAMHILO	BIT(2)
> > +#define  LTC3208_OPT_EN_RGBS		BIT(1)
> > +
> > +#define LTC3208_MAX_BRIGHTNESS_4BIT	0xF
> > +#define LTC3208_MAX_BRIGHTNESS_8BIT	0xFF
> > +
> > +#define LTC3208_NUM_AUX_LEDS		4 /* Number of configurable
> aux channels */
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
> > +static const struct reg_default
> > +ltc3208_reg_defaults[LTC3208_REG_G_OPT] =3D {
>=20
> Since these are already populated, what's the point in specifying a size?
>=20

I have no real reason for this. Will update this to remain blank.

> > +	{ LTC3208_REG_A_GRNRED, 0 },
> > +	{ LTC3208_REG_B_AUXBLU, 0 },
> > +	{ LTC3208_REG_C_MAIN, 0 },
> > +	{ LTC3208_REG_D_SUB, 0 },
> > +	{ LTC3208_REG_E_AUX_SELECT, 0 },
> > +	{ LTC3208_REG_F_CAM, 0 },
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
> > +	[LTC3208_CHAN_MAIN]  =3D REG_FIELD(LTC3208_REG_C_MAIN, 0, 7),
> > +	[LTC3208_CHAN_SUB]   =3D REG_FIELD(LTC3208_REG_D_SUB, 0, 7),
> > +	[LTC3208_CHAN_BLUE]  =3D REG_FIELD(LTC3208_REG_B_AUXBLU, 0, 3),
> > +	[LTC3208_CHAN_AUX]   =3D REG_FIELD(LTC3208_REG_B_AUXBLU, 4, 7),
> > +	[LTC3208_CHAN_CAML]  =3D REG_FIELD(LTC3208_REG_F_CAM, 0, 3),
> > +	[LTC3208_CHAN_CAMH]  =3D REG_FIELD(LTC3208_REG_F_CAM, 4, 7),
> > +	[LTC3208_CHAN_RED]   =3D REG_FIELD(LTC3208_REG_A_GRNRED, 0, 3),
> > +	[LTC3208_CHAN_GREEN] =3D REG_FIELD(LTC3208_REG_A_GRNRED, 4,
> 7), };
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
> > +initialize regmap.");
> > +
> > +	regcache_mark_dirty(regmap);
> > +	ret =3D regcache_sync(regmap);
> > +	if (ret)
> > +		return dev_err_probe(&client->dev, ret, "Failed to sync
> register
> > +cache.");
> > +
> > +	disable_camhl_pin =3D device_property_read_bool(&client->dev,
> "adi,disable-camhl-pin");
> > +	set_sub_control_pin =3D device_property_read_bool(&client->dev,
> "adi,cfg-enrgbs-pin");
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
> > +		return dev_err_probe(&client->dev, ret, "failed to set device
> > +options register.");
>=20
> The style inconsistencies are making me \twitch\.
>=20
> I suggest an upper-case char to start and drop the full-stop.
>=20

Noted.

> > +
> > +	/* Initialize aux channel configurations */
> > +	for (int i =3D 0; i < LTC3208_NUM_AUX_LEDS; i++) {
> > +		/* default value (AUX) if property is not present in dt */
>=20
> Definitely capitalise comments and it's "DT".
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
> > +		return dev_err_probe(&client->dev, ret, "error writing to aux
> > +channel register.");
> > +
> > +	device_for_each_child_node_scoped(&client->dev, child) {
> > +		struct ltc3208_led *led;
> > +		struct led_init_data init_data =3D { };
> > +		u32 chan;
> > +
> > +		ret =3D fwnode_property_read_u32(child, "reg", &chan);
> > +		if (ret)
> > +			return dev_err_probe(&client->dev, ret, "Failed to get
> reg value
> > +of LED.");
>=20
> This is user facing, so "register" would be better.
>=20

Noted.

> > +		if (chan >=3D LTC3208_CHAN_N_COUNT)
> > +			return dev_err_probe(&client->dev, -EINVAL, "%u is
> an invalid LED ID.",
> > +					     chan);
> > +		if (test_and_set_bit(chan, registered_chans))
> > +			return dev_err_probe(&client->dev, -EINVAL, "%u is
> already registered.",
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
> > +					     "cannot allocate regmap field.");
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
> > +			return dev_err_probe(&client->dev, ret, "LED %u
> Register failed.",
> > +chan);
>=20
> "Failed to register LED %u"
>=20

Noted.

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

If the comments surrounding the register macro names are sufficient, I will=
 submit another patch soon.

Regards,
Carlo
