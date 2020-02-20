Return-Path: <SRS0=0WBE=4I=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 371E3C11D0C
	for <linux-leds@archiver.kernel.org>; Thu, 20 Feb 2020 17:21:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 03999207FD
	for <linux-leds@archiver.kernel.org>; Thu, 20 Feb 2020 17:21:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="AH+Ool0K"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728671AbgBTRVn (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Thu, 20 Feb 2020 12:21:43 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:39096 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726959AbgBTRVn (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 20 Feb 2020 12:21:43 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01KHLaEm102063;
        Thu, 20 Feb 2020 11:21:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1582219296;
        bh=+u6HhgFJylfGOe9gG7faZ7Q1c5EP0CTKU6EgfVu2Hpg=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=AH+Ool0KP1zrqPWDDReNUJyqRg+nFvlXi9/gXX5NIuxuOIq2EVei/GXRYoW3EDzDa
         9lEOhjYuyaym0Rno8MRBcdndukQSXBd+0d7997XDax6eW+/P8YoPdIFqAR9wTRUTw/
         NXW+sS2PzjljmBY0psVCzvT86wbiyLv8E1+p/XTk=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01KHLa9A041978
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 20 Feb 2020 11:21:36 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 20
 Feb 2020 11:21:35 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 20 Feb 2020 11:21:35 -0600
Received: from [128.247.59.107] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01KHLZGb092806;
        Thu, 20 Feb 2020 11:21:35 -0600
Subject: Re: [PATCH 1/2 v3] leds: ns2: Absorb platform data
To:     Linus Walleij <linus.walleij@linaro.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>,
        Vincent Donnefort <vdonnefort@gmail.com>,
        Simon Guinot <simon.guinot@sequanux.org>
References: <20200220150833.56542-1-linus.walleij@linaro.org>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <330230a1-1c20-c9f9-6005-0cd24d0c990e@ti.com>
Date:   Thu, 20 Feb 2020 11:16:31 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200220150833.56542-1-linus.walleij@linaro.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Linus

On 2/20/20 9:08 AM, Linus Walleij wrote:
> Nothing in the kernel includes the external header
> <linux/platform_data/leds-kirkwood-ns2.h> so just push the
> contents into the ns2 leds driver. If someone wants to use
> platform data or board files to describe this device they
> should be able to do so using GPIO machine descriptors but
> in any case device tree should be the way forward for these
> systems in all cases I can think of, and the driver already
> supports that.
>
> Cc: Vincent Donnefort <vdonnefort@gmail.com>
> Tested-by: Simon Guinot <simon.guinot@sequanux.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Reviewed-by: Dan Murphy <dmurphy@ti.com>


