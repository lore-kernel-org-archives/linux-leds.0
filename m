Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010006.outbound.protection.outlook.com [52.101.56.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6CAA44CAC6;
	Fri, 16 Oct 2026 09:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792142933; cv=fail; b=VmeYiDeyA4PKvPWFGggpYDEnPzqw06WRNKKAGFfNlUAch6qhXRtf5JxBxiA46aRZCby9K80+1NIow0HovYPtkVLDZcUyuEqO/2aD6iCi/Vk112zTUxKJSgqNDSzhpnBDMOj4QXEN8haP0DE1zD+tjeXnGhaAvZuv7B+7ROU+CeQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792142933; c=relaxed/simple;
	bh=EOPvLTlKOh1kEkoR9bZ6kfj4YWQlMuEURYGh9Dfx3zw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NRQFo6RS9Z3h8952OriiHw7izH2iXF6BlR/TBs93UqM3xDx2p5Ms6Q+sJozigv5YeSzNC7sdcLvw5mnNnwMOhznsGH2LRrptiO6Zjcx6EmwvBn7+vIa6pg3xeDTovvppFokun/r/7D6NdBFHMURxCx/rJt356BjQoH5KfpOo3cY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Ym6EwqBT; arc=fail smtp.client-ip=52.101.56.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ym6EwqBT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aPgCtLwUdtSUz/T60DDqhPzyxrSfDx5rGn1tOjZs8xLQFQOqyBriop9zNVdYFrUCWpvcdpda8zb7jFKr0pDyy9UqOC/GM3mfOzWrhavenbr4Q6o+ErW1v6fnpQenH6DAU7za1f8fRawO/MqCIrD/wBFo6gV0faKU7um7bjDLUoIgOUKn2iasV1w3Lb2zJCn22ucnVpWUMXn2mz9RflkBajftpecakERjomzd6McM1osBDjDFlp2WQ1yBe8ebI25E5fVM56v8fxaSC7T5pWaMbvN3H423k1BDAXBrwvMyNU7gjfNsvNuMKLZTlikHrMdQIU6IOyhPiVLEVaU6mQ5WCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EOPvLTlKOh1kEkoR9bZ6kfj4YWQlMuEURYGh9Dfx3zw=;
 b=Xl/wc73TvBZpk7jxom2++icMyKg+DuUxsdULQLRQn9u5AbESGjEva+ewyFQShjQ2GHDgkoJcr2NyBiitObec7bumTtB9ARLLc15G8lSWK73RQSdVLYPCgDa64y/rpROSCLOgRbEoXCTMuX3g77BEvjd1NaNIhgV1dqK85OVBCG9kOfp5GPD1yV7nXNvPm/Mqk9XxSV9bS9I4+Vw3ap8++DlG8W9ZRmvgx/UjlSlM7gnGLM6nMwlE3KyqPf6AAhGBmOEdFijaKPs8A5mFICWzVX76KF+9Ege3OiSaB9TsSdCrJtJLTfbYyDSVtFyO2gKjGF+u7XUuN7c3ZJLwK4YmIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EOPvLTlKOh1kEkoR9bZ6kfj4YWQlMuEURYGh9Dfx3zw=;
 b=Ym6EwqBTasFSOxBXoUMPYkfJBaHIyEQummimSeZsoTgRSQkb/TUdgjL6DabmL27nxpF/nOdvyBVZix1kDOgRgwL1QObUkGIlCqWvEWOc/xSqew+CpDNnw6cpLcneidteBC+Idvn/+k5/UDSjWXSlLo9wi/UfNLWKXpiELPNy8ikeuhA8VaSXW3CKlBhVOT5NbyIB/odZjZZNvf7oErpDCibM9exT/lWfiXA51yNfxdGOHco57Evn2jXjvfwBpu+QUmPEBvaMOs215LStffLghmcNdHEqpOsoPi8QUKrm2VzmdNmPzTvxGdVocb1NbauixxVdgyl5o0XpVr7MOoVtlg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5974.namprd12.prod.outlook.com (2603:10b6:510:1d9::19)
 by BN5PR12MB9539.namprd12.prod.outlook.com (2603:10b6:408:2aa::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Fri, 16 Oct
 2026 09:28:46 +0000
Received: from PH7PR12MB5974.namprd12.prod.outlook.com
 ([fe80::f5a5:bbc3:e9da:f8a0]) by PH7PR12MB5974.namprd12.prod.outlook.com
 ([fe80::f5a5:bbc3:e9da:f8a0%3]) with mapi id 15.21.0522.012; Fri, 16 Oct 2026
 09:28:46 +0000
From: Adrian Ambrozewicz <aambrozewicz@nvidia.com>
To: sashiko-reviews@lists.linux.dev
Cc: lee@kernel.org,
	linux-usb@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: Re: [PATCH 07/11] leds: Add NVIDIA LSTP LED driver
Date: Fri, 16 Oct 2026 12:28:17 +0300
Message-ID: <20261016092821.2049721-6-aambrozewicz@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-168489@kernel.org>
References: <20261012-lstp-usb-adapter-v1-0-aambrozewicz@nvidia.com> <20261012-lstp-usb-adapter-v1-7-aambrozewicz@nvidia.com> <sashiko-outbox-168489@kernel.org>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR2P278CA0042.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:47::13) To PH7PR12MB5974.namprd12.prod.outlook.com
 (2603:10b6:510:1d9::19)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5974:EE_|BN5PR12MB9539:EE_
X-MS-Office365-Filtering-Correlation-Id: ac36e04b-16ab-4198-87c1-08df2b67e0e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|56012099006|4143699003|11063799006|261009223027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	8pBZkGN0+KQJxQ9P0CnvdngKXccz7g6omzYohi2OLTvSYikqyHZGpWzJUJPLIWkE6XRfWuHf1OFOadpyTFdcn9XeC9T1GjfnE49GahoU+PXqI5d63EnyQxHUmk1gteN2RDdbH6KzEUsidbFgh1Q50QMFP3Z9k6IyehuhgiYTMVnsJM+bIpuu94Q4cLAiDKjFyRyJNThmnkmOTxoZ6ZSCE+2xMhGUG6HK2K3e6E4MoUyoSZowHXNCrvydaOfJJY3A8MBsVUf0BXTn+xN/opDUtrFft0pV0WagLelS5riOIyM3//kthOO4SaJtER3KbSFB9/bLaocpc0T7L9FbOOfDagcHJHz4zPv6O8IwiFZY0m9fVXDWhgNq8NB489G7cxtDIuPV2TNCw5Hh6UcU4iqI7WyHajEGmGWh35iy0Bc7sXx8ddD/r3VDzEbpqISd3lfGBtSZyMxnN10m1mxO3QxX3TnUtbl4YGIXI4kYtMZK95QNU60U3MiZsP9qz8KnSf+ZtMNv1JGjw/iz8cvoo1WfsKEM4MCDKaWAOCTiaG+CsLIvEOSSTRZIwamW4EpINm4F6JeOcNlvQwISn14Uts+waL0n7DOahIdgaaYNx/H4UtsAb0dOq+M6HfudgnpqDfkDp29JyEJWwr6Jp7D2TTUsEmaNnQvnRdcsUkt8WvW8Snw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5974.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(56012099006)(4143699003)(11063799006)(261009223027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?W7mBlDuAPdDHyCHXPQpYanQsO8fl3z8RvvlUjODZ+d98iSTK+BEZvPR67yTH?=
 =?us-ascii?Q?u6We3VR/OhG368UYzT722PiqASAWoxO3H+x5+rdA+E25BDMms0ww7Hs9TvZC?=
 =?us-ascii?Q?e3HYMESByocPumabTfW5L3f1bKjmQ9CbuX6OjGbQa8vvVuhksVZPUpuS6Hq9?=
 =?us-ascii?Q?WTFIYD5yEmXhneh+WjsuRbz+/fUOOWHYNQKPKtZi4TH33QHJ7Pz8NKKfZV0z?=
 =?us-ascii?Q?VA8JKRl1dCB+g12pKDBz8dxz8goZh9A9v+/iXB4nifVGMiJxc0Cou0UQIaqe?=
 =?us-ascii?Q?iqX3WsHIPEf3aDTNZTU9MU8JNnBJxvmJBIIqdmUsN2HKrnmILnT7f7PkrxN8?=
 =?us-ascii?Q?AWF7spj01h8UuoSw2Aw1CbJTUIts4XEm/6Z9hiTEYqQLw4rTV6Drf/hmiuM1?=
 =?us-ascii?Q?FATqFnRYaOWvzddjMe2UeWnlIzPVBWXO0Usx1cAuRbgvHPd+406Lyevc0o6s?=
 =?us-ascii?Q?+WV7T44wrT8kxSekOkLPfFOplAIwz46SqHdAlPY91x1EdSnkwH4hjVhonfGu?=
 =?us-ascii?Q?HeATgT04fDXUiGP8szym4w+AQ56D4gsRY+jKsnNsYwQT7qpqOgWTItaxkTrY?=
 =?us-ascii?Q?WIMikQ4RUK2okawpZRMr6MYaO/zfIHuS244yG8gcKFhxVZcQQve3RUxFVVm6?=
 =?us-ascii?Q?7SmtSaAqse8R239U8NFsIS2BshNgeHNzOdWq5gxfZckLd2Wi0C9PQxFPgtfu?=
 =?us-ascii?Q?EWck8ZjId25BC8udNwEGmCECzYYppMlegNQ50qDKye+S2ZS9+e6NwR7go4jG?=
 =?us-ascii?Q?RUfn1q43MjK2zoZviKhBeCyLLbUHGRd0m0UgYhYwrgV4tXCpanzYQILQjqCJ?=
 =?us-ascii?Q?QbjJ/7yp4OmS21ff6PWiwezqKqHNUhT/DNojVvMavN/M5S2QxneB3mMujiiX?=
 =?us-ascii?Q?lKN4MM3z3tF7S/eedo+yKC7r9COAOnSAoboW1hzS0gzc6gl+CNsY2//0dgfT?=
 =?us-ascii?Q?EuUF25byZMDs36kuVHJREa+VNKOS4lBvcwlGW6ZK6YDfjlOTrQYF6IPEdhrM?=
 =?us-ascii?Q?WJWPiJcabr12c5hGcE69Y53pjM3ZN46ScQF90/4YlU44uQfIgosZmZhg5ZSE?=
 =?us-ascii?Q?VVd6QHiElsOv84KqWM0wno/6fKguls8irNY3LoJPbM3OdSBojFnRzbQDst+b?=
 =?us-ascii?Q?UHaj1q6BDh5d4MW1mPTrWfUpETsE+1zCH9FexqRmRX9bo+NaFJMcgxivWKmS?=
 =?us-ascii?Q?zJzf1jg1TNAD9qqn7NmvDtwVEqB2dXoiDFwC8OwYiUHqeSVH5mDFP4TFUrb/?=
 =?us-ascii?Q?fJ1kYHEG2Xq2WgSwhf4MotaPSTpA8MMHXRpBZvhm0kXF1LDNFUIDlXjaMt60?=
 =?us-ascii?Q?W2UIUAKshrZje3tLi8w7808ol04rfcxF53EefbZgYym6GrN8YSJPn1Aq6KfO?=
 =?us-ascii?Q?+HobGFDTpQAPYRNWF3RvxpUsId2CsGUoCgi6+mnO3MLYKoDuYB5hmthRv9Lo?=
 =?us-ascii?Q?MBFvkT8yPD6w59KmRQcftoYtnZWyQ/cLlKJIg9tVlVuSQtGkiWse7dav+pih?=
 =?us-ascii?Q?moYvZFG4tKBY98WK2Yx4Maym1UZYKWgWuS25YQVMC2St5UnncM26QgLU/bwy?=
 =?us-ascii?Q?khU43qKGny0lASmn/kBvmhZ/RjywuY7+BOPxUzqQQPHa/l6rvJ2EuQ7728bR?=
 =?us-ascii?Q?NwWAxM+z5FLRoy3rORdOEb/Fu7Ac1el/dWQmvZf7ff5C3AYQY6/SYqO/7iKs?=
 =?us-ascii?Q?JaZ7ecjkaMeS97hTv/Kic2akIF1dBZCMoekREAVt0/me7yN/FgvCcw60jnA5?=
 =?us-ascii?Q?GedMjW1bWQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac36e04b-16ab-4198-87c1-08df2b67e0e0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5974.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 09:28:46.5009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7yhl8ZTeTPs3k10kYC+rk9Fzvo0FP4T+0kszSdvRhS2ystZ6iEEgtxtUYPoii+fKdKcdO41lRG1175qKQDb/bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR12MB9539

On Mon, Oct 12, 2026 at 05:46:52PM +0000, sashiko-bot@kernel.org wrote:
> This isn't a bug, but the commit message prefix seems to be missing the
> driver name. Should this follow the standard format, such as
> "leds: lstp: Add NVIDIA LSTP LED driver" to help with git history
> categorization?

I'll go with whatever Lee prefers here.

[...]
> Does applying the initial hardware state here happen too early? At this
> point, led_classdev_register_ext() has not yet been called, so the device
> tree max-brightness property hasn't been parsed into led->cdev.max_brightness.

Yes. The binding does not allow max-brightness, but a software node or
ACPI can set it, and then the default state is written against 255.
The led-pattern path has the same ordering problem. Both will be fixed
in v2.

[...]
> By warning and skipping nodes that lack both label and function, valid
> modern DT nodes that rely solely on the color property (e.g.,
> color = <LED_COLOR_ID_GREEN>) would be entirely rejected.

Agreed. This will be fixed together with the rework of the bindings.

Adrian
