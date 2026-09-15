Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazolkn19013079.outbound.protection.outlook.com [52.103.35.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98E339EF27;
	Tue, 15 Sep 2026 12:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.35.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789476191; cv=fail; b=LHm4dzVpWeC+pf7GfLA0KGdwWYUZmIh9VyZGtnAUxtvCKpTA94U2MrudkN9dWzNMcjfKaptcRaBPUhl4F/I8q9hi4bh7vDXDDhNS7zlH21VQqZLWrP+MRsarBlXQTDcfkZiWHhYewyLtSG2QBCujqkaaLe6e34Ca5E90mSdl94Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789476191; c=relaxed/simple;
	bh=QcxsksoMjeg3NJWPk10wfRFoN4TAJoTA6kF5lOL4apw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GezbqcQc6RNUxokaQDqQYswhm4+pLwVO6bGYF9iGWKvWvli+Dn6gro1R/9irzn5r7uukSU34fUpjWxeOTaF4XptIS/tcOfHf1GPjs4W75wac8sf8fpzwU4U6Qq3imL4EY8d8EnxEUeLQzoKU/C15f9vUMh9uPmzHy1b5o7ftq+M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=gz6M0WAk; arc=fail smtp.client-ip=52.103.35.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="gz6M0WAk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Md5xnDdh4sOQJUm1Y5ewRVZK6fYJKDhf9EEv3iI9YddZQEoRkzJ37/kv8++sqnaynGB1Os88rwmMxUFDZKmOPDNCqDlbzPe4PMp85/LGsu67X+cwtT5DXTjow7dKQQ2BszIuuhFcqSLWcfmxBGs4r7jvxfnLUF4UCNUvdqOgEwX997MSgFNaTK6I8MGPv92rN5xRM4ZRuqBrqidhP7dZ/OUFYYaGzKFqkyMCOx+DUXoii7Po8/VLRKzlsR0K7iWyLsu/bUB88azuvMfdSZspMSUw9M4KCPIVJnGByxB7BpwsIrX12fHbq225QXbQNZXBYqfI5Izz0PJsPdTCqovkKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zzXFXYlEnY14+sALfJFArf1cbVBixY4nEONDy6wsckM=;
 b=slQVrtgsqUbmQJARHuKqspGzgzj1JTNEBaHqGpIDJ5ZDQ50aU00wuONPI6CxsdZkVTEXM6GGgA+hWsbT/RevRY7G1lrqYfn87QGfAYtiIotAXrgE1gO2Vw2doHZFpvEmoQamvDL22AwI9FiAgSei0Fu2FCPj0xbecIljPVnU4S8b80Y90ExPsGjfIS9+L2u/d9AJzBrlSYe/0/9Va7gDp1+fwnHBVZ0GEia9kz14MkPWv1vlukUDSBqPeTfBSKzebD1Z4SDOMcCsRFlSq1QkUYu4Vvx8tlv87+3AH8OSe73sjFGj6jxpIC4sVymcS8Q378023HppwjUXao6hKBxozA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zzXFXYlEnY14+sALfJFArf1cbVBixY4nEONDy6wsckM=;
 b=gz6M0WAkSE0Db1hJbwx7RsKcFCSPX9uSAzByyR6XlpSFEpatzZD0rZVDD6ucTXNI8rMySI5jCmf0BXxhdatMczNISxGSZdd0JQqQ+xfQAeSVmg4udXaA2gcze5TodPEjzss5e0g/HPLGjf18to5ISH6jARFah0ngQWK87f15Ss7YyZHQsT1fqK5fMQoVZvQUcJiKVbgu6337yut+mMUkRWTzy8ZmteHcpcGgjfEOkK3Wzrpr5ovBErlbPdERoFhXW/HbFJl17fDN33q6ewAqMgGzUFcPUpoxpXwvmSVAyvrnYBBhj4zbN0GWqiBFpWom4U0PZF/PIteeJwM16/rd1w==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by GVXPR08MB10666.eurprd08.prod.outlook.com (2603:10a6:150:14d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Tue, 15 Sep
 2026 12:43:05 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0428.004; Tue, 15 Sep 2026
 12:43:05 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 02/13] leds: st1202: Spell out the phase-shift configuration bit
Date: Tue, 15 Sep 2026 13:42:52 +0100
Message-ID:
 <GV1PR08MB849716E21E082D3B93B5B683C5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <GV1PR08MB8497668D389D43F680D2CE3CC5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497668D389D43F680D2CE3CC5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
Reply-To: fombuena@outlook.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0564.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:33b::17) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <20260915124252.3369069-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|GVXPR08MB10666:EE_
X-MS-Office365-Filtering-Correlation-Id: b7ed1889-ba65-4dd9-0b8c-08df1326e2f2
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|15080799012|23021999003|37011999003|8060799015|19110799012|24021099003|41001999006|25010399006|51005399006|440099028|3412199025|2607281247196008|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gcnpGup3cH5z1rGGXogP3E0/4w3Ez/RDrkvgYsqWUU8IWQKZgqL1gr5x4QOf?=
 =?us-ascii?Q?bzs4Oq/kayf7QZKOmcSIahTyaA+Rjzsec8ix9y1KTWKjJHXR8vueAT15At3p?=
 =?us-ascii?Q?+cKTsRRmXggEoajMHqNSuXIVB7s7WMlEm7Rr26V3Pp/XHz9qOzliExpfXLw+?=
 =?us-ascii?Q?cxKbd/wM2rk7pQbQFz3jadhwxbtP8TIVukWQtp0DfshYarZjnQNeemkLk2Yd?=
 =?us-ascii?Q?nOGWawjeEyWFnRQ5wm/8FEFIVRFHExcKdx1EDQOsWwMzxldQ63JUKJYDTLed?=
 =?us-ascii?Q?khTZZBCq022HoNnzHtHmlQutXW7n9oO1CRITAAzaKqm114dXyUU7MmDhnyDM?=
 =?us-ascii?Q?XiamM/DD0bJOID5K/ysXqL/TT0krOQNOBpc9umiqmHLLgkCcB39bD4sWnS/b?=
 =?us-ascii?Q?GGE+8hcL8uh2+1E2V4Q5PjKCExKfECNohmHWyjCPRPv0xphXwwV08PeW5I+7?=
 =?us-ascii?Q?8L3weJwaBbKBE6BLH94USuvnyzuvIiJo5xjDR8PY7m3RhfjfkTZ7DwZX1fbm?=
 =?us-ascii?Q?eJJ/vIya5sfJQRwJpbjlyjZdC5BE++8NmFGGpFqxMXyZVAsJlxb2elr1hXmU?=
 =?us-ascii?Q?oIQpjE4/6OfwL6uWjapN5wUk/gdRA8m+bkLVsVZG9Pi6oKbWGRYKFkqi02Q1?=
 =?us-ascii?Q?nCXqZOeSH2A3jRsMIidhyDk+bOm1iD0+/XanIg4y53VTifaF+9UCagpUOhaJ?=
 =?us-ascii?Q?s7ut2i9/diwQm57cyFGnB/bLkUN3qoaa0xwLE7gLZApg8jTa3c6V4lRtM4eu?=
 =?us-ascii?Q?KKgBUeMcNNdM2p9P/6k5uuMa57w4Id/Hbnw61GWD5acOikg1Yd0QL4/ZDFrl?=
 =?us-ascii?Q?drND8XNIiyANhgVDCk7R3S4yhMFo4h7HIjV2w38rQZlmOoAG7pL+AHqyX9yr?=
 =?us-ascii?Q?V0FR5Bj0NwZlixrMFq4Yr/w+6Y+ZokC0KNA/AKENoebTk8ffsoVYf0bimuIi?=
 =?us-ascii?Q?dq95RB4DHGOSC6htvmuOJ0IOTGI7MwzbxCtiMOCly5xtP88+ry71Qlxqaz+0?=
 =?us-ascii?Q?ilRz?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5AH45nY7QTo0/Xx5CG/u2q7B0bBl6Xs/kDBBzn2WFWB4mV14ukwez1J65eDm?=
 =?us-ascii?Q?leG3gy92sYDDEPR7hnTfH65H64dgOv1GBWeOaabroYRA0ywLW0gSapj/Kgdb?=
 =?us-ascii?Q?5w7+kN4/VODBGvScSI8zp23DOp2ZVt7A/PZDgKR1a7sMS2JiGxv9S4jJc9wg?=
 =?us-ascii?Q?gcKWjdYJVyy/tqyeWgWVBlJgpVGph77Vd3P9KjX1HN6dmxg3CvM6bgLvXckY?=
 =?us-ascii?Q?7p4U1ogoPWH4bL/dZ+ku7ZixB3RucXW1QVk27Za27lM60FJB6LL7oJ8bXh5S?=
 =?us-ascii?Q?3b/zZzj/wtiOcyZ2vtpOg/1llkhXo+03k2Ox/zJzCHBxWzv/yse3h+uFLGHb?=
 =?us-ascii?Q?i7jKBFbGD9Af3k3ktRd45hxrwy1Hj6zLYve7mZwhjbVqlcfj8TCjP3QsSIOL?=
 =?us-ascii?Q?V+F1FRJKpSiN8Rm8y6+lBqT9pK3oMIRbyzLMMDiDQ9zLEOiOaLWmf8HmRpp0?=
 =?us-ascii?Q?soBKsvogo5NRxJe9nqfa9R+r/5HYbUuwDcNlcSRRG0TvZmakFsDcO2f4/xsQ?=
 =?us-ascii?Q?Kq24Gy56EPTLrEmUnXcFaosmsUfVUw8tpx7CeNAOvU+BDu2lC9eaotAoIiEj?=
 =?us-ascii?Q?e0nd2BEZDcIrRJmf/6mUL6T+v+yRa5Vj01cPEwLP2B4GBIASUaY8wHKeeuJ5?=
 =?us-ascii?Q?fmcR25jglj20GY9TRNM6yKGGUzR+BpIfiXPe6bKc/pLoY3C3ibPq3QtJK9rl?=
 =?us-ascii?Q?YuaV5SI0l2SBTgXOJr3z8vvSxsM7GoqXobHl0A0YAICKHTLzaNb3DG9X/Tmi?=
 =?us-ascii?Q?/3goLuNnc/pFlKo+OnOZsPRT3Gw/HWJTjg5rsHI7MfHXsdv1EshOgp/qKYt6?=
 =?us-ascii?Q?rnxnRt2H6T20uWkHgl2c8aA7QSTmkyKkelpy6+G9yyhIJ6MX5+ZJipVoQggi?=
 =?us-ascii?Q?Ag4vrCTPbhOGY91eW2l3r7clu/49UYM3PgTufR9zVh9rH4N1pGFExFIN5vCu?=
 =?us-ascii?Q?SqjTLPphxNAtKIdJc1jynZ0gFXrNYGK7+VMVnj62ZwHh9/gQ3valNJzV/xZC?=
 =?us-ascii?Q?F2jrVL7UnQSNKdCkn2T9z7AFezEd4b2JJZzNPHxlavYJupC1vdfoYxnSwyfR?=
 =?us-ascii?Q?tXkD9uffhvSYG1gkNpMKXPffUzGZReQV0FHcWMzYN/DRwmLkts96TpmdAvIJ?=
 =?us-ascii?Q?Z4KTPOqUO5pCGqPnOcSzissHraE0YJ05MzaAfHzSUoR/P8GaK2wtOZEb5O0B?=
 =?us-ascii?Q?9C778KBhb915+DE+0TfffvKhZAK34JcAxp4DgtuyMsqQ8cfaGCKzp9oUFYwW?=
 =?us-ascii?Q?unX2bpQbzIDTWqhdZV7tmdwbLvwEz3XtgWNF8Fj3zlRoqFDpg2IBQX8iSGyM?=
 =?us-ascii?Q?XoCw8T4N+cLogDaQn1bhEaH+/gQ7vTMSSk4QuYyM/7n9fyVHsZSiLidzRJee?=
 =?us-ascii?Q?qccLtroYpaAG8NC1BArQilCJKpZksXFrptmNDNMgtfcmWgZG2xd5pd204iz9?=
 =?us-ascii?Q?L6W3kPo2iL8+5+LmpZU9N1jBxNWgdV6F?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7ed1889-ba65-4dd9-0b8c-08df1326e2f2
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 12:43:05.1014
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10666

