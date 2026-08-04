Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazolkn19010021.outbound.protection.outlook.com [52.103.32.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8105F442FBA;
	Tue,  4 Aug 2026 10:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.32.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785839970; cv=fail; b=FwroXfa4ws695678xvC7dD38IrYkWXN9Q5vAtNHXjI9cNJSPdqnaMEFSW4ix+KmYb9kjWZmZG3LU1qjMPZ7UxovmJsx7dSBjuw+vxRgrV2ViVHBpKWwcmQ244CyFkA5j+V8xrwY+F7obiVE1Xzd7dTPONPZ6Cy05tnQTKv71lCo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785839970; c=relaxed/simple;
	bh=w6xYgYAAXL/zyWEXXxnNrnqvOnMu4f6QeYewLhqqpJo=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=h1YBn/UpZxgBAykovePlnxP6vxQhQVbnqRhH3IMG2Eg/jHj5ZI4YrA/iL8xdz1kKmAO9F4VNxUUncpaqc+bumN+UIEfzZ0WVYvsxZGUJB8/xdxvRHzXTjKJ6pmZ0Ul2C7w4saG0cwdk3FoQG9oi3yrxqa7Oe9x4t/MZ+VaIP6P8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=qO+/fDzj; arc=fail smtp.client-ip=52.103.32.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="qO+/fDzj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rJwTHnyWejzEprSda6cIiq2zIWGupiiA4NArGWQRsHlfgZEbPdCBLOacAOK7fcTFUILuktTqqDYsYM7/ejES5G/r8hqnXIyi7gRlnmkholXMsxkeryMQgIoYPvF4K7Ceur0QR6WCM2VMZ1K7WGME9uUtUxtu/z5zwQe8ucmFLf3ho8gbDdIqasoizOILFwmsU0mTwhgnhcVrE6kBxDCNPOKfrvZ8LymIm77yK10kRFlkoDJG9zoZNQ5p6P+NaaaU3hBT7tTcgeChxUkxiZm1Q4SgAMYkvMopQSrmzBx9UpUa+1SqgLWXaCQtWrwxfQSViA0agYHf5x/A3wD4id+Ivw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ee0byZhS5sm0f+vdl3PrmcG7X9tJxfgfGicxHGPVxY=;
 b=pKgQjXUp0NAHFIQgxQO37eX27YXdAw0aJCXoa+nDzCBxuDNd58ihmWCbv8sIJPR6C6Serz9NgLQItDuBg/nZjL+4DKAiK9IQ4ceFgblEVQnqTnU3mIE841gQiZeDbQXsAwwF9kzJUOOXOvcaidMmPqKNE5FctCH5TwsgTVlXIhhGEu3QZBdxwVFcisoWtWHzzDrah3/Ji4tnLOXIWLL7YfTB45SwC19njJNAYWPfxiZzrB1SGmKoVeJGGv4ZqxnJlsly2GLUDvNxE1mZPC+WQXuQ5UtStMiBG1sRErxCn57AQXaunS6WMaSzf2YZY0AFew+joC4Blgji9DMIYzLM5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ee0byZhS5sm0f+vdl3PrmcG7X9tJxfgfGicxHGPVxY=;
 b=qO+/fDzjSPJLd4LT/VqmspKtItluvoHg3PeJdDCDg5kJ1mDjM9hYiNWZwnjys6d23iYGneOTnV9q3nPprqsMRG2sziiM9SrPEGTfMPsnspw544v+UdCcVg4ef4QvXfmpRrdQf7EXhLjKNX5k6qvxMSgYlamVJqkgvk7sO2pvQygnjmBUTI5Vkq4kHtGfJF4yeEKW+Y+GQpUS7ZsHGOSXgKZ2cn6UZSL9I1rtfq+qmrwwFYIw+I8uVO3GHyxP9R6q8XPocjZO52F1BW+/LqKyfHnaQ67HU80SSqIufH6byX1H4tzqQXvaTEtPaJLGuLOADJM4SfBrBomAbkKSoBuALw==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by AS2PR08MB9452.eurprd08.prod.outlook.com (2603:10a6:20b:5e8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 10:39:25 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 10:39:25 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/1] leds: st1202: Add hardware-accelerated blink support
Date: Tue,  4 Aug 2026 11:39:05 +0100
Message-ID:
 <GV1PR08MB8497E2498ED9D66AF60A3ACFC5D42@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Mailer: git-send-email 2.55.0
Reply-To: fombuena@outlook.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO3P123CA0010.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::15) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <20260804103907.596313-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|AS2PR08MB9452:EE_
X-MS-Office365-Filtering-Correlation-Id: d9ef782c-8eed-48ac-ea94-08def214a55d
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|24021099003|6090799003|19110799012|8060799015|5062599005|5072599009|23021999003|37011999003|15080799012|8022599003|25010399006|10035399007|1602099012|3071699003|2607281247196008|3412199025|440099028|4302099013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YzIzQWJmTExLR25tYjgzSFl3WGFENCtoM1ltMkFiajB1QXRIRDd4OWpHRzRq?=
 =?utf-8?B?bHpoRXdCaUlEdFJEVlAxMWowaHJpVE9SS2xpa2x0VzlHT1BEVUFOUUczSW1D?=
 =?utf-8?B?ODUzK2NzcldSTTZpQUcvMkdBMXdvT012TFNkRmRtN0ZwL013UElkcUorblEv?=
 =?utf-8?B?NlNpOW1MMEtPb3pyOWdtWlRFMmZjbTUwV25JTnNhVW84ei9Mc3ArRGxhRjdB?=
 =?utf-8?B?L0FWMlYyaE9HNFU0ckhtRGFNQ0VnUVVGVlRRT1dwV2hjUFdidXNVajFJNTZG?=
 =?utf-8?B?M2J3SkxpUGNYOFNsTUhjZEtGKzRUNmFwZlVxRDRhbEYxQjh0ZUVUcEdnSXZF?=
 =?utf-8?B?WXRqVkp3enJVOHBMbElKdm9wZWpyd2JzWUF3NXFqVVRtNmhneTM3Y1ZFOHlp?=
 =?utf-8?B?MTN1U21JcXEreVo0R3ZBVERsMDJiRG45bWloUXJ1RjhyVTY1WFIweUJQWWdW?=
 =?utf-8?B?SERONzAwRXk4TiszV0NVRnpaaVJWU253MXN5Z1A4SVZlYTBLZnNUSnhQL0Y5?=
 =?utf-8?B?THZXSEhMcEtzcWQyZFJNWjQraGdPcFF1Szdwb01QSVUxY0tLV1N3aGpKVlpu?=
 =?utf-8?B?UzRPeHduVXZicUZwRmJTaUpnRUdrUTVJV0U5blMwbVR1dE5HRTR6SWI0b0R2?=
 =?utf-8?B?dmtPa2J3WHovaC9YN3ptK0RiUEtkcTljbG10YzIrQTQrYW54N1h0UWt1YlJI?=
 =?utf-8?B?aC90aThNdU4wQVZWeDB4SzlaMG5jWlJFYm51alFUTTl1SEd6ZTFPOGMrZzJM?=
 =?utf-8?B?NmU3Sklyc2pWVTNIVU9lNFJ0N2c0WlJJVlcrWjJGT05JL0VUbkhzbTNJZ1g0?=
 =?utf-8?B?cCs2NzY4V1ZjU0xOUzBnb1ZncXJOWFJrZ1ZMQVJIODZBd1ROVEtFMk55Sy9K?=
 =?utf-8?B?dlJZbGRBajdJaWFReDJEdnRuWTIxbVNQN2p4RW85SlZTVE5sbGtIR0c0cnY1?=
 =?utf-8?B?bjdtSXVieHRndXQySzZXaDE4ZDlOdGdtVDdjTE9KQkV3NDdxazdRQVd1b3Zm?=
 =?utf-8?B?UmRjYStYV25JM3FYRktyamp1dkRJY3ZNTTZiM01aWGgrQnNCLzNYZ0toSzQ3?=
 =?utf-8?B?dVFSSmh5MHhvMit2VnQxdEtwYzhoeXpqaWQ1VjFIQTM3RzMrb1JQeHp4TG5I?=
 =?utf-8?B?V210djdiL3JzL3paWXpJd0lobjdWM0djcGZqZGp2aU1uTjBpd2Mzdkw0WFUv?=
 =?utf-8?B?UkhpOE95elBEOEVzRVBVMTRMWTVUZ01lWWVTbUVUM2tHVm9xSVhiN1VSZmJp?=
 =?utf-8?B?c1BFcDcvVm9zcVZ0SEtIN2pWV1RkT3c2WFZJWG1NeklYalhyeXlNcXZmMEtW?=
 =?utf-8?B?d0tpUUtjdjM2ZS9KUG1seStTTUFtMXc2V0FOMFpGQmJaZVVJQjd3NE1JVU9H?=
 =?utf-8?B?aFVMa1ZJbHF0MERjK1NuL2l3L0dweTVoNXBhL1hQKzUrQStOQTl2VUMwOWVV?=
 =?utf-8?Q?2o+ZGjCV?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K1pjbjh0Z0JBSjJOYkh6U0E3SDB1Z3U5WEIwWGc5RnZ5ZW0rQWRUelFCZW9X?=
 =?utf-8?B?SlJrRTJTZGVKMjlhWVVNa3FNUVJkWjZmU1hSNmYyUG40ZHZWV3pzcnpxZXFE?=
 =?utf-8?B?cHBvVXNlNkFBOTZMUVFVNWxSQ3Z0NjBJNEErU1o0R2srTDdwYXBFUm9oYmZL?=
 =?utf-8?B?ZlJkOHVObVdWRTV6bWtZNzRyb0k2VW85aTgrdVRNZCtEUTlEYVlmUTNHbHk4?=
 =?utf-8?B?WTY0L3REb1hSMGZHeHU2N0huZ2I2dGZJa2ZpNm5nS0tpT2dRUVJwbm12STE1?=
 =?utf-8?B?S214RkZRZFo2WkxKcktRcDRvZFB4VmNqTjMreUdPZS9PdEN1bjFxS0lpanI3?=
 =?utf-8?B?R09IVnV5N2kvOERNUWpwMG83NXlwdndnaGxNWlpRTC9xQTFMclNRZWpEdFZW?=
 =?utf-8?B?ckVnT2w0bHgxRXBLQUdPcGN0VkJ4dkZ1NjlNSmRtV2Nia0MyKzduOUhuTits?=
 =?utf-8?B?am9ZK29GVU00T3o0aVVKVWJ3SDhJUDc0THdYZnpaeHpsZGlRaDJ2ejNFbHMw?=
 =?utf-8?B?QVQxOStyalFUZG9hWmZiRHJOb0RNSE83a3VyWUZkL3BzSTFrY2I1c3VqWVNK?=
 =?utf-8?B?Z1ZpMlo3TXpidVNJWFNCQTJMeGR4OCtnV0dHUDZjK1hFazB5NzhoWnhLcWZH?=
 =?utf-8?B?ajFYMnMvdFhVV2txYWZ6NnNUREFMZzNCY0NhU0lrV1VJVUJLMk1YbnVoSStF?=
 =?utf-8?B?cnNPc01mV1FRNDZyYnVXSGlYeUQvazJ0YXlzNUdsaGNibHQweUc2OW4zLzBw?=
 =?utf-8?B?U29NS3Y2L1hQanduU3JhVjdaNjlOcEkveDY2Zlo2NXdoTzZqNWYxKzRQN2FH?=
 =?utf-8?B?aitrTUtEbDNPT1RiRXQ2dE51Wk1TSEZGZ01NSkJ6R0pCQzR1azJ1Z3hEemJR?=
 =?utf-8?B?c3RBbGQ4OG15WE9Oc29BR1luMlZFUHFUZFViOVphaGlTV3hLREtjT0lyaU1w?=
 =?utf-8?B?RWE2L3lqMmxBeXZTczQxd2Yzc2pUU1N3dGx1VUFQbjlDZlo4OEVsNllWYXlK?=
 =?utf-8?B?V1UxMUJJNktWVUxWdU9oOHNhNkREckIvKzFSa1JCUzhSVklHVVRGQkw0QmFt?=
 =?utf-8?B?TGFVWURkVThESXJlSEFSQVUvVkJHMFFZUVJXdUQ5ZGZMclNWMGEvUzJ5YnRF?=
 =?utf-8?B?Ui9mVDNDTjVXUFdUQ29hdnVzNFNuLzlibnJlV2xNZDBjNFhRZjhFWm5LN2hX?=
 =?utf-8?B?cmJhTlZQZVd6WGlZczlxQTlkdmcxcm5SUVExZDFzTjlPd2JMYzNmQmZjdGxZ?=
 =?utf-8?B?bTNXak12bjY1ajBVOHpQVWozRWRnbGhUVEFGbjhUYW81L1plRlVwN0JoVEdB?=
 =?utf-8?B?d3JCb09XT2VheENYRXZ3TXY1anFDYUp2bDkvNXl0OFd6eElTTFh0RVZVcVFj?=
 =?utf-8?B?em8zTE1XMjNnTURsUzdmT0E2VjB5YkhTNVl1Z042ZkFpQUZNQzVTSFpDclNC?=
 =?utf-8?B?NnpENVlucEpUVU85VHJzRTZ1cDdueSsyV2poOThlcnhkeXF6aWNnK2I4NVNt?=
 =?utf-8?B?eE8zQUdDeFJVV3luUmk0QXllTEw3emRoNlFXeXhpZTlVdFpkQ1hsc1lLNHhy?=
 =?utf-8?B?eGRrT1hKaW16Rmp1OWdKTnhZd1JidjNWVlVuSmVYOStKR293bEh3ME5pWHE0?=
 =?utf-8?B?RzVlcFF3TFRtRVhQSFZxenhOdTE4bjlPSHMyWjZMbFlRK1ZaemhNQW9OTlEz?=
 =?utf-8?B?cUZnRCtIMURnRVZ5QXZmQU5QODVna2IyUElCRnFSYjNRSU9wSkVQUGpiaDJZ?=
 =?utf-8?B?NHg4SXdLSkVGNW96eXliWXBzS3VHcEQ3cUVOVGg1ZmJmM1pyT2NxWTQrWXBZ?=
 =?utf-8?B?Yi9VQjVEV2h3dHVLOTlYZ3F6NFl3ZG9xK2pteHFSaDBKM0J3Ky9lbWh3N2N1?=
 =?utf-8?B?N3VZbEJLSGdsZ3VKZHhmRDErU3ovZm4vVUJkSzZocmV4M1JzYWNqd2dhdTRi?=
 =?utf-8?Q?VYeq82J+wrsizZ/WRokzWRPx30BVwLn6?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9ef782c-8eed-48ac-ea94-08def214a55d
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 10:39:24.9763
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9452

