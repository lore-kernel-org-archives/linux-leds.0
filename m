Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazolkn19011028.outbound.protection.outlook.com [52.103.39.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A19403E9C;
	Thu, 23 Jul 2026 22:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.39.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784845415; cv=fail; b=OXIv23v0ovTdrBTAtEUjhBTsASytqOReekee7LZMKXyO4yPfzvG0kgfGIViCiK5Q6PMKWMxS5tAA81dBOYNf8RzCBrhS7nQzBddzbfe5hX3HUd0dA4nCDJ8nmVzV8d8c5cZiw4AhcCW2npaFcnr0QA4oAo7YIPkSXFhhgftjeUg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784845415; c=relaxed/simple;
	bh=JfPfSXe99zrXR5NY+EAxzlPMCJ9f8QLZxxZkEEokxoA=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ksCpPp0Lkd2NmlMyumTTrfT5ji0DyRYl5bnxxFS4+pQhVdY9eMt77ftiqI/eRtYR6BiMttmD/RrlwNDOgmt4HiKRGkGSPvKQ8kjjX5uO4ORll3oLpgEYN3IoMZwU2J/a7oxbnyIOmHjyhD4kdmUSOAg1iJm3M5bnnucDypGcoKM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=eX+6oX02; arc=fail smtp.client-ip=52.103.39.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="eX+6oX02"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hD+NqVOVwblVxtgE+M5ilPlodbLf/OUfaNFp4LRn3haWUIsyk0TzyQGrk5rG2g2EQ991Fr8Av0DJmVscCxR1RJQRIDDvUJVTRvRj1k5h38xmdV2tQLdkjBsNhzjzeWY9tBR7EKPoRWkzK5FwS0ax9AazquGvW7wuc5FoxHdmpnqNh9mZCiJeoaqK1TVi1UjoayQIHOxexO/1RRexESyQxZ1GTdbzY7lue2c+fiIF9uOiZz8ERC4bz9fXE0BwRF4svNEGwJVN3Yr2pypLb6+v/xasqomAArVZ6zimDC40bcaNxPjmPZr/IkhBy5VRISmpgQmzbJnyB1Jt/JNiftFD6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qRWbgOlsSX3Aw+SInLl+KCR7OQN2Zj30BsQ5k8QY46A=;
 b=Ii8ERbh9lii90AQ0aor+67DXmI7TYo7HSgdErUYE4jrpv3d+yCl7tXlZ2SEtzByA17VRbV9CstbCI+WAwaFV1dhgzCG6Vht5bU29Bwjp8JR+tjKbR0EIFJhhRKhTf9vXGRey/0W4XqbKmEySV0Egs8IDyftyzW9PK7mTXA+9J2yEJ7g3uTNoYpAqE/3eUbwkKgTHoHc6Nv/fkwr0P5NYM8Aiq3/fy3GIzbu07pR3Wq0f/6czSwy4w/g6v/4zHXaKqwd8GSSYgfsvrJRv4+WHhwj/zMSkET/hnymL7StPhnReai/rjmbC3h4TUEBdhhHuV+b7/GeUV6ua8Y3UggN3pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qRWbgOlsSX3Aw+SInLl+KCR7OQN2Zj30BsQ5k8QY46A=;
 b=eX+6oX02RwQiJbqg72dnxVE2hYkOg2TLbUIKpfDb6T9EV4v1BMHF7IThjYGhNJNIboVIGgL7Qoi8n9fsaUHWpPz2be58cJjw6WPQGkBvlvKF2kiNW7FT6oJYi/iaIZu3Akxmk34SU5ByfDaWFxWzhLyTHFU4/+L5PItClmKu5ioBfqq82kXANOexWZehrr7stNpMBmIVEFL9Y86Co1Nc3lKnl0pHD+xa38mjQQmfWRWBGCh3qxZNga37MtM+Dv/heAORuz9m+f0NDJgfvs4QIWOKnhXGefjfVQdBuCULUi4U86+J9mJYbBjNoktJdAzhfbvI83hYDjH/eSu1sYmctQ==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by DU0PR08MB8688.eurprd08.prod.outlook.com (2603:10a6:10:400::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 22:23:27 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 22:23:26 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/1] leds: st1202: Add hardware-accelerated blink support
Date: Thu, 23 Jul 2026 23:23:13 +0100
Message-ID:
 <GV1PR08MB84979858573735294D41A189C5C02@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Mailer: git-send-email 2.55.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0015.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::20) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <20260723222314.324530-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|DU0PR08MB8688:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bc1dc18-dc11-4c7d-c278-08dee9090402
