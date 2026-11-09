Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.31
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794229139;
	b=Ztz7lJ858WZUkBAT2cA1zjA4hKXJsOVdVkCOjjmG0VkKuf9KUOnuJDceHinLKEFOoWaM
	 aL/hM05iew+P2WNGwf2P5BK/fE4pPDs6uUoQlOkxMRTu+UjgQquIbVk9JDjIqKC/4zw3q
	 aaNau1WNGrXXIwyj4W/MgS4lmGknEGVood7dbUVRPmyhveGXX+5i3Mh0fHwzK6Yy7rXLy
	 4FRw11z3qW+qNSiWS+/+AIvZPPhdrKbDUWKktgkpZHuwRHpK6K7PLgx7v6n6IAM7U+oTc
	 8cyohrmUhdQEp4JmvC4A1I3YaF1/nLgelZdzkLUdq3wfJISBAQap4YpdF0+voi7WB3A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794229139;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-ID:X-B4-Tracking:
	 X-Change-ID:To:CC:X-Mailer:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=m7zwtY6sK6NM+ZsNevqPbBOTPBTCfAU6G+B8ORQlGpk=;
	b=z1H9VLXipgzSBDBu+uWk9JE31VPDQauz+N0ZMNscD0UkJ5F2SWt98Rs/R55tm999TS3D
	 OqbQ3CbcDCCHkOZE7ppEruiwB2Dcj+ozmUlHHP5uxQI++ErdiWdDWHULRRR0x7JKAufuf
	 yMPMUt8FzV/WvtvJz0JaiyuzpnTfOrckdclGXt9z4M+ONVpEljzLoYnNNapGW787CTuH0
	 yA1FYYuZbGVNHrhC1SovkjBR104WEOsON9YOWRUrAQIfNUifMTh3ViNljNYuThrN7zIuI
	 zHWw6TdWqifrrFhzJM2Yk3e+FBEQhf70fL0dolsWwHnTWbMV5kU097D5Tpoaaevufjw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=axis.com;
	spf=pass smtp.mailfrom=axis.com;
	dkim=pass header.d=axis.com header.i=@axis.com header.a=rsa-sha256 header.s=selector1 header.b=PDQkS2tE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.31
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011031.outbound.protection.outlook.com [52.101.70.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0305C606A322;
	Mon,  9 Nov 2026 12:58:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0305C606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=axis.com header.i=@axis.com header.a=rsa-sha256 header.s=selector1 header.b=PDQkS2tE
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=soVpDTUPWOBi1uuEHa9FYpw8S9gju4L7gsOawut6BtDejf5jBKT8ckm9aRL2b5WEvieorJW8cI98PyB7EFyYmRG4esm0XD2FLgHM0B4uD2A/NAxb3Ca8VFKbdCPh2+2f6qOA35SrIR8uv4S7tN7S4XkDTcHvpFn0qzrelYT0QcvvrGbn7VKXqe6nyacJ03SHHYFZlX/L4NW/dJPt7ojZfk+00HRrUzd8s7tSnBem8nlRwY7eqGQaOBLQwMUOdYewlyKmVu0I08z4TG+gbOSWW+L6HT0wrT9Xpf0c21F4yYyCSe7corhE0w65r5oxrrZDkjN5RMwjeGetNqMo966+/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m7zwtY6sK6NM+ZsNevqPbBOTPBTCfAU6G+B8ORQlGpk=;
 b=exeujzqboqfvinOYLmHdoLuFe+w1if9rdWuyLFk4EcETm4hbbhuSgAbpURShEZqQwd+SSM3Mt8xSX44wkkQv/7r2irolt0itpqJlvwt7W7yPWh6NwV6QHQxGN/iPNIedqLirvsbW8vua8MoZKVvXzO8+xS2R+YqvVhM6QhoTDSwbAalqHOHQ5QsIRowkFB5fCPv1b50NXr8ZbCwoFQvr6pW1r5yT563sdP/WFbOLzr1FHTw1T+H7IH9LkyZGTpD1JAG1oHDC7K96+145dQMERmCMYWQLCR32L3UrxXbrDkotGJY3ho6ghhYGyQGVP0wZy6Mdu+t6N3+1PHQGWZxg5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m7zwtY6sK6NM+ZsNevqPbBOTPBTCfAU6G+B8ORQlGpk=;
 b=PDQkS2tEOoYTzloJMd4B64/R5S42QKJalzl8P3YfFx8EFrXGBvnqcR0lDLlk32ktd9jIZh5sladgx8EcsZUKqym8c8xY0oCGgTRynXdwn8olPrhFTjQn97SzAYasyWc3SXqxOQxL6PkXMfV0gHhqFukhiDJBjKMXpxbDejLcAWc=
Received: from DU2P250CA0028.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:231::33)
 by GV2PR02MB11780.eurprd02.prod.outlook.com (2603:10a6:150:2fd::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Mon, 9 Nov
 2026 12:58:53 +0000
Received: from DU2PEPF00028D07.eurprd03.prod.outlook.com
 (2603:10a6:10:231:cafe::65) by DU2P250CA0028.outlook.office365.com
 (2603:10a6:10:231::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.12 via Frontend Transport; Mon, 9
 Nov 2026 12:58:53 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU2PEPF00028D07.mail.protection.outlook.com (10.167.242.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 9 Nov 2026 12:58:53 +0000
Received: from se-mail10w.axis.com (10.20.40.10) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Mon, 9 Nov
 2026 13:58:52 +0100
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Mon, 9 Nov 2026 13:58:52 +0100
Received: from pc63130-2524.se.axis.com (pc63130-2524.se.axis.com [10.92.173.61])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 5B2431D11;
	Mon,  9 Nov 2026 13:58:52 +0100 (CET)
Received: by pc63130-2524.se.axis.com (Postfix, from userid 18369)
	id 618F364CEDF0; Mon,  9 Nov 2026 13:58:52 +0100 (CET)
From: Tobias Johansson <tobias.johansson@axis.com>
Date: Mon, 9 Nov 2026 13:58:16 +0100
Subject: [PATCH] leds: lp50xx: Read default intensity from devicetree
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261109-b4-leds-lp50xx-default-intensity-v1-1-0a04a3533df6@axis.com>
X-B4-Tracking: v=1; b=H4sIAGfD8WoC/yXNTQrCMBBA4auUWTuQxlTRq4iL/EzsQJiWJEqk9
 O5GXb7N9zYolJkKXIcNMr248CI9xsMAfrbyIOTQG7TSJ3UZDTqDiULBtE6qNQwU7TNVZKkkhes
 bj2YKxvuz0s5AZ9ZMkdtvcbv3drYQumzFz184LvkPCrUK+/4BL2h3o5IAAAA=
X-Change-ID: 20260914-b4-leds-lp50xx-default-intensity-345d4cc702b4
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>
CC: <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<kernel@axis.com>, Tobias Johansson <tobias.johansson@axis.com>
X-Mailer: b4 0.14.3
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D07:EE_|GV2PR02MB11780:EE_
X-MS-Office365-Filtering-Correlation-Id: 77520a0f-8106-4bc5-a9e7-08df3e61350e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|376014|23010399003|18002099003|10067099003|11063799006|261028144727099003|261102123227099003|261022105027099003|56012099006|261021121427099003|261026140227099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	Ik6hKl19B6+eUhqMO5xuVKieg1v0hDC9xnLuEIx9R2HopqbNujeKftpdaCqplb4okmrcbYuYzZdpOVzUrlrdn3JFjLfLLAMnr+4Qn5Zsac0jlf/z/EeHel2A5mJ3XP3/8KLBBAqgJrgrmDhhzGDVm2NAEQIiGyMdZdUNnh3sNjnYNTnK4RRacMkkNBT4NPUKlY+oKVnPg7GP+FA2BR/CwNXG7APDaAVl9kxcyEDbWFTt5/syEmo5+vEEFefI4CTmr4wwxJVNKKmy8KHD4toiB6xZ474Kl46REFxCKXW7vfTvRxQgLcjXItqfFSul9Mq36nSStvy1bL6FGc2acR/72/OCAdo+X3P3mumSawOrt/vfv6GJV5x7FfNGBminqwas4jkFdxS57aY+ky95PFNn0iz+INNePZQPRbwvnr+eSz3Gew2KHxftanWU7aiGyLyJbYZlGU69qkAG2TQiYRtFnks3zvXUPSA+ajaa5FvxsCrlmJ94VvDrJAo4f9wORx2S4T9Nq1UVYKcwj7MDd73Sfe1PueydEHxN/UMrQT4v/qK+BQDZAGmFm8DmUC92pKB1Dnipr4dzZC9vQtkEi1YktIITjdbndqeJY/7bTNnWL+KQSdXHns7l0z1+AakNv8dtkHJB4A935l8V0mwUTkNQGgPAzi0y2jpCC287wmM+xIeHYBcF9M3xguyT6XxMHk1H1sTlrFnJadN1puJNgtW5ig==
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014)(23010399003)(18002099003)(10067099003)(11063799006)(261028144727099003)(261102123227099003)(261022105027099003)(56012099006)(261021121427099003)(261026140227099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	avV542XMv7Oasdbd1VgR3TcJQn9AAoxJSbpbTEpcY5WyRyes4F8UxMamoD0qarFdI4oCZraqHtbGtSN/WZewTcpyl3Gop1vgvTs8zohB3LNyKyEsTfHLxkRDnVEMA/V1Ts5Q21Awmeg5pKWKSXpnagvK/yRsawX4OZOfhyBKwB/fBD8IrwhU+OIOaA/54YPJgQ7RUxFunXs6SZjRvX1mYXjQuMStA99cuWryPQVTYcxn6YZ8oV4uovU2HICm81tly16pq+FO9W/+hA4ito8xQui7DrwB1IJQ0dyLMqCwY0YCZVytbtsUK/OYkOl/fww2QTnOsBfaHhREJgfUuqEH6ENAogqQzUbMExtFV9QfAsr+yAHQ1HcfW0mmAKZ0LLFzWpPf7mJCijrotpXwryv3y8I7dvXsplFLZwBS3a9qn9nRN4+mzNzpPG1HSlHGzBm6
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 12:58:53.2295
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77520a0f-8106-4bc5-a9e7-08df3e61350e
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D07.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR02MB11780

Read the default-intensity property for each LP50xx multicolor
component so that the configured color intensities are available
when brightness is applied. This allows LEDs to use the intended
RGB values without first writing multi_intensity from userspace.

Leave the intensity at zero when the property is absent.

Signed-off-by: Tobias Johansson <tobias.johansson@axis.com>
---
 drivers/leds/leds-lp50xx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/leds/leds-lp50xx.c b/drivers/leds/leds-lp50xx.c
index 20bfb315bda1..019a3e3cad05 100644
--- a/drivers/leds/leds-lp50xx.c
+++ b/drivers/leds/leds-lp50xx.c
@@ -522,6 +522,8 @@ static int lp50xx_probe_dt(struct lp50xx *priv)
 				dev_err(priv->dev, "reg %i out of range\n", multi_index);
 				return -EINVAL;
 			}
+			fwnode_property_read_u32(led_node, "default-intensity",
+						 &mc_led_info[multi_index].intensity);
 
 			mc_led_info[multi_index].color_index = color_id;
 			mc_led_info[multi_index].max_intensity = 255;

---
base-commit: 05b4738b0078f7d6f154f68068a11c8a0635e9df
change-id: 20260914-b4-leds-lp50xx-default-intensity-345d4cc702b4

Best regards,
-- 
Tobias Johansson <tobias.johansson@axis.com>

