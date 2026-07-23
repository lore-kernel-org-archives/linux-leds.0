Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazolkn19012013.outbound.protection.outlook.com [52.103.32.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44525400DF6;
	Thu, 23 Jul 2026 22:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.32.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784845043; cv=fail; b=fWkkPmbgnMG60ES/SxjgDx6lLAO4l4Dl7SJq8/kES7Dql2ANl8BBasFDrc7Gbdbb9sbeLppItPXPV61it4nJ6tRw7QKxHDWWiY6vu2IMzAe39+A3jBzrXY4zMbAbIkCVuTvfAcpLd96V+Bps9oVitzaIVTcsRo6RX4yDB5OtW0U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784845043; c=relaxed/simple;
	bh=/n4iXmKLVSN/oC23A+vOZI2eIA2PHpBShNSSuFdLL/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YCZf5tij+b2iaMcqVn/wYXdvqLfrPP0EGOPJQbP30GXrqZWzYEC1cKxuE83OsLB7hcdzplBpq20gWmNEwHZWfnyjWzh6eKI/McsnjiNZz5Ci6b98JsqQfL7tUR9FW1XpPNYbjtvhQuXlrrag+yGsnT0vuZJo39bY+LIOdVjIwf8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=CTYBc/CZ; arc=fail smtp.client-ip=52.103.32.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="CTYBc/CZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xZHczYJVwvSpfR1beIhg7ameA95eSMZpLk1c18Y4VCXV9gxKd30xjZvxfSfxdp9K+D41zPYMvHnZ57KOmOdyki4pOnw/aU3iqMrCDS9AdsmcIXbSUKMSZrJ0kb4kPrsdVp6/ToeSN0XyV3xAZBi2BaW6dcj+B3hQK8Z8TJzFKGW5OrC5exfVktEm1RDhn9Q57aMUgjE+P/96DqUsHt2AsdnMQwgBuEFIzH/HchOUArPGC1W3Cu6OuaSfbGmGZbqGMPUJaeRKPpknL3YtVrad9W7uf9i7bCy5AGNJFIw6jFMqXynA/mvLogISVG2t8EdL4HfjWuFHYyEodvaAUToXsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rWE/Ej8OXTW+iaY6HlST3Jyz41BjOK2yixtWf7rhdsA=;
 b=q/IQOzLYr05bdLP+LpMsT+xSGYS/3gUzDxH7guPiWVONG/1niD0OZ58KsF42GBzLaHc3YjpBmj0g921qMo/TfbIfHsYBkwSH/VJmM6+wfvysbeVnYwdyJS2N1c40wIRv7gxO+noToDLwBPf0h6gd5wUF5J/MPX+gL3Dde7QSUkUQKP7CUM7G7iblVThdGZ30r1cytVBUyXPHm0q2RPkh937Asc8BcgrUosujvvVEY9j3/QJGNdrDoaqn8LUN3OKgoIlZLhsqVS/thTnZki2h6yZv0Yld0LLys8cUGd2Fd7eY6GUbApqYr5PKyj80rKoUzyK7KVH2mjDrjEPT9ZyQBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rWE/Ej8OXTW+iaY6HlST3Jyz41BjOK2yixtWf7rhdsA=;
 b=CTYBc/CZBru9zfcZGVkz64zJUOJvAXm26rwBrg+HhuP7LnhxHNeDJWFuqsTylnfzX+bCjd9tlAkHw/aJ7lliSvcUEBvBN5aFDrca1ZKwJVOBKeJ6zYPhqk5tz5ZX/7+aZOjo+RZmcYQrQmdIz3AT0rq+/4QaUAtIX0iyJSVjCT6yTMoHG7orCcJ0m312kJuodmRnuEDVW8VdoyZa9E8IPHR3k5W12naG6Eh25LgxhwwFjOJAaqkw8wAbg/CZZMBRbj9ApGhMTbIr8bjK0V7VZG/9tR3kVYO1iZTQj20uUh0z3JDtyV4dWmOHW3KJTvFj0qli835Y2EutIFdUxzXelA==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by PA4PR08MB7521.eurprd08.prod.outlook.com (2603:10a6:102:26a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 22:17:16 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 22:17:16 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org
Cc: pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] leds: st1202: add hardware-accelerated blink support
Date: Thu, 23 Jul 2026 23:17:02 +0100
Message-ID:
 <GV1PR08MB8497F18EA89C954C987B3FB0C5C02@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260723121339.GG3363113@google.com>
References: <20260723121339.GG3363113@google.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0207.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::14) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <20260723221703.289909-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|PA4PR08MB7521:EE_
X-MS-Office365-Filtering-Correlation-Id: e4921947-904d-4959-f43f-08dee908271e
X-MS-Exchange-SLBlob-MailProps:
	laRBL560oLSPhlJ95/U7v6W/AahuugGaJABjETuCNzIUQVBtxiFLKBcM2rZUFrLeTm6JhkfPF0RgIfyomAxdcwYD7MAg7c3rUvl5I4Pe46nn9FhFGE/+lzaPPH1jpZPmJQ8BU3vpv1jxkZnYWTqqJyQRAF//CTSdjQPQnde/jsat81Z5Z1iRVU0lswKOMd3572Ngj9W1vLKgNqc2cel/CWSAwMJof7cwCStWgMbSVMaa9+da5YApvUxyud+wAiUxgOBy31S127O8ZzHCfFlzMx8sCN+d2R0QZ9730YZjRHi+J3MNXYPMRp9XeO7J8Gs9+onV8OAZDMq/1Sw2POiLNCMXPNZldu7nHyHJvA7/P5LKB8+1dUAm+Js1jO//IImK8tf6R76/U2agR5IwhX+f+598OIGJAkDYnaPXeXfKEUhE+ujbMPR7peWUA/zsBJKkeS6mEHuEe7d5onsX03nQsXPyJNHsFwcqs1ibwDOprQtOu2lJF2xzfJB8AXZyUuvtHqxHMWtke6o9mRpiVnOeYGC/H29bLRHFAhXh6miBxJIxPLJ4x42hoNyWWZy/Jc77MRRC+IVlDPhopcbhJuKEWe9ioLaHOARj3fSI2d4cra3l7Xn3zRxuwWcFtBcJciLTsRaLleeV7oc8prVae29hgfWyvlrwd7rTBcQr9tVSCupn5RUNcg4L4Kyo1yVNjdu+hDB2ly3rfPQkezA1vTv9ivIVRWBmpW/JjuQQOOi5iR1rvi0fgxGcUvILL8kBSE2JXSl8RYBrdcB+k56mubrUkZS9/6uI+65l
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|23021999003|37011999003|51005399006|25010399006|5072599009|15080799012|24021099003|19110799012|8060799015|12091999003|3412199025|4302099013|440099028|40105399003|10035399007|1602099012;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?90NZy+lYpGro2wqHcmEai/aS2Yj0rwtjerIMV7OPw5XyFcoTHXcNMwm6Exu2?=
 =?us-ascii?Q?avUot4Ewp7D8nFTprv/R4eIdRk3HDmlU0J8vSBMRvVDmZg7S63ZB1vJw/GBh?=
 =?us-ascii?Q?L34o1Y4b15FoQ4GEh9KFI5KyorcnB1E4quOJ32I5uam4jXZ62+wJ46RUC5k1?=
 =?us-ascii?Q?vrEKtgSFfzRgMnp6R8+qLC4ryT0Gee7CwQgA6Ab5C97iE04k20aSf+E5g6S4?=
 =?us-ascii?Q?ih7WKt3x3xVbmdDJOPIYhd1NSNfsguLg/qZ6J0OWU76jhDvi9FVTO2/0Wlme?=
 =?us-ascii?Q?9/40BaN+FLOqmJQFAeUIsmYXeBitpY7SKQdcgCTRWS0xn6s0xtHMTza1Hxo2?=
 =?us-ascii?Q?9cHowMlcMtLk6e++0R7HDyPjtb8hmjkV5FQKxuTbGjg5zN4wwqzlNzGXTU11?=
 =?us-ascii?Q?dvTraqdwSeMzJ0uTQT48H/0fcxbcvl79qdKtuyN0qJrkTUBMF799QrTxotJ0?=
 =?us-ascii?Q?9R/ugravg33agifkybPQZzZYSbjv6qlefZDsMJixfxQnQLEZOkafr0GMYGRH?=
 =?us-ascii?Q?XfnZXa0e4lQ/7xmzxfCw7doNouPlZSjXGdDoJDiN/HLuIs2ypz0x4UbmOqyF?=
 =?us-ascii?Q?2InAzQZi5dKmudts8YBNVnOOhh7K7k6KZtNguDvdS+Zj+91IPsRYNMA5b2zk?=
 =?us-ascii?Q?+Ur4IrYSPCkjMHELscI0JPwRzl3pYZzIcvtx39jgHh7mm57aq5tEgQxEr1qf?=
 =?us-ascii?Q?apTFDnz3kMMg5GYN6L1nxmqBwX3l22+4mObQBAU6/xiFnNwsbQQ8qnOvjKMa?=
 =?us-ascii?Q?yQl5JyhVnTZ7CzgSNwOSUVLjfAhGiur3IokSwJiLkMUF7RU4QOcmNPm3lSPP?=
 =?us-ascii?Q?EwdZgbsOb60qruZPdLcNZ8CZBddFHIgBfD2lhDOfLWIAV0zc/MEngftIWABD?=
 =?us-ascii?Q?7P18MtCbfzrtqW63RPW9/oqQY6vpWpakAXPXv3yugB16IvFiG2XDUC44KWBE?=
 =?us-ascii?Q?qRqWwE15fkvIQKZ8jiTZhvivD7BxMnr8uavnxPNJv9P2j9p0fsPVEDVcHuXy?=
 =?us-ascii?Q?7Mh+AFiT47lSoRSgoLsqTUll1mMZCtYD+oldk0Ov3oGRKfu1wSBAjPfX2sHd?=
 =?us-ascii?Q?shQcd6HXt2pUbsE6+WUEDyhLCQagHnY8wjBc61HPFzzrzC47fCI=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9qSTtAfk56LUX7ISGPvDfq8HyVO7LGLfQs5Gmo5bJLjFiiKqykYNtTOlGKdK?=
 =?us-ascii?Q?ztrpwXnJ+QTQe72kIm2/8oIAOU2uE5zJDPi3OMXKMcziZue7VG2UZo3pxy5k?=
 =?us-ascii?Q?WYAGlx9PwlIhOO87uKb908lcjWinrk8fxQuiIdroLZO/Izs+QC1Vfi2CIOt9?=
 =?us-ascii?Q?f6V1wwibRMIA6Uh3r2Yy+69hUdntxErL/mMS6kzBirErBxP02utpGa9cfT4C?=
 =?us-ascii?Q?13mmSwdxfvd+I2752ZHwEkfDjg+HryLe48eXwOIZKYp7YdBXPGCFg52K6voq?=
 =?us-ascii?Q?g6oTTZrGBbwvchcwRbOXlaVgBiZNb3m+5V7FdtBtwJwy5rhxeC/84h+koaZC?=
 =?us-ascii?Q?edjWsOHd6kcIL1v2IWTiG11Sagr7eeTFa6UkQSCDdd5A/HKU+OIhRdTQFGWw?=
 =?us-ascii?Q?LQI9XrliKYhRIOALZdZIyvTkhA9RXBTuXdXYU7yNbmX7cyIbto8/6EODD2w1?=
 =?us-ascii?Q?WWYmuMnF5Rrnn/ccm6F+nwcmHF/JG+xviK5t8KwcPaIJWQumy0PcCzOnehJT?=
 =?us-ascii?Q?Xvdu0jkQkfczY8qptW72NWk+z05T53yAYgXuYrfNK3qhwR6GizmLNaX6C7Ed?=
 =?us-ascii?Q?UutJCINMthjjrdPMUluEVPLv6B6xd2e2tU9SCJKmhYxE9sq7sqE/GOWWV5MR?=
 =?us-ascii?Q?QN2cb4GBpVwnVPOL4cQIEwbTAeLFfq1nO/kVHP0+4j/3uWQj9yRN9KD84MTx?=
 =?us-ascii?Q?y8nJl9RkBBzEnKOVEgP218HSJxriNxQEm6ktuhLK23y47dKXWTE9qnx8ae1f?=
 =?us-ascii?Q?Ik9GsAg6P0dS8Eccrp4UEqGW1EH2WCDiCFUfXGJcSJvzaW4vPgbv+O2ijVSY?=
 =?us-ascii?Q?PbXc4eAEfdnt8Ld20z/IotscE9ZpPZyRZ98q/asSsipT5exxsEskQOLZXT07?=
 =?us-ascii?Q?CsarwiJOXOfS0JGupUSvLYKO3r5YcIs+kJBwvBg8NAInwJDoprLyzNSfqA3X?=
 =?us-ascii?Q?41I/+T16dZ7oF3QJidjkFYj26wDnzNaLXy/ByEbjrVhAD7VJriqYJKwI/QUg?=
 =?us-ascii?Q?9Xlnw8q0+QDxAUOAP2oWkcQFsKjirMCFJtIjN06wwcvp8pMJiUaB/qI696Be?=
 =?us-ascii?Q?5vIjAjIYeZjtePRow5vhHAFGPdxlNQhLumPVSD9QVTvm19470PbFHDt1pYBQ?=
 =?us-ascii?Q?ffa84vsUnBJmico5WoGohu1zO83BVdReKKOfvLSGtG8BycytJvErEPGc/mnW?=
 =?us-ascii?Q?rU7xJ2+DsA3iTVN3A2l8/mNEWueXe6+xFM8xp687uRB2krM0OLrjNrsWl4Dm?=
 =?us-ascii?Q?6cyvOlUDHore411DBsxl++oNR49v/UpkHCqOi51rj1HAQP2Bup9cENf01XBo?=
 =?us-ascii?Q?BDAufHtpcoK7f+lcvl3SLY3VEkKurUG3rxFulDEa7SMEzHPYTYm8A2J5lUBJ?=
 =?us-ascii?Q?VC6rtiEvB2Hy4pVo6WiiKf1qKFAzZoLGuAj+pHWEXSoa8LDR73q4J6w5eMyY?=
 =?us-ascii?Q?wbULRvFr6UEnHvBKCF3AyJGxuEPCqgGq?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4921947-904d-4959-f43f-08dee908271e
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 22:17:16.4679
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7521

