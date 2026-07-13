Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazolkn19013086.outbound.protection.outlook.com [52.103.35.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20A025FA29;
	Mon, 13 Jul 2026 15:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.35.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783955933; cv=fail; b=fEwJ6vmmLTcNYjqJ6szvhM1Lxc/j6W0p2BI04BxBPNabKQUbw1CdD10GbuMQM2VxGSjrbghK1Pu//q5a7bnjbuQ2vl/pvgD2jN4tDHkkXmHXX2Q8rY1ijLk6IwWx9QkND/pj+cErYlp+POEw8SI02T5iyqjAJ4+3I7q7qLmCZc0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783955933; c=relaxed/simple;
	bh=ZNN0J8YCX8PPXtUQ8TtTeLdlz/Fc6EfHlaTUZHuW92g=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=aaIkoqHV6QBxyQRfZ/P4JdRjmW6HY3VZkvLmpGb60XOlcXj2Gahuos8WEYYAHTRW5kn7MZC34u6IYD1g6YRZdbjJKPH/Q53YJLSKj7oO/a3+FlfuDISUTVQCMISB2pS1n/2LbJ3qx20mJnYPfPy2LdqcCXbZnOGsyGVdrfQcZEA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=OD77y6bI; arc=fail smtp.client-ip=52.103.35.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="OD77y6bI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m8dZc5jVvUX+k1js81lqfM507ZJE4PrbThzKmY4c5e/JIRpp1YKJ5TvzzkjoKCqqUGd5dTBmy6CyAhpaOkJqcnBQOJv2WslcZb/4dNbk0WP98BLoxzDWoO+Ue7URnqV58JXpRCL2Dw7p3ILTXveuKvP2k0c7Q02bn6CFmJizr3oJ4UZT3OoTv/vdtgEzpAdgjVKwe+hKU+UPECCaSFu2BrSq6SY61XkX2TQtaTCqntjReSvyWKniFTq5zyjoEQncUI4vM9shEWc+XePPX1Of+jslvI2wsbL4MdldyXrqFT3vr4SlptFSVWOOdlgwJpukZ4LwBWAOHJC4Gqd5z9ERHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JjiTxuel3+8hFv2DiBuw2T9C0cmqdXd7/6ckxRYdjSk=;
 b=a/NKF6ZReuZhws3pinjYjNjnL8Vw71AjGI6J0oMR4APzGEAzRihbWemvKHkOGcWkvA74xuk23SjYwDSQgwZtpiDBkxc6IxTWUfemw75e/+HekTnWgJgnK9MOq35/pQCeVfwyOA9rQrjy4nSYBopUWgz6gG6H9uEvj4lYk8785AzhyAM6JdneK0hbLoKiqX5aZDiDErK26SMTBAanov2YGG0/FOP4OlvQfAAkV6chdLBYNnNujVn08DNussGDRZakU4WZpBmlrFvHAAEvPIA2y2G35eyiuc2K04K3GA6pCaKcWY5Af9QhLX0rKxj8jPVYOWN4mqzDX3CO2GbRJ2DzQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JjiTxuel3+8hFv2DiBuw2T9C0cmqdXd7/6ckxRYdjSk=;
 b=OD77y6bIw/snaj3sikIuYuLX9KvzLUWF9ypyePiEcpzOHXWuBZDjx4su8tDW4OE4aBMpy884xEKNyKjGVYhOJfgjQVkYWofkY5XKaAg9NVWZCpYkNoRGj1M52Fg5HSyujDoLMMfS92TPp5Rjt6xi778olRjAymuw/wknfTCVTPkiZGNvEOM9x2yzh8a/VK8LxxMopt8qUZvclYKqk2/EoZd2ytarvIcmS3LyZXQI8b8LpHPQ4i6zH9s22Gu2iBggk6vJbQt055zSZ1NoXlAYUR0zKl7pE8n0VO4Y0PaAPZR7IIoC2D8sQ2yYJzN0LxZsZLu6H0G8KHQ/T3H7DQe/rQ==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by AS8PR08MB6406.eurprd08.prod.outlook.com (2603:10a6:20b:33c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Mon, 13 Jul
 2026 15:18:48 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0202.014; Mon, 13 Jul 2026
 15:18:48 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/1] leds: st1202: add hardware-accelerated blink support
Date: Mon, 13 Jul 2026 16:18:17 +0100
Message-ID:
 <GV1PR08MB8497C5B8CEB2CE19743DFCFFC5FA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Mailer: git-send-email 2.55.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0350.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::13) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <20260713151835.635908-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|AS8PR08MB6406:EE_
