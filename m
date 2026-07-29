Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011032.outbound.protection.outlook.com [52.101.65.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5272141BA75;
	Wed, 29 Jul 2026 07:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785310826; cv=fail; b=RFtC85LQbMe66FPXz4n+Z/2I2dHlTTA3eb6fr0wo6+ZRX+BEX2C4PDg3cV2r//yvyjTscc60BftqjTTyYl8valQy3SWwNt5CRAKUfg4bESlpo+HWlUZ6ZuYIDsXOXAXJ/EN0mCS8QMQgbJ8Vsgb2sPKUM/noFjYkQd7RQB+xhag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785310826; c=relaxed/simple;
	bh=d+zjOv2oj/f4ZF13Z1dcIEuKJskE5vBMS/zE71HAkEI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=sGY4jdNfc9K6SWDTjPvK61OOUWUgrMwaLVjJ8Y00QAAPU1P8kO1nmMn9ilgeRGB7jDMYiR/v+CHJnEovgONQrJaOXmHbew+kYYhZHo268SqqXVAlWW02lQX9viaxA0uHnfIidi0/1F/L3qdkCFYn0s1SQjSVGURcdIo2M2GFE4g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Mp/TaG7O; arc=fail smtp.client-ip=52.101.65.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Mp/TaG7O"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=egKOsZg973rQ98NsQidExjWdhlbq4nk/TVqdp8GzPNy5E3htY1XrVegxCXhk9Dmib3P7YgBIaOBVUVxpv7I/iHjDjwwbVln2VDxRBGd2LT3uNQm+KNq49/VYCZa5qyddi1f0u/F19h10EZrxpy3wSq5cra4NMd9rocL0xqUwNfvyrVe9R3eKVPa2iKtOs0/WNBmh58zYnBbJHdy+FgKHar1L6Oi1ERiToo+Immo4XnDg8AWjFeU+6Ewl8rkQYOTwbCViJClSIl+iOcbdnlvMiHureaEgu3LBMiZCrKXA6UsB4d0y9A0YiHuysH+vSEpJizwZ11J0U/eWhjVpVapPWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nQYEvhYx7ctyD/oth6VylBv68FnULHz5sXdpbjBOKgc=;
 b=yHGM6LAihu4MRcUnZ3dlGRARgvgTdHBSYww4P/viPTM9sK9B91qhHke5/EyW8NxQRCGRdMa0uHhaV9BsnIqYJrQm4Bl0OnetYWpKA7qVcYf9UFiq3hSP2/xDvYqYF4yQBT9bRhM7HTS5BWYUWmhFiwbBoMjuSK7u+zCAyHP8vKKvqjmGgAYMhkJSRHFFdQrSAzivCu5C/6FOCTpriLNfbym9bs6++QqFhl16nNOLICZiDTQJV4exzMkDZOUpZ3ToCMpCYyz1VWpBiWJAvov2xM890EFfLOc9vS3Sy4LCvthawHVlbGOcjWnWld/tH2ArP/C/qOWwim2hVOptAJKSNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nQYEvhYx7ctyD/oth6VylBv68FnULHz5sXdpbjBOKgc=;
 b=Mp/TaG7OjLVh6AcdKjVfcZOdlEobPCuB4lGdgH+/CDbyZv++0I8eYFfGdBO1/jKtoemausszQ7mbgLCINLrJKCXfok+cvwKnLDgWaar1JFNzYCGXYieNzpl9dkWDqFSgUHtHyVTD0izOtX1zjqy7bq4lQjJyf2D9QYJSTFpW+ZPH+XH42oMAGEJKmbplHY583b5gRpwXquPrkhdyYim1pmPyk109mkSSqxK3t/hiUF55Zusp3DgvTjja1SIb6BIZdxfEmoFGd3loSBUVz4guftd2RRLUv8Q49T+fM4RVL4cHNW/N3TAMSLaFV9zAWbtTqWt2tK2yQSHIhAMQJ3/Wzw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PA6PR04MB11909.eurprd04.prod.outlook.com
 (2603:10a6:102:51c::22) by PA4PR04MB7903.eurprd04.prod.outlook.com
 (2603:10a6:102:b9::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 07:40:12 +0000
Received: from PA6PR04MB11909.eurprd04.prod.outlook.com
 ([fe80::a4b:fa4e:7fe7:e6a2]) by PA6PR04MB11909.eurprd04.prod.outlook.com
 ([fe80::a4b:fa4e:7fe7:e6a2%5]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 07:40:12 +0000
From: haibo.chen@oss.nxp.com
Date: Wed, 29 Jul 2026 15:43:27 +0800
Subject: [PATCH v2 1/4] leds: pca9532: check i2c_smbus_read_byte_data()
 return value
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-led-fix-v2-1-09ad218457bd@nxp.com>
References: <20260729-led-fix-v2-0-09ad218457bd@nxp.com>
In-Reply-To: <20260729-led-fix-v2-0-09ad218457bd@nxp.com>
To: Riku Voipio <riku.voipio@iki.fi>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Haibo Chen <haibo.chen@nxp.com>, imx@lists.linux.dev
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785311027; l=1867;
 i=haibo.chen@nxp.com; s=20250421; h=from:subject:message-id;
 bh=HW0ODPXBFf3IfOOtNmg+PUGHN52/fPZWEBdlyJanqOU=;
 b=fbQ0Bcmahcl5Q7xRMe10/SuVRUkxSfD4if0M+pWirnulCDLk8kHoqo/ORkUbr+qpoEfxnnWEO
 W83gK7jSrdCA2fHQ3WCQufdEeuX6WjIH7rxYnqMy36mCn4qNsf4rVUi
X-Developer-Key: i=haibo.chen@nxp.com; a=ed25519;
 pk=HR9LLTuVOg3BUNeAf4/FNOIkMaZvuwVJdNrGpvKDKaI=
X-ClientProxiedBy: MA1PR01CA0177.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::9) To PA6PR04MB11909.eurprd04.prod.outlook.com
 (2603:10a6:102:51c::22)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA6PR04MB11909:EE_|PA4PR04MB7903:EE_
X-MS-Office365-Filtering-Correlation-Id: 78a9ec50-e890-4ee9-d979-08deed449f54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|19092799006|1800799024|23010399003|56012099006|11063799006|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	NBgXY7WTG2BM2ixeYE7q4U9hHGdVs6QquaVf2O9jYAx4oxlJpBnHDajMxag4fQMnI4F6IBJeHrXfZ6rJG+DF70ZtCMHi5GVAEjoTiEMPjAOvLeN54blvmngdoEkTV9gHD/GmBkLIXf0ZHNKY0w3XOtCyXsyomQNkpOdJl+ebsXg27WhHEcmE4tuJuJDZkCRXGG0RjoUN+tdfirPhuDKDRG9xQ05pVAHmAzNKXgls5SyDRK50IV0pC765ZllGzUlYxYkLrr5TwXW4cvKR16GspMtr7hGmFSezVoJ/fE0a4Cn/w5Fw1X4HqKpW6I5j0CafCrKsQMkze8qNWvxE2Ht1aLX4O2S0yyTNSnjS3mpWTXmEZ+ViRCMOfkmeQkHSTK6JAtHI49mIKD9jSU+lzV/Q6F/pKcoBHnXQKxV9vk1qhqZz/wYvVgsdQ16i/17UCTMDvawXBGWN3ihaclMwLZWLn9rZB1MyBWuCjsTBrxIjXNuTplBNAVXwDdwh5BtfLNMLyqd82zsJbURrWjtu/8ojXpArc7XHvZCzJoPHRsrWfAfo1gGoDbP37SJdIUDSimpsflZcDK7SrBvJL0/IgRa/Zc6HN8y2zz1L8BHoVsupVx6PC1OpTE5GR3mY7VdzU4st8z0q2wliRhEw9gmRI5K7OZ1PsCHR5nvPj2GMBu1bUNA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA6PR04MB11909.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(19092799006)(1800799024)(23010399003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ckkxYzhiQUNBNitwTk9Wb2ZwY3pyMEM0eXUxQVNSZkJTRlRpZTlSOUhFUk0y?=
 =?utf-8?B?dnFVa21WOHo1UTZwU3c2cktKc3oyVnp2KzZLd1d0ZklXSmllaHVUaTNDSEg3?=
 =?utf-8?B?bk8xcm95a002MHJCUStDRno2c3d4N3VCaGtqeDAyZmNVaDBObkt3VjJvWTJR?=
 =?utf-8?B?NGhEVHZOeTJHdElGWG0zT0xPS3FPQnBJeXdIdWZ4MG1QRkRid3hyRXJJSy84?=
 =?utf-8?B?cUVDTkNDakRSaVBqUENsTkRrVGxsRFV1Sm1CdlhsUFVmN3I1RytnRWJLWk9z?=
 =?utf-8?B?S2hGaXRLU1Q4MmZYM0paNlNEWDJRbmtuU3I4RlBGOHQ1Uk84TFNSVGJ2cFJj?=
 =?utf-8?B?OHIrVkxXNDZtTmt5NCtURm81b2Zndnh0VEVJeXhJcFVZVmtlTkRRbS9HVmVk?=
 =?utf-8?B?TXJmWmZuOUNPUENaTVRvWmRPQ3BQOTIrelNuZEc2SG56WHhBZFlRaHdubmcy?=
 =?utf-8?B?OHJBS0NIZVJZUXNKOVZ4bVQ4OHJUbGEyMEZEUG9uWUVVaVh1U0hRZGVtcUo2?=
 =?utf-8?B?UGJQeEdDV2l5cGNtSGZJUW43eDhQckhBaUdvSS90MHNleGJWQ3BHL3hPeU51?=
 =?utf-8?B?M3NNNkRPVTdiQXhMcTNDeTVDd0htd3J0cUx0K3BXZFRWR1JSWmYrK0gyY2Er?=
 =?utf-8?B?R0hWenduWm1RM2ZIVHA5ME9QV0VaMUZRVHVoUzIyWVNPTDNrUzZNampFSEJp?=
 =?utf-8?B?RlorWnkvYWVUQTJpZ3A1ZlJFUFN0S0tkb25iVlFCdGRBZ2p6UlNaczFLYUV0?=
 =?utf-8?B?cDdUOVpwdHZtRWxmbDVRNDVXQkQ4MjdmekRRYi9aeUlqaE5aeFBSNEpLdHMr?=
 =?utf-8?B?QVpzc2xnUkN0RDhyS29ld2IyYll1LzhqZVZuQ0I2K0h1eDJFMCtkZm1TRXNN?=
 =?utf-8?B?YnMySFgxWVpXNEJzSkFpYnhuL1UwTGZVSzEwdHE1UnEyVGg3QTJoS2JFd1Az?=
 =?utf-8?B?d0dienMrMTNxNE1TL0Izb1NWY0poeVUwa3N3a2g4U1hJbU9nOVNseXRXOENr?=
 =?utf-8?B?Wjg2MG5jY240ZlhHYjJ4aGZoZVNLemhldElKWWluSTRxMXg2cTlYbzRlSk9s?=
 =?utf-8?B?Tm4zRTBFL3dkallRVUJSeTZYWlNNMHdzWkRFSTFaOUdkN1dWV2hpcGVKMGRX?=
 =?utf-8?B?YUM5bmZkcTVHemY4enE4NHlNSGdjcTJPTXJnRkdwcGVtQlg4dW1KekJHSXdP?=
 =?utf-8?B?UGVrUWVqd2lWWmM1M0VJS2kyTjZyZWRUTndFUlJZenM1L3VTSEFuYkVDUFFK?=
 =?utf-8?B?bUdSQ09TVFV2MUNMSFF5VkNmZG8xdWt0R2NOYUplczRTKzU5ajhTRU1nRzlh?=
 =?utf-8?B?RUpHSE5oM3MvbjB5OWhXWTJvYll5RGhTZWJLNUdBY2dHcFNNNGhTNGVBY1BE?=
 =?utf-8?B?T1FUc3pzUTZIcDFTUHVtSTJQSkIydEdpaEticDU2ODRjM0dHVUtMNFI1WURw?=
 =?utf-8?B?ei8zZS9UL2JiZHJNSTQwakRjNGJ2eS9MMHpvY0ZQNzRCUzMvZW5tR3E4N2dZ?=
 =?utf-8?B?UG5Eb0JZRlJjYXRoUEQ2aWEzd2M3ZWxKeGVBUXM5Z2V2eEZGTGJMODg3Uk9N?=
 =?utf-8?B?dldyb0xTOHFHWFlnMmo3Wit2Vnozb3hsM29BMkNYMVMvYm5iNmJXY3NnbDcy?=
 =?utf-8?B?VUhZOVMyWUtHQ25SKzFFVG5va29sT3dneFdSYTh0OWRvbUx6alNIYml3U2Q4?=
 =?utf-8?B?Q1NlZVBxV1ptemFTZ2dISWcyS0liV1h1K3VFUTJKTkdNUGg4aE85a3AvaEZK?=
 =?utf-8?B?dWE1dVFKdnB4K1UwUkFtV3NZc2gxaUpINTZVNFF2cTFXNXc5U2Y3N2ZUb0ZC?=
 =?utf-8?B?Um9xS2t5Y1B1K3pWWHI5cm1jbmtLOGZPU0JLWnhKVzlBSFNiWW9CSEY1NnpV?=
 =?utf-8?B?NFZ4Q1dTREU2aGFNK0ttWTk3elp4S2pGeTdRRFVWcFJjVFhCM2twaHdKZm1Q?=
 =?utf-8?B?Unlhd2g2TW5yc3dpMExES0d5a3NubmJsZXJXeWVJRGhsN2RkUWhOK3REQThR?=
 =?utf-8?B?ekdLWnlYNXgvQWF1Z0tuV3B4cnZsNXd2V2tZOWdOQWY0RmkyUkg5dDlhaW1z?=
 =?utf-8?B?ZHVZU1JIT1VXZmxPRnZQOTBBeTFya1AzMnNGT1F3eTZ4Q2ZKN2VxTWVqSW5C?=
 =?utf-8?B?RVU5V2xFVThTOVY1L0dHTnhHYnJGTGdscHJ1dGx3TVpSdTFjSkdkNytnVnVr?=
 =?utf-8?B?YnhDb2hHUFZ4elNJa29aWGMzeE1TeVZPOHgzeEdIblozaUg2K0JhS3FiQmUv?=
 =?utf-8?B?S1k4RXZEN1UxZzNPK3pvWWZsZDBUOFJtL1BhMWdZaDJiYWhyRXFZRk5pSFpM?=
 =?utf-8?B?VVdyZnBhUEFqcEhIT2ozNjFWUS9Ya2RwenM1Uk1IeENrTGVMQkJBUFhOVlg5?=
 =?utf-8?Q?71oj3qdaoR7nqGJDn6nRr3TNYCEixX0lfISUR?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78a9ec50-e890-4ee9-d979-08deed449f54
X-MS-Exchange-CrossTenant-AuthSource: PA6PR04MB11909.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 07:40:12.1061
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Auxn3uhMCiNT9RmbhBBwISyf3BjoeCdKDT4yrde8yHm8eJN20D4hpHyD3RG2RMbJfuaPpuaGjODZ3QOXGhwuavufpY7B+S4WcNTwipXiZ4IqKYb1RLAGR9GklRjOHWTh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7903

From: Haibo Chen <haibo.chen@nxp.com>

Coverity report INTEGER_OVERFLOW (tainted_data_return ->
cast_underflow -> overflow) in pca9532_getled().
pca9532_getled() stored the return value of i2c_smbus_read_byte_data()
into a char and used it directly to compute the LED state without
checking for an error. i2c_smbus_read_byte_data() returns a negative
error code on failure. On an I2C read error the negative value was
assigned to an unsigned type, triggering an integer underflow/overflow,
and a meaningless LED state was returned to the caller.

Read the value into an int, check for the error, and fall back to
PCA9532_OFF while emitting a warning when the read fails.

Fixes: 28c5fe99016d ("leds: pca9532: Extend pca9532 device tree support")
Assisted-by: VeroCoder:claude-sonnet-4
Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
---
 drivers/leds/leds-pca9532.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/leds-pca9532.c b/drivers/leds/leds-pca9532.c
index 2d37e00e459dee9f0313830f4852b01f40977311..e8ee17b8bd547a92372a8e74a6781b95ae831fe2 100644
--- a/drivers/leds/leds-pca9532.c
+++ b/drivers/leds/leds-pca9532.c
@@ -298,12 +298,15 @@ static enum pca9532_state pca9532_getled(struct pca9532_led *led)
 	struct i2c_client *client = led->client;
 	struct pca9532_data *data = i2c_get_clientdata(client);
 	u8 maxleds = data->chip_info->num_leds;
-	char reg;
-	enum pca9532_state ret;
+	int reg;
+	enum pca9532_state ret = PCA9532_OFF;
 
 	mutex_lock(&data->update_lock);
 	reg = i2c_smbus_read_byte_data(client, LED_REG(maxleds, led->id));
-	ret = (reg & LED_MASK(led->id)) >> LED_SHIFT(led->id);
+	if (reg >= 0)
+		ret = (reg & LED_MASK(led->id)) >> LED_SHIFT(led->id);
+	else
+		dev_warn(&client->dev, "failed to read LED register: %d\n", reg);
 	mutex_unlock(&data->update_lock);
 	return ret;
 }

-- 
2.34.1