On Thu, 23 Jul 2026, Lee Jones wrote:

> > Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
> > Assisted-by: Claude:claude-sonnet-4-6
>
> Should we avoid using non-standard metadata tags such as 'Assisted-by'
> in the commit message to adhere to standard upstream practices?

I'm going with the guidance found in
https://docs.kernel.org/process/coding-assistants.html which at present
still states it should be included. I read somewhere that there were
active discussions about this guideline and that the tag might be dropped
in the future, but I ignore the outcome. I will drop it if that is the
preference.

> > +	on = *delay_on ? *delay_on : ST1202_BLINK_DEFAULT_DELAY;
> > +	off = *delay_off ? *delay_off : ST1202_BLINK_DEFAULT_DELAY;
>
> Use the short form here:
>
> on = *delay_on: ST1202_BLINK_DEFAULT_DELAY;

Noted, will fix in v2.

> > +	on = clamp_val(on, ST1202_MILLIS_PATTERN_DUR_MIN, ST1202_MILLIS_PATTERN_DUR_MAX);
> > +	off = clamp_val(off, ST1202_MILLIS_PATTERN_DUR_MIN, ST1202_MILLIS_PATTERN_DUR_MAX);
> > +	on = roundup(on, ST1202_MILLIS_PATTERN_DUR_MIN);
> > +	off = roundup(off, ST1202_MILLIS_PATTERN_DUR_MIN);
>
> Should we perform the 'roundup' before 'clamp_val' to ensure that
> rounding the value up does not push it beyond
> 'ST1202_MILLIS_PATTERN_DUR_MAX'?

