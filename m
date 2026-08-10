Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013049.outbound.protection.outlook.com [40.107.162.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739AD21CC59
	for <linux-leds@vger.kernel.org>; Mon, 10 Aug 2026 04:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786334966; cv=fail; b=DzRMFkvoKH0VMQfVqaUBwJ43uBvJ4MT1td4LWJzPSmDCbp+7we208od3MXgO6QlUHouVndeJXqRPR5GwASSuCmW3rqNvW+5btboPf8/jPMDyNq4EEMfsF0BNHR3G7D3z94waCb6aHt/hqxy+jjk5Bb/MZ3Z1h/nuONjGk3HSwUI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786334966; c=relaxed/simple;
	bh=koCJMXd9yxerXM4kV9EBOqPZzgYW/7N7hY2D56y85Is=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BkLYiYQ+DHn1uWc4ajHnfXLAgYI3saSpq2Ja2iD1/zEiY3l2AVO6HTtZrd0RGS4zlAtZaGkeaWUTW0ukS+Mo7528xDYtdU6AhgCHELxdk0+Xhbn8Mt5s/DOgnsrHmSPDjbOggXm9pK8PuCDpvUigNZmiWvIsXnAVfZjUAcDKryQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=njYm7c1n; arc=fail smtp.client-ip=40.107.162.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="njYm7c1n"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QDsoNHBo9NqujJmB9a8ycooUaGQBjw2jWnGXOynoZBFacxEGqktbwqFi3gN9DLQYwD+ix8MPjyokHzxl/W/Xnk6zOQN6voJGJtrkqGwY2eSTDJC5g2i08rEXVzAwewRzjYuNhGVR8lw8mtTqxrjNz8sgbMu8lNcBm9K3pAcqbWV9VJiaDcMfu6BJoZIxwPzyPAabrIK70tc3zvkmC/bil4eKz+r4B2Oc5kldlGMf54OqY2U92HKOi8b2KyuZ4tn10wDx6i/dCdq5eWttD/Ndg66dmmBVNI/sygeezNW0plAG28kbS96NxEtqTMPfkaHOUzpNvc+8YHV6TnXwOkzInQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=koCJMXd9yxerXM4kV9EBOqPZzgYW/7N7hY2D56y85Is=;
 b=t4d8AHjBXa5sDmf5pqczV82YFz9jENclDAzSGvMHsiFAzy14FZ30VdZ9vrCLLTt5x6cT47locpn6jmo/4tqKwDWPP4TxsXWbkMhNNdXNMhDXm4Z5X9UhFf+8158xMgAykPSEm98JRFf9SYuhpMnMrMB2zbh6FRe1mOcqN1wqP5Aq7lFlwOQWOwqm0n7TxXn0bD3LbsMjDfnAqhVQx/NOOenRiXFW4r6RnGCW4Pm9l1MJaJp/9RCpcbmQ3t+1O3t8J7oVxWJ0Nc7gF1nTj2IBDKS3T4jlWrkyEDhzj0SENoTBA/LA06yNo7aghxjH4ghAy2Tlga/f/wszBzetnHxrMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=koCJMXd9yxerXM4kV9EBOqPZzgYW/7N7hY2D56y85Is=;
 b=njYm7c1nu6DqF+cZL4ki8B98TQA8UVlFK003iYlWScHSRW0V4+qJ1Qd03bHGrk9UsVtKLcEVU8Ugx+XEJ+PT4bzSno5ralAq3G7vmKSMCxPyLHlDNsw00WGaydYbqZ+R+Wm/U04isgcyLABRDbphqGbew/Uq+PE1GE/KUtbxTFQ2UQonL5Yf9WAgA1Ul2qU0IdJIP4M+JCkrK89pgTXxRxaJpb3jlKQcO3HlxMlEHIHB90ZQHVS4SX50IbHG+B6Rmj6fWaf7Y24yHaPE2R4HP31fYQI+yMehDFkYJePYCNLSN7golpk06NIbCQzlMzTvhZyU8WwWfyQ67EAFhp9meA==
Received: from AS8PR04MB8676.eurprd04.prod.outlook.com (2603:10a6:20b:42b::10)
 by DU2PR04MB8550.eurprd04.prod.outlook.com (2603:10a6:10:2d5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 04:09:18 +0000
Received: from AS8PR04MB8676.eurprd04.prod.outlook.com
 ([fe80::d57a:2d06:49d5:9861]) by AS8PR04MB8676.eurprd04.prod.outlook.com
 ([fe80::d57a:2d06:49d5:9861%5]) with mapi id 15.21.0292.024; Mon, 10 Aug 2026
 04:09:18 +0000
From: "Bough Chen (OSS)" <haibo.chen@oss.nxp.com>
To: Lee Jones <lee@kernel.org>, "sashiko-reviews@lists.linux.dev"
	<sashiko-reviews@lists.linux.dev>
CC: "Bough Chen (OSS)" <haibo.chen@oss.nxp.com>, "linux-leds@vger.kernel.org"
	<linux-leds@vger.kernel.org>, "Frank.Li@kernel.org" <Frank.Li@kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: RE: [PATCH v2 2/4] leds: pca9532: check return value in
 pca9532_setled()
Thread-Topic: [PATCH v2 2/4] leds: pca9532: check return value in
 pca9532_setled()
Thread-Index: AQHdHy2BC/N/4++vmEmWvr0hA5kG1baEIOkAgAz+sACABZ4OMA==
Date: Mon, 10 Aug 2026 04:09:18 +0000
Message-ID:
 <AS8PR04MB8676ECBA9378175390658AE890DE2@AS8PR04MB8676.eurprd04.prod.outlook.com>
References: <20260729-led-fix-v2-0-09ad218457bd@nxp.com>
 <20260729-led-fix-v2-2-09ad218457bd@nxp.com>
 <20260729075535.53DE11F000E9@smtp.kernel.org>
 <20260806142214.GM2869284@google.com>
In-Reply-To: <20260806142214.GM2869284@google.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB8676:EE_|DU2PR04MB8550:EE_
x-ms-office365-filtering-correlation-id: c7bd48ff-3812-48d8-1200-08def69525fa
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|23010399003|22082099003|18002099003|10067099003|56012099006|11063799006|5023799004|4143699003|38070700021|6133799003;
x-microsoft-antispam-message-info:
 KtURU09gUTPZUMODFQr0sXec3NEiIAaTyq+DuDbEaN8D16XTErtpEzhsyrALrcnK9nHVdeaZEExSFBKqLI3RCvXDPjuBWWrEg68tIcVBBw40XgmXo0XXhbthdU+7esjlr5kXCCReUDMnnvulAu5hVTSbLQrWSzaobd2H2TAQnmkZF3NxWrvaA5Gv2z0pHzhh91xcMIXzlVFqVZ7K47cpAaozT+ChhbfeVLko4xrSX1n56b8YGFqeNKTQ1CuYw/RiVQ+0V4DK3yebaSMjVIRJmWcz4GvtkxxbtbWDenswJwMv97wtdrgbtknB2lvhcN0yFwZSpzDdMLB9uncszoQA430zCphtz3crlh81LesPTEJDLZyNiwRMvdQXQ3hvYyCl8m9XQmW6zsur8VXinnIsJ8alP9ajKOnkPRzeP2x/snmVFrVGvR+OEQuc+UbK+WQIRcth08wJU5VpcEoqaQdKvf2Tjgx7i7Tqd9Du3P7l28S00OJ7gVIUACHKnIxLA/Nfg52NuNriwLF3CgWKgSsYSZgoSWM5UpiGSQv6/3uDzLT3oSz/XOLgQGbyKT+wD3mhefAKmaLc254eJvoPo+OgUYqBdDTFXKjHWrQqRYhzgEkZ8ZgPiR4mZ2h4GPtjFTjeDyBPb+J+1O/mgeGRFBWpt7vSZxOKW5tE/0vSF78f+tY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8676.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(23010399003)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006)(5023799004)(4143699003)(38070700021)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?TFdydDB1NHJMMG50UnBsQnlvL0tJeTB6WXUyT1dkNHJhb2xuRXBZd25kN2pN?=
 =?gb2312?B?SEVrWDJEWnhPWitnNDMxaDBhdlM3QXkrZlZpQjF0QkdERTlVM1ozTUltWFpN?=
 =?gb2312?B?T1hscHRTZDZacFZTRE5td3AvY1NuM21IYlBPSjUwSndwMWxuMXh1SkNOYVNP?=
 =?gb2312?B?RnZNTExCSko1SXZZZG91VDRGalZCcmV4d2E5bUVIVXQrQXFvK1c5UkEyZm92?=
 =?gb2312?B?cVVlb2pINk5SekdibjFNZDdjQ09QWjAxeE04RGViRXRSRW5heGRxNTJwaUpv?=
 =?gb2312?B?N2dhVC9LK2QvZ3QzeWZ0eHBGNnlFWk56eWZsQTNNRUl2a2gvbVN2UUF3YVlx?=
 =?gb2312?B?dDZjN1lKenJpRmpHc1BWeVNXM2ZBcGdGanBab0x1eExjamJkcU5zdUFLWllF?=
 =?gb2312?B?VUJVLzV6Ykhyd0lJYSt4dk5TdnQzUjU3SDE1VFVobktRNm5ucG92VlVjVXJw?=
 =?gb2312?B?QVJoY2ZrNnF3Rzl5b2RxeVlzZ21ITnVzcXo5aXd1V2JQaGZvUmNSRDFlR2VL?=
 =?gb2312?B?a2NpYUIxcE4vdDVhTUk0Z0VUQWFFQmhxNHJEZ05EdTNLVS9oRnVrMXAvQnI5?=
 =?gb2312?B?eW1YM0dVN21PWCtmU0xRVnR0M2V2bm92MFBIaXB3bVVjZzdFUzZuY2hKWkpV?=
 =?gb2312?B?Wmo3V21NYTNvYkxwOEdIc2YzWWdPNEtWNzNvZmJmeHhqY3IxT2FnM0htSFVy?=
 =?gb2312?B?Y3RaSm1NQWhkU0JVYzk0SHNIYlNZcWNjWnAxLzI1OEo0VDcwUmQyL3hDdjRz?=
 =?gb2312?B?elZBL3RaTmVBTTFqbUF4aUhGZmFkaUF1WlBxK1l3NzNnV2M1YmZoYnZiak1G?=
 =?gb2312?B?WktCa0NBbFdtcGV2cVRiWFIwRUNTSXYzbDJSd2dkWFBWYjF0cUI5ZVR3bWNj?=
 =?gb2312?B?MG9QZG4rMFk3RW0rcHRyeUNaN1Z1UXZoOVp0V1BPcEVRK2U4bmdJVkxWUXRT?=
 =?gb2312?B?T0I5clY5TVYwNUo5dVNsUzlrT1loTGtNRmJ6aG9QSWVRUlZCcjBkaFFramhD?=
 =?gb2312?B?dzdEL1lRNnVJemNpbFNQUlpVOVpCRmx2S2lUV2FKaEdqOExvSDdPWCtXQzFy?=
 =?gb2312?B?UGs5ZHJLTkRjVzB0NVR6bVpOUllTSTZCTnBndmdXdG1wQ3c3ZFVSSlozYWRY?=
 =?gb2312?B?Q0dqUEE5cElLdnU3VnVDV0lINkgxdENXa2JPaG1ScXpXUFhKbmsvM1ZmS0RE?=
 =?gb2312?B?Z215RWduUHMrUjJOSXBtSTBNSzNhSUdjQS91MHM5byt0N3hZaEF5a05FdTNH?=
 =?gb2312?B?NmcwUGx5YlNjL29IL0VEU2ZBeHBaa1ZhWmdFQ2VkNHQyRDN0cE9vK2RkbENG?=
 =?gb2312?B?a3U4QW1sTzBvQVBpUE1qTzZ2bG02Z1BwVUxRbnJCZWhSMWIwaFFQZ3dlWHBR?=
 =?gb2312?B?UDVVSUtCYkhKK0grMWYrU0dzN2J6cjBMN0NIZ09Zc094eXV1ak9WaG1OSXV5?=
 =?gb2312?B?ZXo0OEZRNGIzUFc0cUJtaGI1RVJsOFc1TG94M1RKRHljRzg4QWlIcXpoby85?=
 =?gb2312?B?TUtsTjZQRVBFbWZzWEdJL1dSU050L3hYbmNsbzVUSHNFTW9ESzlUQldIVnJj?=
 =?gb2312?B?dFNIeXF6UXdpZUxVUUVJZk8vT3U1K0ovWFdwWG14L3RWd3pWTVVWTW1ETHdy?=
 =?gb2312?B?YlUvNUU3K1ZrVzZ0TFNCYk9jc2lSVXZha0RCaVBiQ1lkT2xjWENjWVJ0dkQ2?=
 =?gb2312?B?NEJQRElRYVdsQXdJSXdDNCs1N0c1eVVObkxzbHBDbHlrd2FGb1ZsUW9SNWpy?=
 =?gb2312?B?WDRDS3hTY3pYZC9qNGNWU0VYR3M3NnpqK0NLU0dGbFdSdi9MeHIvV2dPdkxu?=
 =?gb2312?B?Q3BRQXBzU2xKNVJrcFNnUTFmVlJaaW1mQzhDZVg2ZGN5d2hQdml0SVgyckhG?=
 =?gb2312?B?YUg0TVJEZVFHVFRsUjIwZXljQTRCek9QL1dhaHVRSEFaSkFURzVPRDJLaFdh?=
 =?gb2312?B?dE9LNWRBemY1SEljTG51aFpjd1l0SS9QMDZkNEdIcGxETHh3OWdjc3dpQUFX?=
 =?gb2312?B?N1R5ZTJudzh1ODVLQm9YQkxIcjEzQkNNZDdRS3Z0eHEwT2ZQSWJKMDJwenVU?=
 =?gb2312?B?V05aVXl5TFJQR2ZmMzlMcmdBMkNIcmhEUStmMXMxNnl0ektRdUh0TnMzSEtZ?=
 =?gb2312?B?cTZnVjR5cjlzVEcvcHlxNFRFbnV6UitmRGhRMlEzcFRRdXRCZ01aSTl3V2xB?=
 =?gb2312?B?V1hqWENJSTVSd05VWE1iSExEZ0hSN3QwRyswS0lyYkJDd3VGTnlpRGJCYWF1?=
 =?gb2312?B?OTQyMWpQV3RJdkw4NER0VUw4NGpsSUpvRG1sZXBTRnI0VnNiSUV0Tk9sZmdP?=
 =?gb2312?B?NGswOCtxSW9JaWpsaXV3WFhMb1RqQmI4T1k3MFFua3hZbWJxLzBrdz09?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8676.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7bd48ff-3812-48d8-1200-08def69525fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2026 04:09:18.0610
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ymd8W9Pkc++4IxoTluvzS7L5qQ2YAiyUm8RbIebRyJpCl0Vip3TtZT3bsVWJ3dSTa2nisLbQ096AgXOAfIH89Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8550

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBMZWUgSm9uZXMgPGxlZUBrZXJu
ZWwub3JnPg0KPiBTZW50OiAyMDI2xOo41MI2yNUgMjI6MjINCj4gVG86IHNhc2hpa28tcmV2aWV3
c0BsaXN0cy5saW51eC5kZXYNCj4gQ2M6IEJvdWdoIENoZW4gKE9TUykgPGhhaWJvLmNoZW5Ab3Nz
Lm54cC5jb20+OyBsaW51eC1sZWRzQHZnZXIua2VybmVsLm9yZzsNCj4gRnJhbmsuTGlAa2VybmVs
Lm9yZzsgaW14QGxpc3RzLmxpbnV4LmRldg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDIvNF0g
bGVkczogcGNhOTUzMjogY2hlY2sgcmV0dXJuIHZhbHVlIGluDQo+IHBjYTk1MzJfc2V0bGVkKCkN
Cj4gDQo+IE9uIFdlZCwgMjkgSnVsIDIwMjYsIHNhc2hpa28tYm90QGtlcm5lbC5vcmcgd3JvdGU6
DQo+IA0KPiA+IFRoYW5rIHlvdSBmb3IgeW91ciBjb250cmlidXRpb24hIFNhc2hpa28gQUkgcmV2
aWV3IGZvdW5kIDMgcG90ZW50aWFsIGlzc3VlKHMpDQo+IHRvIGNvbnNpZGVyOg0KPiA+DQo+ID4g
TmV3IGlzc3VlczoNCj4gPiAtIFtNZWRpdW1dIFRoZSBuZXdseSBhZGRlZCBlcnJvciByZXR1cm4g
dmFsdWVzIGZyb20gYHBjYTk1MzJfc2V0bGVkKClgIGFuZA0KPiBgcGNhOTUzMl9ncGlvX3NldF92
YWx1ZSgpYCBhcmUgaWdub3JlZCBpbiB0aGUgY29uZmlndXJhdGlvbiBhbmQgR1BJTyBkaXJlY3Rp
b24NCj4gcGF0aHMuDQo+ID4gLSBbTG93XSBUaGUgY29tbWl0IG1lc3NhZ2UgdmlvbGF0ZXMgdGhl
IExFRCBzdWJzeXN0ZW0gY2FwaXRhbGl6YXRpb24gcnVsZS4NCj4gDQo+IFBsZWFzZSByZXZpZXcs
IGV4cGxhaW4gb3IgZml4IHRoZSBTYXNoaWtvIHJldmlldyhzKS4NCj4gDQo+IElmIHRoaXMgaXMg
YSBzZXQsIHRoaXMgcmVxdWVzdCBpbmNsdWRlcyB0aGUgb3RoZXIgcGF0Y2hlcyB0b28uDQoNCkhp
IExlZSwgDQpUaGFua3MgZm9yIHJldmlld2luZyB0aGUgcGF0Y2hlcy4NCkknbGwgdGFrZSBjYXJl
IG9mIHRoZSByZXZpZXcgY29tbWVudHMgYW5kIHByZXBhcmUgYSBuZXcgcmV2aXNpb24uIFVuZm9y
dHVuYXRlbHksIEkgbWF5IG5vdCBiZSBhYmxlIHRvIGdldCBiYWNrIHRvIHRoaXMgZm9yIGFub3Ro
ZXIgMi0zIHdlZWtzIGR1ZSB0byBvdGhlciBjb21taXRtZW50cy4NClRoYW5rcyBmb3IgeW91ciBw
YXRpZW5jZS4NCg0KQmVzdCByZWdhcmRzLA0KQm91Z2gNCj4gDQo+ID4gUHJlLWV4aXN0aW5nIGlz
c3VlczoNCj4gPiAtIFtIaWdoXSBJbmNvcnJlY3QgdGVhcmRvd24gb3JkZXJpbmcgb2YgYSBkZXZt
LW1hbmFnZWQgaW5wdXQgZGV2aWNlIGFuZCBhDQo+IGN1c3RvbSB3b3JrcXVldWUgbGVhZHMgdG8g
YSBVc2UtQWZ0ZXItRnJlZSBkdXJpbmcgZGV2aWNlIHJlbW92YWwuDQo+ID4gLS0NCj4gPg0KPiA+
IC0tLSBQYXRjaCBbMl06IFtQQVRDSCB2MiAyLzRdIGxlZHM6IHBjYTk1MzI6IGNoZWNrIHJldHVy
biB2YWx1ZSBpbg0KPiA+IHBjYTk1MzJfc2V0bGVkKCkgLS0tIGNvbW1pdA0KPiAzZTgyNjg5MWQ1
YjYyODZkOGIwOGRkYzdjNjY4ZTM1NDY1MzUyNTU0DQo+ID4gQXV0aG9yOiBIYWlibyBDaGVuIDxo
YWliby5jaGVuQG54cC5jb20+DQo+ID4NCj4gPiBsZWRzOiBwY2E5NTMyOiBjaGVjayByZXR1cm4g
dmFsdWUgaW4gcGNhOTUzMl9zZXRsZWQoKQ0KPiA+DQo+ID4gVGhpcyBjb21taXQgdXBkYXRlcyBw
Y2E5NTMyX3NldGxlZCgpIHRvIGNoZWNrIHRoZSByZXR1cm4gdmFsdWUgb2YNCj4gPiBpMmNfc21i
dXNfcmVhZF9ieXRlX2RhdGEoKS4gQnkgY2hlY2tpbmcgZm9yIHJlYWQgZmFpbHVyZXMsIGl0IHBy
ZXZlbnRzDQo+ID4gd3JpdGluZyBib2d1cyBiaXR3aXNlLW1vZGlmaWVkIG5lZ2F0aXZlIGVycm9y
IGNvZGVzIGJhY2sgdG8gdGhlIGRldmljZS4NCj4gPg0KPiA+ID4gbGVkczogcGNhOTUzMjogY2hl
Y2sgcmV0dXJuIHZhbHVlIGluIHBjYTk1MzJfc2V0bGVkKCkNCj4gPg0KPiA+IFtTZXZlcml0eTog
TG93XQ0KPiA+IFRoaXMgaXNuJ3QgYSBidWcsIGJ1dCB0aGUgY29tbWl0IGRlc2NyaXB0aW9uIGFm
dGVyIHRoZSBzdWJzeXN0ZW0NCj4gPiBwcmVmaXggaXNuJ3QgY2FwaXRhbGl6ZWQuIEl0IHNob3Vs
ZCBwcm9iYWJseSBiZSAiQ2hlY2sgcmV0dXJuIHZhbHVlIGluDQo+IHBjYTk1MzJfc2V0bGVkKCki
Lg0KPiA+DQo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9sZWRzL2xlZHMtcGNhOTUzMi5jDQo+
ID4gPiBiL2RyaXZlcnMvbGVkcy9sZWRzLXBjYTk1MzIuYyBpbmRleCBlOGVlMTdiOGJkNTQ3Li5h
ZGZiNWFhNTBlOGUxDQo+ID4gPiAxMDA2NDQNCj4gPiA+IC0tLSBhL2RyaXZlcnMvbGVkcy9sZWRz
LXBjYTk1MzIuYw0KPiA+ID4gKysrIGIvZHJpdmVycy9sZWRzL2xlZHMtcGNhOTUzMi5jDQo+ID4g
WyAuLi4gXQ0KPiA+ID4gQEAgLTE1OSwyMSArMTU5LDI5IEBAIHN0YXRpYyBpbnQgcGNhOTUzMl9z
ZXRwd20oc3RydWN0IGkyY19jbGllbnQNCj4gPiA+ICpjbGllbnQsIGludCBwd20pICB9DQo+ID4g
Pg0KPiA+ID4gIC8qIFNldCBMRUQgcm91dGluZyAqLw0KPiA+ID4gLXN0YXRpYyB2b2lkIHBjYTk1
MzJfc2V0bGVkKHN0cnVjdCBwY2E5NTMyX2xlZCAqbGVkKQ0KPiA+ID4gK3N0YXRpYyBpbnQgcGNh
OTUzMl9zZXRsZWQoc3RydWN0IHBjYTk1MzJfbGVkICpsZWQpDQo+ID4NCj4gPiBbU2V2ZXJpdHk6
IE1lZGl1bV0NCj4gPiBTaW5jZSB0aGlzIGZ1bmN0aW9uIG5vdyByZXR1cm5zIGFuIGVycm9yIGNv
ZGUsIGRvIHdlIGFsc28gbmVlZCB0bw0KPiA+IHVwZGF0ZSBvdGhlciBjYWxsZXJzIHRoYXQgc3Rp
bGwgaWdub3JlIGl0Pw0KPiA+DQo+ID4gRm9yIGV4YW1wbGUsIHBjYTk1MzJfZ3Bpb19kaXJlY3Rp
b25faW5wdXQoKSBjYWxscw0KPiA+IHBjYTk1MzJfZ3Bpb19zZXRfdmFsdWUoKSAod2hpY2ggcmV0
dXJucyB0aGUgZXJyb3IgZnJvbSBwY2E5NTMyX3NldGxlZCgpKSwNCj4gYnV0IHRoZSBlcnJvciBp
cyBkaXNjYXJkZWQ6DQo+ID4NCj4gPiBkcml2ZXJzL2xlZHMvbGVkcy1wY2E5NTMyLmM6cGNhOTUz
Ml9ncGlvX2RpcmVjdGlvbl9pbnB1dCgpIHsNCj4gPiAgICAgLi4uDQo+ID4gICAgIHBjYTk1MzJf
Z3Bpb19zZXRfdmFsdWUoZ2MsIG9mZnNldCwgMSk7DQo+ID4gICAgIHJldHVybiAwOw0KPiA+IH0N
Cj4gPg0KPiA+IFNpbWlsYXJseSwgcGNhOTUzMl9jb25maWd1cmUoKSBpbnZva2VzIHBjYTk1MzJf
c2V0bGVkKCkgZHVyaW5nDQo+ID4gaW5pdGlhbGl6YXRpb24gd2l0aG91dCBjaGVja2luZyB0aGUg
cmVzdWx0LCB3aGljaCBtaWdodCBsZWF2ZSB0aGUNCj4gPiBoYXJkd2FyZSBpbiBhbiB1bmRlZmlu
ZWQgc3RhdGUgaWYgdGhlIEkyQyBidXMgZmFpbHMuDQo+ID4NCj4gPiBbIC4uLiBdDQo+ID4gPiBA
QCAtMjU3LDkgKzI2NCw3IEBAIHN0YXRpYyBpbnQgcGNhOTUzMl9zZXRfYmxpbmsoc3RydWN0IGxl
ZF9jbGFzc2Rldg0KPiAqbGVkX2NkZXYsDQo+ID4gPiAgCWlmIChlcnIpDQo+ID4gPiAgCQlyZXR1
cm4gZXJyOw0KPiA+ID4NCj4gPiA+IC0JcGNhOTUzMl9zZXRsZWQobGVkKTsNCj4gPiA+IC0NCj4g
PiA+IC0JcmV0dXJuIDA7DQo+ID4gPiArCXJldHVybiBwY2E5NTMyX3NldGxlZChsZWQpOw0KPiA+
ID4gIH0NCj4gPiA+DQo+ID4gPiAgc3RhdGljIGludCBwY2E5NTMyX2V2ZW50KHN0cnVjdCBpbnB1
dF9kZXYgKmRldiwgdW5zaWduZWQgaW50IHR5cGUsDQo+ID4NCj4gPiBbU2V2ZXJpdHk6IEhpZ2hd
DQo+ID4gVGhpcyBpcyBhIHByZS1leGlzdGluZyBpc3N1ZSwgYnV0IGNhbiB0aGlzIGV2ZW50IGNh
bGxiYWNrIGZpcmUgYWZ0ZXINCj4gPiB0aGUgd29ya3F1ZXVlIGlzIGNhbmNlbGxlZCBkdXJpbmcg
ZGV2aWNlIHJlbW92YWwsIGNhdXNpbmcgYSB1c2UtYWZ0ZXItZnJlZT8NCj4gPg0KPiA+IER1cmlu
ZyBkcml2ZXIgdW5iaW5kLCBwY2E5NTMyX3JlbW92ZSgpIGNhbGxzIHBjYTk1MzJfZGVzdHJveV9k
ZXZpY2VzKCkNCj4gPiB3aGljaCBtYW51YWxseSBjYW5jZWxzIHRoZSB3b3JrOg0KPiA+DQo+ID4g
ZHJpdmVycy9sZWRzL2xlZHMtcGNhOTUzMi5jOnBjYTk1MzJfZGVzdHJveV9kZXZpY2VzKCkgew0K
PiA+ICAgICAuLi4NCj4gPiAgICAgY2FuY2VsX3dvcmtfc3luYygmZGF0YS0+d29yayk7DQo+ID4g
ICAgIGRhdGEtPmlkZXYgPSBOVUxMOw0KPiA+ICAgICAuLi4NCj4gPiB9DQo+ID4NCj4gPiBIb3dl
dmVyLCBiZWNhdXNlIHRoZSBpbnB1dCBkZXZpY2UgaXMgYWxsb2NhdGVkIHdpdGgNCj4gPiBkZXZt
X2lucHV0X2FsbG9jYXRlX2RldmljZSgpLCBpdCByZW1haW5zIGFjdGl2ZSBhbmQgcmVnaXN0ZXJl
ZCB1bnRpbA0KPiA+IGRldnJlcyBjbGVhbnVwIHJ1bnMgYWZ0ZXIgLnJlbW92ZSgpIGZpbmlzaGVz
Lg0KPiA+DQo+ID4gSWYgdXNlcnNwYWNlIGluamVjdHMgYW4gRVZfU05EIGV2ZW50IGNvbmN1cnJl
bnRseSwgdGhlIGlucHV0IGNvcmUNCj4gPiBjb3VsZCBpbnZva2UgcGNhOTUzMl9ldmVudCgpLCBy
ZXNjaGVkdWxpbmcgdGhlIHdvcmsgaXRlbSB2aWENCj4gPiBzY2hlZHVsZV93b3JrKCZkYXRhLT53
b3JrKS4gV2hlbiB0aGUgc2NoZWR1bGVkIHdvcmsgZXhlY3V0ZXMgbGF0ZXIsDQo+ID4gdGhlIGRh
dGEgc3RydWN0dXJlIHdpbGwgaGF2ZSBhbHJlYWR5IGJlZW4gZnJlZWQgYnkgZGV2cmVzLg0KPiA+
DQo+ID4gLS0NCj4gPiBTYXNoaWtvIEFJIHJldmlldyChpA0KPiA+IGh0dHBzOi8vc2FzaGlrby5k
ZXYvIy9wYXRjaHNldC8yMDI2MDcyOS1sZWQtZml4LXYyLTAtMDlhZDIxODQ1N2JkQG54cC4NCj4g
PiBjb20/cGFydD0yDQo+IA0KPiAtLQ0KPiBMZWUgSm9uZXMNCg==
