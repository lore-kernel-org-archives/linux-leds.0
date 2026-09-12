Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazolkn19011031.outbound.protection.outlook.com [52.103.39.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C08F1D798E;
	Sat, 12 Sep 2026 22:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.39.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789252861; cv=fail; b=MbP4wXt3Lc8KnbtU3XXcSztRtFto5LdeSlw17RNEeVMDS/vsoHHprNzy5U2r5qc6ipZrCjHe5Zm9jwdsY8CoAGzaeoFsjdQu5zCQII67dbc/074YhZfBmkl+tYiniw0CfV/Ef8Z+H5KDDAenVItsdlFEGniCtyEXKepNbpxW2Jc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789252861; c=relaxed/simple;
	bh=BLBB7a8+pandbq+0v/HqsNb+taUpcgDpXiJymzGC0KM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZG6DicAfUP5+dr1rI3Qo8bLYCqqpXk6VvCmDtj632FDe8Wav/WqERVrSHwtCVjR6/nHDyEgBVtNV5duRMtnimeG889idwLa4j/RkleRArfL1TBIgMrw+4nY8KXdcUqnVmsAQY/Mm9J562cVVd4gxMKWz+FXFxVUqV6w64U3A1yA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=WfehyfV6; arc=fail smtp.client-ip=52.103.39.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="WfehyfV6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qfHHazMzXvyLJVtNEYRVNEFdY5fv7YQSm/9aj1x9wapqysxndbJx0whCqA7ZIDduIYZptefL0q8rzUO8lIJoYsxxPhO+5oNnp95XTX0RpHheNOCBNlGvlXjdWqKK1DyNp48pzAAXK5eKq3iYJ+JdcCd6Jgrm4x5hPMBcVXWKWXI8/rvsPy3pgOStRJXV/o/solaOiK3sUvXbNgp8xDQY+YcmiKwsvVxMEYGd0HP68GwVrYkIZ+PqdhOsrAIkjnRNAwS5PqBf3X1B5CiVOcf438HWhok290fVyQWq19iUhNWfdOfZTuhPXan2RpsF/jQSI3vTQ9f8UaqMFz5Wu05yTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GmVCe7Xucyelt/dhVS0qJLtucXX92yzJMFzOccLbYUU=;
 b=Xd98ajEay5cnykG68zVQOOA3kdGeerNdDKhE7QxXWtJ4fniMVzpD4/oeSaTinL5T8wWbD7aj8CTl8abE927SlgKqaKzimhgBwKuwoBYAjQdMaWJmznb1h1w7jM4CmeODinf9WsCqa7JKTwONyDg+YWUw7H5iv+hkMwtXFNXupRcANaE2jJznK4fhpSjSRjt48II6QKqzPxILmfiw4MPFqw5IfjdUcdOxZi3RPPwd+Gsx3ne1+MBjurv7xFSPlZNeq9I4XW2yNX+Qjc3x5q+VlI3zawISZ1lDocilAp/x/LhNOS5cBpVyP3ckQkGD1bCKZuH+RYuISNNijn0Cwd9S4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GmVCe7Xucyelt/dhVS0qJLtucXX92yzJMFzOccLbYUU=;
 b=WfehyfV6WKLRxMQNajxzohrOXbBHNLeiOWVyrRbBdYkK6iAW6lBnzJtY8lAODUEI+k4R6cNcqPokyHQOgHeIm0cReoeAIULNo9jJzOQ9r3OysC53pxQF/sQVrhaQUguk3D7MO3lLo402YHVvEiGbtpKPeHtCfWthJmfvB9Jp5/MDW3h0SAsag18kvGs/YNK+fFE6RqdSQo/u4qqO81uciWehcKHbOhcJJTQnss96MmKjxY3ii/9GFwIWBLow2SbLD9rMT/ujS49iir5aK0YO+DoClOeC9E2S9At6TvPNGSl4X32yiMbBJC2/vkrmTtIuJ5ez1cvcR/TLlcrZx3jDyA==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by AM8PR08MB5763.eurprd08.prod.outlook.com (2603:10a6:20b:1d7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.8; Sat, 12 Sep
 2026 22:40:57 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0428.004; Sat, 12 Sep 2026
 22:40:57 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 11/11] leds: st1202: Honour max_brightness when blinking
Date: Sat, 12 Sep 2026 23:40:45 +0100
Message-ID:
 <GV1PR08MB849736BD134900C02F674EBEC5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <GV1PR08MB8497422B7A44424C4968AEC1C5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497422B7A44424C4968AEC1C5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com>
Reply-To: fombuena@outlook.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0133.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::12) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <20260912224045.3118587-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|AM8PR08MB5763:EE_
X-MS-Office365-Filtering-Correlation-Id: e09d169c-16eb-4b4e-908c-08df111ee93c
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|25010399006|41001999006|23021999003|15080799012|37011999003|16051099003|24021099003|51005399006|5072599009|8060799015|19110799012|40105399003|2607281247196008|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KTKkZ859MlizqOWsGtwhy4j2XN5HcvP7eAeoamXhdmImLke98mg6bdTeWOxd?=
 =?us-ascii?Q?nVgqWGh4NJ1h3RnWAsDwgTZYGRxOavP3eLM0ojB5iL1xIzo9juf3ESAgK9uw?=
 =?us-ascii?Q?JKdbJcH/qqHVUaVNYejimDbCmeQ+8+k6un1sJzvTXZT8qdNpti6NiC5DI7PZ?=
 =?us-ascii?Q?XhQ4sLTuZCR5NTrNyIc7ugcZv2NIgbywIU/y5fYyx05JIO8fzmfHOnMDFeTc?=
 =?us-ascii?Q?M/Nf47MD9RJXYoLo8OSV0fPP7ixCYqidQZ1DcOgjl/HQNC38sg1282KBlSwQ?=
 =?us-ascii?Q?W2aua+xRB/5AXy4LidU4hwmvsa2vCuUNaC7FqtIZtaOQhU6iP0duS6X0Te6a?=
 =?us-ascii?Q?tS49kL4fpr1uSVFCxRn1esR61qNocBXduvnXWAlfYyQBLbHS/rE3ZyEPlY8F?=
 =?us-ascii?Q?9jYtSEid3+qCwEXEy50DQ2LU52x8S8fDGctORlWKgI8x5okdWTASSvdTvptQ?=
 =?us-ascii?Q?4pWGlOaoeHoR7AcJMeipTdwHMPZ1RRVXfUalfatw3x9Gw3MqNI7G0GwBYSCU?=
 =?us-ascii?Q?mwGwJqB+XVQc5MDr1P42Zd7LwRE7WMK27GPpcnao7OulkG0PAb+mKk1kFA6E?=
 =?us-ascii?Q?wC9TWy0DlbDJ7SrLhQdl/iGGaBVYFjMT1rBlVEu609X79DThvOaCO5GZiqNW?=
 =?us-ascii?Q?Kc7DV/MImeKtSdmZxDnCqdbhS+N85CYe4Ql2tXOYXl4HVyKTIVO6BYgipJpE?=
 =?us-ascii?Q?kW2R80ijPkxUVRVx7tHBDvPkahr/OB4Z5udzrXz1ha5fn58qgj070iub5J7M?=
 =?us-ascii?Q?uEPyhzvG/xLX+cLGb0H3Oeepp4uGMVPmMq+lXNJIWNIFnEbo6far3hkGOsI3?=
 =?us-ascii?Q?KaU9XC1xTn7zPM5gs0ifNfbfNZ8An17vdHAXdo+YTAbHGS/xACWXJBF0Z1nV?=
 =?us-ascii?Q?5VE906fH2A6N8AHJ0uZuprodBmuTV5aU7I91KfeGdwXmS7is+CVFQHKwTmV5?=
 =?us-ascii?Q?18QAVOjCC3TY2u7dSBzFxpmsCA5U5TgFthDCn6TDvPUhB0cksPV6xjxb47Rf?=
 =?us-ascii?Q?bHDCBxJLYSJneYLN4E77nzxtNa4NRewCBJw6dFIS6hhNWB8=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9FVyzk2NPbHznbwJz9LAwtxIeO6SIeQtyOti6uHiUURFSVH2xdqtamPEZk7H?=
 =?us-ascii?Q?cPOEAdfiqkmgtE8ppypdoTVPVEOd1dGrlqgbHZqJ9wYVR+n5Ar5RN2B/jFmp?=
 =?us-ascii?Q?FWzq+NAT7qfO+maVxROLNh/HKbCj7BciAiPg0OjnRS4IlhQ27WeH6jXQ4KlB?=
 =?us-ascii?Q?6VK/oq/GIpwnSTMrkLC0vubmc6fYbet9cFOZkhXOteidFv4cptdrVoEeH1xr?=
 =?us-ascii?Q?eORVYbQDAQKAIWtWFaG8PD6EQx3vXNlBONdki5S9shvpMobj+ch4k0rm6F6V?=
 =?us-ascii?Q?1+reky+ScfKnakokXMqIZKtVjd226RM0E+ofSHdnr/LovP35KTi0t5AoGH1M?=
 =?us-ascii?Q?riK9hg46xa2KNECTdVYxerkZ6i2nYAAKUmICvSzmF5D86edPDsh2CsCRNKe/?=
 =?us-ascii?Q?xZ2wtHZ0vhu37nchHssk8eoyTTvPsm+PLq06AIMVHzTDWqtEOuzo8eWdW8rd?=
 =?us-ascii?Q?Lsyz871r7MNtFVwDmlAFJkiWREMCgiigmXmFU2wNd00eMzBTEKoG8UjVD5Pa?=
 =?us-ascii?Q?JAdfZJz2UOPTIFfXh3HT6X+Okc2oo2hj2oeQ2TNFW3xcUkLyDyTcXtpYN7e9?=
 =?us-ascii?Q?TBN8Roeum4D9PyXx2LE+a7szp4EVRhjEPpcbj3m5NNDaqgmebDMShOs/26li?=
 =?us-ascii?Q?U3upLOg1V0SMdgkhUx2mqWAc8W+oa1m3COGuY37JTe8vShSF7oizSWhuwQrA?=
 =?us-ascii?Q?YdGPJ9jTBk5NqRD/VWN79TNW+DiQFOaXaKggbYVfllkhiJmF2fyKB3fN8HsW?=
 =?us-ascii?Q?riNw3XizGLWD3HcSqq6rs2DD6sRODJBvFetXex3Yi4tLMQrtsM6kLIYjUaDL?=
 =?us-ascii?Q?lePhJZb7+9N8dOOPB9mbYXQL/bHivihEQfEznxrkULZI3y9UzkiqXbFlJzWT?=
 =?us-ascii?Q?RE9uO3EbCYl05KTsmYH3R8yvHR893kKvQH1l0IdKBssLizU5F92NZd1lhLY8?=
 =?us-ascii?Q?d8TTq+mWAl0bTWQUFwKRUy9OYjr+bGK5rKIsYD6VKrI+drBjHufgD/g+wfEH?=
 =?us-ascii?Q?H29zGkcRe4dhhL+g9YkYSM8d3th/bpe5Gq/hdAIGlElWKxXXzd+ZaNxZpUrz?=
 =?us-ascii?Q?8gT6g5K66ZdF9bPbHwDfeLjUAHQ6psOEmLx/Nf42mSXIzGHxinDMF0Xr9fuZ?=
 =?us-ascii?Q?xIlo2l8wEnnLVkQP7TsHf4nuqH5bgf/7z0nLtne/ppg+xu/h1T99AFob3LMA?=
 =?us-ascii?Q?vSQkDcoGifqt++mW//V75q/E4620M6K7WAPa75hN6TFpe9MeS2fMSQl577Cg?=
 =?us-ascii?Q?QfNsnWFvM5dgMLnirU/rwa9bQ8cVytpFYbUiYtrabhLzY9Q1nP1JQKwMHhWG?=
 =?us-ascii?Q?udWWwyQJDbHDtOFatgPI2J89LPSCmN+rUggXridx2H3NUcb8lVRc3HYT+GXZ?=
 =?us-ascii?Q?vRkc+yaBQoTKIwVI4qBdf2EWOqQcIK1BoHYkDOv5jbXZlUIBm2EhSpv0otyT?=
 =?us-ascii?Q?APYV/ijAfdV06uj4S8+bT6Tj9A8PLRY8?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e09d169c-16eb-4b4e-908c-08df111ee93c
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2026 22:40:57.2409
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5763

