Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazolkn19011026.outbound.protection.outlook.com [52.103.33.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B948F432E85;
	Fri, 24 Jul 2026 11:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.33.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784891556; cv=fail; b=s51GEE0DHvyjyOmIk1Wo8dy8CwJEb4/Px9Key5Rk5Q6sNUzUBvjfI5cY8mALmtkTrzP0sU4KN1GaVWaEfc0YaHmgd41R4AUS62Wl767b7DDcVg70LGWuL5vBlCr9dATmr9tAeIVzcNTnXff/4NmLstt8pgcXyOxgU57uybovAus=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784891556; c=relaxed/simple;
	bh=jGKUuh0ncBWf7kcku3akRSVnPUsk3JdDcFwiM/hKcIg=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=C9wM6wF38uXfVWElP8RJZWx4D5qQugCpTgsY8PxS5FGfUFEWseKeahbN7EAauFp0QuS0BXS8Bm8707PGlMPiDVXXM7CZG6OmFKi4TYhqXD58rWJoTx4o3C6pm2NjMUKqVsmisHWDNjPaLBL+jXR7wg5FFcapiIdIfwoN9Uf+UHc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=CTJQx3ox; arc=fail smtp.client-ip=52.103.33.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="CTJQx3ox"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ox39mWcvZw74pHliR6pnP79yA7PFLToJMHNwc1wECzE308Jc3gtMf4GbxmjRzje62JqYdAzZRLI26xD702oMdflNgrVtSos9zNqWbgcZPyU0Jvc26sKKN5tQhnK9fnj0kVKzMux4n4dboxdTUpb1c1x35LlVWl6mx9PD7SQsiMwJeZutUxWf/9Acy5bMObtIwTV2mtfxiSBpTOYU8SMdyeYvgg+OHuslClZLnPoJvViZxi5oGq3EPh+G/MdGFfmNtE+efShv8mXskbCqLeykf9EYrK69Kmb3kYGta1WaXcez/wrVI/esCFiwiZqC2tqrS92xwWiRRLl+2VfqEFEDuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ox7MRhZsGcEpOBBGJ5z5NmVZAK0kYJOg3lUYEK3g04=;
 b=rEcjcirqg1mxORtPb2Ev8gKQ0JECtgUK8KMQkgmra7oUYx9xKloiLs7SdSmBUheve16Y7OLYQHk3BfLeYeujrLsTBKQ1UXc+voXvdJn1y+dXZVk+XknV8dP3WcOvCf/VAcBVLhnXgaotUGBUVx3j2NCTmJXH1DrlSr0WnHUmlDGIqlVIsJthhxDwHN9Q2ueTyK6RzvkbFngGru1tUs08TFLeO0Mc3pndZuq1Il8aD4kYiLTzmmi0vQpY4HzypJeX5x8J+Nbawhtq0YqR7cS1cq09/Y09c0pe/jSYcdVn4Hs1gFtbyKHc0PYBQ8tKNZx2uQHZw9+b9lTwPJCV6yi6VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ox7MRhZsGcEpOBBGJ5z5NmVZAK0kYJOg3lUYEK3g04=;
 b=CTJQx3oxjlIBxKIOYLQNM5lw+Jdco/+UOXHSvFUAKzjXe2+MiJT+yNHdVGrViOXdgd2fn4VXhh95Jq/JWsBCJUT+zlICsZyfRrv3kWpw3ZuDHf6UuWQcjYWSVXtLiaH9+L23z4CYrrq56VQU4p8fqvi72IwOOShvh9WIUV7725+DLArSqj/gar/aqu845sUNx8WTMAYXWiIBFJRfIJHdf8hqL1bjhk3FxUMPcKXZPchzJduQBSy2HZ0Xbz63n9PxQLAZHouHpcw7+rmmDhE0HF8Mva823N4JdhEKwiOurRdGkrb/7ISyyr403kd7AVCFqTppz6aUhWYQoTAZcj1tLw==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by GVXPR08MB11059.eurprd08.prod.outlook.com (2603:10a6:150:1fc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 11:12:31 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0245.010; Fri, 24 Jul 2026
 11:12:31 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/1] leds: st1202: Add hardware-accelerated blink support
Date: Fri, 24 Jul 2026 12:12:16 +0100
Message-ID:
 <GV1PR08MB84979E014A407174EBAE9875C5CF2@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Mailer: git-send-email 2.55.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0137.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c4::15) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <20260724111217.988021-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|GVXPR08MB11059:EE_
