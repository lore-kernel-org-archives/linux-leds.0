Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazolkn19011033.outbound.protection.outlook.com [52.103.33.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C480C4BEE4A;
	Sat, 12 Sep 2026 22:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.33.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789252581; cv=fail; b=t8npmIgXGsCQQ1YK0pvmpvOuHiFdawLF2KHAN/2v+Q46BhfL9RM/uKGQn97/8bp2T2q3AwI0SCXGa1EAYQm1vS337bJp9myqRPMDezOohXqgTXULMzCxfbg5SeDWeCLZTgI81l+XivivSvGXS6+FZ2jHgpTroiDKvjZflPJdbTM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789252581; c=relaxed/simple;
	bh=LqgTJ+WB84mSdzYxh0oAmdM0iHq3z9u28PWD25WyxKY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JLxSyOWfB/m0c+95eG3jcEhJmNXHr5A8ZzpZYyh3OQskFDl26odT5j+E0+n+HpsHnY6fTBn7vinS5Pk7OGSG1ECH+ysG1n25pY294o16VW46Wwx38+O2jKXJDLtKEjhoN4avASRc3UvyRskSvSlMXsG9pJ2hWeoeBlwtTkpGWPM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=uXziTXc5; arc=fail smtp.client-ip=52.103.33.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="uXziTXc5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vrajSrxim1oRvEcVPTcOl9CQo36hc9HNhs2gpe8BdupJtw7Lw1Y2XVAXaDOlNbx4NXE5mE+9GJy4hqlk963Uy1uU3J1zRQ15GkEuTMTjd2KWS5WrZqVAMBX7hBxUFj+9tgu0tLKApajeZcio1VoGVk6Mymn0tC0J2C/3s1ilDBsVhePE/AwlNmlcjqWfHRf8ytqX3qDTJE8+rpIBPAQT2Qs4pzqVf0OvuIW9EkqM38kJZY4UHUS3W9+pcZP5tIWorMRW7MiamgoZSqDMmXKyioNGroz7VQ5ZO/jfJ9P8+IarphSV8lCrw0wRK/Qk/USfYsJEkjyQxsl+STcL/YdlKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xXCSZbX1TBc51Vbz4DVE8VEcD9Ene5VfvqWB8qu1LM8=;
 b=W2NnSNgoYtu4N3ZrSz60lNH6n9040vBmy6gjM/yQxTytXMBaG3idmTMt5HNtQNHV8o0h7lHhfR0vYQC95u7NArOa1O1DhAyoDPi7sKMnUW8WGKYsc4ozCRQNP3gpq1NMP6biAV77MToldVKo33Gg1naJv87NHlsIvC+Gs/W/8As6wiwN3lJrdgckLGp1Lz1NSmNb6FJnv3WQnijhQggUYFAPb52mxnHtB9HpJxQy+s9bckJ4OXUTfp6HT5i5ok9cvCDp601zXJ4BMalRGgZCcUMzoa3jROitjwFF/GKX0IYNlHdit3r5Ls9MK855IRMoPDeT/mYMFEjzsKDpaG6tWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xXCSZbX1TBc51Vbz4DVE8VEcD9Ene5VfvqWB8qu1LM8=;
 b=uXziTXc5Kqjwaibf5fTUSoHWWUSL8y0FgSzIRhJ2qRoydAH6TAThS48CzUDuUNb9dk4865Xj9YoVTfXw/j4qyZiyuJVxfxUdbklpU3X1eQnMN+nvoN4cOGniJK5OKHxiHs+EbycezkphpeeekD/lELhnqlF4HePUEM3HktPngNg6NQ1lWQfaCZVWhshpVR9JPO5OvM/xnt3wZcCzqJ6cdM+WW9hILVTJfiXJV1LgmXufsI3tfMGpbDgHHsvrf83CVT6Xg3xIz0X2qF7os90t2zhzWF08IPeVaZt792pU6olvmBQynnWQ7t7BjH15H6jjasMMIEmTYjWUKSDdPQdXGA==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by GVXPR08MB11096.eurprd08.prod.outlook.com (2603:10a6:150:1ff::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Sat, 12 Sep
 2026 22:36:17 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0428.004; Sat, 12 Sep 2026
 22:36:17 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 07/11] leds: st1202: Program the channel current for hardware patterns
Date: Sat, 12 Sep 2026 23:36:05 +0100
Message-ID:
 <GV1PR08MB8497746317561206D7C20DAEC5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <GV1PR08MB8497422B7A44424C4968AEC1C5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497422B7A44424C4968AEC1C5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com>
Reply-To: fombuena@outlook.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0167.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::10) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <20260912223605.3092185-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|GVXPR08MB11096:EE_
X-MS-Office365-Filtering-Correlation-Id: 10124882-30fc-451a-0a3e-08df111e4258
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|41001999006|15080799012|5072599009|23021999003|25010399006|51005399006|8060799015|19110799012|24021099003|37011999003|440099028|3412199025|40105399003|2607281247196008;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WSVH1t2e4/DGXNF3GWAV1q45hKW2Vi/zIcZ56ni78ADa33VhKdohxebkNRTT?=
 =?us-ascii?Q?bjeuKey3Idoh5FHB44kZYyLtwY/ge/9KbDyY82dolyKsflpMv53V488qf+ip?=
 =?us-ascii?Q?/rTVNiqPPKKKkDFUCOAJLHGyL1uruDq6YIiNi5oJtrzF0DCDtg/1ywGWALRC?=
 =?us-ascii?Q?Jrn2t++yk+uARf0zjD4omAqKF0XZEMqA4kmYMfREG0YGPJT8UKnN9vc8+P4x?=
 =?us-ascii?Q?Xwh2hIbhlwIZCflh5CnSmRi6vVHcGvYrEkTlSOaWLXTS6zQbFB8FMDB4GcC1?=
 =?us-ascii?Q?L8rVsVLPpJwCgNZlItqAMNzti3d8XZ6B/bXXqgO+a0JfEaIUJdTAd9bRG11U?=
 =?us-ascii?Q?9wQRREdgNpaYt3L+WZvwcWiiSrZ4ZmF6MAc42Q5/1iapkLt3ruzTofNdiwS8?=
 =?us-ascii?Q?sFBewSS7xytdV3mPeclvKy4IQ+/OUep14cEISYlTf5Q0D4nK/VM0m/MQPPFR?=
 =?us-ascii?Q?FNpDXHOhiMJjfWMrXqvi3JG1RSZdSfg+lU2+TTZySStX7GBr/cHE+WljxlSH?=
 =?us-ascii?Q?guApRl7QAgbXaVVKix3r0FcB/mzzqPeAE6LB/xS8LM4Js9LPcwp32U0Ijgvv?=
 =?us-ascii?Q?iEr/JpShFT/wNAG33sH1cp61ALF3rsIu9uioex3tPBseI5fxrplfdV3KBllS?=
 =?us-ascii?Q?cpAckZ3g+8eF5OnBGp6gwB8kPayXd57TXQctaZ1jlGBTN33IRkyR8dWEcFAB?=
 =?us-ascii?Q?H23ZpTqj+CEpEas52VeF33/Qrv7Tr7hY0sV1BKiNGJF5W2gWvTaqqFy3lv9f?=
 =?us-ascii?Q?HZAVxgH4TQ1UWhO+CTw4a1GAYKaJTi8w/8MYPqPkrBfSacSOqSMkLL/CQkrb?=
 =?us-ascii?Q?S35SMW1mTJRlOc6MoplqSIGPA3J/I+Kjs7OrMHxivub8YnHy3NETa7jE+qjQ?=
 =?us-ascii?Q?kVCFqH+JRTIvK8B76WAhkzRuH5lr6qp/nvxkuIHcjkpZruf6kY61Q37IXQS7?=
 =?us-ascii?Q?PraOi71Q3d9WF6gfPbzD7PaeUeMGyWKPJnHo6Tq5gqtgD0KAEv3IHPsc4Yya?=
 =?us-ascii?Q?JbCs?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?g6bKyWZceP2DgNb9tLNPGE8eBKlqaxXbPFefwwhhqDeXUFsVj2XJDY4tElK+?=
 =?us-ascii?Q?87vDJIo5NCkFYg9zcO073+VPRTM3zf12aYUu7RrQ3nsujTmfQyb2+RffXYlX?=
 =?us-ascii?Q?s5UtO+PpqK8etkJfxEKkjkF67a6cKeoCLb/cjJ85d/0fV29eYQJR33lMR1M9?=
 =?us-ascii?Q?dtbzAiXqIvvzosg30J6SwAyqPt8/XvhF45FFZpu4eGxI1u3clWugFvzfkQag?=
 =?us-ascii?Q?wvmiYIf39sAWmqL9EJYrrKO3NpeZy7yxAK8MpEJk6yHhz+3IIrtrnpqw6QE5?=
 =?us-ascii?Q?pL1qtPDRFPW+MXB43HmpCiEQhzHmBl0WjV0AY9MIPazi3tUegCUleTZHBcr+?=
 =?us-ascii?Q?nX4KbLfSjkZSnTTPWWPEQ4VdEWV6/uIjBlnkXyjV+wAkYZnUS0l74+GE6R0s?=
 =?us-ascii?Q?zgdHz71e6U2KkiZqjZTsQ/hPgDU7dBufZcaZLarc5NHuwwHiBvFBMG6LNOy4?=
 =?us-ascii?Q?I5+jLxEK7N7Fl6ZpNgaabV9g/MbMsJjBLFEUJ6ZEE94SeLiEkJqLPfd+j5jr?=
 =?us-ascii?Q?fp+QAE8KDMBeUkI6y9zpO0E3cBTWZq77aA3tVi0JAjn/eVRHZwsd58PXg0Iu?=
 =?us-ascii?Q?H4l9qL/dmo03/7fYpZSJVEgJ9vuvCE6XtxqCAxIZpiQyMP64BZFRUoNqN3aj?=
 =?us-ascii?Q?VJtUL/P2MBoVNuNaNtBhEGcstODbFL+bAvuH7pT3BibrO0Ta39RmOGR5ezhy?=
 =?us-ascii?Q?RQk38C7S2b6LU2WkgqBCzDqIvHlC4p6SfB6lD3cVpgJr81Cwe5pSuTapP6Ay?=
 =?us-ascii?Q?pQgt/ybHBz961kPN5tlWDDRckfKcyN8yFTD9BLRQcSTYOU9uxYcZ/ZzsfCID?=
 =?us-ascii?Q?RJ2dDAoacW0QHxv6iZsrXVmeIysVjOXbogbtucCc9yM7lXTomVUVkWgSl9FE?=
 =?us-ascii?Q?imV4xN4Av3QGBvxDKS7yFm5k4w1MOGtY81zNtFLfAOzMUc5XZKQUDWt68Slq?=
 =?us-ascii?Q?u2UgSRFNyfa+dVZAFttHoPzoNCwWsKup5jV2q2AuogCCs7VcUrB7W+KJpWMA?=
 =?us-ascii?Q?3U8Lz8Rw2CRRvEdCJQvBdphKKXBLES0k7grFGM8eEvSeTbLiTXqdswF3ouFP?=
 =?us-ascii?Q?6SK9WdDBGfAEUSNFxmlnRgyGiT6RdSSq+GhHSyX1H4C4ypaNGUf6HJavw1Nq?=
 =?us-ascii?Q?wFrGiyGbxZbD1Y0pRUVaRB0r3LvD6r6QOgv2EeFu8qNJmsbQ2xbUIrsw5KcL?=
 =?us-ascii?Q?i57UX6IN5RhlN0aNTgwOJ7xaPzLTjo/MNKWC77utu+X1bimD4ZyXkmGNhpuI?=
 =?us-ascii?Q?UsDqEV6OoX7Wd2Sr78/VE4w4SxyR7nxLzuqj3axvmWSnj8chIhWvpMBan6RE?=
 =?us-ascii?Q?Yzg9qmSqVjEazAeEGOU4Bkm6Ph4vz6tzqEr/7g7siAV2Wu1u6feyNhewBqS7?=
 =?us-ascii?Q?sbaa8tE/BxY7jB+clDrw1WqUhnZnUEm8Zh/CdPJJ2nzunxZOnqSk+XCHiUNU?=
 =?us-ascii?Q?ZRko8LEozrYaqdRpyAj80QNhTfN0B9cf?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10124882-30fc-451a-0a3e-08df111e4258
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2026 22:36:17.2854
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB11096

