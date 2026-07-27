Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010040.outbound.protection.outlook.com [52.101.69.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D0F3F4822;
	Mon, 27 Jul 2026 10:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785146686; cv=fail; b=jCzbp0Mz/Jeg7ApqcOmA7+njZwOvhQQHx5Z1V8Gm5Raq+0W2e57JZJEqd/HgMJhgrGOdMSJp0SsVT1KCyTHJ0bjbJtvrEifrnlWRifBh4913YDtGYRZEM0uMb1//i461UY369fSOkeJrECFYkMe0LMu58N0uD5h9AUPXpxEKIAA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785146686; c=relaxed/simple;
	bh=01w/yo6XF2/E4QpuSxl5+dR23T0NvpUoDYXFje+rFaQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kgp8+QC7N2bcytqwl9Y5OzzeYTT8CaFcWuASi7Yem7FbVYqokWF1jVunQRYTgk+K/eiu/es8VZvYswoBvuent3ZUgj/PAYbYE6yLNgRxcOSycbVWcq3foBvdNiabQaajbk+fTUV2FxNdP1nLr1VeTMeCXfUy/uDzqhT6OD5IUrY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=WQkI1NGX; arc=fail smtp.client-ip=52.101.69.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="WQkI1NGX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iHT+srVZlkXPnFpsWDNwxUxXO1ej34VEKqAqwqrmR38rutXr3Z8LgTcLhjlQZLMH5WdZ2Lrl8gYsADpkDU7ghIqNDyK9QrplxJPFOygAcTtbJFyuJbUuTPKDHjq0Tqs/Q6/V1LjpYysIsI/U8cuwuZZjbAWSI2GgsDi8O6tD8V4S8JhywmPIVo1dlCxc99hoed6KSoGA7UqGsA+hCuXAbWabZdKpwqjNaLBSNlsYi0E/3oNZWps/UgcAHdcY2E1M3wFRKwag3cKM62vUjkhryzYsgji2QZVyCHyDh6bWFoZ+HKTzSm6RBUabMyVLrsl6S2YWdSeskvetsfLX27Doug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=01w/yo6XF2/E4QpuSxl5+dR23T0NvpUoDYXFje+rFaQ=;
 b=kQM9yJE/Q6HhPjATlFPC2gbPo3gZ9xgoLsrhKzsQoZK8BRupu1QsDebpkoHWHXW7trD1OIzvAdFpJm1PV6QN35W8ncttRAu4eGNMIQI8rVYKZqPMm568bpeIaY9MIvnt7LTM11j/eEFWw9Nl18QjNxfYyOhYhRKFjyi2Ej4ZBonsHaKJsCBySkiscO18jIoNDdYodYVcNaBADxr1h3SqSSRfAk+KY68UQ1mtT/WSc/f/SdpSnuqXI/MFiTqKteMTAaT3Zthpvr9NQLY0080lt9AhcCRloIiJoMoAIsPE9Hegl3WQ0NybO5QuQRSLqDRdlcjtXxNpa/lsD0we9VpT9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=01w/yo6XF2/E4QpuSxl5+dR23T0NvpUoDYXFje+rFaQ=;
 b=WQkI1NGXv12nUl9Pgl0nlCRNZjtT2rvkUGZID9K5Oid4CaDgpRjizkxUAgZpHROr2GTxa5/F4cYo8tZAl2Gi13nXhYVA8XLxw9By8YoXf4jMi+xtCrlXLBCbsaqqCOmQe6OvBX9BinIt6+3RE3MDNbIjjgz3iHQ2HoNNyhMOE8axhZvx8uSzLpzWrSczZEAuN3rZeRRMxV6AQcxWWT3Z1GtA66g7gLwOQo270olAheSoC3NkLZb8+Gk/7Q4S6DDnVZGIOqK1lliRau+do26rlFKnigLQEfm8jAu6dXHdWoBXHtL2+AoWEtb6K/Bg3Fz49eAg/Xf68x43REiCgqZCkQ==
Received: from DU2PR04MB8677.eurprd04.prod.outlook.com (2603:10a6:10:2dc::14)
 by PA6PR04MB11801.eurprd04.prod.outlook.com (2603:10a6:102:51e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 10:04:37 +0000
Received: from DU2PR04MB8677.eurprd04.prod.outlook.com
 ([fe80::9cc3:2ef9:9259:e963]) by DU2PR04MB8677.eurprd04.prod.outlook.com
 ([fe80::9cc3:2ef9:9259:e963%4]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 10:04:37 +0000
From: Bough Chen <haibo.chen@nxp.com>
To: "Bough Chen (OSS)" <haibo.chen@oss.nxp.com>, Riku Voipio
	<riku.voipio@iki.fi>, Lee Jones <lee@kernel.org>, Pavel Machek
	<pavel@kernel.org>
CC: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: RE: [PATCH] leds: pca9532: check i2c_smbus_read_byte_data() return
 value
Thread-Topic: [PATCH] leds: pca9532: check i2c_smbus_read_byte_data() return
 value
Thread-Index: AQHdHa3tNZSyC3QWrUGrfGRulOOO2LaBIq6w
Date: Mon, 27 Jul 2026 10:04:37 +0000
Message-ID:
 <DU2PR04MB8677182F2CC98B6AAD09F25990CC2@DU2PR04MB8677.eurprd04.prod.outlook.com>
References: <20260727-led-fix-v1-1-d635c5037109@nxp.com>
In-Reply-To: <20260727-led-fix-v1-1-d635c5037109@nxp.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU2PR04MB8677:EE_|PA6PR04MB11801:EE_
x-ms-office365-filtering-correlation-id: 3838eb16-4a26-44bf-82ff-08deebc67755
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|19092799006|11063799006|56012099006|10067099003|6133799003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 ow2xybP1qVq1tjCW19WbrQbKGLhdwudTUthhwq6zN/twD/JMdHqsm52MC7qPDNkmRQyllKVwVLS9SlU3m1BW2u3soqXBz0R8A9YsaEsWJVqIDU6eRoLGKs0Vkw/UnocOwShOOYey0i3pzX9WYl7X0xvje854rG8AHGy4gnwFXOjp1A3g3cbsqKGyqpfhl6Ckpz62UU7tPOXwRPGAkU8V4mlfTisLrARYwz/6ICoDNuzXb5Y4loACw6DI0IC3EF7xraND4NDchcbnyfxharwCgwbMT9E5HuC2aycGI/27KrMBHQM9ILX3/QPIp/2XQ5VyZvD2z9xJPNVTUlCYUEbFuqVigkD5cDveqw4r2hzrB2XDN8BuTQp1c75CFUpmLjghAmsLHV7ff2G6BKh7DboVfwyUqL80NbLqiYa7NuKHs4AMEcLsITZkoc6W5DeyU4e2Wej2QeKkFhQ3JOTZUwgmvOfCZIAz0wZwGyV0mQdH+GoeG++fFZkrOVN6/V9tjUvhEKHAXIJHdEteAlOEL87S9V+jKxgKPrTBNgx0iVSlu5l9VApHWxGzSFCagIN0BO2MN5F8xbpxfoTBRJ/8Oug+rwTued/dfCpJ3aMXdiRRcOk/ep3yqNbDiWFLsOyrrRn8XVjVpL5FROzJBdXld8iR1HPGtp0BBV15L4dSn0TZtaq2Wqx+CXYz5DdMU7PGXFm5deIxNWug72Ov35LR+ploJNAD+7ORfI6tWc/jYb6Ylg0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8677.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(19092799006)(11063799006)(56012099006)(10067099003)(6133799003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?azVzSzFuTllIaXp0QUZMNFRMM0dWL3ZtSTA0VDdIMnZiRnZoYTFHMk1WbllR?=
 =?utf-8?B?SUNvTjhoZ1ZaTWxYdjk3Y0lyOHpIMHB2azQzK3JTKzJXeFpaVnFEOHhEcWw4?=
 =?utf-8?B?ZEZ3eDFkWlpzeG94RmN6SDlaL3RlTTJnbFk3ZkhEM25Dai9jMmVBckp4RDNB?=
 =?utf-8?B?bFRUUG9vVkI5VVhBamFKekNBNXVBTDR1OU1pbHkyMHI2RTlhVHcrQ3VsYko4?=
 =?utf-8?B?QlVJNU82R0lrSzYrNHY5eVpyczMwWEM2MU83KzJSM3hnbHBmNzRWYkptVlJ5?=
 =?utf-8?B?bVF5ZXBVeVpIREpxb3IvajE1YnJ4Zk9sMmVYbjV1ZG9SbzE0b3VqMys5WWNX?=
 =?utf-8?B?QmU0anM5NWNOUGtkZ0FucEM1ODZmaHVRNUtsMGxFeVhteGgvN3owaFN5NmZi?=
 =?utf-8?B?S3JCdGV1dk82aTI0MzFpN0cwQ3VBWGw4VWdXTENiVUxxRWdVeTVieko3cU9H?=
 =?utf-8?B?WTlucU9RdURtWVNvK2V0Z2ZGYzBYdHNYY2tTbU9kbFN4V2Uzc1BzQ253TktD?=
 =?utf-8?B?SUZENHJZRC8yWFNnOGVOUUlvbG1DRk93OHNpcm82blh1MjlNL2hzbXFSdjhE?=
 =?utf-8?B?U3R3MVExSFRib25UVG9ZYXNMblhNZ1ZTQTk3ZldWQ3A0TVMxZFVnOVZBRVhz?=
 =?utf-8?B?NW4xRGJNNkdJR3FwUTczQW8wblFoV3pSeklEV2txVlNGcU9VY2M3YkE3QlZF?=
 =?utf-8?B?SDVKRzgrek5HVGNhZ1dtbk1tMFhoeHh2di9sOXRyYjZ0VU5FMXRsbTA2UkdY?=
 =?utf-8?B?a2Z0WjZWY3dEeks5bkRTbGJLa2xFNlBqUmJyRDN0NmQ4QTNSQngreWZmOFRu?=
 =?utf-8?B?bURlU3RlS0FydkVBUDJ3blJsNzdWU0FsTGhWczBiL0dBY1hkT3padE5WOWRM?=
 =?utf-8?B?djA4SW12cnd6c1ZTVmMrZzczUEI5ZkNmdE13VExtdCtXSEZyZGxpZkxnUmw5?=
 =?utf-8?B?MGM2MFlBQ3pvUEVPa0RqelNkUDkydE1SYUpzbjhSRFJSc0JNdGJtLzcxZmp4?=
 =?utf-8?B?SDM2Q0VPMzFWRGh4WUtHWXJuWEV6akhQNVQ1RUYwcDRoOFU2Si9hTFZhQ3I5?=
 =?utf-8?B?VFhUai8veXVDYmRsaGg0cXFuMVRBMFpwR1RNdmFiNGg3ZzhoL2hjb1k3bW54?=
 =?utf-8?B?UHV5Y3ZQdmlBQzE5TUxyZjY1MjhFVXNMa3JOY0dSRmh3bGNraEZZdjljK0Q3?=
 =?utf-8?B?amlpVkpXWHEzUXFtQlhMSDlyOGZ3eE4rbnhiZnkrUE5xRjdLK1I5N05VM2lx?=
 =?utf-8?B?VC90TmxFaE0rRjVUQzdFVDg2VTdoZnRJd0ZmWjY2UlVQYmtSeGgxOXZHb0l6?=
 =?utf-8?B?Z3p0d1RLL1AvaDRmME83VGxuVlRVbkUrb2oyUDZyNGFxY0VhVWxsNStDQnc1?=
 =?utf-8?B?VnRjbCtmNSs4WENLRTNmSU5seEgvU2tnelZDUjhXK0RGSjk2N0M0QUVmK3F1?=
 =?utf-8?B?RGIrYU1nM0ZnU25tdnF5RVdPZVk5bWx3NEVobnhaTWVkUElTZU9iNVZyZlg4?=
 =?utf-8?B?OGVES0VmenJOYmh0N2VLS0gvSTU2SkorWmJJNEZiMHRPZDc3RVVZYUxtd2pQ?=
 =?utf-8?B?SElRRWNxejFGODhNWmZYaUNvUDJPTDB0bmhwNjhkOWJVdm9tN0JjZUFtZnpI?=
 =?utf-8?B?OURnOTBmVWJLeTRLL2o5ZGZHdG95cGdTbXFzcnJmL0pzdENlQWkvTXRMaTd4?=
 =?utf-8?B?Nk1yUHBBNi8zajBWcThvbHNWeW9NRlU4cjhUQVplNG1LcGNFSW5keG4xd01s?=
 =?utf-8?B?dVVEaWZuUjlOd0xRNjd4ZkRXSnNBRllyWkRVUEE0V3NlNk5WZmJPMDdFb2E4?=
 =?utf-8?B?eGYzQkkyWWpuYUhRV2ZGaTRYdlRCdWN0eHBhRTJXMVZZRTBReXJxMFBoL0dD?=
 =?utf-8?B?WXFjbm5xbVBhSTF3MXhCdnpPVStPLzBJWXhlZTVvQ2xjV1VrMCtoUjUvSklX?=
 =?utf-8?B?b2lzUVVEUDRRTEZWQkRiS2hwTzUwc1praW9oWTlhcjhqREJUcStXOFBuRGpN?=
 =?utf-8?B?R0hHUnBQa3ZCTEV0U0ordWJ5ZEo5b0xpTkRGRlRpVEY0cTBpUVhiWFhNRDlx?=
 =?utf-8?B?bWRGNzc3RnNHV21CaVUyMEg4MlpSSzcyVklyQWZKWjFkY05kTTcweDZUQWxo?=
 =?utf-8?B?S1VqQ0pRRTlOZjdKNnM2b1J2bEJRR1IxT1JqVzhGNUNMcmhZcWF3akxrMHR6?=
 =?utf-8?B?OXVlaFZ1QVF2UkpETWhabEZkUGMwYkEzdWloRFJtcTJRWU9yNHZUdU5KR0dp?=
 =?utf-8?B?RUM4VjI4VE9KeHY1SWtFK3QyZENOM2RLclRKcmZXT3czcWYzQThsN1VVYTJv?=
 =?utf-8?Q?x+FN2ttLkruLiS/4ew?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8677.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3838eb16-4a26-44bf-82ff-08deebc67755
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2026 10:04:37.0929
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jyPu9yesVdzxrInCuOfY3uf7HKohy+G3juB8f2bI9ko7eo6JKIH0y7Zu/UCfDsGdcLq71n7Gnfdf/2JkIp0eIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR04MB11801

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCb3VnaCBDaGVuIChPU1MpIDxo
YWliby5jaGVuQG9zcy5ueHAuY29tPg0KPiBTZW50OiAyMDI25bm0N+aciDI35pelIDE3OjU4DQo+
IFRvOiBSaWt1IFZvaXBpbyA8cmlrdS52b2lwaW9AaWtpLmZpPjsgTGVlIEpvbmVzIDxsZWVAa2Vy
bmVsLm9yZz47IFBhdmVsDQo+IE1hY2hlayA8cGF2ZWxAa2VybmVsLm9yZz4NCj4gQ2M6IGxpbnV4
LWxlZHNAdmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOw0KPiBp
bXhAbGlzdHMubGludXguZGV2OyBCb3VnaCBDaGVuIDxoYWliby5jaGVuQG54cC5jb20+DQo+IFN1
YmplY3Q6IFtQQVRDSF0gbGVkczogcGNhOTUzMjogY2hlY2sgaTJjX3NtYnVzX3JlYWRfYnl0ZV9k
YXRhKCkgcmV0dXJuDQo+IHZhbHVlDQo+IA0KPiBGcm9tOiBIYWlibyBDaGVuIDxoYWliby5jaGVu
QG54cC5jb20+DQo+IA0KPiBDb3Zlcml0eSByZXBvcnQgSU5URUdFUl9PVkVSRkxPVyAodGFpbnRl
ZF9kYXRhX3JldHVybiAtPiBjYXN0X3VuZGVyZmxvdw0KPiAtPiBvdmVyZmxvdykgaW4gcGNhOTUz
Ml9nZXRsZWQoKS4NCj4gcGNhOTUzMl9nZXRsZWQoKSBzdG9yZWQgdGhlIHJldHVybiB2YWx1ZSBv
ZiBpMmNfc21idXNfcmVhZF9ieXRlX2RhdGEoKSBpbnRvDQo+IGEgY2hhciBhbmQgdXNlZCBpdCBk
aXJlY3RseSB0byBjb21wdXRlIHRoZSBMRUQgc3RhdGUgd2l0aG91dCBjaGVja2luZyBmb3IgYW4N
Cj4gZXJyb3IuIGkyY19zbWJ1c19yZWFkX2J5dGVfZGF0YSgpIHJldHVybnMgYSBuZWdhdGl2ZSBl
cnJvciBjb2RlIG9uIGZhaWx1cmUuDQo+IE9uIGFuIEkyQyByZWFkIGVycm9yIHRoZSBuZWdhdGl2
ZSB2YWx1ZSB3YXMgYXNzaWduZWQgdG8gYW4gdW5zaWduZWQgdHlwZSwNCj4gdHJpZ2dlcmluZyBh
biBpbnRlZ2VyIHVuZGVyZmxvdy9vdmVyZmxvdywgYW5kIGEgbWVhbmluZ2xlc3MgTEVEIHN0YXRl
IHdhcw0KPiByZXR1cm5lZCB0byB0aGUgY2FsbGVyLg0KPiANCj4gUmVhZCB0aGUgdmFsdWUgaW50
byBhbiBpbnQsIGNoZWNrIGZvciB0aGUgZXJyb3IsIGFuZCBmYWxsIGJhY2sgdG8gUENBOTUzMl9P
RkYNCj4gd2hpbGUgZW1pdHRpbmcgYSB3YXJuaW5nIHdoZW4gdGhlIHJlYWQgZmFpbHMuDQoNClNv
cnJ5LCBJIGZvcmdldCB0byBhZGQgdGhlIGZpeCB0YWc6DQpGaXhlczogMjhjNWZlOTkwMTZkICgi
bGVkczogcGNhOTUzMjogRXh0ZW5kIHBjYTk1MzIgZGV2aWNlIHRyZWUgc3VwcG9ydCIpDQoNCldp
bGwgYWRkIGl0IGludG8gY29tbWl0IGxvZyBpZiBuZWVkIGEgVjIuDQoNClJlZ2FyZHMNCkhhaWJv
IENoZW4NCj4gDQo+IEFzc2lzdGVkLWJ5OiBWZXJvQ29kZXI6dmVyby0xIFtjbGldDQo+IFNpZ25l
ZC1vZmYtYnk6IEhhaWJvIENoZW4gPGhhaWJvLmNoZW5AbnhwLmNvbT4NCj4gLS0tDQo+ICBkcml2
ZXJzL2xlZHMvbGVkcy1wY2E5NTMyLmMgfCA5ICsrKysrKy0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQs
IDYgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2xlZHMvbGVkcy1wY2E5NTMyLmMgYi9kcml2ZXJzL2xlZHMvbGVkcy1wY2E5NTMyLmMgaW5k
ZXgNCj4gMmQzN2UwMGU0NTlkZWU5ZjAzMTM4MzBmNDg1MmIwMWY0MDk3NzMxMS4uZThlZTE3Yjhi
ZDU0N2E5MjM3MmE4DQo+IGU3NGE2NzgxYjk1YWU4MzFmZTIgMTAwNjQ0DQo+IC0tLSBhL2RyaXZl
cnMvbGVkcy9sZWRzLXBjYTk1MzIuYw0KPiArKysgYi9kcml2ZXJzL2xlZHMvbGVkcy1wY2E5NTMy
LmMNCj4gQEAgLTI5OCwxMiArMjk4LDE1IEBAIHN0YXRpYyBlbnVtIHBjYTk1MzJfc3RhdGUgcGNh
OTUzMl9nZXRsZWQoc3RydWN0DQo+IHBjYTk1MzJfbGVkICpsZWQpDQo+ICAJc3RydWN0IGkyY19j
bGllbnQgKmNsaWVudCA9IGxlZC0+Y2xpZW50Ow0KPiAgCXN0cnVjdCBwY2E5NTMyX2RhdGEgKmRh
dGEgPSBpMmNfZ2V0X2NsaWVudGRhdGEoY2xpZW50KTsNCj4gIAl1OCBtYXhsZWRzID0gZGF0YS0+
Y2hpcF9pbmZvLT5udW1fbGVkczsNCj4gLQljaGFyIHJlZzsNCj4gLQllbnVtIHBjYTk1MzJfc3Rh
dGUgcmV0Ow0KPiArCWludCByZWc7DQo+ICsJZW51bSBwY2E5NTMyX3N0YXRlIHJldCA9IFBDQTk1
MzJfT0ZGOw0KPiANCj4gIAltdXRleF9sb2NrKCZkYXRhLT51cGRhdGVfbG9jayk7DQo+ICAJcmVn
ID0gaTJjX3NtYnVzX3JlYWRfYnl0ZV9kYXRhKGNsaWVudCwgTEVEX1JFRyhtYXhsZWRzLCBsZWQt
PmlkKSk7DQo+IC0JcmV0ID0gKHJlZyAmIExFRF9NQVNLKGxlZC0+aWQpKSA+PiBMRURfU0hJRlQo
bGVkLT5pZCk7DQo+ICsJaWYgKHJlZyA+PSAwKQ0KPiArCQlyZXQgPSAocmVnICYgTEVEX01BU0so
bGVkLT5pZCkpID4+IExFRF9TSElGVChsZWQtPmlkKTsNCj4gKwllbHNlDQo+ICsJCWRldl93YXJu
KCZjbGllbnQtPmRldiwgImZhaWxlZCB0byByZWFkIExFRCByZWdpc3RlcjogJWRcbiIsIHJlZyk7
DQo+ICAJbXV0ZXhfdW5sb2NrKCZkYXRhLT51cGRhdGVfbG9jayk7DQo+ICAJcmV0dXJuIHJldDsN
Cj4gIH0NCj4gDQo+IC0tLQ0KPiBiYXNlLWNvbW1pdDogYzVlMzJlODZjYTAyYjAwM2Y4NmUwOTVk
Mzc5YjM4MTQ4OTk5MjkzZA0KPiBjaGFuZ2UtaWQ6IDIwMjYwNzI3LWxlZC1maXgtMjhmMDg1ZTEy
ZmViDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IC0tDQo+IEhhaWJvIENoZW4gPGhhaWJvLmNoZW5A
bnhwLmNvbT4NCg0K