ST1202_CONFIG_REG_SHFT is abbreviated to the point of being unreadable
and, unlike the neighbouring PATS and PATSR bits, carries no comment
explaining what it controls.

Rename it to ST1202_CONFIG_REG_PHASE_SHIFT and document it in the same
style as the other configuration bits, retaining the datasheet name in
the comment so it remains searchable.

The longer name no longer fits the existing layout in
st1202_led_pattern_set(), where the continuation line was already 106
columns wide. Re-wrap that register write to match the layout
st1202_blink_set() uses for the same operation and drop the redundant
parentheses around the bit mask.

No functional change.

Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
Assisted-by: LLM
---
 drivers/leds/leds-st1202.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
index 5a2202fb4c22..d8a04e96fb46 100644
--- a/drivers/leds/leds-st1202.c
+++ b/drivers/leds/leds-st1202.c
@@ -24,7 +24,8 @@
 #define ST1202_CONFIG_REG_PATS             BIT(7)
 /* PATSR: Pattern sequence runs (self-clear when sequence is finished) */
 #define ST1202_CONFIG_REG_PATSR            BIT(6)
-#define ST1202_CONFIG_REG_SHFT             BIT(3)
+/* SHFT: Phase-shift delay enable */
+#define ST1202_CONFIG_REG_PHASE_SHIFT      BIT(3)
 #define ST1202_DEV_ENABLE                  0x01
 #define ST1202_DEV_ENABLE_ON               BIT(0)
 #define ST1202_DEV_ENABLE_RESET            BIT(7)