A channel's output is ILED x Pattern_PWM / 4095, so a pattern is only
visible while the analog current register holds a non-zero value.
st1202_led_pattern_set() programs the PWM slots and starts the sequencer
but never writes ILED, so a channel whose current is zero stays dark
while pattern_set() reports success.

Zero is reached by ordinary use. Writing 0 to brightness sets it, and so
does switching away from the pattern trigger, because
pattern_trig_deactivate() ends with led_set_brightness(LED_OFF). A
sequence as simple as

  echo none > trigger
  echo pattern > trigger
  echo "255 500 0 500" > hw_pattern

therefore programs a pattern that never lights up.

Program the current in pattern_set() and release it in pattern_clear(),
so the pattern path owns ILED for as long as a pattern is loaded.
Releasing it matters because the trigger calls pattern_clear() before it
parses a new pattern: without that, a rejected or empty hw_pattern write
would leave the channel at full current with every PWM slot at full
scale, latching the LED on. Clearing before the slots are raised also
avoids a brief full-brightness flash on every reprogram.

Release the current first in pattern_clear(), before the sequencer is
stopped, and write it last in pattern_set(), once the channel is enabled
and the sequencer started. An I2C error partway through then cannot
leave the current raised on a channel whose pattern is being cleared,
nor raise it for a pattern that failed to start.