X-MS-Office365-Filtering-Correlation-Id: 6eca18af-4de0-482b-5b84-08dee974741d
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|24021099003|19110799012|5062599005|8060799015|6090799003|5072599009|15080799012|23021999003|37011999003|25010399006|51005399006|10035399007|40105399003|1602099012|440099028|3412199025|4302099013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RmJKeUk1NUxuRHhFeS93dmFoTUJzbkR5ZEhnK1IrV3ltTXlFbVgzTFNMNi9S?=
 =?utf-8?B?dUJsbVV3SktjbTRRUGo0b3ZmeWdZUGZjVFpYc0VOR2FhYjRUT2xUOW02R2p4?=
 =?utf-8?B?YUdLTkloV3dkWFFKTTh6cUNNWUNZSHRrYlpCMnBGV3ZCVjBhZFdzVjdRakd2?=
 =?utf-8?B?Vjk0NDg0YjNFcW03ajgrK1NrdVlEQXJTZS9KbjVBbk5CSDJxTDdnRi9peGcx?=
 =?utf-8?B?T3l6Qjg4L0pjOUtVQnJIZmppdVpGc1FZWnFMcTNkblk0ZWk2RkVvbGl0VUcy?=
 =?utf-8?B?U2gxMGRzc2JDck4rNDlmVWxVV2pHYWVOSDhJazY0SHBleUs0QTZnd3ViYkxU?=
 =?utf-8?B?M1lCVWhzblpLeDBVbStpZ0U5TlpNMTU4MG9CaDRXQVZCQ0x3ZGFVcmxVczB3?=
 =?utf-8?B?eHB5bkxnM0tuNmcrL0czL2ovRE1FZkpGalF5cFA0bmI1K2VzQXpSQVZFZTg5?=
 =?utf-8?B?alJNbjRncGRoQXBkNmRuUklMdnptQURPNCtFek5sYUFaYUhYMEJVRmlQaUNP?=
 =?utf-8?B?VDJ1OVcyYTNNc29DSFczK2dwMFRSMjZ0cVBIbFFiTWVZMTNQWlBvRnBYRHRP?=
 =?utf-8?B?Q1RleGpYZldCOHZXa0VITGthYkpNM3YzbzZWOTdKZjJlYVNCamZ0VmVDdGh3?=
 =?utf-8?B?eko5VVVMOUtJOUtucEQ4cDlONE50RGh1S0thVE5QdGRPNVVVd0NBMXFvaGZy?=
 =?utf-8?B?bkRzZ1BEZmZzQStTK24vRUNiQVZjUW5TaHVPOGVvMThjb0ZXR3RVOThmU1hX?=
 =?utf-8?B?ZzdUK1B4bGVpeWE3emhKcmRDYmxnQ0IxOEdlRlhBUzdCSHBWMUJKZXRBUDdt?=
 =?utf-8?B?SkRwc2tyRHNudm55eFJlYVhVM0NkUnBYVEtTKzJPUHA1Q1lVR1pYSVpleDND?=
 =?utf-8?B?b1cxZnFwb1Y0M0xDY0tiZE9uWmQ3enhPTUhnUXJoSEsvcXBldjFIeXVEenhs?=
 =?utf-8?B?aWc0SXBTTUxjNmRjbDlhRkhTM09zdWFDUS9wQ3pYa1BtYWl5UUc3Sm1OVTdk?=
 =?utf-8?B?bThsODZHVDllNnlXV21pcDFPRk9xaWp6aDE1OVk3Vyt4bUdhN21ka0tmd0RL?=
 =?utf-8?B?OUFybHRubk5GQnppaWtHS3k5RkI3SUlPbkhoNWlsQWV3ckdPT0RjZXZhWXpP?=
 =?utf-8?B?VXh1TEdFdTR2RlFzcU83NUJNN0ExZHg0cllHN0hWdDlXZmJ5RmdCa2NSYnlj?=
 =?utf-8?B?WTZxQlQyajBpTGtQd1ViUytBL3NMZFJkL0ZMYUlpVXhud3c5M250cEZKTDlW?=
 =?utf-8?B?M0t0d2ZXMGJIdW9vNHdhZEdiOWpzeFl1YXJyRmVMdjR5b0M2Nk1OeEZSU3RE?=
 =?utf-8?B?R1E3V1RTdmlxOGZXMVk5TXJQcEc1ZkxXVlZZSW1RNWdjR2pqamlaa1hVZWhC?=
 =?utf-8?B?NUlDSDA1OFJ5RmtBbmxteGVRSGlJRjRDVXMwc0xERG9XVWhLbjJyV0pUL0pr?=
 =?utf-8?Q?W0whnrIh?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WmhRMk9pOFlZTkI4OGlYWVVuVE9nNVBjRjd1Wk5wWjZQSnl3RGQzUDVHY0NT?=
 =?utf-8?B?NWpBTlBYaHVLVXVFcXdvbjFKdFUyRXR4OUZPTlhQUXlFU3dndm9TVUpvRk5R?=
 =?utf-8?B?N2Fyb0ZjUXZqczdJVDBENU4rY2pPWXlZRy93Mm82NnduejRBMFBNbGVOd0ZJ?=
 =?utf-8?B?SXB5bW95NDE5Y3pxTUYzenp1dmlWVDNESE9rL0cyMW93NE9TU2xEd1pVVnpk?=
 =?utf-8?B?WWYvcHIzT2R4V1dRcWNXdHhFRVMvb2M1VElkSUI4WGw4N2hUMmZmOC92aFNC?=
 =?utf-8?B?a3BPN3BBZzhUeHJIYWIxc3pOKzY0TU9TajdLRUo2Z01RRStHZEVRQ043aWc1?=
 =?utf-8?B?Q1ZoRGJTUVRzNEdJSzdEeTYwUG45bDM1d2tKc0tGM3hSUk9SK2xpRjBuNFMz?=
 =?utf-8?B?eFV5aXZuQjlPZWtWWVlISmFVM2xPdCtRdFNEM2YrY0x2b2oreE5uWmNpVkVQ?=
 =?utf-8?B?Q0I3bEtVZ1d2bkNzbitIaGdBZ0FLNG1QclVvdHZzeGovTWpCUE1XckJnWGM5?=
 =?utf-8?B?enQ3bDdHbm54Z0l5TE1HUi96Zmptd0ZUeGsxYWxhYzRqZS9RWVBVWU1Rcncv?=
 =?utf-8?B?SXNtZEMyWC9yeHFBRWVqQ3k3SUpLc3lpcC9sL2g3WG1QdjFSbXY4YVB2UTZw?=
 =?utf-8?B?OGJSU3d4cXdyeVovb1FnVTM5YWpFNmNVN1RhNWpSRFo3UFBrbDkyQ0xqOWxO?=
 =?utf-8?B?QVRhemJrc0pvNGM3RkJ0Ynd2bmtLR2pyNVAvQ25vTlhxRStVYVZIZXJjVTJE?=
 =?utf-8?B?SXZQRE1FVk1yTXlBZEdWT0d6MUMvd1RQcVp4SUhpMWErMnJ2c0JyWEw0Si9V?=
 =?utf-8?B?WW54YjA2V0puS25yMjN0RW92Qnc4b0hzT3dOZVV6c3FaRlRNZS9IUWpyaW5E?=
 =?utf-8?B?TnpOQjdNcGxLa1o3VkpxNGZVdXRVTS9uT3JvN1c2UEZVdDlqbTBRM2dnNUpj?=
 =?utf-8?B?RkVTOVVLUjZXTWt2UERCWDVDTHdiZHJpWXFxaHNwN2xNYkZuNUlmMTlhQkh5?=
 =?utf-8?B?bXloeCs4RTJ6M1U1NFVyUW8zcS93MjlnbEZ0MUdKbXJ3ZkszNFJlcTBqWHVO?=
 =?utf-8?B?eDFwTFczZi9xWHZ3OEtlMXorZERUbzl1NjB5N0RLaVRSY1M3YkpIS3d2MWw4?=
 =?utf-8?B?NGsrU0p6YkdENGpOY0cxQ1FGU1pCWVlmMFkyVWNSUUM3QThGNlMwYmlVMi9n?=
 =?utf-8?B?anJEZEg2ZUZGdHY1SGpOT3k2YUk5ODlDM3JsblhvSTRLMnc2OG1MWjJOU3pS?=
 =?utf-8?B?c0FkRmJITDBITzJEK2hMYURmQkwrdEZnb0Q5Y05sT0F1UTh2QnZDWDU2Qnp6?=
 =?utf-8?B?bVFLeGM4MUxSUDFZTnhmRzEvQjlkcmZZektoaWpkKzZIQnYzWHRQdlk3YWdq?=
 =?utf-8?B?VjZQUUZhVlduYk1MdnpZWXhVcnJudjJGUkx0SnlMQXpIWUp2UlFjQXptOTBs?=
 =?utf-8?B?ZCs0UkZVcFVTblh4clRZOTJhRkxIczBrOEtLQnhiOVBSeUhFNW1BcmJlS0tx?=
 =?utf-8?B?MzhWWWJGalp5cVRmRGRZY0lRVmxmVXNubXI0dmQ2VTBFT3VmVGVUai9wVHhB?=
 =?utf-8?B?YXpSWStyVVdORjBPMXo2alFGekFycmhzdGlubHBzMFJzQ1c0T1ZzMk1VVitO?=
 =?utf-8?B?dWFVdDAwd2t2WE5xWFpKUkZKclkwalNwWm9PTFRMay9WSWxrbC9oMGNMSDJs?=
 =?utf-8?B?Njd3eHpLY3hsWk0wTjlzUU4wTmphYWJBcmhJRXFCVEhGdlhLZzlJeXFENXJa?=
 =?utf-8?B?UzVOSE0zMGs5NEpiNnFERDV5NGZFRkJFcGdYcVBBY2RsSTliQ3NnK0xwU3VV?=
 =?utf-8?B?TFJkUnNzdU56ckZCTHBrUzVBdDBoaHhCSnd2c1d3cWF4TURSQmlKcndWZ3Ev?=
 =?utf-8?B?anNNb0o3QXZuNkJ6N1J3d1Y3cDk1Nll2SlVSc0xsaFhncEdGUmhuVGVKeXNk?=
 =?utf-8?Q?t3xPjRADEqh6qSFDoV7l29eUszDy/AHD?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6eca18af-4de0-482b-5b84-08dee974741d
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 11:12:31.3894
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB11059

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

--- Changes in v3 ---

  In response to automated review feedback (Sashiko) on v2:

  Clamp delay inputs to the hardware maximum before calling roundup() to
  prevent integer overflow for extreme values near ULONG_MAX. The final
  clamp_val() enforces the full [22ms, 5610ms] range as before.

--- Changes in v2 ---

  Use short-form ternary for default delay substitution.
  Perform roundup before clamp_val to ensure rounding cannot exceed
  the hardware maximum.
  Capitalise commit subject per LED subsystem convention.
  Drop Assisted-by tag per maintainer suggestion.

v1: https://lore.kernel.org/all/GV1PR08MB8497C5B8CEB2CE19743DFCFFC5FA2@GV1PR08MB8497.eurprd08.prod.outlook.com/
v2: https://lore.kernel.org/all/GV1PR08MB84979858573735294D41A189C5C02@GV1PR08MB8497.eurprd08.prod.outlook.com/

Manuel Fombuena (1):
  leds: st1202: Add hardware-accelerated blink support

 drivers/leds/leds-st1202.c | 84 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 84 insertions(+)

-- 
2.55.0