Noted, will fix in v2.

> > +	ret = st1202_write_reg(chip, ST1202_CONFIG_REG, ST1202_CONFIG_REG_SHFT);
>
> SHFT is weird - why save that very short char and harm readability?

ST1202_CONFIG_REG_SHFT is a pre-existing constant from the driver. I
intend to keep this submission focused on implementing blink support.
I have this issue and all the others identified during the previous
fix-focused submission registered for a subsequent submission.

> > +	/* Zero out PWM for all other active channels to prevent them from blinking */
> > +	for (int i = 0; i < ST1202_MAX_LEDS; i++) {
>
> Does zeroing out the pattern PWM slots for other active channels
> permanently overwrite their configurations or is there a mechanism to
> restore their state once blinking is disabled?

Yes, it permanently overwrites them. The LED1202 has a single global
pattern sequencer with no snapshot-and-restore capability at the
hardware level. When blink is activated on one channel the sequencer is
reconfigured globally; other channels' PWM slots are intentionally set
to LED_OFF so they remain dark rather than blinking at the new timing.
This is described in the commit message.

> > +	ret = st1202_write_reg(chip, ST1202_PATTERN_DUR,
> > +				st1202_prescalar_to_miliseconds(on));
>
> Should this function be named 'st1202_milliseconds_to_prescaler'
> instead, since we are converting a millisecond value into a register
> value? Also, could we correct the spelling of 'prescaler' and
> 'milliseconds' to ensure the code is clean and passes spell checks?

Agreed, but as with the above, this is pre-existing and registered for
a subsequent submission.

--
Manuel Fombuena
