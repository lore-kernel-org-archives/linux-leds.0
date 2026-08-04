Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazolkn19013077.outbound.protection.outlook.com [52.103.46.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ADE33FA5E9
	for <linux-leds@vger.kernel.org>; Tue,  4 Aug 2026 15:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.46.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785858085; cv=fail; b=fpWoZHMmTq76yTMficLPahjTTdYUM7c9n/xuWSHH1cx9lxLvgM39bXUVfLL9c9XHhtGPWIrAwoqhha+LKN6PPSBnkytEP12Y2EapInu5KidoE6L1HVscllfxLcP89TYPJa+Cvpac5sMf3mLbz0F/bATbfyCTvCTtWCV6ChNRYgc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785858085; c=relaxed/simple;
	bh=PdQIs1xm5lE203qvhMJCYvVv6d5qzHt0i1Tf4jBJ8y8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PEaIfQx18hf9AIykvlyCJPtmq07hHFPBRTKyjt6tEmLpi0pkSqpwJG6D/LkKEZPo1UQdcnriypQO5CY0FZZtCmWofK8zNil2b3hTU3YWSVUgrFGxRnE5E2uRozNljhEikzesHKEaxwD2ZYqugd3gkyOgDzN7lmtjPosyOiDQ1TE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=AAXduEih; arc=fail smtp.client-ip=52.103.46.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="AAXduEih"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kkbRvBNBHVYm52+gkGa9TYG2WqBnmfzCPTA2nWIG4FbJ4MacCc+Et2XgnT7kOQcfQLhqDRalL8Pl63lKgRrCc2shfRCBhulmQpc4aHMZjKPfGrfoL/uM9yZJExkdWQ/sMumms7cECv1XfnQsWlIMFf/ysoaa98ObSKOpgvg5J8c53q5/EinB5n7tfR8xIo3TNVywgXGRTFzgzSv4G2kEtvQy6UOSRSG8612SIBV1XI84A5HskqUYanfKuQzPGrW9L0lCR72Db4aLVWAw1dLAw4G3MbJ2Y1RFCI+vKRj4K7t2tKf98NiagUPIz6OzkQuKK4sHQONYIps6L+bUSNhv2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PdQIs1xm5lE203qvhMJCYvVv6d5qzHt0i1Tf4jBJ8y8=;
 b=v/YCVvmxqfeYfMyOd6OkkQBMp1fL4puyx7J+1X9toUdYkog8x/KCBZbtwGf/9Cxqx5akjLQzuXRYf7JBq+Pa8t8j08JK3Erg2DzXYg0G9hekY3Muw+EKYt26Tjmj8/dGL9YTejVdYxc3rpGj2lis1iKR/AI4mBoB+X+bjlM+cD9jzEbzsBI+MhKySADZ/L0m3xzsLXK+6FVSUrFzvpWLw/SPI3vFAU0CeuQEQW1Oa+bAKuh581ozKqW96pVUHCL74CiRNGSJ65tykJIpT1KImTZGPGzScy5x2RFZmyW8kvzd8jsVKG1Lr64man3yA2IAQSNOlXWQzhc6jeKCi8No/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PdQIs1xm5lE203qvhMJCYvVv6d5qzHt0i1Tf4jBJ8y8=;
 b=AAXduEihTvpwlSAOiQs/Njq065jMPqRoPvIfDnhX8u2ITEsc4TVCGyxjrDGHz7pH+mHfwPeZbJIaent/9OhP5wvygNX8hUt6jMlDAVHmhTw00bf7gXd8kaQ/BxJG0Gvsjr6BC3eAPyWYkT2NB2OD+E7VGZ1nXeMoLz61J+O+lPOZKABAbsg8VtLKfa9gsyxHFm0L01dexA44OffaGmLXA1TELK6OU+LlF0tsNGDJXP6d46eJu4A2KmRZW/D56O63p7S5zQb+7ByR8+ggF1NabB+3EKijbzMxeR+Tv8Ki6FBOqxYsdSlybXl1QjgNTUrstx59AUlp0sv+uZWeAi3cbA==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by AM0PR08MB5362.eurprd08.prod.outlook.com (2603:10a6:208:180::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 15:41:21 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 15:41:21 +0000
Message-ID:
 <GV1PR08MB84971C3DEF172222866DEED3C5D42@GV1PR08MB8497.eurprd08.prod.outlook.com>
Subject: Re: [PATCH v5 1/1] leds: st1202: Add hardware-accelerated blink
 support
From: Manuel Fombuena <fombuena@outlook.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-leds@vger.kernel.org, lee@kernel.org
Date: Tue, 04 Aug 2026 16:41:19 +0100
In-Reply-To: <20260804105253.C68661F000E9@smtp.kernel.org>
References:
 <GV1PR08MB8497E2498ED9D66AF60A3ACFC5D42@GV1PR08MB8497.eurprd08.prod.outlook.com>
	 <GV1PR08MB849709A3BE3D1CBB9E28ABD2C5D42@GV1PR08MB8497.eurprd08.prod.outlook.com>
	 <20260804105253.C68661F000E9@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44app2) 
X-ClientProxiedBy: LO4P123CA0395.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::22) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <6b8e61a9325e90e1e5d369a842fe8ec2028d36f2.camel@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|AM0PR08MB5362:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b2c6ff8-2ba5-4549-6972-08def23ed4e6
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799012|25010399006|15080799012|5072599009|6090799003|23021999003|51005399006|24021099003|37011999003|8060799015|440099028|3412199025|40105399003|2607281247196008;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cjV1T0dTYzZuMFEzZDF1SGdpWTVjc1B6a2xUeHhYSGx4YURML3c5R1NLb3lW?=
 =?utf-8?B?cytCZVdCWW1meEdLVVp5NXdMUzBvN01sQ0hQdWU3VFVpUHhoYlZ0VVNRRnF6?=
 =?utf-8?B?MTFocUs5TXY5d3ljbDZBSWpUQTVlOU53QzRvM1BaZUNMS2JSTUJtcS9vUC9Y?=
 =?utf-8?B?ajgxeVVsNksrOWFmRGs0cmtCZm9HQXJkQ0Vic0pBbmFWQS8xbmtOcWdlSTJy?=
 =?utf-8?B?VFNkcVREaDVadnFVbk4vM3dqaDFOSW8yNXgvZ0ZPRW5nUGQwby85UVg0dzhr?=
 =?utf-8?B?emlOeEN0RjE2M1o5ZEFpY0dZbWtITnhpOTF3cGRDUGlKdmZkYWxUdTJ6VUx6?=
 =?utf-8?B?WnNnOFZwcGdHQ0RzWVExZ29rU0gwS0dkTHhMSEpncGhXdWZ6VEJrelU0UTMx?=
 =?utf-8?B?d3FFOTdBL211S2d4ak1POXU5bUlRbnJBdDZseWxMQ0RlWmZPK1FIaDhQZllP?=
 =?utf-8?B?QUhzTmNwZjR0MFU0OWU4SXU4ODh5VFZ2a05nbWJNL3ZBaitqRFNpUVQ0SUNk?=
 =?utf-8?B?clF5OFBINFJmNUpxUWFWSE1OdmVpV0UwVi90VXZJMGpGM1M1eDlBekRBb3Rw?=
 =?utf-8?B?bXU5c2xkdnJoMmdYdUc3VzhyQkdpODZQbU4wcWFQbUgrUkJjOHAwYmlrZHhq?=
 =?utf-8?B?Z0p1NzBlR1czUFI1YjVERWxUYW4wcERjalY2ZVYvYnRzTVlmTlZCTEx6L2Y5?=
 =?utf-8?B?djEzKzRmZDhjemdDbGFLK1Z2ajFhc1V1b1FZaXBSbUVCVlp2ODJjMDV5UEpO?=
 =?utf-8?B?bVR2YXcvMVJGSjk5bG1hYU9ZZngzRXRIVnVCUStkWjRxZUVvNFpRNklINkN3?=
 =?utf-8?B?WCt1Z2RkQjZRL0JQdHZGMjUzcWtxcXAycnhGNURGeG11VVVObnFwTXZlL05W?=
 =?utf-8?B?alpuQ0FvclZHVXMrOVBuend2OXg3VWVCRTRyd2NvS0R6UVJJWEcvN0YxM2xW?=
 =?utf-8?B?VmtabWtwVTJ5VldWTmFGQmkycHRtT0RKSFJHZmdIb1h6NDRYQXk4T3kyUVFS?=
 =?utf-8?B?UUFoWkgzWFFjRjBMb2hhczREUjZwSXRNb1RlN0pVb2hQMXV3QzNKVlVYQ3pU?=
 =?utf-8?B?b0hiNkpyTkRoajlsMXhCa2xDUUlZRnEyN2sxSWZCQWpMU2pFb0ZwUEhjL05Y?=
 =?utf-8?B?eExvNjlQWW0ya3RDOWUrOWx6cVUwakVtc3hsQkllRHVOWnFrb3dyTWI0NWN2?=
 =?utf-8?B?WlNteExZcE54dnNaS2V5Q0hYUjJ0R0lsOUdvOU1ybWhuWjBxb25XWmZrcU9L?=
 =?utf-8?B?SCtJb1crU2NDcThnbFl3TGFDL2ZxeVdFblFLTTQzeEs4UlN4a1d2Zml2dWMz?=
 =?utf-8?Q?SKvGdBqWUs2yBg7KfR17phFwP4MH25MP2X?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MFlnQ3h5eWU4UG4yLzJRT0ZtdjhScmRpWUhBODQ0ZEQ5VmhlTTA2VmxsT0ly?=
 =?utf-8?B?TGg1S1BPNTdpNUNKMHRCVnBEQk4ySHcrMzlGOGxjNU1WS2prbjRiY3g3dUo5?=
 =?utf-8?B?ZXZqNUVyclFqUG9sZ1lTYm5LelRxUGFzQVFtZEQ5M3ZBSVd6WnBrVVNLRnB2?=
 =?utf-8?B?cGwxZG5vUVZmeFJvT3Y2djlqTnc1bGljT0YzZ3lRcGdsaGRmeFZtdE5zZzli?=
 =?utf-8?B?VXIvLzJaQ0lwSjhjeUtYdDhHUFZPcUJ1c2FzckhqMTllUkZlemhMQlVORW5U?=
 =?utf-8?B?VzZOaU5PcGJQRDB3dnYwVEd5T2FJU1JRUFhIVGVPQjIzdHBKVkJpcVpvUlFu?=
 =?utf-8?B?T0FtV3dlblZBTnVRL1NETUhyTjZVRzhlcTNTQWtPNWJGejExaDVyaGVabWQv?=
 =?utf-8?B?M1NHNjNUcnd4bktwU2E4OEtkYzgyOG5jb0cwd2FsQjNiTHd2N3hIOFlaRTlW?=
 =?utf-8?B?MllDY1NodWhET3YzLzI4QTBybCt5Wk5qY1F2Z3hoTE1sbEN5NW43bnNmcUpF?=
 =?utf-8?B?aVA4RWZvU0RlM3ZHODBMZ1RXVm9mWURCMjlTSmtEOVBKZ0FDTFQxWG1DSGcy?=
 =?utf-8?B?L2Z4bTF4Mm9DQmlUemlma25odmdaMUJ6cWlQQkF5WDBvTW1ZZ29qaW84enJZ?=
 =?utf-8?B?WEhxbEREcHJodlJKSGM5V2grNjRQZ2FXQi9GOEdJSDhxUGFBeHBIWnZtazA2?=
 =?utf-8?B?TEt3d0d6eGZTMG51WEduUnNoVjI3bnRVcWtmTUwxTGRzMVNLZU9hVlNlRjFP?=
 =?utf-8?B?b2VwUGJQNTdpZHk3WXNqZnhIR2FZNnhHNVJnK3VSQjlHSTJlVXdCK0puMWdx?=
 =?utf-8?B?RzZjK2lpaVdiT0RVRUlhMzFYVXB6QzZuSlpWcUJQZWZHZnBpbmk5NzJRWXE0?=
 =?utf-8?B?enlzR01sN2xQNjk4ZUJ4VWhWeC9BSmtHbGVsdGM3TWN0K1dacW9qUEErSktS?=
 =?utf-8?B?UENabEg5cGE1WXdvU3lxQ040QkNsc29rYVhxblB2ZWdPWVhOR3E3WFNPSHNN?=
 =?utf-8?B?VGh3c0xZUDY3Rm8wVnQxK2VKdU8zZU9uUWlHK29jUzlMT0k4dG1IQzU2MDRI?=
 =?utf-8?B?WEtYZEJSMzhTSUpiNzZTWkZLYzRsQmcxaDVuUEV4Mkg1eGh2VkpzMzZaUlZk?=
 =?utf-8?B?OW5hSDZRc2d5Yms5ZVF0QngvREwwdVBKemUzV3FSU0NmQjIyTHRJbklXMVZB?=
 =?utf-8?B?WmcyaTk4WENxOEdXVE9GK29qRmd5eCtNNzRadkVUSFMxTml2ZFhYQTNXMkxa?=
 =?utf-8?B?RDhwVzRqT0VOZlNQUWZ5dTZ4TWVaR2ZpTG9mL0sxK2Z5S0FMUUxmTTFjL0Zz?=
 =?utf-8?B?SGJDNEcvTThtQWl2QVp4bXlYSXIyL3dRWlYzZ0FCazQzOHRzcmU4dXJWUzJo?=
 =?utf-8?B?TXlJNHFIb0VseEQ2Y3R2UHIrTThWa3pnVEl2UjRGMTFJeU54ZHRlVFFyQUpT?=
 =?utf-8?B?dzFGR1pBTHBmYWRBUWVXWXNDa2FiTUF0Z0RqUGN2Tk5kSlF3ZUd1ZFpmUVlK?=
 =?utf-8?B?UzhjbnRDZ05pSDlNZVJxVytwdU4zeVFNR0NKamVPMUFPYnlTeDN6OGJzMmdB?=
 =?utf-8?B?WHQyblp1OUJUQTE2Q1J2MExuZ0xSYWhjY0VrUWQ4UEg5U2wzUjZJNld2cG1Q?=
 =?utf-8?B?Tmd5aFA0MEk4RlZqUEZMZVVpbTZOeFdKc0pkeVN6bldEU2tCZGlxQW0xN2ll?=
 =?utf-8?B?VGdTOXhVbTkyY3dnQnpjUDFVSGd6VEZJbEU2QW9sVUtZZEFnZFlEUnlUYkhm?=
 =?utf-8?B?UEtQK1RRaC8xQWZpN2FtdkppME9jYUt0aDJnQ1lSb2txeHI3UThCSTg3eG9t?=
 =?utf-8?B?Q1dvNEg5emJyUWhRVHlwbERpM2MzSExmQjB6VFBoSjR4azJaNy9SOUZ3MTRJ?=
 =?utf-8?B?SGRYdEtUODg1bjZCZEloTFkrR1FsaXQ4eXNFdWphbGdBcDI2QStYWHB3TjhY?=
 =?utf-8?Q?E1K8ZvudB+NS+eQygGBXegDXcSDv8VUh?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b2c6ff8-2ba5-4549-6972-08def23ed4e6
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 15:41:21.1612
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5362

On Tue, 2026-08-04 at 10:52 +0000, sashiko-bot@kernel.org wrote:
>=20
> New issues:
> - [High] Hardware-accelerated blink destructively alters the physical
> state of all other active LEDs by zeroing their PWM slots.
> - [Medium] Hardware blink overrides user-configured brightness by
> hardcoding maximum intensity.
> - [Medium] Updating LED brightness indiscriminately breaks an active
> hardware blink configuration.
>=20
> Pre-existing issues:
> - [High] The driver incorrectly assigns a sleeping function to the
> non-blocking `brightness_set` callback, causing 'scheduling while
> atomic' panics.
> - [High] Dangling `fwnode` pointers due to un-incremented scoped
> device node reference.
> --

All five findings are either previously answered or already tracked for
a follow-up submission, as they are not directly related to the feature
this patch implements.

Unless there are any other reviewer comments, there will not be a v6.

--
Manuel Fombuena