X-MS-Office365-Filtering-Correlation-Id: bcaaab4e-cf97-45b4-4160-08dee0f209bd
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|23021999003|5062599005|25010399006|5072599009|37011999003|6090799003|24021099003|51005399006|15080799012|8060799015|19110799012|4302099013|440099028|3412199025|40105399003|10035399007|1602099012;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V0E1UXc3VlF4NTFLNHRTYkNYRW05bnhnVkJ5dlREMW1oVG5LbTdRNmFiSEln?=
 =?utf-8?B?eFNheHRwOWp2TGhvTXFqc21ta0NHRG5GdWtRU0wyMW1jNEhHcUxCdS9QeWNy?=
 =?utf-8?B?QXBBRTFRWFBjQ2I4NFZuelN5azg0RDlENW5JSmRTL1VlaEF4VGdGcFJSL1JD?=
 =?utf-8?B?WHNzNnhpRjhNbWFCNi95UmNCMytvTFFvemJNdEF2Y29sZlpqOERRUHhSSGVT?=
 =?utf-8?B?czNpTmYrZmxyNGlncG5ZUldyWG5sMmF5NWhEOEZhazFKZkFDR2FvdDJycjEx?=
 =?utf-8?B?dEVYeVg4bFBqNjlkZ2NzL1duUy8vSmswVXI4amdlWkdyVzRqU2dzeExzOGNl?=
 =?utf-8?B?Rk1HV1ZnWHk4SUNTNzZFaVNORGJLbmsvV3diMklhUnlZMGcvbkYwOXBXYm16?=
 =?utf-8?B?WnZiV0VIcWZqUWtQdnJ2b0FYWlgyWjlTVEZhb0Vya2RGNjR5UGVWNHl2TU0x?=
 =?utf-8?B?aUkzUDBnMDZwZThzT0VaZFBpc1B4SWhrT1pXS3A5Q0k0TDJLY3FtZEplclNP?=
 =?utf-8?B?OFBmekVrTjYycE5YNzJINHdidWVYYmMvQjdKeWgzcnVoVm9PWDNQRjhMRzA2?=
 =?utf-8?B?ZUhQa3VSWFg2UTlGWk04dWhNbTNZODFzS2NQR0VJcVZ2aE5JRTJqSC9ib0pQ?=
 =?utf-8?B?OU5IdE1ETXJzOVRPNFZIUXBNNy80bkhIT2drdW5sTWRwR3RaVjBnN2F1dTcv?=
 =?utf-8?B?MGs4UlVzb29hR0ljOWNuNjBjRWRMMjh2bHVJMnNhRUovQXozSlBBVkgrUHRo?=
 =?utf-8?B?REdpamdndHkvL1BrNUc0UUl0RW45bkdla2dEbHM5bW5IMmt3RGhZK1VkTzd5?=
 =?utf-8?B?U0tXaWh1UFllWDl2SFBYSzc1WTViTmNUeWF3ZU9JQm1xRUMzUzBjaHFjalZK?=
 =?utf-8?B?TTQ4NU1DUUFvSTk0NlMyaEFLQ21QVTliclNGMm9VNlJGY0hJMjZyQWlhVWty?=
 =?utf-8?B?ZVRBWVowYnZlOU1MQy9sbzh0ckloQ1ZWMmNRTDJTR1dsQ0lHQm04ZzVWcTFx?=
 =?utf-8?B?MTN1by9yUG96a3Qvd0RXR2FSOEhYVjhja1VjK21JK21yeDl6VVFLTWVITWRQ?=
 =?utf-8?B?WGoyOGNHUlc1NkFXQmltdlBvL09lQWVUT0RqY2RtdUxyU2dYQXBGWDYwOWIy?=
 =?utf-8?B?bTJXejUrNzlzL2k4VzJ3aWl5cnRjR3lRaWU5c250bXkwVFNEWVBjSjBERWIy?=
 =?utf-8?B?SmRCc3hBaWl6M09CL2llZDZvZ09zNWVJVDBIblBDWHB1K1JodXloblJQYi9Q?=
 =?utf-8?B?WGN6L3dTaDhzRkJqMTBqVkhZYVlxKzhXQnRpL09lNDFxellzdEMvQ0JPSVdu?=
 =?utf-8?B?ZkwveTRQTHF3T3hNSXlHeTRRUkxMMzhIallzYTdycENOV3FjekZGWC9iWjBK?=
 =?utf-8?B?UjlHdHJ6YWZPOTF3cXExYUxLb1RFTnN6T2drU0tTcWJrUmplbFFCYkhvYkJQ?=
 =?utf-8?B?QlJQMzBJWjJDa3BEazNlQTQvdjNsYmZaRXZsNWt4R3BEUUxhYTVjSm9RYk5O?=
 =?utf-8?Q?3xgXyD3v1/dp5FTmeMw4XiykDVu?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZnpVdWxJSkplbWpyeWNCcWd0NGsybkF2YnBsOG5veDV5OW5WTHNMc0J6SG5m?=
 =?utf-8?B?bHN3SHE3dWtZZm1vZk55LzFzTnVUbHdBQnpQd0prRFozZmxzYTZhRm5XSWhl?=
 =?utf-8?B?YlYrQ2FUcXB4enoxUDBxYzJhdFRhWE1MUE1CelRLOUc2Q2pZSW9RcGVCRDh4?=
 =?utf-8?B?R1Uydk9CL2xGa09JcnRQdmJMdXdzRVJqZVFUVnF5YlRPRUllNzVDUFVDVDBa?=
 =?utf-8?B?VVBxSUlXOUEzM1lGTXBTVmxOYTlqN1Fod1E2RmRLR3A4eFdBbEJlTmpQcy80?=
 =?utf-8?B?MVhKd3crLzJtUStTU1FHV2Z5c3V3YzhZbzN2bldHOTlQTFBsSUJhMTVkcm04?=
 =?utf-8?B?eDBnOTVIRG15cFFDNmgra09yZEZLMWdReDloblFOK3JyaXY2VlRKU2tMRVVL?=
 =?utf-8?B?cTFkVWREQy81Y2xxRXFIbVJnbUVNMDhKTlFtNFIzbERBbGpDVGhwSFdmTTAw?=
 =?utf-8?B?M0FtUUd5Zk5rRFB1TmdZRHF5MUFFUUZsbE1kK0RiOWM1UVgzZlJZWTU4S2ln?=
 =?utf-8?B?SW1FT3pPSHo1QS8veVVkdHZ4dm9jTjRzZlduTDhGTE5hcUQvV2tmOXB0Qm4r?=
 =?utf-8?B?enp3eXlyZjhPcy9BZkxGQllOK016KzdEd252U1dSYlNNQXREN2pkcHBnaGh2?=
 =?utf-8?B?TjRNam5ZdTkwdzVMS0JpL3VyaVR3b2NndmxpREpTekhQVjNmNzlUTmwwSkhr?=
 =?utf-8?B?LzZhamEvSmhPSThuaXBnMkdCTmhpWUJITkN5bU5pVHVNSll3UEJsU2tRUWxB?=
 =?utf-8?B?SEpBVzlUMjYvZXpOdkhqdzRtdzR0N1p4VmwyNUU3ZWhKQzZqMTl5QzZ6cUI5?=
 =?utf-8?B?c01pMEJEbCtYWXZod0RESHI3R01jRXA5dVpkekFTc0IyQmx4dkRUSG9zRHNS?=
 =?utf-8?B?Y2d2MjBYVUpJRmVoK0hpWHBySXNnN3AxL1BTTTVmZEhIWVJjMkVtWXByVksr?=
 =?utf-8?B?SG9wZ3ZRQ05WYVlFeEJVRHpadDhYYjlRK25TVjRVTDdtSDZOV2s0ZkYzZ3JB?=
 =?utf-8?B?b1JOYzNaMEtLS2VNbmd6YzB5Njh4VlRjOUg1TWxoemZmOU93T2ZaTGhUbE0r?=
 =?utf-8?B?RmxZVzRPMnZIVVhmT3AySnk3WXZzSGdhaHhhUWxpYVljLzFzeUV4Slk2VThJ?=
 =?utf-8?B?bVE1cXJpbDI2TFcyR2tKY0JVd3E5RXpMb05BWHNEa0h3elJXakl2elF3bHIw?=
 =?utf-8?B?UERoTGY1NFdiWlhWdlN0cllZRGlPbmpqT3BTeXZmRTFCKytYeVl6aU5oaXM3?=
 =?utf-8?B?N21WMEVzQnpBU0lIQk0wQWQrQ3hYU2l3VllWWW1Bb1JDcmJVdnVLbTNlRVBT?=
 =?utf-8?B?UmxUcHMrV1R6clZGSHRkbjBXVmRDOGNscjRKUmZ6aythWHg1ZVhSOTZoS1h5?=
 =?utf-8?B?S1B1L3JzL01zL016ZldNNHpFUmpTZXd2dURPbmxYWDVVbVJFY1VUQVBkYzY0?=
 =?utf-8?B?TmE2Y3UweUlEOGdpWGZTNFJaYWJldWk1RTYwMC9QNFMzVEpKcmh1WkIyWWRw?=
 =?utf-8?B?SEJwTHpjUENxTEJKVTRIVW0rWTBEY3FLY2NwMFFmcHFNSWVUakh6YWowSXIw?=
 =?utf-8?B?aHdLWGxlQmdpTjZpNVdjOC9xUm5PQzhsbE5jbEZQcDBBbkRCNmVJRHE2ZTlO?=
 =?utf-8?B?Q2VPRExUaWg4TlYvTkpUKzh1N0F5cy9xSlp4aDZxbDNCYWlHK1U1ZWZJYmg3?=
 =?utf-8?B?K2lMaWdlNE44TVJtM1M2UnpKQ0FpZXlVdUlmakZrN3c4NFdBbmZyOCtNVmpG?=
 =?utf-8?B?ZVRkRVBqK0ZiNWNzcmR5SWRBOGZUQ25TQnE1TVJVbTZoVVRVQzNJQ1JMMUxU?=
 =?utf-8?B?NjZ0OGcyRVhKeVBZYThCWHJ4ZFQrTzdqUGd0MjBicU1lRU5tUFFsL0ttU1JY?=
 =?utf-8?B?dVhxdyttNlpaQktRWGo4bWJvQW5RSDRCdjh4c2ZvbHJibU5HMmdiek13RUlt?=
 =?utf-8?Q?0vEpS54WIkuoCXeT0INTsLd4IlE79EbN?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcaaab4e-cf97-45b4-4160-08dee0f209bd
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 15:18:48.8384
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6406

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

Manuel Fombuena (1):
  leds: st1202: add hardware-accelerated blink support

 drivers/leds/leds-st1202.c | 82 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

-- 
2.55.0