This patch adds blink_set() to the ST1202 LED driver, enabling
hardware-accelerated blinking via the timer trigger.

A series of nine fixes to the pattern engine and brightness handling
was recently applied to for-leds-next:

https://lore.kernel.org/all/GV1PR08MB8497C0B898789BB73ACE6EE3C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com/

With those fixes in place, the pattern engine can be used reliably to
implement blink_set(): a two-step pattern (full brightness for delay_on,
off for delay_off) is programmed and started in infinite repeat mode.
Requested delays are clamped to the hardware range and rounded up to
the nearest 22ms step.

During review of the fix series, several pre-existing issues were
identified in the driver — including brightness_set() being assigned to
a non-blocking callback, the global sequencer affecting all channels on
pattern operations, and missing brightness scaling in pattern_set().
These do not affect blink_set(): the callback is not invoked from atomic
context, the function explicitly programs all other channels' PWM slots
to zero before starting the sequencer, and channel brightness is set
directly via the ILED register. The pre-existing issues will be
addressed in a follow-up submission.

Tested on LED1202 hardware via I2C on a Linksys MX4200v2 router running
OpenWrt. Hardware blinking confirmed functional with the timer trigger.

--- Changes in v5 ---

  Use st1202_duration_pattern_write() for pattern duration slots 0 and
  1 in blink_set(), consistent with how st1202_led_pattern_set() uses
  the same helper for the same registers.

  Fix commit message: ST1202_MILLIS_PATTERN_DUR_MAX was wrapped across
  two lines.