X-MS-Exchange-SLBlob-MailProps:
	laRBL560oLSPhlJ95/U7v6W/AahuugGavgrCH8wAY+b2+XWDF04sfVoAb57hKzUn8makw32lwztkY1Av9zXj6z/oKzwpdvQCeGXbT9zZ8IF+rGgY1qIvci+lv13j+ydmyexs4zzr4j1IcHaukI14NdcC5moOLjyLk3FL91+rCNwnBG+rf9BrE5q8dJmdjbGgB0Ew0qCLs5KbghWMSnvaLfj0v9TKU3Jgc29W+Twhk0thMbZOGF3UuRmxHOyNmudtSwpdnblm26sbPhW7g7657YF6+ytNVZ3FSCRtM2w/y05dydkjA8mD+goUik/UoYmINmOCKz+PoBcg9ynVbO6R5+l/A8ilDorA2iQv9nO9w7vDpDvvQx/YWIffCu0QIK/Soo+fXYNbrYkyY/9rCKmi+dHaXVbGsw63y334mSYLhmierWtwSLJdF74wNWWO1jW6vj9RSiiHcuhR8sUAMsWgpcwKcqEvy45fAT1SfzxfS5x0WXLCKFOJsCpe8RNvJhdW7I0lXDn+ws6+FXJ53n5KhONsOuVic0SM/FgAGnAFSBfZiY2r7GrDvJ6x0DFCeMkscWNVh3jjGKf1zXA6Jt/5kslkdjmRqbMzRGlzggsEAp1lvMPRCS7LK9lZP7dIxtNCYUtaDTzv8/a+r4yF17/7dOOhxMNhBBfrdWYyY2WAdQGNk6nyEnfYlSc9B6DfCB1qqIEpS74UvHriUxCjP1ZVVUEqDPoJN5hKaxacEmjEZmsWG6kUAX25YG1orm1kUjy0rc5TmhxnIXJLyptCjWR9bGcRjUafbKUa
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|25010399006|5072599009|23021999003|37011999003|19110799012|15080799012|5062599005|8060799015|24021099003|51005399006|6090799003|3412199025|440099028|4302099013|40105399003|10035399007|1602099012;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WEhmN3NZRUk0TnBWYW02UStqdWwzODhxbW1GcVhZYURaeWdCbktKNzI3UlNP?=
 =?utf-8?B?ZXkwbzJwU1RVb3ZlVHN0QUtvOHppWTlWUEFmNlhaWUFRU3g1czk1NjIvOSsy?=
 =?utf-8?B?djlpVThrWlZONE1ucTgyZG1wOFdacVRzUVN4T2tJSFJQdnFNZkM1OWpMV3pk?=
 =?utf-8?B?SDVmNXY3TDlpd1FwejBYNmtXWG5Ra2N3dnFFdTU5cG0vd1BSR3dvOHpsNVNH?=
 =?utf-8?B?L0k1UlpiWVNISnJkVy9BUXhRQ2oxNkl4V1VmbHIrZmxBZHpSTG9VSEVONFk4?=
 =?utf-8?B?bnEzV09kYUVDemRPUzV5VDBEMGhXalBmanNnTk0yOWh5NGtoTXFZUG82Tzlq?=
 =?utf-8?B?S3U0Q0Y0T3dMSXNGcXZjdWVpZU53OGg4bjlnNjVSejZoMU9hNUo5dkRkdm44?=
 =?utf-8?B?R25KazNLWW1vakpaK3VBckpUT0lOVWRNeEpoOUdWSDNaSU04amx1YnBDWWtB?=
 =?utf-8?B?NVEwZHhpNTBYbG5BUXU5eTd0dnJYdml2TVZrV1VkRUd2WHhVSWNiaG9maVlo?=
 =?utf-8?B?VHhpS0dGMFV1MXBoL2J2YVVXNHFxQmVsZGxmTTNibGxnYXVwaTNSSVpnTjZY?=
 =?utf-8?B?SUZ3SWxOQ3I3ci9pYnliN21DL1h1RHpNQWFMWGpqNmxxQXJETVVHamFyNWQ4?=
 =?utf-8?B?MExiUmVJc1prK3VHUWZnVXVqOXRMUjNCQXNudFlvWW0zaTZ5cWZtc3pkT056?=
 =?utf-8?B?SXd4RVJpblk5end1ZnpxbWk0RmhPRzIyaG1ZdjFXL0daamJHODV4OGgxNlFz?=
 =?utf-8?B?Mi94WC9PS2U0L2VlWDlNQ1lob0FoQzRscTUzSHFpQlZsUHJCRWRDMm5iQ3NP?=
 =?utf-8?B?bzlLYlhJVHVXQUg4dHYxU1BrQTZGWkVHTFdRTmVyUnlyM1FLeVdMam5pQWs5?=
 =?utf-8?B?N05Zd2VLam01TU9ZUkRIS1lSQ25ocms2Q1hMbkRxaWZGY3RxVEhKRU9HeTkx?=
 =?utf-8?B?N1Z0OEwrWUJRbGg4TmROZW8xWU11a3lhZGQvSjNuNXZVODc2NGg4U015M1NW?=
 =?utf-8?B?eE4wbjFnanRzT1I0ZVNDUDg0M0tLSnZyRW9DUUlUNGJ0Ukh0eEFwdXZ1L1dy?=
 =?utf-8?B?NkNxOFZzZlBYUnV4eXhBdndTRlFWcVduOXN2OGJQZXVtQ2dsRGxHNmxMRFMx?=
 =?utf-8?B?ZVJQV1RQQkdrWENlRmc4VzE5bWxjTG1JNDVPbFdVV1VYR09nS0loYjEySElE?=
 =?utf-8?B?dmkwR3pQNzJDTXZGOW1nVW1jRkJHd3RZYVhWNnhETk9ZSDFuRUVUM1Z6U2FG?=
 =?utf-8?B?M0JVYm9OQVhVcDV1bW0xdlB6blJlVm93SFpDaHNiemtTTURFeFdIN1dYQnRP?=
 =?utf-8?B?TE41Q3JiYWlFS0dNSEtIeTRvSWVGK0Y1MEdCQVl5aUk2QUZ0Z2JmaGtJQVlz?=
 =?utf-8?B?OVVIV1dKSW83UVp0ZkZhaElyWWM0dkt5eXhlKzNYS09talhhcWNzRXVFR3gr?=
 =?utf-8?B?enV0V2c3ajhEZWRDSUV6cGJ2VXlib0UzV2IvRHovSTNiN2JSbExRYVFTdVNY?=
 =?utf-8?Q?PXOBwfjwYCT5hIcUAbWuuHK2heq?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SnA3VWZ3WjR3Mm45ZXNFQkVFcVNNeVhQMjlBQ05XREVJTE00b0t1UXlDMGVO?=
 =?utf-8?B?WTJ6a3h6R3VISkJlQXZ1dFVMWkZ6Ykx3amlFQTRmajZRMkY3Z253SGNDaVQy?=
 =?utf-8?B?OHppUUVhcUZrMmQ0a1RDQ0pHRTBubUJYRkplanZ4OVE4Q084VitKb3p0SWha?=
 =?utf-8?B?MXdXejZaU29qRTFqb1d0N0V4RmI4R0ZjWmRhdmlWUjdJSmFZbmxsbm1sNzhj?=
 =?utf-8?B?THlheVZNbW40VTV3WFJjWit6SWtuMFo0VEtnNXRLMEtkSFkzREd2Q01GaVR5?=
 =?utf-8?B?Q2xzdytWUzR1eElSQ3F6NkhORFNmTW1VM2tEQ2ZiS0tsM1ZWc2t5NU9uT3dx?=
 =?utf-8?B?VldrMS9nM1psRlFRUEN3ZDQvK1dtK0NMRE9FUG9EdlFjYkU4VHNNdXJyQnVH?=
 =?utf-8?B?dnBzNm1BVjFwNDBva0tPRzd6elJwTzFac3J0UE9yTmtYRnBVajlidWZuTHJY?=
 =?utf-8?B?WURNcm44ay9lZDEvVW1vQlh1cEF2ZmVoaFUydFBGa2s0VVArWXBUckZobmVl?=
 =?utf-8?B?RWdJVkFqYVh4M1hQaWk2UzVselE2ZUY0bU8rTVR0empMMVMyUkVvN3lsV0hE?=
 =?utf-8?B?c3hLMU9nMnhuWlFzSnV3QnZzLytPUFpueEtTV3BLUlZGbnpMNktLbkx4QnpZ?=
 =?utf-8?B?WGx5Wm1TUjlEdEorTWJJQW0yYnVoVmUrSUhDZDJpdjl5TTJZVCtHUzFBRUlr?=
 =?utf-8?B?SStHM0lvVXU4Z0JFRUtRa0lLZnNtN3lUcHFmdTFtSzlsOHc4bWp3RjRrWmkw?=
 =?utf-8?B?OTRUcVdoSXpTYVdUWXkrZjVTTDgyblc1dlQ3S0xER0RLcUVFbUZubGxZY1JO?=
 =?utf-8?B?bURhck1FeHIrUGU5UTlYdFQxSW1OMFBaOUFrcldqUHJxUkxFc2FOWWFoc2cr?=
 =?utf-8?B?VDJ3VmdFeTBId0hXQ0lOZVNjOU1PWGlCenB6OEp6aHVRTFVxVnZxV1ViN1R1?=
 =?utf-8?B?cjBjNlJRK1FrZEM5R1ZIUkgrVU1sdCtxRm91YTVrZlExd1dOMmV2MC96dThv?=
 =?utf-8?B?Z2V1WUdhbHlISDIxM3NUcjM2K2lHRmEzWVh0MWFucHpIUkxyMXZia2NVUHYr?=
 =?utf-8?B?S1NnVFhFTWhrT3d4c3BDUlJ3eXNyV1JvcnU1QU9rRXpyQ21uMVplYndCWXQz?=
 =?utf-8?B?OU9HbjdxbmFzQW1lY3pPcm9sYzIweG1MM3lKYzJ0b2VQa29RMFlpVWJPa01Q?=
 =?utf-8?B?WWIxcnVEa3FDbWJNL2VRMjVRcDVwTTBxUHZQckpBcTRGY2o4aEhKZEhsaERP?=
 =?utf-8?B?UTN2Sk1sMzc2R1FoNWlEN1NZRTVqVytiQTh5alRtMG5GekpCU2ExV2FlUnJZ?=
 =?utf-8?B?cDdUSXZ6ek9WaU1IRDZqaVBxcVNTNmpDdkF0K0NHaDJhOHhmc3VDSnN3eitD?=
 =?utf-8?B?OXlSbWx3dE43bm9lZ0djOW8zNUhTZ2RUckM2cGJ0eGVSUi80bW44S0Z3cm5J?=
 =?utf-8?B?QTJSdVBLRW5xY1RlL3Mwc0k3aUZzMUFiOHA5MXJsamg4WlYrMi9oVFg1bzJq?=
 =?utf-8?B?ZmNCdUpMNW5nSGJVbzFXUFZUeTlKeHA5YllGYUhaYkJNL2F4dkc3R3g3c3Fq?=
 =?utf-8?B?N1lyZTRDcko2bzVibnNmR3lQN1pGdDl4aitjZDBudzhqb2NSczEzWHVYT3Mx?=
 =?utf-8?B?SHpjVWZ5VG1ZTGRyUHFFKzhzc08rR1pVR2FDL0U0c3NZRWRnQklXek9qbWp5?=
 =?utf-8?B?NmFmNUxlNTJ2Wlh0ckdNUVhGU1N3M1FXOHBWd3EwTVRiQUxwazhLV290dzlD?=
 =?utf-8?B?aHV0WlJid2tab2ptWmNKTFJiZkRRVXFVZjhjRWwrZGlhZG41N2tvS3NsaGpl?=
 =?utf-8?B?Z2pKZUtYcDZ3R01CZHpDZXBMb0I1MEc1YVNYRHkrSGJMVk9vd3NBZDd1akg4?=
 =?utf-8?B?NlMrdnkxUkZ2Zi83TDI3Z2tOWVJ3OVdnM1JCbUQ0ci9tRTNSMFhNblZYN1A3?=
 =?utf-8?Q?Qof75QkczoHfHlAfQBs5GfdF2X+cG+0G?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bc1dc18-dc11-4c7d-c278-08dee9090402
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 22:23:26.7962
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8688

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

--- Changes in v2 ---

  Use short-form ternary for default delay substitution.
  Perform roundup before clamp_val to ensure rounding cannot exceed
  the hardware maximum.
  Capitalise commit subject per LED subsystem convention.
  Drop Assisted-by tag per maintainer suggestion.

v1: https://lore.kernel.org/all/GV1PR08MB8497C5B8CEB2CE19743DFCFFC5FA2@GV1PR08MB8497.eurprd08.prod.outlook.com/

Manuel Fombuena (1):
  leds: st1202: Add hardware-accelerated blink support

 drivers/leds/leds-st1202.c | 82 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

-- 
2.55.0

