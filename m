Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010065.outbound.protection.outlook.com [52.101.69.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A1E3E63BB;
	Mon, 27 Jul 2026 09:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785146083; cv=fail; b=cs5GqIuNG63FhqME/i4oGxw6FFkFXJZBRSGODIFEbS1/skSINb/lS0XsU7UolDrJZSTEEYjeVuSa/D1Vhh+sOSflXNM+hKKe+SNGiCzq3ZdLNoqaz0kQWLdbY2qT+oqaVWIurQ903PmpYg4fKrssXt6VHF5Disb2rAda25QGeds=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785146083; c=relaxed/simple;
	bh=qF9bP6IaNv9e/3fDYYrCkxnfr7Or86tBn4pgLwObTO0=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=nJmZFOWgA7fzCiNg3Q24CMc3EyLc+R7URX8/Ptxw+JBMj6g7c7U7is/DDmx9LQxTOi2z0OpkUyCKqlKoeynm6/8h6ZhZmX35spyNT7p1TWyJ4nIVW92QoNj6c6azno0zRmLFg4x9iN2VHbvCjxk6r7TugUObb+KHEO5coxBQzaI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=GGR97G0p; arc=fail smtp.client-ip=52.101.69.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="GGR97G0p"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GqKMdJsNQKjQMZHrjr0aM8G3/pN9cjs1Swl6IMRvWP0k6ljf4PDkOMg7vTidFRC31mvbcuYM/bb5iaUbiqBHwqRxE+fJkSsMxnHwTcz/JuW4IjJwDJyIfsLxvk9ugEjgMxs0jL1ZuFuc+bFWALcD775Q8OwWn2qgxgmSE7mxVdDz622bpESIvrSxAqd1VN/pEhdX2Jo87EuqNK9jg6RwTt9s9Uebxlo7A4XIK8CR6pJZ5yX/Q1gfxVfAhHrryHvZUJJ9rybYy3+tuG5E5BWj2cGqFMvrY7l2TUZyblUYHLjFVcueHAO1Qj0ffV8b34INhIu+2/I44cChbwDZN0rARA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jx+vNojNuzhSo0YYo6oEJQ5G7ImDrpac7zfifLQdGAE=;
 b=v29cO5r+scuHQvmmJE2R7dIcEKk0k3d2MBV8YZSRbzbLZ+GVw9kecGKypNJshyfWUcEPI1qy8PrmL/KrbNZyTtDR51i2zgC8JNDZVuSntj8ny50WJaBuZTPfV49Qv5pvZ5sZFmYH5jrNWAx+5rDRuMmWhJUrrL1ey3ODDrQCjw7917EwZHnjmPMZ2pz1swFYFD2nauuqQ1+Rwuc86N7BbeZuK2OYMMh+hXvtyQKjKRlUFosjWlQ1Bh2yUseTtpZ0K7WYft3Ton2E3um6tPjGw9SqXsQrk8kcrH6mBrbEdTuccZ0my5qNC1LPqwPlgDGV4r+8WN7FoCuKEdN28dF6dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jx+vNojNuzhSo0YYo6oEJQ5G7ImDrpac7zfifLQdGAE=;
 b=GGR97G0pWfqSwugNvxtgfMBgAEyaEVLu4PSGywsMg/CGoP1s2K8YPTGFeGlZEpT+Lnd4jpEI8D+AZBboIZIM5cJsPzgFJHRY2RrX531jh4GDbGlkpVQlS8dWmnfjUKwZyzSPB1TpQmabvogsDQ7/B3aO3x5F3zeS+lMuBfyROh96e8ut5UKa8Y1AvZwe81abhTxYQ0yXy/mc7x9o1BXY5qqe51dIOBZu0NhlHvrUpNAFY8N8GCi49oWHIyARJz9GPYJNLgSwouzMDurA5NIuu66n8xwwJojTJXZDKVri0Gyet5zwsz18/nHuXHEaGTYVwSAqLoXPCNaelXzXvMTqoQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PA6PR04MB11909.eurprd04.prod.outlook.com
 (2603:10a6:102:51c::22) by PA6PR04MB11778.eurprd04.prod.outlook.com
 (2603:10a6:102:525::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 09:54:32 +0000
Received: from PA6PR04MB11909.eurprd04.prod.outlook.com
 ([fe80::a4b:fa4e:7fe7:e6a2]) by PA6PR04MB11909.eurprd04.prod.outlook.com
 ([fe80::a4b:fa4e:7fe7:e6a2%5]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 09:54:32 +0000
From: haibo.chen@oss.nxp.com
Date: Mon, 27 Jul 2026 17:57:54 +0800
Subject: [PATCH] leds: pca9532: check i2c_smbus_read_byte_data() return
 value
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-led-fix-v1-1-d635c5037109@nxp.com>
X-B4-Tracking: v=1; b=H4sIAKErZ2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDcyNz3ZzUFN20zApdI4s0AwvTVEOjtNQkJaDqgqJUoDDYpOjY2loAjWa
 sxlkAAAA=
X-Change-ID: 20260727-led-fix-28f085e12feb
To: Riku Voipio <riku.voipio@iki.fi>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, Haibo Chen <haibo.chen@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785146294; l=1933;
 i=haibo.chen@nxp.com; s=20250421; h=from:subject:message-id;
 bh=WeKubR8MHR/WXFce0x/FXCZ9aBaJ27QD+YvuE2vS6UI=;
 b=E7EUuDp+Fpw3qXblrvH+eUReav3ncdl+KGVzUryXhw3mbex/q7NwbfV+w/FF/DrIobNaA6Ud4
 pTA24IiDQBLBv68o8BWwcPYue7VY+rcwu/+2cR2nxkW3n0b7Es3Lupu
X-Developer-Key: i=haibo.chen@nxp.com; a=ed25519;
 pk=HR9LLTuVOg3BUNeAf4/FNOIkMaZvuwVJdNrGpvKDKaI=
X-ClientProxiedBy: MA5P287CA0026.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:17a::9) To PA6PR04MB11909.eurprd04.prod.outlook.com
 (2603:10a6:102:51c::22)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA6PR04MB11909:EE_|PA6PR04MB11778:EE_
X-MS-Office365-Filtering-Correlation-Id: af405b4b-259a-45de-cb26-08deebc50ebe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|19092799006|23010399003|366016|11063799006|10067099003|56012099006|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	KS7OTDwe5YnHVFg5a6yqkgMMT0uw70ES3wQIQin56lv4tgIVFPbPQKehROibxBxGM8tmuaDwuxaPM27cjaqUF+T2VsTjy1bTESLrVsXqFJFY5t9uF73ACNcIV8sJXtqebo3ZG2eI/2XSLpxD96MJH4xyyn0T1l/atqpumU/c6xf0KjlTsa6GEL1vc93JE/g4KPXi1OOmgPe0VMxGoFH+zSHhqJffgFeYkcBx5BjJ1MLqrb/lyruYLGqj444Kd6SGNnD4J8vjgjiQIM7rJWIzRWNJs+4R4kLVHwH8XUpKwE5CZUCLL6YWJSAgeNC+qpX40XjW+eFKA0C03VdAbhsgzRK951zwz7xY9IhvY0vZ+1Egz/j0p5ApmohluqlLNmsa2xdqERAPBiLbWrOYBWCBSmN80RClRcHdUrmeP6DdEaImoV6ed+sAUoVcE+x21zYr6zv5SY8lMT3q7GbxjiGwlqZEjokNkAaW8pJjmD9tGBAotwHpoEpw/vsRtLtUhuKXnePCr9AqpT4YB8R1UBAJAHpfx0D4UhXjXzaVdjs40yWhJ3HC4Nmt+9z8d63aa6vN5BNuouh/i/n3Rp0loj+RHBTHbb7e4T9hPURyMItwJH6Hv/9RSAVl9gVDG9c/k3OV4A+DloJQc9W060fk2wyCTAMlKWLFZIIcxjVm/psBc/c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA6PR04MB11909.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(19092799006)(23010399003)(366016)(11063799006)(10067099003)(56012099006)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZXJBNnNXVFJwbUdqNEFLZk0xeUIzeUVjZ2FacUdINXNlOGUvbXJGYlY3NkQ2?=
 =?utf-8?B?QStybm5wNW5LQkdTL0VzVVIrYVQ5UlhVd1Y4aWdYemphblV2SUgvcFFaSDdp?=
 =?utf-8?B?bjhMdG4wL1c3dFl5cTg4OTk2eW9aNmo5VlNhL2lhTFNmR1R4dnRKN0FqVkF1?=
 =?utf-8?B?Ym1BRnhzdjM0eXMwYUd2dVVpM2wyZ2xOTE9Gb2lXY29uY1hkc2sybEVLckZt?=
 =?utf-8?B?K3BMbTVZS1ltWG9xcmkrUWlJSUFKTFZWb3hjWFAvTVo1Y0tteTdjMGo2aXll?=
 =?utf-8?B?dCswR2ZsTk1RcFdBaHZjYTdTQVhHSmNNbkhsWFBsMnBjRGdNdVNRUWt4L2Nh?=
 =?utf-8?B?bGVzalhFZE8xSVNxa2FxY1h6RFRtVkYwT0oxNk52d1lTWklucXlaQUhockhw?=
 =?utf-8?B?b21vcVNjVlZiZVVOWXUxd0g2L2RBcHFWRjFnMVIxdFcyQ1N2bitsUW1hMG50?=
 =?utf-8?B?NEZFd3Bocm9rTzBQbnJnRmp6dURKWU56UlFNamVWU3phSU1DbFgrcjgvbG1H?=
 =?utf-8?B?bUdrVWRGcFpzM3NVQmN3NkowckRqeDkxck9yUDZwa3VYN2dtTU9UZzR5NFc4?=
 =?utf-8?B?RTZaVWdxNytrNC9vK0tUYWtZcndWZ3ZiMnhrWkhDR2JGSXAxSzhrNmtmeXJy?=
 =?utf-8?B?OE1nL2x6MEgxVFRVVXplQmNkWnhKcm9nVFc4eGdiT1VxdVo0QVVaL3IydFRa?=
 =?utf-8?B?ZWkwOEpWUis3eHJhbnJGMklxRXRzOEF2VHBYQ2pTQmJjbWQ4V00vaENsQUlZ?=
 =?utf-8?B?eFBTcmQ4amNxcHo1aTExdDRxZ1dqTm0yVkxVWnB4Wnp5eEVhcmYwc2s1RzBh?=
 =?utf-8?B?NUs4WkNWdUsvQThOVDg5REI4S1grU3VQa2IrU2xvOFl5d09vZ0tnQmV3L0tk?=
 =?utf-8?B?SnVSQU52TTNEV2Y4TWc4SjhuZE11aTN4MlNxQ0FEOTdyWEJUaU5sOUFnNjJ0?=
 =?utf-8?B?TTVKU3ZtUnZCSlo4THRpbk5kL3RJRStpQjQvL2psL1ZGYkIyTURaSnNFZE9T?=
 =?utf-8?B?d2ZNRmd3dFJRcEZZMEpFWENNWHpaYmgrZlJPTnpJSll3WmErUGZrODRqaTVM?=
 =?utf-8?B?MEdLS0N0WTlFVG04N0laY0N0MjFVRFNFL2doeldvNGwxNHhNaXZQemtnUVhB?=
 =?utf-8?B?VXk2azNqdCtvS1ZyZGpyWUFBZ09oVFNzdHBudWErNkVLZ1A5dTJHeGxzYkxh?=
 =?utf-8?B?bDZoWEZuWXd4WDhleWRTM1VCMmF3US9MTWFOeDdlZUhMVjNSU1VONm40TldW?=
 =?utf-8?B?dTJwSWd6ay9PVHB2ZnpQMEFhNitQclFnTGVwR2hoakE5ais0RmNrdTBFak01?=
 =?utf-8?B?S2ppdWdJak01VWJiNnhQRTlzU0lEcWZxQzNTNmNvZDFFTWJXeGxPT3JKaUpO?=
 =?utf-8?B?cDI3Y1FWZUVJMkZiOEl6dDM2NDZCTEFtakZHU0c2MytTOTdGR2xYSVlnbWhH?=
 =?utf-8?B?TS9oUVViRXNJVjlWcHNVWk8zZnJOOXJPSW1GMTJsbllZdkhLL09GK0RuQkpm?=
 =?utf-8?B?MjZnQkw1dGVaa3lGOUowZU5md1hGczJwVCtVbTAvc3dVWTl6N3EyNEE4cHF4?=
 =?utf-8?B?Z3lvdmx6NmYwbEtLNVluS1ZiNFJXZnNmUDYzNE9ENjlXWkRSK0dmdVk4QkFk?=
 =?utf-8?B?VHBWZnI2aG9PODByWFRmZ2JldzJyOVlPak05NkRkRmZOMUdkMTNaNi9Na2Fk?=
 =?utf-8?B?T2QxUDBXYVRHQ1RWRy9pU2dya0RhSzBPUGNsTGNJeURQTGFVc1R6Z05BR1U1?=
 =?utf-8?B?Q2Rvc1Q1SVAwazU0V2MvZS83OHByazNRZk5zajhTNUtIdVFUamo0enJnL0la?=
 =?utf-8?B?TElIUTlsRTFHcWRBY1JvL0RkUy81eVdnZXFFU1d4ckJLVEdHNHN4VlkxZVha?=
 =?utf-8?B?bW92RnMvZzFiNWk2RWh2K09KYlJHbVN3N1pRam4xY0daVi96TURiR2lOSXU5?=
 =?utf-8?B?SThBbmFSeUsrMi9ZbC9CNGpLOUhJcWk4UGszWFZPZEtLSEpIQUJPZFJ3UjJh?=
 =?utf-8?B?YjVrdENuNHpjTHNBbHlJZTRXK1ZZOUxaSG9EUFBPQkdnM3dzb2ZyS3loR2Nq?=
 =?utf-8?B?TTV3RkRYdEhLZFBDbkswV0ZOYXVpQ1B6WTExNXVEVGhVdE15QUdJb0ExR3Fy?=
 =?utf-8?B?NUczcE50ZFJic0VhQUg4WnlCcWZkVXdzRmxpQzdsbndXaGVZUHZRa1BPdlIr?=
 =?utf-8?B?bS9vR3hxVEhlSnlaak5UWDlRSzkzNEpyWm9PK01YNFU4K0QrSVBsY3hCTmFU?=
 =?utf-8?B?MjdGYlIvQm9PcjhIK3BhOERuejNub09DN0l3Wk44SWVCY2xjQlllT3AzL2Jw?=
 =?utf-8?B?eHFwZEtaalpjTlJFbHV4UmRaVDZyam45UWJSYSs3b1NZZS9UUVQyc1IyaXp3?=
 =?utf-8?Q?xqiPEsRjFQCj5Y7KzINSnw//E+O6EAw9pyybo?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af405b4b-259a-45de-cb26-08deebc50ebe
X-MS-Exchange-CrossTenant-AuthSource: PA6PR04MB11909.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 09:54:32.5405
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UrOcRjGwNR06XuAYIWZahkvkT9ag8YSP07rD3hGOcCeK9acb8oTrUJes2se3x35jSADk1FA2JiNqxMS2d+ycNyDPA9WQX6cqVtq4y6h3MdqWehLtS/CrULuoq0k/4hUM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR04MB11778

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

Assisted-by: VeroCoder:vero-1 [cli]
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

---
base-commit: c5e32e86ca02b003f86e095d379b38148999293d
change-id: 20260727-led-fix-28f085e12feb

Best regards,
-- 
Haibo Chen <haibo.chen@nxp.com>

