Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795604870;
	b=PeFN07dc5hmmd5SrNJz8juhWH2N/I5LVXXOvkq7nh5rC4vDkugzEvvWjqxLIjqHPMgGH
	 TuMdmnx2Nt849SnJhpY4zRnqpl70L96vTfjmrvm6kOh9e9gaS6Z0QoxVdQo3MRaWNz6a2
	 dTDqF5Z/kcajJsnWgA3QihqDi7yCBUeU4GyoiBcl4tiArncFf8uDidZObAww+ZUTSURnf
	 azHDpirg85X5kk5siqoQlWGpynKfTx4fpiu9qyw9C7/ykfIoXmYJmCr+SJRSa3W1cFAIX
	 TPnZwy/LUbcnE9pGkUY5JiCaOo/S2a3cCcfFPB6lOnMGKkEkS2/z6PXl03oDtHTbU7g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604870;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=Q/YfNVXPnqN8pgnvRPkPuy3nc8kX1DYn5fcv77VYHFA=;
	b=F1hrGI3d74sfNi/PbVP0k4CEKwHJxXx8kUjqvZlC4mm4ycKpwOl+tTK0DfTAcd6yjD7F
	 DUcIHunrsCOY4k3FANpmi76wS+Fu992u/2y2Jd6UiJxg0sQUyrnIa5Js9N4TW2krAk0SH
	 bB4d7/9Xh3S7rnGzh9EBt/OybtW2ONWsIaCNuPlZXIdRxaSF0eOd4u7arF2fvUTvGoSfV
	 IplL86zCUECY9ul+FFjE4/MZ9t/wRHPcpbuJDgcF8WrZDVVtb2foFESSjuAOAGvRMmCUS
	 txLDUwnOtvaT8iYVC+tt9AWGJz4Pr98M2OWxJ070TtJ7MIXQdiKJnawUPWU0/RWG0aw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=a5XMRQF9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.28
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012028.outbound.protection.outlook.com [40.107.209.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C4A606A338;
	Wed, 25 Nov 2026 11:07:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00C4A606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=a5XMRQF9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rbjiDMR/EHtvFNrimShYqbNsXqWPFM5/mjEzAylKDxVFLk/gx/mdQrDNqr5rkM3foH37zBmcS1yYinBk+LisCk4qtQF7kipVBDSvD8NcX5dEmqsCcQgrsipJ/w0CybTeRht3BqNQBuDIFvtX4qawLpNgwMpvPwoGG9AbsqbRmvNiJj0lYlbSJ3k9JJOSjiaUlGr4JT3MRj2UVMlxPa13wfpbBOqTil/+wzY6XtODAAL2UIk36C0jN5CY8urqg/slReMM9YENSnOkWN2JNlUeInStoY0xX2ax45YRqR9UELpHf/3SE7vkbwmocmzieKIUJt7yKRA8rW3kMVJieNl6QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q/YfNVXPnqN8pgnvRPkPuy3nc8kX1DYn5fcv77VYHFA=;
 b=G/5ve2X8m1JrmIL/z1WfoWpoj7jaD2ZEVYw7FrVL6pzSojd3kKRUgPYaRMTe5U1JsDbrq7NpzVdD1bFkD+iZjDwc1HZ4/rTTVkctXdgVnec+rKh0zU+6mlVk4wnYPhkBuOux4JLEeik2fy3YSMfTz77EWTfwj3+CW1KDk3PZ7XdnV+zTqcoTeTdn9Zm3k5gk5InNKOua940vGpm5nuk2l+UjUOnbzBZgtM/UO4wrk+lo4Nsa4YFRk93aLyznl92lyX/KRpoqLTtmGlfYSpDGcrKUxq4sIjDgYWmNm8LX0CreU2JbYF0OcDr9cv1UNPR5F9HwRjlbN7h5AcPB17S/ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q/YfNVXPnqN8pgnvRPkPuy3nc8kX1DYn5fcv77VYHFA=;
 b=a5XMRQF9Fj89ShqhPErv3ftlWDWX/4ScC0RkR0P2OWyljnnCtZPnk5x6eMEayzW3iteyqwq6AjY/E2NolESxMpugYlrFlXAxmasqtjpirDvvk45PQaVMk5ZYcllf5rFo2CnZfNu7pfQjXbmOlsNRN7u8ECXKoEfZxb++Y9JDPGTgLDYFTKJQb+ArnZrvFmZ2lc9N7+oMjNVXYboxPQSI3eMi4Qhx/Moqhjwwss+8xUqTyNCL6fhLEk8n95okQ/cN3cf+GIofpGR9dfmD90oAzpPvCTqiu0VB7f9KwrwC0dozp3QsI+/JY6o+7MZCiyANLmS2xsHIgKilMLRRCamy8A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5974.namprd12.prod.outlook.com (2603:10b6:510:1d9::19)
 by IA1PR12MB6553.namprd12.prod.outlook.com (2603:10b6:208:3a3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Wed, 25 Nov
 2026 11:07:44 +0000
Received: from PH7PR12MB5974.namprd12.prod.outlook.com
 ([fe80::f5a5:bbc3:e9da:f8a0]) by PH7PR12MB5974.namprd12.prod.outlook.com
 ([fe80::f5a5:bbc3:e9da:f8a0%3]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 11:07:43 +0000
From: Adrian Ambrozewicz <aambrozewicz@nvidia.com>
To: Saravana Kannan <saravanak@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Herve Codina <herve.codina@bootlin.com>,
	driver-core@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: fw_devlink: consumers are not linked again when a gpiochip is re-added
Date: Wed, 25 Nov 2026 13:07:40 +0200
Message-ID: <20261125110739.3760281-2-aambrozewicz@nvidia.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TL2P290CA0014.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:2::17) To PH7PR12MB5974.namprd12.prod.outlook.com
 (2603:10b6:510:1d9::19)
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5974:EE_|IA1PR12MB6553:EE_
X-MS-Office365-Filtering-Correlation-Id: 483526f8-ddcf-4a88-13a7-08df4ae4544c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|23010399003|18002099003|261009223027099003|261026140227099003|261022075727099003|261026121527099003|261022105027099003|261028144727099003|261021121427099003|10067099003|56012099006|261102123227099003|11063799006|5023799004;
X-Microsoft-Antispam-Message-Info:
	IH9j0YLun8Lwr9vhfTkU3uqHRUs8fIySIuf1j1DfMLNwaw2RnNPrbaYdlcP/bJHwy6KxKJ/30U6MbVAJl00uT6u5vCSqDNjv09X4HJ/2JujEv+SI6wYYRx2frpwJLqsnJKDv5Ub3sj22YbNWzRLmdC5Hs5URQwOhVM/xZven42xvpI843LpHxKTG3myDPFrmrFrO7YW3DEtJmgb+cNEVb+ItY14IC53/phzl7roZH59WVf8eC8mh28Wq8GBC4zi7ywwqTQqgtUwS75+/WPP06qTg2VTZrVC6hGnrYM4bxJ/MJF8a92ey0LDpZXm3LUslAusW2RqNyCvd7lrftIYe9CA32cTTMEl/4heYErgEc6FkbO7PZyXh5mCpNBCaTJtB5zeMWPCDX3aTr5a40NKNejrHM8RcGMCUpj59p4GIZz7tvIAd1aHmLR6XQs2GlUQJIWysV6YVxHI+a5f5R+JzlsKO0XN/FtVUkYDecovHgYwwuxPpN6WeJQlD5h/9dJB5pvT/5p9+VvpcSVhFSLjEBUw8JaTloswH+R33qgBNs6hbfOo9spr/n8E/qlulxg4M3wdeSBTy6DJzQc1RNSdzxUoToy0nUErXbfbMQQIxmDp3FpcVxmBO2fc7s42kYORo4lYp+cScY5CSRmoLWRNs3hU3C0XP8XJ0tjTvhohPYtA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5974.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(23010399003)(18002099003)(261009223027099003)(261026140227099003)(261022075727099003)(261026121527099003)(261022105027099003)(261028144727099003)(261021121427099003)(10067099003)(56012099006)(261102123227099003)(11063799006)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yWPvPyk4Q6l2nQuyUV8oVDetwb29JUYqfbcIweV81OnR0sPMq+gL4WGTdy6O?=
 =?us-ascii?Q?+UjenYqP3FVzHiAD1S4+TmvIVw4shMW7aeLVmRs4DnQKQPvw8ZbbNaHbrL5V?=
 =?us-ascii?Q?cs3gibyESsFJs1Xtr/oAQtyLykF31YVUJFeTAL6yrecPpFJVAu8co4V3dr35?=
 =?us-ascii?Q?GFkNg2tbWtBCX3MToR0rGsptVa79QA0ds/kn6Gys7XOcQYz11cysQoQdqnaV?=
 =?us-ascii?Q?+F8CvOVMmi+I2I9e20WO8zkOqRzMXRQQ6HlBexv7S+1963/ufWIh58cO7QJM?=
 =?us-ascii?Q?cgSeh+zlx93RPVHXjrDwdKdJqgZCIfDWKttRWFP+VPjvp1xpYh2r9VAA/N+F?=
 =?us-ascii?Q?xJE8FNlIVXI0aq5uO8fZaNVR0qQxF3vfNH6XQMGKRQyXvfkdxd5l+L/o2FAT?=
 =?us-ascii?Q?ONPpz3BlYNkEN34IRzc8h1Ax06vZ66f17ZGPm0EvfNepovLEA7PBKt1jirtp?=
 =?us-ascii?Q?uCslA51GSDHfRW5yRqlLkSaaYwU+WVnCze2JY1NXvR07UBZwr4n4iyzuDtEo?=
 =?us-ascii?Q?JZqgnFQ10UjwkXF3sQO949fp9bjtchqtONt7PPq/EF3bzB0aAT9h9IJKEWIC?=
 =?us-ascii?Q?MZhyL3v/T5UZHWuanPaViE+EYWpLA9yQSBPbL3UV03zgkvon0NF007h5tVlz?=
 =?us-ascii?Q?/YNbbchtN9eGQoL4RjRRbXJnuNTTbRM5R7BhMQrSuHQz37gvwYqhK2lyg/8o?=
 =?us-ascii?Q?7GpeqgLEoiEvwOMTBHlG12Eb6iAZ697//HkM18KTbPFh5M46MUAQiUL43KiG?=
 =?us-ascii?Q?B28NQv35L+HzQJAjSQ+eKReO1eytjOwnuXQcmXGohRjIwlrX4s/Bop8UXbCr?=
 =?us-ascii?Q?KnK4ZX74HIYggjpmFf921k3CeU3Lm4AbC9M4L4R/HIMD5n2WwV1DintRVNLy?=
 =?us-ascii?Q?GdjskGMpp/RfQx0YW1srJ0h5JVTcp7dtAVyP0o+dkw1EANdoKRlaacH0gwaM?=
 =?us-ascii?Q?k15XrzaQNGSaVZ9RuIE1M1N/t06smm25g9vGc54UZVO/Lo95iVMT0NRTkg/K?=
 =?us-ascii?Q?N89NJBkXfJGAuo2fLSuKZigiO/IfelKpCh1DoiuGIWA9Qqmx/Bj7Ut9a/oVR?=
 =?us-ascii?Q?qUzq4VmTT+CCGBuGiyMm3y4fnP/lFnm3pBmyvRxaR2kSzwacTkq2egtv46yc?=
 =?us-ascii?Q?pJ3R53EUfvdORXjdw9DKeXY+eKmvGpewp3p1BK5ql4aZxV1+JWgiIyzK0TFp?=
 =?us-ascii?Q?jLy0tX0HGowR4CNNS5gYMBAhvBbUczBC25CDs5YudbfBTjpdFfFN/Eyf6FCV?=
 =?us-ascii?Q?edgJT9OTi5fa9u4rFlPRS352QQiW4vxfV0i/5a3PF8LVqXRbIWaRgog4gh3a?=
 =?us-ascii?Q?f/uj+fN4X52XPt1/CziRd+N1i3/B5J9Akfz1U3F5HQFYbUGvL0GOVP4y98D3?=
 =?us-ascii?Q?QMdQNp8TS4Se+0s9B2VqnS1iXfLOw4Go4Bcxny/WwQ9krhxXKFJ2UhVpW6IC?=
 =?us-ascii?Q?DF9qzlHi0SD1HOOS5KnCyCaFXdOo+4vw7BY4ozWU5GNzDu12Mx2dlBlNkWkM?=
 =?us-ascii?Q?o7x+IUzptwib3u+34BAeoH8ztS0OlGhaPPTj0qnd4IqMM4LgYoFkt9rLRV48?=
 =?us-ascii?Q?Ilrsyrwk0SFlcR86XVDPO+pxeYC+lHav9RyHZMcdGj/FiD9TMmbChe69a8oL?=
 =?us-ascii?Q?g/PsiJdi7a6DowRlaOqxVU2mdkILuQwscABdMZsd3GffFF3KHapGBXR+2Wkn?=
 =?us-ascii?Q?7x0af66I3hUa0qVsTTsEbudu49GzDaUn4XBsDPl+KdCyliCWoHMYAM/golPg?=
 =?us-ascii?Q?XsUmNy4/+A=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 483526f8-ddcf-4a88-13a7-08df4ae4544c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5974.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 11:07:43.8343
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +TE0M72C13Uo1z0Y2Sjp/mKWF9IVxukfdFhF5xGGS5vNuz/BIFnviBNDOuC2sr69a25SqwstmJh685K6Fi1Kzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6553

Hi Saravana,

When a gpiochip is removed and added again for the same DT node, its
consumers do not follow it. We hit it with a USB GPIO expander in DT
(emulated so far). gpio-sim shows it on v7.3-rc7 (arm64 QEMU virt):

  gpio-sim {
  	compatible = "gpio-simulator";
  	sim: bank0 {
  		gpio-controller;
  		#gpio-cells = <2>;
  		ngpios = <16>;
  		gpio-sim,label = "sim-bank0";
  	};
  };
  leds {
  	compatible = "gpio-leds";
  	power_led { gpios = <&sim 2 GPIO_ACTIVE_LOW>; };
  	fault_led { gpios = <&sim 6 GPIO_ACTIVE_HIGH>; };
  	uid_led { gpios = <&sim 9 GPIO_ACTIVE_HIGH>; };
  };
  regulator-own {
  	compatible = "regulator-fixed";
  	regulator-name = "own_node_consumer";
  	gpio = <&sim 4 GPIO_ACTIVE_HIGH>;
  	regulator-min-microvolt = <1800000>;
  	regulator-max-microvolt = <1800000>;
  	enable-active-high;
  	regulator-always-on;
  	regulator-boot-on;
  };

  # echo gpio-sim > /sys/bus/platform/drivers/gpio-sim/unbind
  # echo gpio-sim > /sys/bus/platform/drivers/gpio-sim/bind

regulator-own has a managed link to the gpiochip. It is unbound with
gpio-sim and not probed again: nothing re-queues it, and its fwnode link
went with the first device link (drivers/base/core.c:2331, :2373).

leds has no device link to the gpiochip even before the unbind. From the
code, references in child nodes get SYNC_STATE_ONLY links (:2221), which
are dropped when leds binds (:1440). It stays bound and holds no line on
the new chip. Each new link is refused because leds has probed
(:851-859):

  leds-gpio leds: Failed to create device link (0x180) with supplier gpiochip2 for /leds/uid_led

The leds half does not need the device to go: with the same consumers on
QEMU virt's PL061 GPIO controller and only its driver rebound,
regulator-own is probed again, but leds holds no line on the new
gpiochip. From the code, an I2C expander on a rebound I2C controller
hits both halves.

Herve reported the leds case in 2024 and you called it a generic gap for
class devices [1]; in August you offered to write class device support
for device links [2]. The regulator case matches your 2023 suggestion
[3], though from the code a re-queued consumer would have no device link
afterwards. I found no later series for either.

Is the class device series still planned, and would it cover a gpiochip
that is removed and added again? Herve's leds-gpio link, ported to
v7.3-rc7, only gets leds unbound when the GPIO goes; nothing probes it
again when the chip returns. Would that be acceptable meanwhile? I can
test either with this reproducer.

[1] https://lore.kernel.org/all/CAGETcx_=g1dCH=YMUkc7VquUmLs=bNZMspUxH+V49uhcV0Bx2w@mail.gmail.com/
[2] https://lore.kernel.org/all/CACRMN=fEPoyEk1oi4QRMX0whMEF=xQv=kkd62bueKTKWtxDedA@mail.gmail.com/
[3] https://lore.kernel.org/all/CAGETcx_fXa6Zt_gkTQKw8Wt11EmSt8ZQ6TxKi5P+5ii3EvwsdA@mail.gmail.com/

Thanks,
Adrian
