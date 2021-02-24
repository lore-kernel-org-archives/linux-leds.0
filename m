Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2207C433E6
	for <linux-leds@archiver.kernel.org>; Wed, 24 Feb 2021 16:07:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 720FC64EFA
	for <linux-leds@archiver.kernel.org>; Wed, 24 Feb 2021 16:07:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235120AbhBXQGp (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Wed, 24 Feb 2021 11:06:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234340AbhBXPol (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 24 Feb 2021 10:44:41 -0500
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 563F5C06178A;
        Wed, 24 Feb 2021 07:43:57 -0800 (PST)
Received: by mail-pf1-x42f.google.com with SMTP id t29so1548262pfg.11;
        Wed, 24 Feb 2021 07:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=F0KLBWS2W58C1mncZrZj6XYYjOTe4I0lLVbrvhxQFPg=;
        b=rzsP2rqIpc8txgkbOcKSxOuj700vJWZavDofAJxssBIq3xg6Sds0/B5jTZtqjCoGyw
         iQSycq35TiQDC2QbvtUjqHfiD0vpW4aiBjolXqfRkNwb6zKYrueHVjUDf2cXQlsGw7Ta
         Q0UIJ2naXAfN4czn88AcI3SWZAnR6JkpzdvA74sUFQcZZR5HDVRfN0T4REuVTdlxrHnT
         d0U6yTZnpzz6SX+yeYPBld3yfQELrr4Oc099GfxRWujtPtlF5063yQVrFragvn1bYWP+
         G30XWTFnIe31a1hFVq4WtMV0Ozus8f6tmnxIRPrKjIQsUiUROesYP7+/Y7Q2HrwES1dJ
         DnNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=F0KLBWS2W58C1mncZrZj6XYYjOTe4I0lLVbrvhxQFPg=;
        b=ujV3ssOYKXeVGFOi61VSIvxtUsoVzl8pRERLEB0NHCNsztKs69EgMKOc8YUXMneRSg
         bsIL2nS+5qRIDmTQQu8EXvKrC4xvu3mtXIOwdZlxgGZ8fZylXxkg65B45S0IDnn+cRvf
         A1PUUP09PGfN91ttPYaOClzgKolpJdCoAvLgQ8yfMVTAWhz/55t3wnvpR8X1Oa2LwYWk
         4jjG2gFsM47kmTqS/TupYoPGQpqZSGIDE3uXJIaigTB33Fwi8EO9AIL2qiWtwEZv1LlG
         J4Ypqk7TXHwzRkWD8bq7lLyCDx5fNeUyW1zcc/rtJ/2YFxyfGiaOS1E9k0Wy1Zpo+FFD
         L9Yw==
X-Gm-Message-State: AOAM530f7Rv1FdSVmmWVi6mLSDJ/QAUtbnV0vUUKkxUpmLzIbnW4Unno
        TocISODxMXJ0+TQYw2sqibioSlxAwY8=
X-Google-Smtp-Source: ABdhPJyxIdUgANGydRXeaK1ncYAeTWetwo+E0x6He7QUS75cxtS0ZMIM6piwHr29tr8alQQFq9BYFA==
X-Received: by 2002:a65:67cb:: with SMTP id b11mr6599993pgs.58.1614181436559;
        Wed, 24 Feb 2021 07:43:56 -0800 (PST)
Received: from [10.230.29.30] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 184sm2827216pgj.93.2021.02.24.07.43.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Feb 2021 07:43:56 -0800 (PST)
Subject: Re: [PATCH v2 2/2] leds: bcm6358: improve write and read functions
To:     =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>,
        jonas.gorski@gmail.com, Pavel Machek <pavel@ucw.cz>,
        Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210224101110.20179-1-noltari@gmail.com>
 <20210224101110.20179-3-noltari@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <2b8364ff-9b89-f709-365e-d7c3face29f7@gmail.com>
Date:   Wed, 24 Feb 2021 07:43:49 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210224101110.20179-3-noltari@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org



On 2/24/2021 2:11 AM, Álvaro Fernández Rojas wrote:
> This is proven to work in BMIPS BE/LE and ARM BE/LE, as used in bcm2835-rng
> and bcmgenet drivers.
> Both should also be inline functions.
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
