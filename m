Return-Path: <SRS0=t1//=D3=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3994EC4363A
	for <linux-leds@archiver.kernel.org>; Tue, 20 Oct 2020 15:24:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DA90221D6C
	for <linux-leds@archiver.kernel.org>; Tue, 20 Oct 2020 15:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603207484;
	bh=xkv3dFrvh7Kt07UxO/4foWgjUIYyyTNqqYS+af5Q8pQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=ZZNt9/uViq5WsR5VtUPNuUTf+O9qRs4Rnfs+Kgb+b8DpgOwjhlXSCOhCrT3wNkd37
	 3KOhpvUMFZfZDkjO/+RDp62cRJ5fzMjOettxrZxxxg5M3ThUdSwO1ysjRUkyYLr1SD
	 IjuztuXSaxv2cdxTKMPCfu73zPxktgqftIA7x92s=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408723AbgJTPYl (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Tue, 20 Oct 2020 11:24:41 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:41282 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728246AbgJTPYk (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 20 Oct 2020 11:24:40 -0400
Received: by mail-ot1-f67.google.com with SMTP id n15so2041015otl.8;
        Tue, 20 Oct 2020 08:24:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=skxRshqOr5D6Nh058eMGdzOj0cEeQrCjIUNkB4DmNrA=;
        b=KElqckfPGagRQ14Q+FfIyCzozVn1dw5V2P1bYaRQknmEAFK+MHP7ktISoxwHoXHua1
         KrZ1YYOIFu+D6fcPMPcijp9BZNxLnYN2owehKit3UjjpRPG+aYzny5wcVEQ9IakVL+3/
         EM7gpgPpatBGb+gRkqNgSyGK+HUwPniS3z4jaF86wM1becbVlsU1MUiLAvjVN4qA+zvk
         53jiuIp37oXOD77I97SrmYlnzm+xJbAXN8mlZMKgwgkfI0jDx1cOnPgnHRqkEPEDmAf+
         Ud12sWFEb8zHBaYb9FSTxxweNu/Oe3cFBDd0HEw8wIOgu/HOXlsjYHm+LKrARxsCEHnj
         2cTw==
X-Gm-Message-State: AOAM532NBvrOelKRVCeQFwEsgO38lk6gGV5A+sLKer5e0nYlJWIwH62w
        +ZFjIZYkYfP0MgBEQUShNQ==
X-Google-Smtp-Source: ABdhPJwZMveXwWTGOGHruCazq1Q9Nlj9oKfbTJAKUfSfdEcZCMgvrdLxZBbnqT8CPKWT50uyuxFSPg==
X-Received: by 2002:a05:6830:1345:: with SMTP id r5mr1979825otq.6.1603207479790;
        Tue, 20 Oct 2020 08:24:39 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id f18sm506620otp.10.2020.10.20.08.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2020 08:24:38 -0700 (PDT)
Received: (nullmailer pid 867552 invoked by uid 1000);
        Tue, 20 Oct 2020 15:24:37 -0000
Date:   Tue, 20 Oct 2020 10:24:37 -0500
From:   Rob Herring <robh@kernel.org>
To:     Luka Kovacic <luka.kovacic@sartura.hr>
Cc:     robert.marko@sartura.hr, linux-kernel@vger.kernel.org,
        linux@roeck-us.net, robh+dt@kernel.org, pavel@ucw.cz,
        linux-leds@vger.kernel.org, marek.behun@nic.cz,
        luka.perkov@sartura.hr, andy.shevchenko@gmail.com, dmurphy@ti.com,
        linux-hwmon@vger.kernel.org, jdelvare@suse.com,
        devicetree@vger.kernel.org, lee.jones@linaro.org
Subject: Re: [PATCH v6 1/6] dt-bindings: Add iEi vendor prefix and iEi
 WT61P803 PUZZLE driver bindings
Message-ID: <20201020152437.GB866676@bogus>
References: <20201019221859.56680-1-luka.kovacic@sartura.hr>
 <20201019221859.56680-2-luka.kovacic@sartura.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201019221859.56680-2-luka.kovacic@sartura.hr>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, 20 Oct 2020 00:18:54 +0200, Luka Kovacic wrote:
> Add the iEi WT61P803 PUZZLE Device Tree bindings for MFD, HWMON and LED
> drivers. A new vendor prefix is also added accordingly for
> IEI Integration Corp.
> 
> Signed-off-by: Luka Kovacic <luka.kovacic@sartura.hr>
> Cc: Luka Perkov <luka.perkov@sartura.hr>
> Cc: Robert Marko <robert.marko@sartura.hr>
> ---
>  .../hwmon/iei,wt61p803-puzzle-hwmon.yaml      | 41 ++++++++++
>  .../leds/iei,wt61p803-puzzle-leds.yaml        | 45 ++++++++++
>  .../bindings/mfd/iei,wt61p803-puzzle.yaml     | 82 +++++++++++++++++++
>  .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
>  4 files changed, 170 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/iei,wt61p803-puzzle-hwmon.yaml
>  create mode 100644 Documentation/devicetree/bindings/leds/iei,wt61p803-puzzle-leds.yaml
>  create mode 100644 Documentation/devicetree/bindings/mfd/iei,wt61p803-puzzle.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/iei,wt61p803-puzzle.example.dt.yaml: iei-wt61p803-puzzle-hwmon: fan-group@0:cooling-levels: [[64, 102, 170, 230, 250]] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/hwmon/iei,wt61p803-puzzle-hwmon.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/iei,wt61p803-puzzle.example.dt.yaml: iei-wt61p803-puzzle-hwmon: fan-group@1:cooling-levels: [[64, 102, 170, 230, 250]] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/hwmon/iei,wt61p803-puzzle-hwmon.yaml


See https://patchwork.ozlabs.org/patch/1384521

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

