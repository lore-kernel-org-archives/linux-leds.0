Return-Path: <SRS0=FPB9=YS=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 361E8CA9EBD
	for <linux-leds@archiver.kernel.org>; Fri, 25 Oct 2019 16:56:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 03F7F21E6F
	for <linux-leds@archiver.kernel.org>; Fri, 25 Oct 2019 16:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1572022603;
	bh=vEqQXJuMkHIEFWMJrvuzbIc/2RFpiXpPlmej2bVwQSg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=oUAEqEAbQUv/v7vJ8n13S+LEHHSnNQunbgy1oOSett/cjCyiB0wUsx6V16ghX+8WG
	 UGZtfGndY2I0mC0bCY+OOb8Se5E+v0G9ADa2iPUSaVKgRQe9BsIfQ7+FKRWONXxyPp
	 uaDpAHVuCA8HIOuo7UK09Vu2LidH5O6qZ4Y0F7UM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505766AbfJYQ4j (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Fri, 25 Oct 2019 12:56:39 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:36445 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731452AbfJYQ4j (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 25 Oct 2019 12:56:39 -0400
Received: by mail-ot1-f65.google.com with SMTP id c7so2530742otm.3;
        Fri, 25 Oct 2019 09:56:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=n8vqf9dLwTsGTBgK1g33cr8B5xKtZqiaKcIRTMTeyfE=;
        b=oavJJYWy3WnRzalHos5FIRdt6MvtwAucFAsk0QVNIMu9ltn5cOBBenDFgZ4iAwQAda
         SSe5j6WVRCw2UB/XWSgK9O+dK84ggvS2S6RlgdV6BXk+4AvzCXmH6IXCmCB+/PG07TSW
         CqqfyYROJfO0vAltFjplyWmcbgn84Jvt71URcl1/9FwpNGznrK9EWcjYU53Fb/eIsOre
         JWzL7/HakV/EW7QbeKCuV1GBByfBc+gUIJnEDqbM2rc/DW5b8vHrFYaFIYBjiro5xo74
         1QVvBDSLrMqVeQSaBzJ8s4uH3/wI7pRGfVrl5MZAw/y9jdBUqCP52WygZ0wwUB7RmSK0
         bKiw==
X-Gm-Message-State: APjAAAVT0WKxinBtnudUmAX/4Jne5n8fDUgYMwwOtnlS+TN01J591dzW
        u5NcFMnzJycu+yp5zyh9Zw==
X-Google-Smtp-Source: APXvYqzZLlPI7VNCS+rdHZMnC5H/HwwT3QNxyBcZM13Vjm5DqM8M64uqaWorWzBhJ1Tq+kS+k3kfQA==
X-Received: by 2002:a9d:4e98:: with SMTP id v24mr3677564otk.58.1572022598242;
        Fri, 25 Oct 2019 09:56:38 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id c19sm884854otl.6.2019.10.25.09.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2019 09:56:36 -0700 (PDT)
Date:   Fri, 25 Oct 2019 11:56:36 -0500
From:   Rob Herring <robh@kernel.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v4 2/6] dt-bindings: regulator: max77650: convert the
 binding document to yaml
Message-ID: <20191025165636.GA26878@bogus>
References: <20191021124428.2541-1-brgl@bgdev.pl>
 <20191021124428.2541-3-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191021124428.2541-3-brgl@bgdev.pl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, 21 Oct 2019 14:44:24 +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> Convert the binding document for MAX77650 regulator module to YAML.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  .../bindings/regulator/max77650-regulator.txt | 41 -------------------
>  .../regulator/max77650-regulator.yaml         | 31 ++++++++++++++
>  2 files changed, 31 insertions(+), 41 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/regulator/max77650-regulator.txt
>  create mode 100644 Documentation/devicetree/bindings/regulator/max77650-regulator.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
