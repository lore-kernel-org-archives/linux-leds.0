Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B4ABC4332F
	for <linux-leds@archiver.kernel.org>; Thu, 17 Nov 2022 16:44:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235023AbiKQQn7 (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Thu, 17 Nov 2022 11:43:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234550AbiKQQn6 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 17 Nov 2022 11:43:58 -0500
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFF352657B;
        Thu, 17 Nov 2022 08:43:57 -0800 (PST)
Received: by mail-qt1-x82a.google.com with SMTP id jr19so1428385qtb.7;
        Thu, 17 Nov 2022 08:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GggQuWVXiwWxnY25xlzAWAfbbKYugnv9nFXyHH2GBfI=;
        b=QjIFIX6amaTPJRadtZIsYXyGPIrY/FwW+vxSmdZreQfcTGG3/u16LrJtKAvA4F1zEB
         +G3Lh+I83x7BB0Ubgl33IweqkZvxhHdUanJ8YN53uTG/Nc6KAUs3vhvsntErlm/qPL3b
         CiJjpoGtrxBvjhlDYfNKhO3EsGlQH02KpqsXT/xMiE04wmYjwVwrZnJNUSsf+V7mPiI6
         QHcXMVLDf/8c1LFkc3MzFMLWC22tsKCJAAhL6CdS3RaaXKECemIhhPD2yksoP8K1d0Qz
         /Jd44+86hJu8x8vte0GCnvxzBg67lZKD6FZx9v2cqaeubZsKc+qzUbMgAbGlwsD4nqlZ
         20Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GggQuWVXiwWxnY25xlzAWAfbbKYugnv9nFXyHH2GBfI=;
        b=bCsODV/jMYG4Rdqr1OhT4q4tKCVb4r93jqKm1Jk3YmQyO4s25O6VllCyYGpD/jxdfl
         1RFCF0s5D6gw9li8aggEB1sKuMdEJ9mPcEKyae0WI06jYJZ5QgVaeETz2W9hqJ0zsBRE
         w7AaoMiQVcGn6V8auC1ZIQluFXsB2uQCez+W6wxWtKZQiT7KGdj4gLkHijVy0+esIJ05
         uU/IemATI84tTdy0GwZRPB/1oE/k/vuBXcT52pvrD2VUPNN/RqcB30ZsdByEeC+cViWa
         n3yO4atJ05+QyQQndblY25amkqXZwWc8GvZfovxQvWLTNfYbxtwYhTtxKOl2zHOHhBeL
         yYXw==
X-Gm-Message-State: ANoB5pnRteWqZXNWVChs6cPCwVolzJIMhORUMH1C8WTYddOYhzQ0LLfM
        HwU/A8Q3NG0PQQVnc82PyMlcIAot+HOJr3MiAqI=
X-Google-Smtp-Source: AA0mqf7ao1p3NkvFAhoWW33WHgtfzeQG5uWSAjzY9cEiFg0OSuDb2w+JyhvOJqSurhGafC9a9iKElyAytyJxd6b0ZEU=
X-Received: by 2002:ac8:75c9:0:b0:3a5:4a1a:6ff0 with SMTP id
 z9-20020ac875c9000000b003a54a1a6ff0mr2957305qtq.481.1668703436729; Thu, 17
 Nov 2022 08:43:56 -0800 (PST)
MIME-Version: 1.0
References: <20221117160447.294491-1-jjhiblot@traphandler.com> <20221117160447.294491-5-jjhiblot@traphandler.com>
In-Reply-To: <20221117160447.294491-5-jjhiblot@traphandler.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 17 Nov 2022 18:43:20 +0200
Message-ID: <CAHp75VfMdGRz5mqhQDZT3ozwmYF2OmT8uk1yGMHXLf5Z-m_tUw@mail.gmail.com>
Subject: Re: [PATCH v6 4/6] leds: class: store the color index in struct led_classdev
To:     Jean-Jacques Hiblot <jjhiblot@traphandler.com>
Cc:     lee.jones@linaro.org, pavel@ucw.cz, robh+dt@kernel.org,
        sven.schwermer@disruptive-technologies.com,
        krzysztof.kozlowski+dt@linaro.org, johan+linaro@kernel.org,
        marijn.suijten@somainline.org, bjorn.andersson@linaro.org,
        jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, Nov 17, 2022 at 6:04 PM Jean-Jacques Hiblot
<jjhiblot@traphandler.com> wrote:
>
> This information might be useful for more than only deriving the led's
> name. And since we have this information, we can expose it in the sysfs.

...

> +What:          /sys/class/leds/<led>/color
> +Date:          October 2022
> +KernelVersion: 6.1

6.2

We missed v6.1. And I'm not sure with the current state of affairs
with LEDS subsystem maintenance we are not going to miss v6.2.

-- 
With Best Regards,
Andy Shevchenko