The current is programmed to the same max_brightness the PWM values are
scaled against, so a pattern step of N produces the same output as
writing N to brightness, and a board declaring a lower ceiling through
the max-brightness property keeps it on both paths.

Note that this makes a hardware pattern take the channel to its maximum
current, so brightness reads back as max_brightness once a pattern is
loaded and as zero once it is cleared. The pattern's own values, not the
last brightness written, decide what the channel shows while a pattern
is running.

Fixes: 259230378c65 ("leds: Add LED1202 I2C driver")
Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
Assisted-by: LLM
---
 drivers/leds/leds-st1202.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
index 5558ac9612a1..5042fe88fbff 100644
--- a/drivers/leds/leds-st1202.c
+++ b/drivers/leds/leds-st1202.c
@@ -221,6 +221,10 @@ static int st1202_led_pattern_clear(struct led_classdev *ldev)
 
 	guard(mutex)(&chip->lock);
 
+	ret = st1202_write_reg(chip, ST1202_ILED_REG0 + led->led_num, LED_OFF);
+	if (ret != 0)
+		return ret;
+
 	ret = st1202_write_reg(chip, ST1202_CONFIG_REG, ST1202_CONFIG_REG_PHASE_SHIFT);
 	if (ret != 0)
 		return ret;
@@ -297,6 +301,10 @@ static int st1202_led_pattern_set(struct led_classdev *ldev,
 	if (ret != 0)
 		return ret;
 
+	ret = st1202_write_reg(chip, ST1202_ILED_REG0 + led->led_num, max_brightness);
+	if (ret != 0)
+		return ret;
+
 	return 0;
 }
 
-- 
2.55.0

