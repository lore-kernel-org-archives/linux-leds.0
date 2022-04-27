Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6DA3C433FE
	for <linux-leds@archiver.kernel.org>; Wed, 27 Apr 2022 19:00:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231279AbiD0TDK (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Wed, 27 Apr 2022 15:03:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232316AbiD0TCm (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 27 Apr 2022 15:02:42 -0400
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACCCC55237;
        Wed, 27 Apr 2022 11:49:46 -0700 (PDT)
Received: by mail-ot1-f42.google.com with SMTP id l9-20020a056830268900b006054381dd35so1689235otu.4;
        Wed, 27 Apr 2022 11:49:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XkFp4bPCvGPvoxtWs0T4GHuydk1I/JnKWam2KB2EgH0=;
        b=PKr6+1UPjjmqe3i8J52m9ihx3+gk6Q+3IQAvzdqlMWszhcI14es0JaySCGorwMwDTv
         YV0fczsFLcigN78riGYUTljnry0Z6heNBgAzpmdueTKpZYFGIRQiUe7nwxu7H55iD0ll
         IDY7Qb2lBL/nEXK6pv4dSL/w5qtCn1Iw3uu/S6uFhG61tC/VB+wKIoLX9Ae5pGbIBj46
         E0s7zBE711c/y/dJL+XC9aqN67xmhGFu6YPBH68swPxE49V0Rt8NFOOy7WWIgtCawX+h
         JrDR7TLSUlejmqMVjBLmNmqDDCM1BsFK09nR5B77ozPwz5H4Q0tJZlTwqyc7xtk6n/Bl
         /h8A==
X-Gm-Message-State: AOAM533L7E6VboSlC+rkT9JWoMHgIzS0K5doxNmUP012rtbmovwkwfYL
        +rx3FXI7SoQiMM4oFkLmQmR5VXOPIg==
X-Google-Smtp-Source: ABdhPJwzbS6guqppl23lSNHSgJWx3eX7jtWwvge8UqnbMtpDtrYOg0GP/AahJ5xlCu0LogWKhvRbow==
X-Received: by 2002:a9d:6759:0:b0:605:4d93:c44f with SMTP id w25-20020a9d6759000000b006054d93c44fmr10488106otm.373.1651085385939;
        Wed, 27 Apr 2022 11:49:45 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id c17-20020a9d6851000000b0060551d14386sm6148712oto.13.2022.04.27.11.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 11:49:45 -0700 (PDT)
Received: (nullmailer pid 444224 invoked by uid 1000);
        Wed, 27 Apr 2022 18:49:44 -0000
Date:   Wed, 27 Apr 2022 13:49:44 -0500
From:   Rob Herring <robh@kernel.org>
To:     Gene Chen <gene.chen.richtek@gmail.com>
Cc:     lee.jones@linaro.org, krzysztof.kozlowski+dt@linaro.org,
        matthias.bgg@gmail.com, pavel@ucw.cz, devicetree@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, cy_huang@richtek.com
Subject: Re: [PATCH 1/2] dt-bindings: leds: Fix binding document for the
 Mediatek MT6360 LED
Message-ID: <YmmQSHKPAk2Bt1cE@robh.at.kernel.org>
References: <20220427080330.40136-1-gene.chen.richtek@gmail.com>
 <20220427080330.40136-2-gene.chen.richtek@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220427080330.40136-2-gene.chen.richtek@gmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, Apr 27, 2022 at 04:03:29PM +0800, Gene Chen wrote:
> From: Gene Chen <gene_chen@richtek.com>
> 
> Fix binding document for the Mediatek MT6360 LED
> 
> Link: https://lore.kernel.org/lkml/YmHK02g1pC19Oyh6@robh.at.kernel.org/
> Signed-off-by: Gene Chen <gene_chen@richtek.com>
> ---
>  Documentation/devicetree/bindings/leds/leds-mt6360.yaml | 2 --
>  1 file changed, 2 deletions(-)

I already sent and applied the same patch[1].

Rob

[1] https://lore.kernel.org/lkml/20220426133508.1849580-1-robh@kernel.org/
