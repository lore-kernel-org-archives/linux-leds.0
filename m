Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012015.outbound.protection.outlook.com [52.101.66.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A285226A8
	for <linux-leds@vger.kernel.org>; Tue, 29 Sep 2026 12:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790685468; cv=fail; b=bd16LswtxKPx0ATlIyHQ9hS8SooN/bkHdlNihT1O39voakIVUUwCYV4cMC7yDZMvss3qEH/B8y1eaoky1pDqxlXeBRMq85vqp05H2AjoBRwh91a/xU+Xa4V6nAo1anCY6Kfqd7M8JwAfZNInAzLxNMGa268rF+Yf7e7nBLA0Ufk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790685468; c=relaxed/simple;
	bh=DZSOMZ+6bYiGNyqNePVizqUi9sDn2+4G27M18SK99fA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CtGSrUC8gQJ3ym1ZVTvjmSPDQGfhTgcJ332N2POhuSLGILP2Ryysd7wtwungN0sBfiTCZjMe5I0IXPP4rWkRCOn1DSv6Trv1GoNKj1nBc+4bzIqm5AWEMBsnvjsMG6MsnIO4H01O4rjhctpe7a8YB2JG6QUF3PLje8WdQDn5Dio=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b=Vm7y0E3r; arc=fail smtp.client-ip=52.101.66.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b="Vm7y0E3r"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kK/Sa2bbt9W13Icd8YbOMjlG1tio0MaRl+lKt2tq7sMVWL5xseg9jBkZ0luCsCYXZlFdE+wawYJrtHB0cC0lzuOzsYPEIs3FaKP3+RK23DBhSBbflbTZzdRCUPjLcbpQm6VieiFwpRPRX9NS50QZejqA821zI6GV/EB0Bq0CAdnXBxbN5mNL/Gd+PcZGG2AWfJtsCg4Uho7qDt82ihJ7wLcgNioDEaf6dzdQql0L8ty/ZH+g3nOpXcLnrmYf01+imGPHIZCE7l+8GSqzZJE5cl2MGJfUtFHwx9Cgfv755FtCjqq1X3DOfj3zGrZ6JnYkM49/MO5YwxkKL+sqdqfk1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DZSOMZ+6bYiGNyqNePVizqUi9sDn2+4G27M18SK99fA=;
 b=mVT7ztKVOJQYx9ue/FuZQ2L9K+WURlpwjiZxO0BfU8fYoInrai2s++CNN8Pf/OgIoAWfDpY8UPebSzchPokX80pcyXc3Dz9C0PKPSn6yqaaLQbvaPaf9p3D3HjIfPXLOo7YhX3zKmf/LAz040oPhZmJZHK/t7bAasrIIW68Ev5/BqYnF0wlCTykNne3Ou68UWkKQK2rvoUuzih1WnmrXOtXyRuwOnzhcYDeAu4VUjoP/n6pB+7UG3PsESw7KhUiPkLZk4n3V6Hr4h9QePN+ydONvaxwYPCeq1dQnfv7FLOXfy3QnM9eARZMXrAI8qYwRTdtUK8ha3h+O/OziJkGTyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DZSOMZ+6bYiGNyqNePVizqUi9sDn2+4G27M18SK99fA=;
 b=Vm7y0E3rLpITgDD6VK6ael5DJET5Ljw3zOPewvCbriO8kBzKt6+xAL5vm8WbThFj5oRMZ4tDSFUc0iQEJNYy8olWuYsXF2iKdxRzl8GwEQLK3+T1y1uwKtrwGYj+bOgjkACm8gGmIcz6EYuyxnylaXGFFFfBJxo28norDZ/sNMmihpz/LCvaPQfR+/gftYbLQJo0mcFTe1++TytzsXggqo2yRV0P/57+8UTQA3VKxzLKEPWS+klTotRJbshTPVeRojWcl6m2Qwt1a/o2l9tgO5/5kWxpisw4m9hifX0Ld2W5lO3PTGJQwtSv9qehYuRORQLnks+iVkxipeLQ6/yC3A==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by AM9PR10MB4071.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1f0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 12:37:43 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9126:d21d:31c4:1b9f]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9126:d21d:31c4:1b9f%3]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 12:37:43 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "lee@kernel.org" <lee@kernel.org>, "linux-leds@vger.kernel.org"
	<linux-leds@vger.kernel.org>