st1202_blink_set() drives the channel current register to U8_MAX, the
full scale of the part, regardless of the ceiling the board declared.
led_classdev_register_ext() takes max_brightness from the device tree
max-brightness property. The driver does not implement led-max-microamp,
so that is the only way a board can ask for less than 20 mA.

The brightness and pattern paths both respect it. Blinking is the one
that does not, so a board that declares a lower ceiling holds it until
something enables the timer trigger.

Program the same value the other paths use, capped at the width of the
current register so an out of range property cannot wrap it to zero.

Write it last, once the channel is enabled and the sequencer started, as
st1202_led_pattern_set() does, so an I2C error partway through does not
raise the current for a blink that failed to start.

Fixes: 35cbd34a6a05 ("leds: st1202: Add hardware-accelerated blink support")
Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
Assisted-by: LLM
---
 drivers/leds/leds-st1202.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
index b93828fbbe26..2114ef8a3119 100644
--- a/drivers/leds/leds-st1202.c
+++ b/drivers/leds/leds-st1202.c
@@ -385,10 +385,6 @@ static int st1202_blink_set(struct led_classdev *led_cdev,
 	if (ret)
 		return ret;
 
-	ret = st1202_write_reg(chip, ST1202_ILED_REG0 + led->led_num, U8_MAX);
-	if (ret)
-		return ret;
-
 	ret = __st1202_channel_set(chip, led->led_num, true);
 	if (ret)
 		return ret;
@@ -399,6 +395,11 @@ static int st1202_blink_set(struct led_classdev *led_cdev,
 	if (ret)
 		return ret;
 
+	ret = st1202_write_reg(chip, ST1202_ILED_REG0 + led->led_num,
+				min_t(unsigned int, led_cdev->max_brightness, U8_MAX));
+	if (ret)
+		return ret;
+
 	*delay_on = on;
 	*delay_off = off;
 
-- 
2.55.0

