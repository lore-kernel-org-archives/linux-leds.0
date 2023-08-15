Return-Path: <linux-leds-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00237C001B0
	for <linux-leds@archiver.kernel.org>; Tue, 15 Aug 2023 13:42:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237167AbjHONmI (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Tue, 15 Aug 2023 09:42:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237330AbjHONlu (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 15 Aug 2023 09:41:50 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 341AA1985
        for <linux-leds@vger.kernel.org>; Tue, 15 Aug 2023 06:41:49 -0700 (PDT)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.56])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RQC7v1SxJzrSLd;
        Tue, 15 Aug 2023 21:40:27 +0800 (CST)
Received: from [10.67.111.176] (10.67.111.176) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Tue, 15 Aug 2023 21:41:46 +0800
Message-ID: <178af48c-70d0-3057-acab-32fe5b038346@huawei.com>
Date:   Tue, 15 Aug 2023 21:41:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH -next 0/2] Simplify the code with declaration-driven
 macros
Content-Language: en-US
To:     Andrew Lunn <andrew@lunn.ch>
CC:     <pavel@ucw.cz>, <lee@kernel.org>, <ansuelsmth@gmail.com>,
        <davem@davemloft.net>, <kuba@kernel.org>,
        <dan.carpenter@linaro.org>, <yang.lee@linux.alibaba.com>,
        <linux-leds@vger.kernel.org>
References: <20230815075944.1089298-1-lizetao1@huawei.com>
 <3ac35f8c-aedc-4ea9-afc0-5c39711bbc29@lunn.ch>
From:   Li Zetao <lizetao1@huawei.com>
In-Reply-To: <3ac35f8c-aedc-4ea9-afc0-5c39711bbc29@lunn.ch>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.111.176]
X-ClientProxiedBy: dggpeml100026.china.huawei.com (7.185.36.103) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org



On 2023/8/15 21:17, Andrew Lunn wrote:
> On Tue, Aug 15, 2023 at 03:59:42PM +0800, Li Zetao wrote:
>> The patch set uses the declaration-driven macros to simplify the code.
> 
> Hi Li
> 
> After reading this description, i had no idea what the patches were
> going to do. Subjects and descriptions are important, they help get
> the right people to read your patch. So please try to improve them.
> 
>      Andrew

Hi Andrew

Thanks for pointing out my problem, I will pay more attention to this 
problem.

With best wishes,
Li Zetao
