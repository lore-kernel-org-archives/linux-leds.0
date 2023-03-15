Return-Path: <linux-leds-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CD06C6FD1D
	for <linux-leds@archiver.kernel.org>; Wed, 15 Mar 2023 00:51:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229988AbjCOAvv (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Tue, 14 Mar 2023 20:51:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229525AbjCOAvu (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 14 Mar 2023 20:51:50 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14AB02C67E;
        Tue, 14 Mar 2023 17:51:49 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id cy23so69183931edb.12;
        Tue, 14 Mar 2023 17:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678841507;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EwBN2Hj7A9dlDwxqDE/m/THVw9Imb9kKwPpzlKQlm1k=;
        b=F8UwypX/oGX1md5s7DE+tOq1rZ7QnhWTDgm9pNP+lwWdJLAUP6j01C7TcCPux/VjKY
         5Ot9d/H/1CP2RK9PgE/Exm9FK9YoPsa2zUyQWxrUUDi09iHE9fe/ZIs5aW0F+XCEMqm2
         JtPP+4u96s6PB99IcBc+JFiSVwj7jXLaKUVUJmh4idWFa9avBXjwwAo7WZl1YovQcsn4
         KZes4yJ6QP39ISjwfwXGd8J/EnZgqoaxJgcthaeoxjGsJ1QUUcsniD/JYUEsjhYlkqjn
         1OxAFgcjk17WFQgQpwX8X/IsN09bPjYWnz3KTKWzJfyjthcVcquk4RlNCGQkJUhMnl8Z
         KRyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678841507;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EwBN2Hj7A9dlDwxqDE/m/THVw9Imb9kKwPpzlKQlm1k=;
        b=P47hwp25o+BVT/oaI2iEazDyLGNgvn3P13hkDa0c/nXUgIsQthwlRs+XfIMZ1UdluI
         FC8kLzezrDqFyvMu/iBc30XltHEPZpGeZdf8EWknepQFWGgDkIu79gn9AUDbnRI3A5lF
         zShKC+0dpziR9hlPGish0iTeBo2lDHYOmNPs0zhbbhaNW+yTaBW5AJk+oLd+/2x8mKGq
         F9CY1VV0LbcnpOfidXflu67rTwC6Tz5+g9dWK+YmPIvecxFTXJjbXcUh9WXIznhwzv0h
         QhAc0TPyIsP6bSEqYASBEr3ohVO0cLO0TAiMIZmWnXW4UGyvmAYEHeouSSslUM5Pevjj
         eK7g==
X-Gm-Message-State: AO0yUKU1KucYktQJFnWntd0I/yYHjZiz1U8I9Fameqx+YM9P6zkMZgDK
        kw6GkPOb3fg/f31cx291ULg=
X-Google-Smtp-Source: AK7set/4YcNuJRHLTgTNwo71PEhRaeUSgNgjEEeyGaVjvAX/BQkdJyqTzZj6DV3JslKGhvU5Y6S5+g==
X-Received: by 2002:a17:906:bcf5:b0:925:5705:b5b8 with SMTP id op21-20020a170906bcf500b009255705b5b8mr4045594ejb.58.1678841507420;
        Tue, 14 Mar 2023 17:51:47 -0700 (PDT)
Received: from skbuf ([188.27.184.189])
        by smtp.gmail.com with ESMTPSA id mc15-20020a170906eb4f00b008dcaf24bf77sm1789093ejb.36.2023.03.14.17.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 17:51:47 -0700 (PDT)
Date:   Wed, 15 Mar 2023 02:51:44 +0200
From:   Vladimir Oltean <olteanv@gmail.com>
To:     Christian Marangi <ansuelsmth@gmail.com>
Cc:     Andrew Lunn <andrew@lunn.ch>,
        Florian Fainelli <f.fainelli@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        John Crispin <john@phrozen.org>, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, Lee Jones <lee@kernel.org>,
        linux-leds@vger.kernel.org
Subject: Re: [net-next PATCH v3 10/14] dt-bindings: net: dsa: qca8k: add LEDs
 definition example
Message-ID: <20230315005144.mz6z6zo4gbpbq4kx@skbuf>
References: <20230314101516.20427-1-ansuelsmth@gmail.com>
 <20230314101516.20427-11-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230314101516.20427-11-ansuelsmth@gmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, Mar 14, 2023 at 11:15:12AM +0100, Christian Marangi wrote:
> Add LEDs definition example for qca8k Switch Family to describe how they
> should be defined for a correct usage.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../devicetree/bindings/net/dsa/qca8k.yaml    | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/dsa/qca8k.yaml b/Documentation/devicetree/bindings/net/dsa/qca8k.yaml
> index 389892592aac..866b3cc73216 100644
> --- a/Documentation/devicetree/bindings/net/dsa/qca8k.yaml
> +++ b/Documentation/devicetree/bindings/net/dsa/qca8k.yaml
> @@ -18,6 +18,8 @@ description:
>    PHY it is connected to. In this config, an internal mdio-bus is registered and
>    the MDIO master is used for communication. Mixed external and internal
>    mdio-bus configurations are not supported by the hardware.
> +  Each phy have at least 3 LEDs connected and can be declared

s/have/has/

> +  using the standard LEDs structure.
