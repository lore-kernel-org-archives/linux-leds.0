Return-Path: <SRS0=bC6L=D6=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8678C4363A
	for <linux-leds@archiver.kernel.org>; Fri, 23 Oct 2020 16:28:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8DA39208B6
	for <linux-leds@archiver.kernel.org>; Fri, 23 Oct 2020 16:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603470507;
	bh=/BuzCgerQZAMI42mg7Qu08zTys00kMt6NkdPJfzFAIs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=noVns+jccotWEKyYKFiTwvcskKV7cjBrrGtXSGNqcPSPxzkctvVCCddxe5fkIbQHh
	 NzZPr5AkXh4YQpP82IJa1obt8oHLR69jRSwjR/zv4bfSW0sIrmQZSGC89/4E1Jxz3t
	 0qFJ90B2JVAJFrUaXmhDTGKZzxAN1L2bVruo4Ulk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1750591AbgJWQ21 (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Fri, 23 Oct 2020 12:28:27 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:42272 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S371933AbgJWQ20 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 23 Oct 2020 12:28:26 -0400
Received: by mail-oi1-f194.google.com with SMTP id 16so2458579oix.9;
        Fri, 23 Oct 2020 09:28:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2/F4gcPmqW9k3gfZUEuVT5UA/z/NAFC4iSRG11LIn+c=;
        b=Uqz+rcI5WVlo49bCzJieO7mRqmcOWlCa8GyfLmjVjJyuT8JpDeGwVM2tpPJo6leKpt
         JxRJ3W7zT5sAYndFLM7y46R0dITEVu7pnasoUs1uAszPHOIsUyCgZ9KdzB+lkx6iOMfx
         fG49TPK3Ndj+bwdFCVVTJ170kkP/5pQDneXRSOArofjwonS3xNvr/S617Jfm/YXyMmdh
         PLYfdgg3tkvH0+7WEzuP8INtbD96GePjgF4v4QuEe859gIyL7wwc3GeI2RJk5+gKV+hc
         TN2tJtwNxk2CKeJzSoQBEF6Hf1U3gZnVr0CVabnGXtUKsFXtdM5v8ESerZn2htVcPXIx
         5D6g==
X-Gm-Message-State: AOAM5327mpeOqm/R8S4MI1WamDTSScaLGGfna2fS99VSHYwhXGXS2zRj
        GOZTWbG0mfVkg9wUGeS47A==
X-Google-Smtp-Source: ABdhPJwe2qFcFHOCLXfp3Qrfl3ZtYE+6ZoVPO+xoTzzWaoe7uJCZB+rDCGHpJkSp9Bs/iJoaQtD+yA==
X-Received: by 2002:aca:f084:: with SMTP id o126mr2397685oih.104.1603470506162;
        Fri, 23 Oct 2020 09:28:26 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id e76sm601380oib.16.2020.10.23.09.28.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 09:28:25 -0700 (PDT)
Received: (nullmailer pid 2820622 invoked by uid 1000);
        Fri, 23 Oct 2020 16:28:24 -0000
Date:   Fri, 23 Oct 2020 11:28:24 -0500
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dan Murphy <dmurphy@ti.com>, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, linux-leds@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: leds: leds-qcom-lpg: add pm8150[bl]
 compatible strings
Message-ID: <20201023162824.GA2820586@bogus>
References: <20201021225100.162795-1-dmitry.baryshkov@linaro.org>
 <20201021225100.162795-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201021225100.162795-2-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, 22 Oct 2020 01:50:56 +0300, Dmitry Baryshkov wrote:
> Add two more compatible strings for Light Pulse Generator blocks as
> found on PM8150B and PM8150A/L chips.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
