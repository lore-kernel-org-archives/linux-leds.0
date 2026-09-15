Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazolkn19013009.outbound.protection.outlook.com [52.103.33.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C746138422E;
	Tue, 15 Sep 2026 12:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.33.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789476479; cv=fail; b=PFUmZtJ6+zsXP9z+htsC5nN9T6Dru+vGh7VgwXEj8bqxqBrCYtEr9F9cdPBY8SAWDGIDV5xET88/Eriip0gKYwNZ0Qh9ZFCJMy4+vCH6svTZxm795RAYzZYiB+Ixyj/GJVz222XtrBulVALbvHtO139FX9fSxfJKIQuqPRC+sIM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789476479; c=relaxed/simple;
	bh=+creXhlxBXqVr8RfRghxQW2DUpzFte5nS2qibaSLsFM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Tylv2u2Ova2UIt/yP2LuzybR+M41UD6gFxsS9L1QPD3KjhVTHY8qoLCxtWoFhftjLccH6Ur3t6UcZQR+jTN15IguhhLmOCosVDO2YrO/QMlBmGVfw/T9CX/+Nq+vcEorywxXbmM2xU9KJsjIq/TRe1jVGj4l1Li9E7yr6yhV4E8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=W+l6MDmc; arc=fail smtp.client-ip=52.103.33.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="W+l6MDmc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gx0w90FjDO5bWCI5fKmovqV5PElyxeDlAe9NcEa41MvU5Hs4P8hdL3EP/Z9QMXwdMt010eSmcjwRr0zruTYPBujEUVoamrJoMt0Z7KuHc4yBiY5Pknq+Gvv8l/Ho6+yEuX5gnA3nptTtjaejEVaI6buRFvbNJqrSI1p0b/msgmg3lG9g5UU30INzFXJYmMIRV+EgobQemyCS6goo14xEFxwGq2yjHIb1rr6xyelh49Y8/rkqZHUfb0qth3JZUCjH25M7fAqDb9VhitOUPB2gnxj0XS8Z2V1ScgKezOlKbPIxX3gh8ZZvaB/ZzbUppO49pjyx3yCBaH+7XOuIDN6cFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3JOzcodiWIAv7U7AEKldV4W/G9WL4VdOtnQ8KHUW0AI=;
 b=h/75+ZNuHBG5Qf1HLEMYvaI2pZXIcxm62ITRodG7QohvWCfeKjWysY76uwNwcdPyDkDJKmqUjwsXqoeP0L+N/h/cpn2An4vgKiphTI/vwWo91is1cKgQ9s3OoctYRK8DjN0w2uIzR8RaepQoc7o95q2HwFbbvSSNJ6wTmrDUJETZsO2pMkR2dsIIG/frEebczIixPoQp2/dmYAcwfqPB+uCfEoNbIGwLk6BCPlvc3M2wuo25lTi14SxVsQsslulMxZSzptts1LgPioLTD1KspfFAQmEHwUOn1PALRZCf6lMKpn0oGe0ZY5Su7F2uPI7l72u6dT/VrLTO4nj5m1cHXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3JOzcodiWIAv7U7AEKldV4W/G9WL4VdOtnQ8KHUW0AI=;
 b=W+l6MDmcSmPFE9vvyyaBFKoy7T03k4JVoOWJ/EUN7Vupqgv9hBJfnaRzNSowDxSkC+rf7b42gDIVoeDodOHq0u2uCWmhrM+/N0PMN7N5+d5IjRTa5+2WcGAirG0tIjViVmt2IcdD/A1I3+88RU/9wyxr0SeB9nf3zZCF6Cs7MVtBpQGDciW5d/c0ffK1SVJsv7AYyr/ZUyG+kgOWr6m/h/EHgD0pm0atLN4ECyyQTNu1idvs4/gXz6RqhKCfrxL18ZO82oLEhEOPFeGNli2x/QDo3G6XYBWXTtpsaWHYvycCwd03OJ1syjW3P9BSRc2qB8ven/Ci4U7gn8VO+Q5Tjw==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by DU2PR08MB10106.eurprd08.prod.outlook.com (2603:10a6:10:46d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.8; Tue, 15 Sep
 2026 12:47:51 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0428.004; Tue, 15 Sep 2026
 12:47:51 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 11/13] leds: st1202: Honour max_brightness when blinking
Date: Tue, 15 Sep 2026 13:47:39 +0100
Message-ID:
 <GV1PR08MB84979A5D536C71D319A06808C5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <GV1PR08MB8497668D389D43F680D2CE3CC5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497668D389D43F680D2CE3CC5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
Reply-To: fombuena@outlook.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0659.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:316::11) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <20260915124739.3395898-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|DU2PR08MB10106:EE_
X-MS-Office365-Filtering-Correlation-Id: ca46ee3d-1f23-4630-4527-08df13278dd9
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|24021099003|16051099003|41001999006|15080799012|25010399006|23021999003|37011999003|19110799012|51005399006|8060799015|440099028|3412199025|40105399003|2607281247196008;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MFU4YqXYyR7xYkG4m/vyFEoLSGGex7MJcVu2kKmu6HH5JpjD2Ld23T4BSiFf?=
 =?us-ascii?Q?8Hna5/0dmqdBdUo71lS/aivnNoH6uwrgWAMSx93uk3gOfSompjgk/hlPC1ve?=
 =?us-ascii?Q?NP+RrLT00apj4JTY9i3M36gL2WOsynC3iLpRkjpZ11vfgTKufdSFyyfJrnF4?=
 =?us-ascii?Q?lQib0lCbATi7efAEAuewfuiW5PeUp+73NugU7U0S++uz0lISrxZKtbYb2158?=
 =?us-ascii?Q?IYFAG1Iz3IE8wD92/8jHQpPeoy2/TJ4h7bQQ6PFjiLSRLf+k0FOdtzQkz3eJ?=
 =?us-ascii?Q?03Yb6iawzmKpucjTVw9U5tbxdhNHUBa6t1vGVev73z1KwnzKpGgr+p9S6Jbp?=
 =?us-ascii?Q?PWRG0keN9UyYtq0Gj2lklpdm+teu9FndtjGvJX0PQTL7TL+6cSimPnFMAQ3b?=
 =?us-ascii?Q?EcqDd9OJ1nL5LMhYcUpOfErh02MuI4Ffg/U+W6Yz3DYjvneZU+/YaNB+klP0?=
 =?us-ascii?Q?tVvxLYDeWcSSBKJEAnxpdaxNauNnAG1rzigetd6o+KUUB+9ATNZe5ZdgSD0H?=
 =?us-ascii?Q?Yd1mkv5SdNPnEGg1pjq9HnDvEqDOut5FjrpOh3dSHV2lijwnNNjXq5YMCMqh?=
 =?us-ascii?Q?7YO0Vsh8HS4kya2SkaFCMCYkX+AQJhhOiY1Og6S8ks9fl8MlPMRZ3VvTLSgd?=
 =?us-ascii?Q?S5Koc+PLDZDMPZmp+tisWLKsJRfmVib3BDHLA055fUEyN10ALmEAhg6ToG8L?=
 =?us-ascii?Q?UMQtkRt5SklY8UMe0L0gSrx057Cl30R6DiZXG4PL9kOH78EOyWH0lVH2JFHy?=
 =?us-ascii?Q?ffWb0ADODwm66qVio7EhOS+eLYB9b8rW5HDX5bzy+NrCux7el8N8b2JpFrru?=
 =?us-ascii?Q?m/QobSTmnNrdVwZ1FRrUbXbp3XFQ43vr76VkkBzWineNnIidSOGUbAy6DK9e?=
 =?us-ascii?Q?pT3efU0AmzdnwGwbJllMbn2fq4GinLNmzzuvepgR5D8mBCDIdkdNzBz4+EWn?=
 =?us-ascii?Q?uWkxR1HxpActSnb4vwmq0k7TCwdinL7jGLblGzTmp1YyQznwWLPbeZjw1bm3?=
 =?us-ascii?Q?Qxgh6LVmNP5ajWuwpWDRmZcLnUbRCazFQKr1toqOGE4Y1KM=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ewDEzmapT8cYT5Amaql4j2aGwnywkHA6QnhVbJnZFikHcWOFYQd4tvyvhRhJ?=
 =?us-ascii?Q?Gk0pRXFC31m84WnJUzzPRGcif3txOaqtf+0lBIQub7ER1l5eYfgHMp4DcjQN?=
 =?us-ascii?Q?TqDG9aUBOvdvIAA7BZMIaWg67BF4qLzAxsZk2+MJarWb7GodU1htK9gChy9m?=
 =?us-ascii?Q?jyg7Vy6Hl480AQ+vvWquQJPC1ZBUpOewNPYVqQiQL9JJP5dEUgUB+OcT8A10?=
 =?us-ascii?Q?GtEAV3IjinQCaIeAz8ElWKS+vhgWvImTmUdBYfLqLABi6dbwcK90KWi1+kZt?=
 =?us-ascii?Q?Qt6N6+TtTHoPMQzOD4rkqgCvFY6FKgMSzuqp8Caa/JCX9WOxKedmTIUb8fuy?=
 =?us-ascii?Q?NS+AR6k52jjjxJI2kZWdpq9RY7WjQLWKzHdrvKK04+6MUMehTGwB6dQxBqn+?=
 =?us-ascii?Q?6s/xAMLo+rlagQqWfPJ+kBGuMIqLbqIqgQkUi/ZO5JdDhRWsx4lzVk+8zBA2?=
 =?us-ascii?Q?w8+eX1c7UhqPRp07eCiRqWJqnU4BQxucbATANggxMxPxL5StSDOMRamHj0AJ?=
 =?us-ascii?Q?NXqrC2C062Znwee5ORce3ENjF03c6KUXnoUioEPB/097fbiSShZg9uaF2/1o?=
 =?us-ascii?Q?A7HVX9uOohUYG7pvlZT6JpQ7vKgEV8HTgVz5qu7LXSb3os1y/BGzOfEJLAQQ?=
 =?us-ascii?Q?uXbRHdB43bOGMLd/B+TYlMd4p1NPwB9r/Vk6u6setNx5ThPJ0AbM06F2OAhZ?=
 =?us-ascii?Q?ewirwAcorDGHJTrbBkLPO8WKd02WqbRmFFd8boPUL1fRs2drbRfwRhArflS0?=
 =?us-ascii?Q?e5ok4C4mMv8NEYqN1hKkvEJ9Qx39FvnVr7X1Pf1UwzAAt8rwTOk1krsyb631?=
 =?us-ascii?Q?1DZF1w2JKmusQz2YxBDYyBnBa33tWKzPhQxRZnFIq5IJb611UDUhuFoHIFjp?=
 =?us-ascii?Q?ZlhIxuNNzZKR1yTUO7Gk9cPkXcHwPpkjWYjqsG84BKAmuQNc2lmGCyQR13bu?=
 =?us-ascii?Q?1kvqWSgCuJZQej5dkbd4PQVIhUW3tLBFaYR37Cl8mKGIOnq4V8JJa8U030eo?=
 =?us-ascii?Q?qNaRlytUzVhnpTYwxEeP804IZUGPhRzxHuPCy4RRTmovWXjrLEDJTe3E/n1p?=
 =?us-ascii?Q?nz95bRhijxJEjTCTZ/SxYBDHNWdkF8OFOvFOXqBFf17zR88+Fwf9buaSOre3?=
 =?us-ascii?Q?w00EGIdVHVtEpc0CdfXn00gl7/v58QaoZCUvW2ddoPAZZESTGp/c+HuYIysq?=
 =?us-ascii?Q?glbbYSKoKNw6qRU1V7SddYvXMvJ/72HxJLNDOtl8jPpzuLmDQuwP8Jpt7G0k?=
 =?us-ascii?Q?Emq4em9b+6K4KH/Tk/HZxCVOAJTKejyDbpEZWRbxpqL8lY+xgcBSkevhIvJi?=
 =?us-ascii?Q?QFNftQiYvyT8TKkslHgjEDZm0OEPKpNmkuzJyktoU/mG5kHN9ouhvj87CetZ?=
 =?us-ascii?Q?xQWgw0VjRR6dvetsAxxRXjlfrRoBdFnU9xGIrIdoh44FYNZD89KPkYbOwK+p?=
 =?us-ascii?Q?mwVw/GeGDmhcORCLP8i99fDPgMjIVVgR?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca46ee3d-1f23-4630-4527-08df13278dd9
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 12:47:51.8386
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10106

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

Fixes: 35cbd34a6a05 ("leds: st1202: Add hardware-accelerated blink support")
Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
Assisted-by: LLM
---
 drivers/leds/leds-st1202.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
index 42989b4fbaf3..39129206b78d 100644
--- a/drivers/leds/leds-st1202.c
+++ b/drivers/leds/leds-st1202.c
@@ -382,7 +382,8 @@ static int st1202_blink_set(struct led_classdev *led_cdev,
 	if (ret)
 		return ret;
 
-	ret = st1202_write_reg(chip, ST1202_ILED_REG0 + led->led_num, U8_MAX);
+	ret = st1202_write_reg(chip, ST1202_ILED_REG0 + led->led_num,
+				min_t(unsigned int, led_cdev->max_brightness, U8_MAX));
 	if (ret)
 		return ret;
 
-- 
2.55.0