@@ -210,7 +211,7 @@ static int st1202_led_pattern_clear(struct led_classdev *ldev)
 
 	guard(mutex)(&chip->lock);
 
-	ret = st1202_write_reg(chip, ST1202_CONFIG_REG, ST1202_CONFIG_REG_SHFT);
+	ret = st1202_write_reg(chip, ST1202_CONFIG_REG, ST1202_CONFIG_REG_PHASE_SHIFT);
 	if (ret != 0)
 		return ret;
 
@@ -246,7 +247,7 @@ static int st1202_led_pattern_set(struct led_classdev *ldev,
 
 	guard(mutex)(&chip->lock);
 
-	ret = st1202_write_reg(chip, ST1202_CONFIG_REG, ST1202_CONFIG_REG_SHFT);
+	ret = st1202_write_reg(chip, ST1202_CONFIG_REG, ST1202_CONFIG_REG_PHASE_SHIFT);
 	if (ret != 0)
 		return ret;
 
@@ -268,8 +269,9 @@ static int st1202_led_pattern_set(struct led_classdev *ldev,
 	if (ret != 0)
 		return ret;
 
-	ret = st1202_write_reg(chip, ST1202_CONFIG_REG, (ST1202_CONFIG_REG_PATSR |
-							ST1202_CONFIG_REG_PATS | ST1202_CONFIG_REG_SHFT));
+	ret = st1202_write_reg(chip, ST1202_CONFIG_REG,
+				ST1202_CONFIG_REG_PATSR | ST1202_CONFIG_REG_PATS |
+				ST1202_CONFIG_REG_PHASE_SHIFT);
 	if (ret != 0)
 		return ret;
 
@@ -299,7 +301,7 @@ static int st1202_blink_set(struct led_classdev *led_cdev,
 
 	guard(mutex)(&chip->lock);
 
-	ret = st1202_write_reg(chip, ST1202_CONFIG_REG, ST1202_CONFIG_REG_SHFT);
+	ret = st1202_write_reg(chip, ST1202_CONFIG_REG, ST1202_CONFIG_REG_PHASE_SHIFT);
 	if (ret)
 		return ret;
 
@@ -353,7 +355,7 @@ static int st1202_blink_set(struct led_classdev *led_cdev,
 
 	ret = st1202_write_reg(chip, ST1202_CONFIG_REG,
 				ST1202_CONFIG_REG_PATSR | ST1202_CONFIG_REG_PATS |
-				ST1202_CONFIG_REG_SHFT);
+				ST1202_CONFIG_REG_PHASE_SHIFT);
 	if (ret)
 		return ret;
 
@@ -419,7 +421,7 @@ static int st1202_setup(struct st1202_chip *chip)
 		return ret;
 
 	/* Enable phase-shift delay feature */
-	ret = st1202_write_reg(chip, ST1202_CONFIG_REG, ST1202_CONFIG_REG_SHFT);
+	ret = st1202_write_reg(chip, ST1202_CONFIG_REG, ST1202_CONFIG_REG_PHASE_SHIFT);
 	if (ret < 0)
 		return ret;
 
-- 
2.55.0