Subject: Re: [PATCH v3 4/4] leds: trigger: netdev: Serialize mode/interval
 stores with trigger lock
Thread-Topic: [PATCH v3 4/4] leds: trigger: netdev: Serialize mode/interval
 stores with trigger lock
Thread-Index: AQHdUAtnXbkn3ZQTVUK2ZYeQq/v+BLbleXwAgAAFEQA=
Date: Tue, 29 Sep 2026 12:37:43 +0000
Message-ID: <20339b46edb23ade58d71417d82bcee160c00480.camel@siemens.com>
References: <20260929120902.2793138-1-alexander.sverdlin@siemens.com>
	 <20260929120902.2793138-5-alexander.sverdlin@siemens.com>
	 <20260929121934.AF3661F000FF@smtp.kernel.org>
In-Reply-To: <20260929121934.AF3661F000FF@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.58.3 (3.58.3-1.fc43) 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|AM9PR10MB4071:EE_
x-ms-office365-filtering-correlation-id: db18ddcb-6ff5-4f60-be0a-08df1e26751e
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|38070700021|56012099006|6133799003|10067099003|11063799006|18002099003|55112099003|4143699003|22082099003;
x-microsoft-antispam-message-info:
 EWAT1g508bDop4OwrgYPyz4Jg2ZyZyW7mWmk7/wjX1sxKulQ36xODCGcYGaqWYZe/DtboaOMUOhOUBo4HZS+43llMjbe6VfNIUrhi7kT6M/lXrXbSRJCT/H++fgmURtpAEt1rd5v2IeCYTNmWlklhxShDkT/g+jsjjYzBuLlJ+sg/S+rYvSoff7BiDkEREUvroc0lCE/HyW2Bzbx57XVvt+Gx917f66yQdfYzy1wQH9bwLCa0i0GNj/a4Ie9UR6aB/YDONfganLha4bSm7BnPkdGKvHAU928GFbMwGVsxZgraJn/TouSH8fr9YSm8OHvmHyDTtaB8NM9Rbxu9rYGEphty6kXN+I3eTNEHrEss6xksPIIrXgov7dWPJb0rGH4QVD8s47p7dZ8brXG6tO+MwfcTWJLK3iOk0xN7l/H7ic4skohnc0IsvRXqPx0aqQ9kNjnXwWSLJKVU2FZQAECrNdzS77CQCkoo5UtHuxT68N5h/BtV+qqIqpHU9b9BhugFaCRcsUmiJNyPFozU4W5E+tl8ukPlx26GknzN+QULFfH1du6LPhhVrjoPPeBKFMFxw1U1jtRWZU+3A4m0F8+dZ/jzkcQFjeD1gLM7Vn9gNX9l9yDane0Ybg3yr7NIItMdIYS/xhkZMeykzEj2owDgXU59JM6bMR9UpYzKyk8Vw8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(38070700021)(56012099006)(6133799003)(10067099003)(11063799006)(18002099003)(55112099003)(4143699003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UUZkYjBTMXBnbk9aSzFGcUpmNEZrL3pHVzlxNjlDVVNLSXJyMjh3YzgycEpI?=
 =?utf-8?B?TlpiM2RaWG1NR2xKakpzeXg3WjRvWENyNkJLL0dBeERQVjczcnpOZGpGODFI?=
 =?utf-8?B?UVA0dlFmYjFvTGpMQ2ZTU25GRnh2K2RGbGs2cWN2US9PTzY4VGV0YWRrQzB0?=
 =?utf-8?B?MUl0NS84R0NtZzB4SXNYWGZ2YzQxdnhmenZkVyt0MWtSZWMrSlYvSVBQRm8y?=
 =?utf-8?B?SHN2Y3hzejhxZDFWcHZmUXRPWjFXbXphTWltZnN2ZFZhRi80TTUzZXYvM1pr?=
 =?utf-8?B?QUxmblYyUHh5M3RSNllsQWFKNExjNjE2UHBFQ0U0ckVieVhPM1FZbVB3d1B2?=
 =?utf-8?B?S2ptNnZXOFR0TXVOSnZyZU1OTmpabVdWWUduWUo4SVdqR3pqUThCWHExb2FR?=
 =?utf-8?B?VzFKNjFmZE1rUnhsbzRncUV5QjNZcFE0RVpTa2NQUGF5N0JGWExxVWRFQjhO?=
 =?utf-8?B?Z0hXODZ5U3ZaWktxVkhMbEhpMnIySDlxelY5TFNIQzhJY0JxUUpzMVVrSXM2?=
 =?utf-8?B?ckFXbytqWXl2ZFdKM0lualp5T3VVZ25jT0FVYlduMHg0WkJUUlFBRGhzdlJT?=
 =?utf-8?B?U3ZCZjRnTTBGM0NVc2tBM2pqN3VJMDlHU1o0Nk4zaTJJMzU0WVBoaUM4Zkdr?=
 =?utf-8?B?SzVKV1lYYTVDemRNY2NybHFkRGcrWGNYRkNRcEFCY2YzZE5rMlRpdUh6Mndw?=
 =?utf-8?B?cnhjRmh2NHIwZFpwbE11T2w5UTFGdHcwNmRuTTRTM09VQVp0WCtHRHREMlAz?=
 =?utf-8?B?OWhlbkt4T1VDc3IwcEN1MmEwWlErbEZaZVhqbWxxRWVGcFRFbmlTZmVVdjdy?=
 =?utf-8?B?dm1EOUkrbzJ4VTFOUnJBQ2F0eFNpd05JSzQ5K29WUEppeUtvM3RNb3JrVXNS?=
 =?utf-8?B?c21LNDNqT2I4cEpHdlVIeG4wU1MyRlBvdEVCOU53YnE0Vjk1U2x5MWkrTC9m?=
 =?utf-8?B?WG5RZnNCbEhsVWZrV3lXZlcraVRDWFZJWFlWZGJ5RmRnZ29Jc3NvUlFyL2hh?=
 =?utf-8?B?aFhaYWJocCtmY1hQaGVrVXNoR1YwZTJDcTdXeVBTbHpScnpobHNneG51L2tl?=
 =?utf-8?B?NUN2VU9PdFU1S3dMeXJsNm9pOUUzR0J3ZVY0a3Q1SG54LzZza1BROURVOWpV?=
 =?utf-8?B?bHhhbng1UUtnMWpoMkNjY2J2Vk8zWGJqQnlYRG5uZGp1azFSckYyQU9VOXBl?=
 =?utf-8?B?V0Z4MnpuVE5PcVdPanBMV2NPYVB2d1pneDdQS2FjMXUveVpNL3dUeEliRStw?=
 =?utf-8?B?ejM2d3phV0l6WnczaFFlUHJuQXZzQ2dUMDBLVmNXam1XQ3hTOG1vc3ZpRnhh?=
 =?utf-8?B?VmxhNGdjVmk5enY4YjYzM2VrcDlnRFdJSWtvVmszMGFZZHNjUTdZKzQ5OVlz?=
 =?utf-8?B?L1VUaCt5dm9weS9VT3djNVVVNGVyYm41dk9BQUI4cmdZM21rbnJ5eFB6c3BR?=
 =?utf-8?B?bWJZUllnNHJackllZUR4d1g3NFdCN1RQWTdyTXlBYXE5WjVZMDE5eGFyYjIw?=
 =?utf-8?B?NFBVRXVNR2VURng0dFB2cUhIRVRKWCt0eFRaTDZjL0l1cTZoZVFSMElZV0pX?=
 =?utf-8?B?dVpZbnVwejk2RTZFT2lMRGJqdFdqU3NQL1l1eXZpODdtMWkrc3JRMDhHaDlq?=
 =?utf-8?B?V3JHM0REWUZYRzdpb3JscnVwVUNWZWI1dEV3RTlnRUZKLzdLbzdKbEFKaVN3?=
 =?utf-8?B?ZEhqaGZWME8zam5EVURPbW9uTDBWQXlTc3BiaHRsQ3VOcWxCdDlZOXZlUmFC?=
 =?utf-8?B?OWpOb09SbWM5elduQTdrMnF0VUV4QWhBUlVRQnczcENKNEZMRERmdXpuVTlR?=
 =?utf-8?B?MDJhTm13TEVxQ2hudXZuUlpsNXRxTXpiZGR3TDdhcHI3N0tyT0RGeml5OTMw?=
 =?utf-8?B?VmpVWk41VWRMWnBnVmNEM0svK0k4K0xjTy9ldDNqTUY2UWZFS1kvOXNsQi8y?=
 =?utf-8?B?cGtUSTR2dmhjblZLOFM2dElNR0xWRVRXSWpERW1mVDdwdSthOXk5ZEZ5Skxp?=
 =?utf-8?B?bXBGeVUzYVlhNTBrdWRWWnNBeVE4Q3I0ZFo0TzdXOVhuTzZmam0vRUt4dGRT?=
 =?utf-8?B?aDFSZzc2bkFva1E2U3U5RmtRQUhKeVdRbjJSUzZidVJPd2RBbXE5Tk9hOFVU?=
 =?utf-8?B?TFduci9lZTBwcUR3NUJXRmdNdE1BOU5DOFpoTWJZUnhEWUd5bHJleGNJR0s2?=
 =?utf-8?B?dkxBajlmU3psM09MLzdEZzhKNFJSZmMrS0k2RjZ4TEVtUzY5RnE0bStWbG13?=
 =?utf-8?B?dHpxY0dJMTRoM1NYVkw1SVhhZ2NBK3Fzanh6aGxCeFFyekQ4U0VLUFZPeXU4?=
 =?utf-8?B?VUhaV05HU2Q0MndSUUMwRXhXSDc1UmFqSGFLcDY2aWlpYzU0ekNVT3M0dk04?=
 =?utf-8?Q?nFHM8FP/6ovxAoNQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <71DC0D33846EA24F9B287E87FB4A0BD3@EURPRD10.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: db18ddcb-6ff5-4f60-be0a-08df1e26751e
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2026 12:37:43.2373
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Tvy+Ai0/hK/SM4KUdA0B0kCBLNmRHENk8Garpwlv7MKD9bScxBjU2ey7BJpJYipGhjUenHjuC8utHkw40j48FxtymJbFMK4awfk1U83nesQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR10MB4071

SGkgYWxsLA0KDQpPbiBUdWUsIDIwMjYtMDktMjkgYXQgMTI6MTkgKzAwMDAsIHNhc2hpa28tYm90
QGtlcm5lbC5vcmcgd3JvdGU6DQo+IFRoYW5rIHlvdSBmb3IgeW91ciBjb250cmlidXRpb24hIFNh
c2hpa28gQUkgcmV2aWV3IGZvdW5kIDEgcG90ZW50aWFsIGlzc3VlKHMpIHRvIGNvbnNpZGVyOg0K
PiAtIFtNZWRpdW1dIGxlZHM6IG5ldGRldjogYXN5bmMgd29yayBjYW5jZWwgYWxsb3dzIHpvbWJp
ZSB3b3JrZXIgdG8gb3ZlcndyaXRlIGh3IG9mZmxvYWQNCj4gLS0NCj4gDQo+IGNvbW1pdCBkNTFk
Y2E4YzRhYmJiMTEyYzFmOGUzMTM4M2QzZjIzMzRkNTBjNTg1DQo+IEF1dGhvcjogQWxleGFuZGVy
IFN2ZXJkbGluIDxhbGV4YW5kZXIuc3ZlcmRsaW5Ac2llbWVucy5jb20+DQo+IA0KPiBsZWRzOiB0
cmlnZ2VyOiBuZXRkZXY6IFNlcmlhbGl6ZSBtb2RlL2ludGVydmFsIHN0b3JlcyB3aXRoIHRyaWdn
ZXIgbG9jaw0KPiANCj4gVGhpcyBjb21taXQgYWRkcyBleHBsaWNpdCBtdXRleCBsb2NraW5nIHRv
IHNlcmlhbGl6ZSBtb2RlIGFuZCBpbnRlcnZhbCBzdG9yZXMuDQo+IEl0IHJlcGxhY2VzIHRoZSBz
eW5jaHJvbm91cyBkZWxheWVkIHdvcmsgY2FuY2VsbGF0aW9uIHdpdGggYW4gYXN5bmNocm9ub3Vz
DQo+IGNhbmNlbGxhdGlvbiB3aGlsZSBob2xkaW5nIHRoZSB0cmlnZ2VyIGxvY2suDQo+IA0KPiA+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2xlZHMvdHJpZ2dlci9sZWR0cmlnLW5ldGRldi5jIGIvZHJp
dmVycy9sZWRzL3RyaWdnZXIvbGVkdHJpZy1uZXRkZXYuYw0KPiA+IGluZGV4IGIyN2E0NTNiYmI4
NTkuLjdhZDYxYzRiZTI4MmUgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9sZWRzL3RyaWdnZXIv
bGVkdHJpZy1uZXRkZXYuYw0KPiA+ICsrKyBiL2RyaXZlcnMvbGVkcy90cmlnZ2VyL2xlZHRyaWct
bmV0ZGV2LmMNCj4gWyAuLi4gXQ0KPiA+IEBAIC00MjQsNiArNDI0LDEwIEBAIHN0YXRpYyBzc2l6
ZV90IG5ldGRldl9sZWRfYXR0cl9zdG9yZShzdHJ1Y3QgZGV2aWNlICpkZXYsIGNvbnN0IGNoYXIg
KmJ1ZiwNCj4gPiDCoMKgCQlyZXR1cm4gLUVJTlZBTDsNCj4gPiDCoMKgCX0NCj4gPiDCoCANCj4g
PiArCS8qIGFzeW5jIGNhbmNlbDogdGhlIHdvcmtlciB0YWtlcyB0aGlzIGxvY2sgKi8NCj4gPiAr
CW11dGV4X2xvY2soJnRyaWdnZXJfZGF0YS0+bG9jayk7DQo+ID4gKw0KPiA+ICsJbW9kZSA9IHRy
aWdnZXJfZGF0YS0+bW9kZTsNCj4gPiDCoMKgCWFzc2lnbl9iaXQoYml0LCAmbW9kZSwgc3RhdGUp
Ow0KPiA+IMKgIA0KPiA+IMKgwqAJaWYgKHRlc3RfYml0KFRSSUdHRVJfTkVUREVWX0xJTkssICZt
b2RlKSAmJg0KPiA+IEBAIC00MzYsMjAgKzQ0MCwyNiBAQCBzdGF0aWMgc3NpemVfdCBuZXRkZXZf
bGVkX2F0dHJfc3RvcmUoc3RydWN0IGRldmljZSAqZGV2LCBjb25zdCBjaGFyICpidWYsDQo+ID4g
wqDCoAnCoMKgwqDCoCB0ZXN0X2JpdChUUklHR0VSX05FVERFVl9MSU5LXzI1MDAwLCAmbW9kZSkg
fHwNCj4gPiDCoMKgCcKgwqDCoMKgIHRlc3RfYml0KFRSSUdHRVJfTkVUREVWX0xJTktfNDAwMDAs
ICZtb2RlKSB8fA0KPiA+IMKgwqAJwqDCoMKgwqAgdGVzdF9iaXQoVFJJR0dFUl9ORVRERVZfTElO
S181MDAwMCwgJm1vZGUpIHx8DQo+ID4gLQnCoMKgwqDCoCB0ZXN0X2JpdChUUklHR0VSX05FVERF
Vl9MSU5LXzEwMDAwMCwgJm1vZGUpKSkNCj4gPiArCcKgwqDCoMKgIHRlc3RfYml0KFRSSUdHRVJf
TkVUREVWX0xJTktfMTAwMDAwLCAmbW9kZSkpKSB7DQo+ID4gKwkJbXV0ZXhfdW5sb2NrKCZ0cmln
Z2VyX2RhdGEtPmxvY2spOw0KPiA+IMKgwqAJCXJldHVybiAtRUlOVkFMOw0KPiA+ICsJfQ0KPiA+
IMKgIA0KPiA+IC0JY2FuY2VsX2RlbGF5ZWRfd29ya19zeW5jKCZ0cmlnZ2VyX2RhdGEtPndvcmsp
Ow0KPiA+ICsJY2FuY2VsX2RlbGF5ZWRfd29yaygmdHJpZ2dlcl9kYXRhLT53b3JrKTsNCj4gDQo+
IFtTZXZlcml0eTogTWVkaXVtXQ0KPiBJZiB0aGUgd29ya2VyIG5ldGRldl90cmlnX3dvcmsoKSBp
cyBjb25jdXJyZW50bHkgZXhlY3V0aW5nIGFuZCBibG9ja2VkIG9uDQo+IHRyaWdnZXJfZGF0YS0+
bG9jaywgd2lsbCB0aGlzIGFzeW5jaHJvbm91cyBjYW5jZWwgZmFpbCB0byBzdG9wIGl0Pw0KPiAN
Cj4gT25jZSBuZXRkZXZfbGVkX2F0dHJfc3RvcmUoKSBmaW5pc2hlcyBjb25maWd1cmluZyBoYXJk
d2FyZSBvZmZsb2FkIGFuZA0KPiByZWxlYXNlcyB0aGUgbG9jaywgY291bGQgdGhlIHdvcmtlciB1
bmJsb2NrIGFuZCBjb250aW51ZSB0byBleGVjdXRlPw0KPiANCj4gSWYgaXQgZG9lcywgdGhlIHdv
cmtlciBkb2Vzbid0IGFwcGVhciB0byBjaGVjayB0cmlnZ2VyX2RhdGEtPmh3X2NvbnRyb2wNCj4g
YmVmb3JlIGZhbGxpbmcgYmFjayB0byBzb2Z0d2FyZSBibGlua2luZyBhbmQgcmVzY2hlZHVsaW5n
IGl0c2VsZjoNCj4gDQo+IGRyaXZlcnMvbGVkcy90cmlnZ2VyL2xlZHRyaWctbmV0ZGV2LmM6bmV0
ZGV2X3RyaWdfd29yaygpIHsNCj4gCS4uLg0KPiAJLyogSWYgd2UgYXJlIG5vdCBsb29raW5nIGZv
ciBSWC9UWCB0aGVuIHJldHVybsKgICovDQo+IAlpZiAoIXRlc3RfYml0KFRSSUdHRVJfTkVUREVW
X1RYLCAmdHJpZ2dlcl9kYXRhLT5tb2RlKSAmJg0KPiAJwqDCoMKgICF0ZXN0X2JpdChUUklHR0VS
X05FVERFVl9SWCwgJnRyaWdnZXJfZGF0YS0+bW9kZSkgJiYNCj4gCcKgwqDCoCAhdGVzdF9iaXQo
VFJJR0dFUl9ORVRERVZfVFhfRVJSLCAmdHJpZ2dlcl9kYXRhLT5tb2RlKSAmJg0KPiAJwqDCoMKg
ICF0ZXN0X2JpdChUUklHR0VSX05FVERFVl9SWF9FUlIsICZ0cmlnZ2VyX2RhdGEtPm1vZGUpKSB7
DQo+IAkJbXV0ZXhfdW5sb2NrKCZ0cmlnZ2VyX2RhdGEtPmxvY2spOw0KPiAJCXJldHVybjsNCj4g
CX0NCj4gCS4uLg0KPiAJLyogbm8gY2hlY2sgZm9yIGh3X2NvbnRyb2wgKi8NCj4gCS4uLg0KPiAJ
CWxlZF9ibGlua19zZXRfb25lc2hvdCh0cmlnZ2VyX2RhdGEtPmxlZF9jZGV2LCAuLi4pOw0KPiAJ
CXRyaWdnZXJfZGF0YS0+bGFzdF9hY3Rpdml0eSA9IG5ld19hY3Rpdml0eTsNCj4gCX0NCj4gDQo+
IAlzY2hlZHVsZV9kZWxheWVkX3dvcmsoJnRyaWdnZXJfZGF0YS0+d29yaywgLi4uKTsNCj4gDQo+
IAltdXRleF91bmxvY2soJnRyaWdnZXJfZGF0YS0+bG9jayk7DQo+IH0NCj4gDQo+IFdpbGwgdGhp
cyBjYXVzZSB0aGUgem9tYmllIHdvcmtlciB0byBwZXJtYW5lbnRseSBvdmVyd3JpdGUgdGhlIGhh
cmR3YXJlDQo+IG9mZmxvYWQgc3RhdGUgY29uZmlndXJlZCBoZXJlIGFuZCB3YXN0ZSBDUFUgYnkg
Y29udGludW91c2x5IHJlc2NoZWR1bGluZw0KPiBpdHNlbGY/DQoNClNhc2hpa28gaXMgcmlnaHQg
aGVyZSwgdGhpcyByZXF1aXJlcyByZS13b3JrLg0KDQpwdy1ib3Q6IGNyDQoNCi0tIA0KQWxleGFu
ZGVyIFN2ZXJkbGluDQpTaWVtZW5zIEFHDQp3d3cuc2llbWVucy5jb20NCg==
