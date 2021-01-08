Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1957FC433DB
	for <linux-leds@archiver.kernel.org>; Fri,  8 Jan 2021 13:16:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C4D4C23788
	for <linux-leds@archiver.kernel.org>; Fri,  8 Jan 2021 13:16:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726255AbhAHNQD (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Fri, 8 Jan 2021 08:16:03 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:59494 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726251AbhAHNQD (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 8 Jan 2021 08:16:03 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 108DE8Di124814;
        Fri, 8 Jan 2021 07:14:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1610111648;
        bh=g0pkcwcjiGAqkqsfnTonqQXJ/nohPTQdR+RYC4zUUyM=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=VjsAY//Ts7URFssHH/00D6nYHV26ek4HXiDoOor73tMwzQ/mCEbrTEG9uwQ6wCxZb
         OicTesEMYeeFXpctXcsw5NgodS0/Ph7/KYaDfU8pQebGnCukPqMqjHXwbHzrxO1Drn
         hG/bF5K2SsTEfIigFZW03voRyvH70Ce+Q/L7V9JI=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 108DE8ab102531
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 8 Jan 2021 07:14:08 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 8 Jan
 2021 07:14:08 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 8 Jan 2021 07:14:08 -0600
Received: from [10.250.35.201] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 108DE8i2066270;
        Fri, 8 Jan 2021 07:14:08 -0600
Subject: Re: [PATCH v2 -next] leds: convert comma to semicolon
To:     Zheng Yongjun <zhengyongjun3@huawei.com>, <pavel@ucw.cz>,
        <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20210108092446.19547-1-zhengyongjun3@huawei.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <fde7dc3b-9ca6-6009-eb16-b325641e3f4a@ti.com>
Date:   Fri, 8 Jan 2021 07:14:08 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210108092446.19547-1-zhengyongjun3@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello

On 1/8/21 3:24 AM, Zheng Yongjun wrote:
> Replace a comma between expression statements by a semicolon.

Can you add a "Fixes" tag here?

Dan