--- Changes in v4 ---

  Fix delay clamping and rounding order following a review of the
  changes introduced across v2 and v3:

  v2 moved roundup() before clamp_val() so that rounding could not push
  the result past the hardware maximum. However, this left roundup()
  exposed to integer overflow for extreme inputs near ULONG_MAX, since
  roundup(x, 22) internally computes x + 21 before dividing.

  v3 addressed the overflow by prepending a min_t() cap at MAX before
  roundup(), and retained a trailing clamp_val() for the full range.
  The trailing clamp_val() turned out to be unreachable:
  ST1202_MILLIS_PATTERN_DUR_MAX (5610) is an exact multiple of
  ST1202_MILLIS_PATTERN_DUR_MIN (22), so roundup() on a value already
  capped at 5610 returns 5610 unchanged, and the result is always
  within range before the trailing clamp_val() runs.

  v4 reverts to clamp_val() before roundup(). Clamping first prevents
  overflow for extreme inputs, and since MAX is an exact multiple of MIN
  the rounded result cannot exceed MAX, addressing the v1 concern
  without the redundant operations introduced in v3.

--- Changes in v3 ---

  In response to automated review feedback (Sashiko) on v2:

  Clamp delay inputs to the hardware maximum before calling roundup() to
  prevent integer overflow for extreme values near ULONG_MAX.

  Other pre-existing issues identified by the automated review are
  outside the scope of this patch and will be addressed in a follow-up
  submission.

--- Changes in v2 ---

  In response to maintainer (Lee Jones) review on v1:

  Use short-form ternary for default delay substitution.
  Perform roundup before clamp_val to ensure rounding cannot exceed
  the hardware maximum.
  Capitalise commit subject per LED subsystem convention.
  Drop Assisted-by tag per maintainer suggestion.

v1: https://lore.kernel.org/all/GV1PR08MB8497C5B8CEB2CE19743DFCFFC5FA2@GV1PR08MB8497.eurprd08.prod.outlook.com/
v2: https://lore.kernel.org/all/GV1PR08MB84979858573735294D41A189C5C02@GV1PR08MB8497.eurprd08.prod.outlook.com/
v3: https://lore.kernel.org/all/GV1PR08MB84979E014A407174EBAE9875C5CF2@GV1PR08MB8497.eurprd08.prod.outlook.com/
v4: https://lore.kernel.org/all/GV1PR08MB8497E3103AD32162BD05D907C5CB2@GV1PR08MB8497.eurprd08.prod.outlook.com/

Manuel Fombuena (1):
  leds: st1202: Add hardware-accelerated blink support

 drivers/leds/leds-st1202.c | 80 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 80 insertions(+)

-- 
2.55.0
