Return-Path: <SRS0=3sP4=CV=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4A89C433E2
	for <linux-leds@archiver.kernel.org>; Sat, 12 Sep 2020 02:24:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 47C0D221E5
	for <linux-leds@archiver.kernel.org>; Sat, 12 Sep 2020 02:24:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="jl3Dmpbk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725765AbgILCYO (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Fri, 11 Sep 2020 22:24:14 -0400
Received: from m12-14.163.com ([220.181.12.14]:33449 "EHLO m12-14.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725562AbgILCYN (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 11 Sep 2020 22:24:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=QMo56
        RhklZ2LepW7CTmbVzItjGLs4oQqQgOIOoy4EJ0=; b=jl3DmpbkJvv1blArBxvUR
        LxxlyFr2VK6eun+wAVTY9itRY7EWNDq0WLcGY9i9b5ltDexaxs80TArIg6GCpUNL
        L0926CxhVA1RVQ2NGQBblWAnGIo1ztwHOpvsclrTnklDecmvH8fB3OP36cXTBRUm
        R/eOBHzwty6GA1r7fMSYuI=
Received: from [192.168.1.166] (unknown [58.33.126.61])
        by smtp10 (Coremail) with SMTP id DsCowADHzVEsMVxf83FjKg--.8433S2;
        Sat, 12 Sep 2020 10:23:41 +0800 (CST)
Subject: Re: [PATCH v3 1/2] leds: is31fl319x: Add shutdown pin and generate a
 5ms low pulse when startup
To:     Pavel Machek <pavel@ucw.cz>
Cc:     jacek.anaszewski@gmail.com, dmurphy@ti.com, robh+dt@kernel.org,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200825082206.26575-1-von81@163.com>
 <20200909091825.GA14289@amd>
From:   Grant Feng <von81@163.com>
Message-ID: <68948033-6d74-a10f-c81f-ee65a528032d@163.com>
Date:   Sat, 12 Sep 2020 10:23:36 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.1
MIME-Version: 1.0
In-Reply-To: <20200909091825.GA14289@amd>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DsCowADHzVEsMVxf83FjKg--.8433S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
        VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUyPkuUUUUU
X-Originating-IP: [58.33.126.61]
X-CM-SenderInfo: xyrqmii6rwjhhfrp/1tbiNw2dOlWBh8RtKAAAsP
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Thanks for the info.

Best regards,

                                                 Grant

On 2020-09-09 17:18, Pavel Machek wrote:
> On Tue 2020-08-25 16:22:05, Grant Feng wrote:
>> generate a 5ms low pulse on shutdown pin when startup, then the chip
>> becomes more stable in the complex EM environment.
> Thanks, I applied the series.
>
> Best regards,
> 								Pavel
> 								

